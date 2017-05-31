From: fenglinw@codeaurora.org
Subject: [PATCH V1 1/2] leds: leds-qti-rgb: Add LED driver for QTI TRI_LED module
Date: Wed, 31 May 2017 14:14:37 +0800
Message-ID: <20170531061541.10808-2-fenglinw@codeaurora.org>
References: <20170531061541.10808-1-fenglinw@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170531061541.10808-1-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: subbaram@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

From: Fenglin Wu <fenglinw@codeaurora.org>

QTI TRI_LED module has 3 current sinks for LED driver and each is
controlled by a PWM channel used for LED dimming or blinking. Add
the driver to support it.

Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
---
 .../devicetree/bindings/leds/leds-qti-rgb.txt      |  66 +++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-qti-rgb.c                        | 634 +++++++++++++++++++++
 4 files changed, 709 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
 create mode 100644 drivers/leds/leds-qti-rgb.c

diff --git a/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
new file mode 100644
index 0000000..62daf38
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qti-rgb.txt
@@ -0,0 +1,66 @@
+Qualcomm Technologies, Inc. TRI_LED driver specific bindings
+
+This binding document describes the properties of TRI_LED module in
+Qualcomm Technologies, Inc. PMIC chips.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: Must be "qcom,leds-rgb".
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Register base of the TRI_LED module and length.
+
+- pwm-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: A list of string to label the PWM devices defined in pwms
+		property which are using for controlling LEDs.
+		It must be: "blue", "green", "red".
+
+- pwms:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of the PWM devices (phandles) used for controlling
+		LEDs.
+
+- qcom,support-blink:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: An array of integer values to indicate if "blue", "green", "red"
+		LEDs support blink control. The values are listed as the fixed
+		order for "blue", "green", "red" LEDs.
+
+- qcom,on-ms:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: An array of time values (milli-seconds) to represent the
+		on duration for "blue", "green", "red" LEDs. The values are
+		listed as the fixed order for "blue", "green", "red" LEDs.
+		This property has to be defined if "qcom,support-blink" is
+		present.
+
+- qcom,off-ms:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: An array of time values (milli-seconds) to represent the
+		off duration for "blue", "green", "red" LEDs. The values are
+		listed as the fixed order for "blue", "green", "red" LEDs.
+		This property has to be defined if "qcom,support-blink" is
+		present.
+
+Example:
+
+	pmi8998_rgb: rgb@d000{
+		compatible = "qcom,leds-rgb";
+		reg = <0xd000 0x100>;
+		pwm-names = "blue", "green", "red";
+		pwms =  <&pmi8998_pwm_3 0 1000000>,
+			<&pmi8998_pwm_4 0 1000000>,
+			<&pmi8998_pwm_5 0 1000000>;
+		qcom,support-blink = <1 1 1>;
+		qcom,on-ms = <500 500 500>;
+		qcom,off-ms = <500 500 500>;
+	};
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6c29998..8996bde 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -667,6 +667,14 @@ config LEDS_PM8058
 	  Choose this option if you want to use the LED drivers in
 	  the Qualcomm PM8058 PMIC.
 
+config LEDS_QTI_RGB
+	tristate "Qualcomm Technologies, Inc. TRI_LED driver"
+	depends on LEDS_CLASS && MFD_SPMI_PMIC && PWM && OF
+	help
+	  This driver supports the TRI_LED module found in Qualcomm
+	  Technologies, Inc. PMIC's chips. TRI_LED supports 3 LED drivers and
+	  each is controlled by a PWM channel used for dimming or blinking.
+
 config LEDS_MLXCPLD
 	tristate "LED support for the Mellanox boards"
 	depends on X86_64 && DMI
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 45f1339..d1a967c 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
 obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
+obj-$(CONFIG_LEDS_QTI_RGB)		+= leds-qti-rgb.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
 obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
diff --git a/drivers/leds/leds-qti-rgb.c b/drivers/leds/leds-qti-rgb.c
new file mode 100644
index 0000000..0e363d4
--- /dev/null
+++ b/drivers/leds/leds-qti-rgb.c
@@ -0,0 +1,634 @@
+/* Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define REG_LED_SRC_SEL		0x45
+#define REG_LED_EN_CTL		0x46
+#define REG_LED_ATC_EN_CTL	0x47
+
+/* REG_LED_SRC_SEL */
+#define LED_SRC_SEL_MASK	GENMASK(1, 0)
+#define LED_SRC_GND		0x00
+#define LED_SRC_VINRGB_VBOOST	0x01
+#define LED_SRC_VSYS		0x03
+
+/* REG_LED_EN_CTL */
+#define LED_EN_CTL_MASK		GENMASK(7, 5)
+#define LED_EN_CTL_OFFSET	5
+
+/* REG_LED_ATC_EN_CTL */
+#define LED_ATC_EN_MASK		GENMASK(7, 5)
+
+#define NUM_LEDS		3
+const char * const led_names[NUM_LEDS] = {"blue", "green", "red"};
+
+struct pwm_setting {
+	u32	initial_period_ns;
+	u32	period_ns;
+	u32	duty_ns;
+};
+
+struct led_setting {
+	u32	brightness;
+	u32	on_ms;
+	u32	off_ms;
+	bool	blink;
+};
+
+struct qti_rgb_led_dev {
+	struct led_classdev	cdev;
+	struct pwm_device	*pwm_dev;
+	struct pwm_setting	pwm_setting;
+	struct led_setting	led_setting;
+	struct qti_rgb_chip	*chip;
+	struct work_struct	work;
+	struct mutex		lock;
+	bool			support_blink;
+	bool			blinking;
+	u8			idx;
+};
+
+struct qti_rgb_chip {
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct qti_rgb_led_dev	leds[NUM_LEDS];
+	struct mutex		bus_lock;
+	u16			reg_base;
+};
+
+static int qti_rgb_masked_write(struct qti_rgb_chip *chip,
+				u16 addr, u8 mask, u8 val)
+{
+	int rc;
+
+	mutex_lock(&chip->bus_lock);
+	rc = regmap_update_bits(chip->regmap, chip->reg_base + addr, mask, val);
+	if (rc < 0)
+		dev_err(chip->dev, "Update addr 0x%x to val 0x%x with mask 0x%x failed, rc=%d\n",
+					addr, val, mask, rc);
+	mutex_unlock(&chip->bus_lock);
+
+	return rc;
+}
+
+static int __rgb_led_config_pwm(struct qti_rgb_led_dev *led,
+				struct pwm_setting *pwm)
+{
+	int rc;
+
+	if (pwm->duty_ns == 0) {
+		pwm_disable(led->pwm_dev);
+		return 0;
+	}
+
+	rc = pwm_config(led->pwm_dev, pwm->duty_ns, pwm->period_ns);
+	if (rc < 0) {
+		dev_err(led->chip->dev, "Config PWM settings for %s led failed, rc=%d\n",
+					led->cdev.name, rc);
+		return rc;
+	}
+
+	rc = pwm_enable(led->pwm_dev);
+	if (rc < 0)
+		dev_err(led->chip->dev, "Enable PWM for %s led failed, rc=%d\n",
+					led->cdev.name, rc);
+
+	return rc;
+}
+
+static int __rgb_led_set(struct qti_rgb_led_dev *led)
+{
+	int rc = 0;
+	u8 val = 0, mask = 0;
+
+	rc = __rgb_led_config_pwm(led, &led->pwm_setting);
+	if (rc < 0) {
+		dev_err(led->chip->dev, "Configure PWM for %s led failed, rc=%d\n",
+					led->cdev.name, rc);
+		return rc;
+	}
+
+	mask |= 1 << (led->idx + LED_EN_CTL_OFFSET);
+
+	if (led->pwm_setting.duty_ns == 0)
+		val = 0;
+	else
+		val = mask;
+
+	rc = qti_rgb_masked_write(led->chip, REG_LED_EN_CTL, mask, val);
+	if (rc < 0)
+		dev_err(led->chip->dev, "Update addr 0x%x failed, rc=%d\n",
+					REG_LED_EN_CTL, rc);
+
+	return rc;
+}
+
+static void rgb_led_set_work(struct work_struct *work)
+{
+	struct qti_rgb_led_dev *led = container_of(work,
+			struct qti_rgb_led_dev, work);
+	u32 brightness = 0, on_ms, off_ms, period_ns, duty_ns;
+	int rc = 0;
+
+	mutex_lock(&led->lock);
+	if (led->led_setting.blink) {
+		on_ms = led->led_setting.on_ms;
+		off_ms = led->led_setting.off_ms;
+
+		if (on_ms > INT_MAX / NSEC_PER_MSEC)
+			duty_ns = INT_MAX - 1;
+		else
+			duty_ns = on_ms * NSEC_PER_MSEC;
+
+		if (on_ms + off_ms > INT_MAX / NSEC_PER_MSEC) {
+			period_ns = INT_MAX;
+			duty_ns = (period_ns / (on_ms + off_ms)) * on_ms;
+		} else {
+			period_ns = (on_ms + off_ms) * NSEC_PER_MSEC;
+		}
+
+		if (period_ns < duty_ns && duty_ns != 0)
+			period_ns = duty_ns + 1;
+	} else {
+		brightness = led->led_setting.brightness;
+		period_ns = pwm_get_period(led->pwm_dev);
+		/* Use initial period if no blinking is required */
+		if (period_ns > led->pwm_setting.initial_period_ns)
+			period_ns = led->pwm_setting.initial_period_ns;
+
+		if (period_ns > INT_MAX / brightness)
+			duty_ns = (period_ns / LED_FULL) * brightness;
+		else
+			duty_ns = (period_ns * brightness) / LED_FULL;
+
+		if (period_ns < duty_ns && duty_ns != 0)
+			period_ns = duty_ns + 1;
+	}
+	pr_debug("PWM settings for %s led: period = %dns, duty = %dns\n",
+			led->cdev.name, period_ns, duty_ns);
+
+	led->pwm_setting.duty_ns = duty_ns;
+	led->pwm_setting.period_ns = period_ns;
+
+	rc = __rgb_led_set(led);
+	if (rc < 0) {
+		dev_err(led->chip->dev, "rgb_led_set %s failed, rc=%d\n",
+				led->cdev.name, rc);
+		goto unlock;
+	}
+
+	if (led->led_setting.blink) {
+		led->cdev.brightness = LED_FULL;
+		led->blinking = true;
+	} else {
+		led->cdev.brightness = brightness;
+		led->blinking = false;
+	}
+
+unlock:
+	mutex_unlock(&led->lock);
+}
+
+static void qti_rgb_led_set(struct led_classdev *led_cdev,
+		enum led_brightness brightness)
+{
+	struct qti_rgb_led_dev *led =
+		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
+
+	mutex_lock(&led->lock);
+	if (brightness > LED_FULL)
+		brightness = LED_FULL;
+
+	if (brightness == led->led_setting.brightness &&
+				!led->blinking) {
+		mutex_unlock(&led->lock);
+		return;
+	}
+	led->led_setting.blink = false;
+	led->led_setting.brightness = brightness;
+	mutex_unlock(&led->lock);
+
+	schedule_work(&led->work);
+}
+
+static enum led_brightness qti_rgb_led_get(struct led_classdev *led_cdev)
+{
+	return led_cdev->brightness;
+}
+
+static int qti_rgb_led_blink(struct led_classdev *led_cdev,
+		unsigned long *on_ms, unsigned long *off_ms)
+{
+	struct qti_rgb_led_dev *led =
+		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
+
+	if (*on_ms == 0 || *off_ms == 0) {
+		dev_err(led->chip->dev, "Can't set blink for on=%lums off=%lums\n",
+						*on_ms, *off_ms);
+		return -EINVAL;
+	}
+
+	mutex_lock(&led->lock);
+	if (led->blinking && *on_ms == led->led_setting.on_ms &&
+			*off_ms == led->led_setting.off_ms) {
+		pr_debug("Ignore, on/off setting is not changed: on %lums, off %lums\n",
+							*on_ms, *off_ms);
+		mutex_unlock(&led->lock);
+		return 0;
+	}
+
+	led->led_setting.blink = true;
+	led->led_setting.on_ms = (u32)*on_ms;
+	led->led_setting.off_ms = (u32)*off_ms;
+	mutex_unlock(&led->lock);
+
+	schedule_work(&led->work);
+
+	return 0;
+}
+
+static ssize_t blink_store(struct device *dev, struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	int rc;
+	u32 blink;
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct qti_rgb_led_dev *led =
+		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
+
+	rc = kstrtouint(buf, 0, &blink);
+	if (rc)
+		return rc;
+
+	if (!!blink)
+		qti_rgb_led_blink(led_cdev,
+				(unsigned long *)&led->led_setting.on_ms,
+				(unsigned long *)&led->led_setting.off_ms);
+	else
+		qti_rgb_led_set(led_cdev, LED_OFF);
+
+	return count;
+}
+
+static ssize_t blink_show(struct device *dev, struct device_attribute *attr,
+							char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct qti_rgb_led_dev *led =
+		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
+	bool blink;
+
+	blink = led->led_setting.blink &&
+			led->cdev.brightness == LED_FULL;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", blink);
+}
+
+static ssize_t on_off_ms_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int rc, buff_size;
+	char buff[32];
+	char *token, *buff_ptr;
+	bool blink;
+	u32 on_ms, off_ms, brightness;
+
+	buff_size = min(count, sizeof(buff) - 1);
+	memcpy(buff, buf, buff_size);
+	buff[buff_size] = '\0';
+	buff_ptr = buff;
+
+	token = strsep(&buff_ptr, " ");
+	if (!token)
+		return -EINVAL;
+
+	rc = kstrtouint(token, 0, &on_ms);
+	if (rc < 0)
+		return rc;
+
+	token = strsep(&buff_ptr, " ");
+	if (!token)
+		return -EINVAL;
+
+	rc = kstrtouint(token, 0, &off_ms);
+	if (rc < 0)
+		return rc;
+
+	blink = !(on_ms == 0 || off_ms == 0);
+	if (on_ms == 0)
+		brightness = LED_OFF;
+	else if (off_ms == 0)
+		brightness = LED_FULL;
+
+	if (blink)
+		qti_rgb_led_blink(led_cdev, (unsigned long *)&on_ms,
+					(unsigned long *)&off_ms);
+	else
+		qti_rgb_led_set(led_cdev, brightness);
+
+	return count;
+}
+
+static ssize_t on_off_ms_show(struct device *dev, struct device_attribute *attr,
+							char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct qti_rgb_led_dev *led =
+		container_of(led_cdev, struct qti_rgb_led_dev, cdev);
+
+	return snprintf(buf, PAGE_SIZE, "on: %dms, off: %dms\n",
+			led->led_setting.on_ms, led->led_setting.off_ms);
+}
+
+static DEVICE_ATTR(blink, 0644, blink_show, blink_store);
+static DEVICE_ATTR(on_off_ms, 0644, on_off_ms_show, on_off_ms_store);
+
+static struct attribute *blink_attrs[] = {
+	&dev_attr_blink.attr,
+	&dev_attr_on_off_ms.attr,
+	NULL
+};
+
+static const struct attribute_group blink_attrs_group = {
+	.attrs = blink_attrs,
+};
+
+static int qti_rgb_leds_register(struct qti_rgb_chip *chip)
+{
+	int rc, i, j;
+
+	for (i = 0; i < NUM_LEDS; i++) {
+		INIT_WORK(&chip->leds[i].work, rgb_led_set_work);
+		mutex_init(&chip->leds[i].lock);
+		chip->leds[i].cdev.name = led_names[i];
+		chip->leds[i].cdev.max_brightness = LED_FULL;
+		chip->leds[i].cdev.brightness = LED_OFF;
+		chip->leds[i].cdev.brightness_set = qti_rgb_led_set;
+		chip->leds[i].cdev.brightness_get = qti_rgb_led_get;
+		if (chip->leds[i].support_blink)
+			chip->leds[i].cdev.blink_set = qti_rgb_led_blink;
+
+		rc = devm_led_classdev_register(chip->dev, &chip->leds[i].cdev);
+		if (rc < 0) {
+			dev_err(chip->dev, "%s led class device registering failed, rc=%d\n",
+							led_names[i], rc);
+			goto destroy;
+		}
+
+		if (chip->leds[i].support_blink) {
+			rc = sysfs_create_group(&chip->leds[i].cdev.dev->kobj,
+							&blink_attrs_group);
+			if (rc < 0) {
+				dev_err(chip->dev, "Create blink_attrs for %s led failed, rc=%d\n",
+						led_names[i], rc);
+				goto destroy;
+			}
+		}
+	}
+
+	return 0;
+destroy:
+	for (j = 0; j < i; j++) {
+		mutex_destroy(&chip->leds[i].lock);
+		sysfs_remove_group(&chip->leds[i].cdev.dev->kobj,
+				&blink_attrs_group);
+	}
+
+	return rc;
+}
+
+static int qti_rgb_leds_init_pwm_settings(struct qti_rgb_chip *chip)
+{
+	u32 period_ns, duty_ns;
+	bool is_enabled;
+	int i;
+
+	for (i = 0; i < NUM_LEDS; i++) {
+		period_ns = pwm_get_period(chip->leds[i].pwm_dev);
+		duty_ns = pwm_get_duty_cycle(chip->leds[i].pwm_dev);
+		is_enabled = pwm_is_enabled(chip->leds[i].pwm_dev);
+
+		pr_debug("%s led PWM default setting: period = %dns, duty = %dns, is_enabled = %d\n",
+			led_names[i], period_ns, duty_ns, is_enabled);
+		chip->leds[i].pwm_setting.initial_period_ns = period_ns;
+		if (duty_ns > period_ns) {
+			duty_ns = period_ns - 1;
+			pwm_set_duty_cycle(chip->leds[i].pwm_dev, duty_ns);
+		}
+
+		if (is_enabled)
+			pwm_disable(chip->leds[i].pwm_dev);
+	}
+
+	return 0;
+}
+
+static int qti_rgb_leds_hw_init(struct qti_rgb_chip *chip)
+{
+	int rc = 0;
+
+	/* Disable ATC_EN for LEDs */
+	rc = qti_rgb_masked_write(chip, REG_LED_ATC_EN_CTL,
+				LED_ATC_EN_MASK, 0);
+	if (rc < 0) {
+		dev_err(chip->dev, "Writing ATC_EN_CTL failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	/* Select VINRGB_VBOOST as the source */
+	rc = qti_rgb_masked_write(chip, REG_LED_SRC_SEL, LED_SRC_SEL_MASK,
+				LED_SRC_VINRGB_VBOOST);
+	if (rc < 0) {
+		dev_err(chip->dev, "Writing SRC_SEL failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+static int qti_rgb_leds_parse_dt(struct qti_rgb_chip *chip)
+{
+	int rc, i, count;
+	const __be32 *addr;
+	u32 support_blink[NUM_LEDS], on_ms[NUM_LEDS], off_ms[NUM_LEDS];
+
+	addr = of_get_address(chip->dev->of_node, 0, NULL, NULL);
+	if (!addr) {
+		dev_err(chip->dev, "Getting address failed\n");
+		return -EINVAL;
+	}
+	chip->reg_base = be32_to_cpu(addr[0]);
+
+	for (i = 0; i < NUM_LEDS; i++) {
+		chip->leds[i].pwm_dev = devm_pwm_get(chip->dev, led_names[i]);
+		if (IS_ERR(chip->leds[i].pwm_dev)) {
+			rc = PTR_ERR(chip->leds[i].pwm_dev);
+			if (rc != -EPROBE_DEFER)
+				dev_err(chip->dev, "Get pwm device for %s led failed, rc=%d\n",
+						led_names[i], rc);
+			return rc;
+		}
+		chip->leds[i].chip = chip;
+		chip->leds[i].idx = i;
+	}
+
+	count = of_property_count_elems_of_size(chip->dev->of_node,
+			"qcom,support-blink", sizeof(u32));
+	if (count > 0) {
+		if (count != NUM_LEDS) {
+			dev_err(chip->dev, "qcom,support-blink property expects %d elements, but it has %d\n",
+					NUM_LEDS, count);
+			return -EINVAL;
+		}
+		rc = of_property_read_u32_array(chip->dev->of_node,
+				"qcom,support-blink", support_blink, count);
+		if (rc < 0) {
+			dev_err(chip->dev, "qcom,support-blink property reading failed, rc=%d\n",
+					rc);
+			return rc;
+		}
+		rc = of_property_read_u32_array(chip->dev->of_node,
+				"qcom,on-ms", on_ms, count);
+		if (rc < 0) {
+			dev_err(chip->dev, "qcom,on-ms property reading failed, rc=%d\n",
+					rc);
+			return rc;
+		}
+		rc = of_property_read_u32_array(chip->dev->of_node,
+				"qcom,off-ms", off_ms, count);
+		if (rc < 0) {
+			dev_err(chip->dev, "qcom,off-ms property reading failed, rc=%d\n",
+					rc);
+			return rc;
+		}
+
+		for (i = 0; i < NUM_LEDS; i++) {
+			chip->leds[i].support_blink = !!support_blink[i];
+			chip->leds[i].led_setting.on_ms = on_ms[i];
+			chip->leds[i].led_setting.off_ms = off_ms[i];
+			if (chip->leds[i].support_blink)
+				pr_debug("%s led supports blink, on_ms=%d, off_ms=%d!\n",
+					led_names[i], on_ms[i], off_ms[i]);
+			else
+				pr_debug("%s led doesn't support blink\n",
+					led_names[i]);
+		}
+	}
+
+	return rc;
+}
+
+static int qti_rgb_leds_probe(struct platform_device *pdev)
+{
+	struct qti_rgb_chip *chip;
+	int rc = 0;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &pdev->dev;
+	chip->regmap = dev_get_regmap(chip->dev->parent, NULL);
+	if (!chip->regmap) {
+		dev_err(chip->dev, "Getting regmap failed\n");
+		return -EINVAL;
+	}
+
+	rc = qti_rgb_leds_parse_dt(chip);
+	if (rc < 0) {
+		dev_err(chip->dev, "Devicetree properties parsing failed, rc=%d\n",
+								rc);
+		return rc;
+	}
+
+	rc = qti_rgb_leds_init_pwm_settings(chip);
+	if (rc < 0) {
+		dev_err(chip->dev, "Init PWM setting failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	mutex_init(&chip->bus_lock);
+
+	rc = qti_rgb_leds_hw_init(chip);
+	if (rc) {
+		dev_err(chip->dev, "HW initialization failed, rc=%d\n", rc);
+		goto destroy;
+	}
+
+	dev_set_drvdata(chip->dev, chip);
+	rc = qti_rgb_leds_register(chip);
+	if (rc < 0) {
+		dev_err(chip->dev, "Registering LED class devices failed, rc=%d\n",
+								rc);
+		goto destroy;
+	}
+
+	return 0;
+destroy:
+	mutex_destroy(&chip->bus_lock);
+	dev_set_drvdata(chip->dev, NULL);
+
+	return rc;
+}
+
+static int qti_rgb_leds_remove(struct platform_device *pdev)
+{
+	int i;
+	struct qti_rgb_chip *chip = dev_get_drvdata(&pdev->dev);
+
+	mutex_destroy(&chip->bus_lock);
+	for (i = 0; i < NUM_LEDS; i++) {
+		if (chip->leds[i].support_blink)
+			sysfs_remove_group(&chip->leds[i].cdev.dev->kobj,
+						&blink_attrs_group);
+		mutex_destroy(&chip->leds[i].lock);
+	}
+	dev_set_drvdata(chip->dev, NULL);
+	return 0;
+}
+
+static const struct of_device_id qti_rgb_of_match[] = {
+	{ .compatible = "qcom,leds-rgb",},
+	{ },
+};
+
+static struct platform_driver qti_rgb_leds_driver = {
+	.driver		= {
+		.name		= "qcom,leds-rgb",
+		.of_match_table	= qti_rgb_of_match,
+	},
+	.probe		= qti_rgb_leds_probe,
+	.remove		= qti_rgb_leds_remove,
+};
+module_platform_driver(qti_rgb_leds_driver);
+
+MODULE_DESCRIPTION("QTI TRI_LED (RGB) driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("leds:leds-qti-rgb");
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
