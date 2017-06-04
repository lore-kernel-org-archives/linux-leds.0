From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V2 1/2] leds: leds-qti-rgb: Add LED driver for QTI TRI_LED
 module
Date: Sun, 4 Jun 2017 20:33:21 +0200
Message-ID: <8058ed85-5a64-8dc3-99ea-1ad8128e043d@gmail.com>
References: <20170601072723.12760-1-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170601072723.12760-1-fenglinw@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: fenglinw@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: linux-leds@vger.kernel.org

Hi Wu,

Please find my comments below.

On 06/01/2017 09:25 AM, fenglinw@codeaurora.org wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> QTI TRI_LED module has 3 current sinks for LED driver and each is
> controlled by a PWM channel used for LED dimming or blinking. Add
> the driver to support it.
> 
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/leds/leds-qti-rgb.txt      |  46 ++
>  drivers/leds/Kconfig                               |   8 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-qti-rgb.c                        | 623 +++++++++++++++++++++
>  4 files changed, 678 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
>  create mode 100644 drivers/leds/leds-qti-rgb.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
> new file mode 100644
> index 0000000..2ca93f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
> @@ -0,0 +1,46 @@
> +Qualcomm Technologies, Inc. TRI_LED driver specific bindings
> +
> +This binding document describes the properties of TRI_LED module in
> +Qualcomm Technologies, Inc. PMIC chips.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: Must be "qcom,leds-rgb".
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: Register base of the TRI_LED module and length.
> +
> +- pwm-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: A list of string to label the PWM devices defined in pwms
> +		property which are using for controlling LEDs.
> +		It must be: "red", "green", "blue".
> +
> +- pwms:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: A list of the PWM devices (phandles) used for controlling
> +		LEDs.
> +
> +- qcom,support-blink:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: An array of integer values to indicate if "red", "green",
> +		"blue" LED support blink control. The values are listed as
> +		the fixed order for "red", "green", "blue" LED.
> +
> +Example:
> +
> +	pmi8998_rgb: rgb@d000{
> +		compatible = "qcom,leds-rgb";
> +		reg = <0xd000 0x100>;
> +		pwm-names = "red", "green", "blue";
> +		pwms =  <&pmi8998_pwm_5 0 1000000>,
> +			<&pmi8998_pwm_4 0 1000000>,
> +			<&pmi8998_pwm_3 0 1000000>;

Each LED should be defined as a sub-node. Please refer to the
Documentation/devicetree/bindings/leds/common.txt.

> +		qcom,support-blink = <1 1 1>;

What is the gain of not exposing blink feature? LED subsystem
provides software fallback if hardware doesn't support requested
blink periods. Of course the driver would have to be redesigned
to make use of that feature. We will also need to add a generic
support for RGB LEDs finally. I've been thinking about possible
solutions lately. Today I've spent few hours implementing a new
LED RGB class, but we will need to solve some issues first.

Generally I came to a conclusion that it will be best to register
additional LED RGB class device in an addition to three LED class
devices representing each color. In order to avoid hard to solve
locking problems I propose to allow for simultaneous access to LED
class devices and LED RGB class device gathering them.

All in all, currently we also don't give an exclusive access to
a particular LED class device, which always can lead to overwriting
current brightness by another process. These issues must be arbitrated
by user space.

I propose that LED RGB class device exposed following files:

- red_brightness
- green_brightness
- blue_brightness
- latch_color

The color components would be only cached in the LED RGB class device
context struct and written to the hw on writing "1" to latch_color file.
The LED class devices corresponding to particular color component would
store back reference to the RGB LED class device to be able to notify it
when the color is overwritten via LED class device. Also other
operations on LED class device, like setting triggers, could be
propagated this way, which would allow to return "0" on executing
"cat latch_color".

We will also need a counterpart of generic support for the devices that
may sleep while setting brightness. Alternatively we may think of
reusing existing set_brightness_work from LED core.

In order not to block your development until this work will be
accomplished I propose to add support for three separate LED class
devices, one for each color. After LED RGB class is ready we
will add a support for setting brightness of all the three LEDs
from a single callback.

Below is what I've worked out today, please note that it wasn't even
compile-tested. You could try to extend it if you wish.

We will also require to adjust LED Trigger core to be able to setup
triggers (e.g. timer) for LED RGB LEDs.

------------------------------------------------------------

static struct class *leds_rgb_class;

#define RGB_LED_SYSYFS_CALLBACKS(color)						\
static ssize_t brightness_##color##_show(struct device *dev, 			\
		struct device_attribute *attr, char *buf) 			\
{ 										\
	struct led_classdev_rgb *rgbled_cdev = dev_get_drvdata(dev); 		\
 										\
	return sprintf(buf, "%u\n", rgbled_cdev->##color##_brightness);		\
} 										\
 										\
static ssize_t brightness_##color##_store(struct device *dev, 			\
		struct device_attribute *attr, const char *buf, size_t size) 	\
{ 										\
	struct led_classdev_rgb *rgbled_cdev = dev_get_drvdata(dev); 		\
	int ret; 								\
										\
	return kstrtoul(buf, 10, &rgbled_cdev->##color##_brightness);		\
} 										\
static DEVICE_ATTR_RW(brightness); 						\
 										\
static ssize_t max_brightness_##color##_show(struct device *dev, 		\
		struct device_attribute *attr, char *buf) 			\
{ 										\
	struct led_classdev_rgb *rgbled_cdev = dev_get_drvdata(dev); 		\
	struct led_classdev *led_cdev = rgbled_cdev->##color;	 		\
 										\
	return sprintf(buf, "%u\n", led_cdev->max_brightness); 			\
} 										\
static DEVICE_ATTR_RO(max_brightness);

RGB_LED_SYSYFS_CALLBACKS(red)
RGB_LED_SYSYFS_CALLBACKS(green)
RGB_LED_SYSYFS_CALLBACKS(blue)

static ssize_t latch_color_show(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	struct led_classdev_rgb *rgbled_cdev = dev_get_drvdata(dev);

	return sprintf(buf, "%u\n", rgbled_cdev->color_latched);
}

static ssize_t latch_color_store(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	struct led_classdev_rgb *rgbled_cdev = dev_get_drvdata(dev);
	struct led_classdev *red_lcdev = rgbled_cdev->red;
	struct led_classdev *green_lcdev = rgbled_cdev->green;
	struct led_classdev *blue_lcdev = rgbled_cdev->blue;
	int ret;

	mutex_lock(&red_lcdev->led_access);
	if (led_sysfs_is_disabled(red_lcdev)) {
		ret = -EBUSY;
		goto unlock_red;
	}

	mutex_lock(&green_lcdev->led_access);
	if (led_sysfs_is_disabled(green_lcdev)) {
		ret = -EBUSY;
		goto unlock_green;
	}

	mutex_lock(&blue_lcdev->led_access);
	if (led_sysfs_is_disabled(blue_lcdev)) {
		ret = -EBUSY;
		goto unlock_blue;
	}

	ret = rgbled_cdev->latch_color();
	rgbled_cdev->color_latched = true;
unlock_blue:
	mutex_unlock(&blue_lcdev->led_access);
unlock_green:
	mutex_unlock(&green_lcdev->led_access);
unlock_red:
	mutex_unlock(&red_lcdev->led_access);
	return ret;
}
static DEVICE_ATTR_RW(latch_color);


#ifdef CONFIG_LEDS_TRIGGERS
static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
static struct attribute *led_trigger_attrs[] = {
	&dev_attr_trigger.attr,
	NULL,
};
static const struct attribute_group led_trigger_group = {
	.attrs = led_trigger_attrs,
};
#endif

static struct attribute *led_rgb_class_attrs[] = {
	&dev_attr_red_brightness.attr,
	&dev_attr_max_red_brightness.attr,
	&dev_attr_green_brightness.attr,
	&dev_attr_max_green_brightness.attr,
	&dev_attr_blue_brightness.attr,
	&dev_attr_max_blue_brightness.attr,
	&dev_attr_latch_color.attr,
	NULL,
};

static const struct attribute_group led_rgb_group = {
	.attrs = led_rgb_class_attrs,
};

static const struct attribute_group *led_groups[] = {
	&led_rgb_group,
#ifdef CONFIG_LEDS_TRIGGERS
	&led_trigger_group,
#endif
	NULL,
};

------------------------------------------------------------

> +	};
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6c29998..8996bde 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -667,6 +667,14 @@ config LEDS_PM8058
>  	  Choose this option if you want to use the LED drivers in
>  	  the Qualcomm PM8058 PMIC.
>  
> +config LEDS_QTI_RGB
> +	tristate "Qualcomm Technologies, Inc. TRI_LED driver"
> +	depends on LEDS_CLASS && MFD_SPMI_PMIC && PWM && OF
> +	help
> +	  This driver supports the TRI_LED module found in Qualcomm
> +	  Technologies, Inc. PMIC's chips. TRI_LED supports 3 LED drivers and
> +	  each is controlled by a PWM channel used for dimming or blinking.
> +
>  config LEDS_MLXCPLD
>  	tristate "LED support for the Mellanox boards"
>  	depends on X86_64 && DMI
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 45f1339..d1a967c 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
>  obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
>  obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
>  obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
> +obj-$(CONFIG_LEDS_QTI_RGB)		+= leds-qti-rgb.o
>  obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
>  obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
>  obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
> diff --git a/drivers/leds/leds-qti-rgb.c b/drivers/leds/leds-qti-rgb.c
> new file mode 100644
> index 0000000..d77fd85
> --- /dev/null
> +++ b/drivers/leds/leds-qti-rgb.c
> @@ -0,0 +1,623 @@
> +/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#define pr_fmt(fmt) "%s: " fmt, __func__

Let's use dev_err(), dev_warn() etc. instead.

> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

Please sort include directives alphabetically.

> +
> +#define REG_LED_SRC_SEL		0x45
> +#define REG_LED_EN_CTL		0x46
> +#define REG_LED_ATC_EN_CTL	0x47
> +
> +/* REG_LED_SRC_SEL */
> +#define LED_SRC_SEL_MASK	GENMASK(1, 0)
> +#define LED_SRC_GND		0x00
> +#define LED_SRC_VINRGB_VBOOST	0x01
> +#define LED_SRC_VSYS		0x03
> +
> +/* REG_LED_EN_CTL */
> +#define LED_EN_CTL_MASK		GENMASK(7, 5)
> +#define RED_EN_OFFSET		7
> +
> +/* REG_LED_ATC_EN_CTL */
> +#define LED_ATC_EN_MASK		GENMASK(7, 5)

These macros require namespacing prefix, e.g. QTI.

> +enum {
> +	RED_LED = 0,
> +	GREEN_LED,
> +	BLUE_LED,
> +	NUM_LEDS,
> +}
> +const char * const led_names[NUM_LEDS] = {"red", "green", "blue"};
> +
> +struct pwm_setting {
> +	u32	initial_period_ns;
> +	u32	period_ns;
> +	u32	duty_ns;
> +};
> +
> +struct led_setting {
> +	u32	brightness;
> +	u32	on_ms;
> +	u32	off_ms;
> +	bool	blink;
> +};

s/led_setting/qti_led_setting/

> +struct qti_rgb_led_dev {
> +	struct led_classdev	cdev;
> +	struct pwm_device	*pwm_dev;
> +	struct pwm_setting	pwm_setting;
> +	struct led_setting	led_setting;
> +	struct qti_rgb_chip	*chip;
> +	struct work_struct	work;
> +	struct mutex		lock;
> +	bool			support_blink;
> +	bool			blinking;
> +	u8			idx;
> +};
> +
> +struct qti_rgb_chip {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	struct qti_rgb_led_dev	leds[NUM_LEDS];
> +	struct mutex		bus_lock;
> +	u16			reg_base;
> +};
> +
> +static int qti_rgb_masked_write(struct qti_rgb_chip *chip,
> +				u16 addr, u8 mask, u8 val)
> +{
> +	int rc;
> +
> +	mutex_lock(&chip->bus_lock);
> +	rc = regmap_update_bits(chip->regmap, chip->reg_base + addr, mask, val);
> +	if (rc < 0)
> +		dev_err(chip->dev, "Update addr 0x%x to val 0x%x with mask 0x%x failed, rc=%d\n",
> +					addr, val, mask, rc);
> +	mutex_unlock(&chip->bus_lock);
> +
> +	return rc;
> +}
> +
> +static int __rgb_led_config_pwm(struct qti_rgb_led_dev *led,
> +				struct pwm_setting *pwm)
> +{
> +	int rc;
> +
> +	if (pwm->duty_ns == 0) {
> +		pwm_disable(led->pwm_dev);
> +		return 0;
> +	}
> +
> +	rc = pwm_config(led->pwm_dev, pwm->duty_ns, pwm->period_ns);
> +	if (rc < 0) {
> +		dev_err(led->chip->dev, "Config PWM settings for %s led failed, rc=%d\n",
> +					led->cdev.name, rc);
> +		return rc;
> +	}
> +
> +	rc = pwm_enable(led->pwm_dev);
> +	if (rc < 0)
> +		dev_err(led->chip->dev, "Enable PWM for %s led failed, rc=%d\n",
> +					led->cdev.name, rc);
> +
> +	return rc;
> +}
> +
> +static int __rgb_led_set(struct qti_rgb_led_dev *led)
> +{
> +	int rc = 0;
> +	u8 val = 0, mask = 0;
> +
> +	rc = __rgb_led_config_pwm(led, &led->pwm_setting);
> +	if (rc < 0) {
> +		dev_err(led->chip->dev, "Configure PWM for %s led failed, rc=%d\n",
> +					led->cdev.name, rc);
> +		return rc;
> +	}
> +
> +	mask |= 1 << (RED_EN_OFFSET - led->idx);
> +
> +	if (led->pwm_setting.duty_ns == 0)
> +		val = 0;
> +	else
> +		val = mask;
> +
> +	rc = qti_rgb_masked_write(led->chip, REG_LED_EN_CTL, mask, val);
> +	if (rc < 0)
> +		dev_err(led->chip->dev, "Update addr 0x%x failed, rc=%d\n",
> +					REG_LED_EN_CTL, rc);
> +
> +	return rc;
> +}
> +
> +static void rgb_led_set_work(struct work_struct *work)
> +{
> +	struct qti_rgb_led_dev *led = container_of(work,
> +			struct qti_rgb_led_dev, work);
> +	u32 brightness = 0, on_ms, off_ms, period_ns, duty_ns;
> +	int rc = 0;
> +
> +	mutex_lock(&led->lock);
> +	if (led->led_setting.blink) {
> +		on_ms = led->led_setting.on_ms;
> +		off_ms = led->led_setting.off_ms;
> +
> +		if (on_ms > INT_MAX / NSEC_PER_MSEC)
> +			duty_ns = INT_MAX - 1;
> +		else
> +			duty_ns = on_ms * NSEC_PER_MSEC;
> +
> +		if (on_ms + off_ms > INT_MAX / NSEC_PER_MSEC) {
> +			period_ns = INT_MAX;
> +			duty_ns = (period_ns / (on_ms + off_ms)) * on_ms;
> +		} else {
> +			period_ns = (on_ms + off_ms) * NSEC_PER_MSEC;
> +		}
> +
> +		if (period_ns < duty_ns && duty_ns != 0)
> +			period_ns = duty_ns + 1;
> +	} else {
> +		brightness = led->led_setting.brightness;
> +		period_ns = pwm_get_period(led->pwm_dev);
> +		/* Use initial period if no blinking is required */
> +		if (period_ns > led->pwm_setting.initial_period_ns)
> +			period_ns = led->pwm_setting.initial_period_ns;
> +
> +		if (period_ns > INT_MAX / brightness)
> +			duty_ns = (period_ns / LED_FULL) * brightness;
> +		else
> +			duty_ns = (period_ns * brightness) / LED_FULL;
> +
> +		if (period_ns < duty_ns && duty_ns != 0)
> +			period_ns = duty_ns + 1;
> +	}
> +	pr_debug("PWM settings for %s led: period = %dns, duty = %dns\n",
> +			led->cdev.name, period_ns, duty_ns);
> +
> +	led->pwm_setting.duty_ns = duty_ns;
> +	led->pwm_setting.period_ns = period_ns;
> +
> +	rc = __rgb_led_set(led);
> +	if (rc < 0) {
> +		dev_err(led->chip->dev, "rgb_led_set %s failed, rc=%d\n",
> +				led->cdev.name, rc);
> +		goto unlock;
> +	}
> +
> +	if (led->led_setting.blink) {
> +		led->cdev.brightness = LED_FULL;
> +		led->blinking = true;
> +	} else {
> +		led->cdev.brightness = brightness;
> +		led->blinking = false;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +}
> +
> +static void qti_rgb_led_set(struct led_classdev *led_cdev,
> +		enum led_brightness brightness)
> +{
> +	struct qti_rgb_led_dev *led =
> +		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
> +
> +	mutex_lock(&led->lock);
> +	if (brightness > LED_FULL)
> +		brightness = LED_FULL;
> +
> +	if (brightness == led->led_setting.brightness &&
> +				!led->blinking) {
> +		mutex_unlock(&led->lock);
> +		return;
> +	}
> +	led->led_setting.blink = false;
> +	led->led_setting.brightness = brightness;
> +	mutex_unlock(&led->lock);
> +
> +	schedule_work(&led->work);
> +}
> +
> +static enum led_brightness qti_rgb_led_get(struct led_classdev *led_cdev)
> +{
> +	return led_cdev->brightness;
> +}
> +
> +static int qti_rgb_led_blink(struct led_classdev *led_cdev,
> +		unsigned long *on_ms, unsigned long *off_ms)
> +{
> +	struct qti_rgb_led_dev *led =
> +		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
> +
> +	if (*on_ms == 0 || *off_ms == 0) {
> +		dev_err(led->chip->dev, "Can't set blink for on=%lums off=%lums\n",
> +						*on_ms, *off_ms);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&led->lock);
> +	if (led->blinking && *on_ms == led->led_setting.on_ms &&
> +			*off_ms == led->led_setting.off_ms) {
> +		pr_debug("Ignore, on/off setting is not changed: on %lums, off %lums\n",
> +							*on_ms, *off_ms);
> +		mutex_unlock(&led->lock);
> +		return 0;
> +	}
> +
> +	led->led_setting.blink = true;
> +	led->led_setting.on_ms = (u32)*on_ms;
> +	led->led_setting.off_ms = (u32)*off_ms;
> +	mutex_unlock(&led->lock);
> +
> +	schedule_work(&led->work);
> +
> +	return 0;
> +}
> +
> +static ssize_t blink_store(struct device *dev, struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	int rc;
> +	u32 blink;
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct qti_rgb_led_dev *led =
> +		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
> +
> +	rc = kstrtouint(buf, 0, &blink);
> +	if (rc)
> +		return rc;
> +
> +	if (!!blink)
> +		qti_rgb_led_blink(led_cdev,
> +				(unsigned long *)&led->led_setting.on_ms,
> +				(unsigned long *)&led->led_setting.off_ms);
> +	else
> +		qti_rgb_led_set(led_cdev, LED_OFF);
> +
> +	return count;
> +}
> +
> +static ssize_t blink_show(struct device *dev, struct device_attribute *attr,
> +							char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct qti_rgb_led_dev *led =
> +		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
> +	bool blink;
> +
> +	blink = led->led_setting.blink &&
> +			led->cdev.brightness == LED_FULL;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
> +}

We will use timer trigger and blink_set op for setting up blinking.
We'll cover that after LED RGB class is ready.

> +static ssize_t on_off_ms_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t count)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	int rc, buff_size;
> +	char buff[32];
> +	char *token, *buff_ptr;
> +	bool blink;
> +	u32 on_ms, off_ms, brightness;
> +
> +	buff_size = min(count, sizeof(buff) - 1);
> +	memcpy(buff, buf, buff_size);
> +	buff[buff_size] = '\0';
> +	buff_ptr = buff;
> +
> +	token = strsep(&buff_ptr, " ");
> +	if (!token)
> +		return -EINVAL;
> +
> +	rc = kstrtouint(token, 0, &on_ms);
> +	if (rc < 0)
> +		return rc;
> +
> +	token = strsep(&buff_ptr, " ");
> +	if (!token)
> +		return -EINVAL;
> +
> +	rc = kstrtouint(token, 0, &off_ms);
> +	if (rc < 0)
> +		return rc;
> +
> +	blink = !(on_ms == 0 || off_ms == 0);
> +	if (on_ms == 0)
> +		brightness = LED_OFF;
> +	else if (off_ms == 0)
> +		brightness = LED_FULL;
> +
> +	if (blink)
> +		qti_rgb_led_blink(led_cdev, (unsigned long *)&on_ms,
> +					(unsigned long *)&off_ms);
> +	else
> +		qti_rgb_led_set(led_cdev, brightness);
> +
> +	return count;
> +}

All these should be handled by blink_set op. Let's cover it later.

> +static ssize_t on_off_ms_show(struct device *dev, struct device_attribute *attr,
> +							char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct qti_rgb_led_dev *led =
> +		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
> +
> +	return snprintf(buf, PAGE_SIZE, "on: %dms, off: %dms\n",
> +			led->led_setting.on_ms, led->led_setting.off_ms);
> +}
> +
> +static DEVICE_ATTR(blink, 0644, blink_show, blink_store);
> +static DEVICE_ATTR(on_off_ms, 0644, on_off_ms_show, on_off_ms_store);
> +
> +static struct attribute *blink_attrs[] = {
> +	&dev_attr_blink.attr,
> +	&dev_attr_on_off_ms.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group blink_attrs_group = {
> +	.attrs = blink_attrs,
> +};

ledtrig-timer will handle that.

> +static int qti_rgb_leds_register(struct qti_rgb_chip *chip)
> +{
> +	int rc, i, j;
> +
> +	for (i = 0; i < NUM_LEDS; i++) {
> +		INIT_WORK(&chip->leds[i].work, rgb_led_set_work);

Let's use work queue from LED core.

> +		mutex_init(&chip->leds[i].lock);
> +		chip->leds[i].cdev.name = led_names[i];
> +		chip->leds[i].cdev.max_brightness = LED_FULL;
> +		chip->leds[i].cdev.brightness = LED_OFF;
> +		chip->leds[i].cdev.brightness_set = qti_rgb_led_set;
> +		chip->leds[i].cdev.brightness_get = qti_rgb_led_get;
> +		if (chip->leds[i].support_blink)
> +			chip->leds[i].cdev.blink_set = qti_rgb_led_blink;
> +
> +		rc = devm_led_classdev_register(chip->dev, &chip->leds[i].cdev);
> +		if (rc < 0) {
> +			dev_err(chip->dev, "%s led class device registering failed, rc=%d\n",
> +							led_names[i], rc);
> +			goto destroy;
> +		}
> +
> +		if (chip->leds[i].support_blink) {
> +			rc = sysfs_create_group(&chip->leds[i].cdev.dev->kobj,
> +							&blink_attrs_group);
> +			if (rc < 0) {
> +				dev_err(chip->dev, "Create blink_attrs for %s led failed, rc=%d\n",
> +						led_names[i], rc);
> +				goto destroy;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +destroy:
> +	for (j = 0; j < i; j++) {
> +		mutex_destroy(&chip->leds[i].lock);
> +		sysfs_remove_group(&chip->leds[i].cdev.dev->kobj,
> +				&blink_attrs_group);
> +	}
> +
> +	return rc;
> +}
> +
> +static int qti_rgb_leds_init_pwm_settings(struct qti_rgb_chip *chip)
> +{
> +	u32 period_ns, duty_ns;
> +	bool is_enabled;
> +	int i;
> +
> +	for (i = 0; i < NUM_LEDS; i++) {
> +		period_ns = pwm_get_period(chip->leds[i].pwm_dev);
> +		duty_ns = pwm_get_duty_cycle(chip->leds[i].pwm_dev);
> +		is_enabled = pwm_is_enabled(chip->leds[i].pwm_dev);
> +
> +		pr_debug("%s led PWM default setting: period = %dns, duty = %dns, is_enabled = %d\n",
> +			led_names[i], period_ns, duty_ns, is_enabled);
> +		chip->leds[i].pwm_setting.initial_period_ns = period_ns;
> +		if (duty_ns > period_ns) {
> +			duty_ns = period_ns - 1;
> +			pwm_set_duty_cycle(chip->leds[i].pwm_dev, duty_ns);
> +		}
> +
> +		if (is_enabled)
> +			pwm_disable(chip->leds[i].pwm_dev);
> +	}
> +
> +	return 0;
> +}

Please follow drivers/leds/leds-pwm.c in this matter.

> +static int qti_rgb_leds_hw_init(struct qti_rgb_chip *chip)
> +{
> +	int rc = 0;
> +
> +	/* Disable ATC_EN for LEDs */
> +	rc = qti_rgb_masked_write(chip, REG_LED_ATC_EN_CTL,
> +				LED_ATC_EN_MASK, 0);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Writing ATC_EN_CTL failed, rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	/* Select VINRGB_VBOOST as the source */
> +	rc = qti_rgb_masked_write(chip, REG_LED_SRC_SEL, LED_SRC_SEL_MASK,
> +				LED_SRC_VINRGB_VBOOST);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Writing SRC_SEL failed, rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	return rc;
> +}
> +
> +#define LED_BLINK_DEFAULT_ON_MS		125
> +#define LED_BLINK_DEFAULT_OFF_MS	875
> +static int qti_rgb_leds_parse_dt(struct qti_rgb_chip *chip)
> +{
> +	int rc, i, count;
> +	const __be32 *addr;
> +	u32 support_blink[NUM_LEDS];
> +
> +	addr = of_get_address(chip->dev->of_node, 0, NULL, NULL);
> +	if (!addr) {
> +		dev_err(chip->dev, "Getting address failed\n");
> +		return -EINVAL;
> +	}
> +	chip->reg_base = be32_to_cpu(addr[0]);
> +
> +	for (i = 0; i < NUM_LEDS; i++) {
> +		chip->leds[i].pwm_dev = devm_pwm_get(chip->dev, led_names[i]);
> +		if (IS_ERR(chip->leds[i].pwm_dev)) {
> +			rc = PTR_ERR(chip->leds[i].pwm_dev);
> +			if (rc != -EPROBE_DEFER)
> +				dev_err(chip->dev, "Get pwm device for %s led failed, rc=%d\n",
> +						led_names[i], rc);
> +			return rc;
> +		}
> +		chip->leds[i].chip = chip;
> +		chip->leds[i].idx = i;
> +	}

Please use for_each_available_child_of_node here. Of course DT bindings
style mut conform to the
Documentation/devicetree/bindings/leds/common.txt to make it working.

> +	count = of_property_count_elems_of_size(chip->dev->of_node,
> +			"qcom,support-blink", sizeof(u32));

As I mentioned, we will need to always support blinking. Or there is
some vital reason for not doing that in case of this device?

> +	if (count > 0) {
> +		if (count != NUM_LEDS) {
> +			dev_err(chip->dev, "qcom,support-blink property expects %d elements, but it has %d\n",
> +					NUM_LEDS, count);
> +			return -EINVAL;
> +		}
> +
> +		rc = of_property_read_u32_array(chip->dev->of_node,
> +				"qcom,support-blink", support_blink, count);
> +		if (rc < 0) {
> +			dev_err(chip->dev, "qcom,support-blink property reading failed, rc=%d\n",
> +					rc);
> +			return rc;
> +		}
> +
> +		for (i = 0; i < NUM_LEDS; i++) {
> +			chip->leds[i].support_blink = !!support_blink[i];
> +			chip->leds[i].led_setting.on_ms =
> +				LED_BLINK_DEFAULT_ON_MS;
> +			chip->leds[i].led_setting.off_ms =
> +				LED_BLINK_DEFAULT_OFF_MS;
> +		}
> +	}
> +
> +	return rc;
> +}
> +
> +static int qti_rgb_leds_probe(struct platform_device *pdev)
> +{
> +	struct qti_rgb_chip *chip;
> +	int rc = 0;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = &pdev->dev;
> +	chip->regmap = dev_get_regmap(chip->dev->parent, NULL);
> +	if (!chip->regmap) {
> +		dev_err(chip->dev, "Getting regmap failed\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = qti_rgb_leds_parse_dt(chip);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Devicetree properties parsing failed, rc=%d\n",
> +								rc);
> +		return rc;
> +	}
> +
> +	rc = qti_rgb_leds_init_pwm_settings(chip);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Init PWM setting failed, rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	mutex_init(&chip->bus_lock);
> +
> +	rc = qti_rgb_leds_hw_init(chip);
> +	if (rc) {
> +		dev_err(chip->dev, "HW initialization failed, rc=%d\n", rc);
> +		goto destroy;
> +	}
> +
> +	dev_set_drvdata(chip->dev, chip);
> +	rc = qti_rgb_leds_register(chip);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Registering LED class devices failed, rc=%d\n",
> +								rc);
> +		goto destroy;
> +	}
> +
> +	return 0;
> +destroy:
> +	mutex_destroy(&chip->bus_lock);
> +	dev_set_drvdata(chip->dev, NULL);
> +
> +	return rc;
> +}
> +
> +static int qti_rgb_leds_remove(struct platform_device *pdev)
> +{
> +	int i;
> +	struct qti_rgb_chip *chip = dev_get_drvdata(&pdev->dev);
> +
> +	mutex_destroy(&chip->bus_lock);
> +	for (i = 0; i < NUM_LEDS; i++) {
> +		if (chip->leds[i].support_blink)
> +			sysfs_remove_group(&chip->leds[i].cdev.dev->kobj,
> +						&blink_attrs_group);
> +		mutex_destroy(&chip->leds[i].lock);
> +	}
> +	dev_set_drvdata(chip->dev, NULL);
> +	return 0;
> +}
> +
> +static const struct of_device_id qti_rgb_of_match[] = {
> +	{ .compatible = "qcom,leds-rgb",},
> +	{ },
> +};
> +
> +static struct platform_driver qti_rgb_leds_driver = {
> +	.driver		= {
> +		.name		= "qcom,leds-rgb",
> +		.of_match_table	= qti_rgb_of_match,
> +	},
> +	.probe		= qti_rgb_leds_probe,
> +	.remove		= qti_rgb_leds_remove,
> +};
> +module_platform_driver(qti_rgb_leds_driver);
> +
> +MODULE_DESCRIPTION("QTI TRI_LED (RGB) driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("leds:leds-qti-rgb");
> 

-- 
Best regards,
Jacek Anaszewski
