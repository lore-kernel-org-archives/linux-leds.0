From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 8/9] leds: add LM3633 driver
Date: Fri, 27 Nov 2015 12:19:19 +0100
Message-ID: <56583C37.1050307@samsung.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-9-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42785 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754413AbbK0LTY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Nov 2015 06:19:24 -0500
In-reply-to: <1448521025-2796-9-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Milo,

Thanks for the update. I have few comments below.

On 11/26/2015 07:57 AM, Milo Kim wrote:
> LM3633 LED driver supports generic LED functions and pattern generation.
> Pattern is generated through the sysfs. ABI documentation is also added.
>
> Device creation from device tree
> --------------------------------
>    LED channel name, LED string usage and max current settings are
>    configured inside the DT.
>
> LED dimming pattern generation
> ------------------------------
>    LM3633 supports programmable dimming pattern generator.
>    To enable it, eight attributes are used. Sysfs ABI describes it.
>    - Time domain
>      : 'pattern_time_delay', 'pattern_time_rise', 'pattern_time_high',
>        'pattern_time_fall' and 'pattern_time_low'.
>    - Level domain
>      : 'pattern_brightness_low' and 'pattern_brightness_high'.
>    - Start or stop
>      : 'run_pattern'
>
> LMU fault monitor event handling
> --------------------------------
>    As soon as LMU fault monitoring is done, LMU device is reset. So LED
>    device should be reinitialized. lm3633_led_fault_monitor_notifier() is
>    used for this purpose.
>
> Data structure
> --------------
>    ti_lmu_led:         LED output channel data.
>    ti_lmu_led_chip:    LED device data. One LED device can have multiple
>                        LED channel data.
>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>   Documentation/ABI/testing/sysfs-class-led-lm3633 |  97 +++
>   drivers/leds/Kconfig                             |  10 +
>   drivers/leds/Makefile                            |   1 +
>   drivers/leds/leds-lm3633.c                       | 840 +++++++++++++++++++++++
>   4 files changed, 948 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-lm3633
>   create mode 100644 drivers/leds/leds-lm3633.c
>
> diff --git a/Documentation/ABI/testing/sysfs-class-led-lm3633 b/Documentation/ABI/testing/sysfs-class-led-lm3633
> new file mode 100644
> index 0000000..46217d4
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-lm3633
> @@ -0,0 +1,97 @@
> +LM3633 LED driver generates programmable pattern via the sysfs.
> +
> +LED Pattern Generator Structure
> +
> +                            (3)
> +  (a) --------------->  ___________
> +                       /           \
> +                  (2) /             \ (4)
> +  (b) ----> _________/               \_________  ...
> +               (1)                       (5)
> +
> +                     |<-----   period   -----> |
> +
> +What:		/sys/class/leds/<led>/pattern_time_delay
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern startup delay. Please refer to (1).
> +                Range is from 0 to 9700. Unit is millisecond.
> +
> +What:		/sys/class/leds/<led>/pattern_time_rise
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern rising dimming time. Please refer to (2).
> +                Range is from 0 to 16000. Unit is millisecond.
> +
> +What:		/sys/class/leds/<led>/pattern_time_high
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern high level time. Please refer to (3).
> +                It means how much time stays at high level.
> +                Range is from 0 to 9700. Unit is millisecond.
> +
> +What:		/sys/class/leds/<led>/pattern_time_fall
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern falling dimming time. Please refer to (4).
> +                Range is from 0 to 16000. Unit is millisecond.
> +
> +What:		/sys/class/leds/<led>/pattern_time_low
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern low level time. Please refer to (5).
> +                It means how much time stays at low level.
> +                Range is from 0 to 9700. Unit is millisecond.
> +
> +What:		/sys/class/leds/<led>/pattern_brightness_high
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern brightness value at high level.
> +                Please refer to (a). Range is from 0 to max brightness value.
> +
> +What:		/sys/class/leds/<led>/pattern_brightness_low
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                Set pattern brightness value at low level.
> +                Please refer to (b). Range is from 0 to max brightness value.
> +
> +What:		/sys/class/leds/<led>/run_pattern
> +Date:		Dec 2015
> +KernelVersion:	4.5
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                It is used for activating or deactivating programmed LED
> +                dimming pattern. Please make sure pattern parameters
> +                should be written prior to accessing this attribute.
> +
> +                1 : activate programmed pattern
> +                0 : deactivate the pattern
> +
> +                Example:
> +                To run the pattern,
> +
> +                echo 0 > /sys/class/leds/<led>/pattern_time_delay
> +                echo 200 > /sys/class/leds/<led>/pattern_time_rise
> +                echo 300 > /sys/class/leds/<led>/pattern_time_high
> +                echo 100 > /sys/class/leds/<led>/pattern_time_fall
> +                echo 400 > /sys/class/leds/<led>/pattern_time_low
> +                echo 0 > /sys/class/leds/<led>/pattern_brightness_low
> +                echo 255 > /sys/class/leds/<led>/pattern_brightness_high
> +                echo 1 > /sys/class/leds/<led>/run_pattern
> +
> +                To stop running pattern,
> +                echo 0 > /sys/class/leds/<led>/run_pattern
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b1ab8bd..ed071ac 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -88,6 +88,16 @@ config LEDS_LM3533
>   	  hardware-accelerated blinking with maximum on and off periods of 9.8
>   	  and 77 seconds respectively.
>
> +config LEDS_LM3633
> +	tristate "LED support for the TI LM3633 LMU"
> +	depends on LEDS_CLASS
> +	depends on MFD_TI_LMU
> +	help
> +	  This option enables support for the LEDs on the LM3633.
> +	  LM3633 has 6 low voltage indicator LEDs.
> +	  All low voltage current sinks can have a programmable pattern
> +	  modulated onto LED output strings.
> +
>   config LEDS_LM3642
>   	tristate "LED support for LM3642 Chip"
>   	depends on LEDS_CLASS && I2C
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e9d53092..e183b7d 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
>   obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
>   obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>   obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
> +obj-$(CONFIG_LEDS_LM3633)		+= leds-lm3633.o
>   obj-$(CONFIG_LEDS_LM3642)		+= leds-lm3642.o
>   obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
>   obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
> diff --git a/drivers/leds/leds-lm3633.c b/drivers/leds/leds-lm3633.c
> new file mode 100644
> index 0000000..9c391ca
> --- /dev/null
> +++ b/drivers/leds/leds-lm3633.c
> @@ -0,0 +1,840 @@
> +/*
> + * TI LM3633 LED driver
> + *
> + * Copyright 2015 Texas Instruments
> + *
> + * Author: Milo Kim <milo.kim@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/mfd/ti-lmu.h>
> +#include <linux/mfd/ti-lmu-register.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define LM3633_MAX_PWM				255
> +#define LM3633_MIN_CURRENT			5000
> +#define LM3633_MAX_CURRENT			30000
> +#define LM3633_MAX_PERIOD			9700
> +#define LM3633_SHORT_TIMESTEP			16
> +#define LM3633_LONG_TIMESTEP			131
> +#define LM3633_TIME_OFFSET			61
> +#define LM3633_PATTERN_REG_OFFSET		16
> +#define LM3633_IMAX_OFFSET			6
> +
> +enum lm3633_led_bank_id {
> +	LM3633_LED_BANK_C,
> +	LM3633_LED_BANK_D,
> +	LM3633_LED_BANK_E,
> +	LM3633_LED_BANK_F,
> +	LM3633_LED_BANK_G,
> +	LM3633_LED_BANK_H,
> +	LM3633_MAX_LEDS,
> +};
> +
> +/**
> + * struct ti_lmu_led_chip
> + *
> + * @dev:		Parent device pointer
> + * @lmu:		LMU structure. Used for register R/W access.
> + * @lock:		Secure handling for multiple user interface access
> + * @lmu_led:		Multiple LED strings

Could you clarify what "string" means here?

> + * @num_leds:		Number of LED strings

and here?

> + * @nb:			Notifier block for handling LMU fault monitor event
> + *
> + * One LED chip can have multiple LED strings.
> + */
> +struct ti_lmu_led_chip {
> +	struct device *dev;
> +	struct ti_lmu *lmu;
> +	struct mutex lock;
> +	struct ti_lmu_led *lmu_led;
> +	int num_leds;
> +	struct notifier_block nb;
> +};
> +
> +/**
> + * struct ti_lmu_led
> + *
> + * @chip:		Pointer to parent LED device
> + * @bank_id:		LED bank ID
> + * @cdev:		LED subsystem device structure
> + * @name:		LED channel name
> + * @led_sources:	LED output channel configuration.
> + *			Bit mask is set on parsing DT.
> + * @max_brightness:	Max brightness value.
> + *			Is is determined by led-max-microamp.
> + *
> + * Each LED device has its own channel configuration.
> + * For chip control, parent chip data structure is used.
> + */
> +struct ti_lmu_led {
> +	struct ti_lmu_led_chip *chip;
> +	enum lm3633_led_bank_id bank_id;
> +	struct led_classdev cdev;
> +	const char *name;

You have it in the struct led_classdev.

> +	unsigned long led_sources;
> +	u8 max_brightness;

This is also present in the struct led_classdev.

> +};
> +
> +static struct ti_lmu_led *to_ti_lmu_led(struct device *dev)
> +{
> +	struct led_classdev *cdev = dev_get_drvdata(dev);
> +
> +	return container_of(cdev, struct ti_lmu_led, cdev);
> +}
> +
> +static u8 lm3633_led_get_enable_mask(struct ti_lmu_led *lmu_led)
> +{
> +	return 1 << (lmu_led->bank_id + LM3633_LED_BANK_OFFSET);
> +}
> +
> +static int lm3633_led_enable_bank(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return regmap_update_bits(regmap, LM3633_REG_ENABLE, mask, mask);
> +}
> +
> +static int lm3633_led_disable_bank(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return regmap_update_bits(regmap, LM3633_REG_ENABLE, mask, 0);
> +}
> +
> +static int lm3633_led_config_bank(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	const u8 group_led[] = { 0, BIT(0), BIT(0), 0, BIT(3), BIT(3), };
> +	const enum lm3633_led_bank_id default_id[] = {
> +		LM3633_LED_BANK_C, LM3633_LED_BANK_C, LM3633_LED_BANK_C,
> +		LM3633_LED_BANK_F, LM3633_LED_BANK_F, LM3633_LED_BANK_F,
> +	};
> +	const enum lm3633_led_bank_id separate_id[] = {
> +		LM3633_LED_BANK_C, LM3633_LED_BANK_D, LM3633_LED_BANK_E,
> +		LM3633_LED_BANK_F, LM3633_LED_BANK_G, LM3633_LED_BANK_H,
> +	};
> +	int i, ret;
> +	u8 val;
> +
> +	/*
> +	 * Check configured LED string and assign control bank
> +	 *
> +	 * Each LED is tied with other LEDS (group):
> +	 *   the default control bank is assigned
> +	 *
> +	 * Otherwise:
> +	 *   separate bank is assigned
> +	 */
> +
> +	for (i = 0; i < LM3633_MAX_LEDS; i++) {
> +		/* LED 0 and LED 3 are fixed, so no assignment is required */
> +		if (i == 0 || i == 3)
> +			continue;
> +
> +		if (test_bit(i, &lmu_led->led_sources)) {
> +			if (lmu_led->led_sources & group_led[i]) {
> +				lmu_led->bank_id = default_id[i];
> +				val = 0;
> +			} else {
> +				lmu_led->bank_id = separate_id[i];
> +				val = BIT(i);
> +			}
> +
> +			ret = regmap_update_bits(regmap, LM3633_REG_BANK_SEL,
> +						 BIT(i), val);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static u8 lm3633_convert_time_to_index(unsigned int msec)
> +{
> +	u8 idx, offset;
> +
> +	/*
> +	 * Find an approximate index

I think that we shouldn't approximate but clamp the msec
to the nearest possible device setting.

> +	 *
> +	 *      0 <= time <= 1000 : 16ms step
> +	 *   1000 <  time <= 9700 : 131ms step, base index is 61
> +	 */
> +
> +	msec = min_t(int, msec, LM3633_MAX_PERIOD);
> +
> +	if (msec <= 1000) {
> +		idx = msec / LM3633_SHORT_TIMESTEP;
> +		if (idx > 1)
> +			idx--;
> +		offset = 0;
> +	} else {
> +		idx = (msec - 1000) / LM3633_LONG_TIMESTEP;
> +		offset = LM3633_TIME_OFFSET;
> +	}
> +
> +	return idx + offset;
> +}
> +
> +static u8 lm3633_convert_ramp_to_index(unsigned int msec)
> +{
> +	const int ramp_table[] = { 2, 250, 500, 1000, 2000, 4000, 8000, 16000 };
> +	int size = ARRAY_SIZE(ramp_table);
> +	int i;
> +
> +	if (msec <= ramp_table[0])
> +		return 0;
> +
> +	if (msec > ramp_table[size - 1])
> +		return size - 1;
> +
> +	for (i = 1; i < size; i++) {
> +		if (msec == ramp_table[i])
> +			return i;
> +
> +		/* Find an approximate index by looking up the table */

Similarly here. So you should have an array of the possible msec
values and iterate through it to look for the nearest one.

> +		if (msec > ramp_table[i - 1] && msec < ramp_table[i]) {
> +			if (msec - ramp_table[i - 1] < ramp_table[i] - msec)
> +				return i - 1;
> +			else
> +				return i;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int lm3633_led_update_linear_time(const char *buf,
> +					 struct ti_lmu_led *lmu_led, u8 reg)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	unsigned long time;
> +	u8 offset = lmu_led->bank_id * LM3633_PATTERN_REG_OFFSET;
> +
> +	/*
> +	 * Time register addresses need offset number based on the LED bank.
> +	 * Register values are index domain, so input time value should be
> +	 * converted to index.
> +	 */
> +
> +	if (kstrtoul(buf, 0, &time))
> +		return -EINVAL;
> +
> +	return regmap_write(regmap, reg + offset,
> +			    lm3633_convert_time_to_index(time));
> +}
> +
> +static int lm3633_led_update_ramp_time(const char *buf,
> +				       struct ti_lmu_led *lmu_led,
> +				       u8 mask, u8 shift)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	unsigned long ramp_time;
> +	u8 reg, val;
> +
> +	/*
> +	 * Register values are index domain, so input time value should be
> +	 * converted to index.
> +	 */
> +
> +	if (kstrtoul(buf, 0, &ramp_time))
> +		return -EINVAL;
> +
> +	switch (lmu_led->bank_id) {
> +	case LM3633_LED_BANK_C:
> +	case LM3633_LED_BANK_D:
> +	case LM3633_LED_BANK_E:
> +		reg = LM3633_REG_PTN0_RAMP;
> +		break;
> +	case LM3633_LED_BANK_F:
> +	case LM3633_LED_BANK_G:
> +	case LM3633_LED_BANK_H:
> +		reg = LM3633_REG_PTN1_RAMP;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	val = lm3633_convert_ramp_to_index(ramp_time) << shift;

Please add empty line here.

> +	return regmap_update_bits(regmap, reg, mask, val);
> +}
> +
> +static ssize_t lm3633_led_store_pattern_time_delay(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_update_linear_time(buf, lmu_led, LM3633_REG_PTN_DELAY);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t lm3633_led_store_pattern_time_high(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_update_linear_time(buf, lmu_led,
> +					    LM3633_REG_PTN_HIGHTIME);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t lm3633_led_store_pattern_time_low(struct device *dev,
> +						 struct device_attribute *attr,
> +						 const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_update_linear_time(buf, lmu_led,
> +					    LM3633_REG_PTN_LOWTIME);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t lm3633_led_store_pattern_time_rise(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_update_ramp_time(buf, lmu_led, LM3633_PTN_RAMPUP_MASK,
> +					  LM3633_PTN_RAMPUP_SHIFT);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t lm3633_led_store_pattern_time_fall(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_update_ramp_time(buf, lmu_led, LM3633_PTN_RAMPDN_MASK,
> +				       LM3633_PTN_RAMPDN_SHIFT);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static int lm3633_led_set_pattern_brightness(const char *buf,
> +					     struct ti_lmu_led *lmu_led, u8 reg)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	unsigned long brt;
> +	int ret;
> +
> +	if (kstrtoul(buf, 0, &brt))
> +		return -EINVAL;
> +
> +	ret = lm3633_led_disable_bank(lmu_led);
> +	if (ret)
> +		return ret;
> +
> +	brt = min_t(unsigned long, brt, lmu_led->max_brightness);
> +
> +	return regmap_write(regmap, reg, (u8)brt);
> +}
> +
> +static ssize_t lm3633_led_store_pattern_brightness_low(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	u8 offset = lmu_led->bank_id * LM3633_PATTERN_REG_OFFSET;
> +	u8 reg = LM3633_REG_PTN_LOWBRT + offset;
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_set_pattern_brightness(buf, lmu_led, reg);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t lm3633_led_store_pattern_brightness_high(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	u8 reg = LM3633_REG_PTN_HIGHBRT + lmu_led->bank_id;
> +	int ret;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +	ret = lm3633_led_set_pattern_brightness(buf, lmu_led, reg);
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static int lm3633_led_activate_pattern(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +	int ret;
> +
> +	ret = regmap_update_bits(regmap, LM3633_REG_PATTERN, mask, mask);
> +	if (ret)
> +		return ret;
> +
> +	return lm3633_led_enable_bank(lmu_led);
> +}
> +
> +static int lm3633_led_deactivate_pattern(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return regmap_update_bits(regmap, LM3633_REG_PATTERN, mask, 0);
> +}
> +
> +static ssize_t lm3633_led_run_pattern(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	unsigned long run;
> +	int ret;
> +
> +	if (kstrtoul(buf, 0, &run))
> +		return -EINVAL;
> +
> +	mutex_lock(&lmu_led->chip->lock);
> +
> +	if (!run)
> +		ret = lm3633_led_deactivate_pattern(lmu_led);
> +	else
> +		ret = lm3633_led_activate_pattern(lmu_led);
> +
> +	mutex_unlock(&lmu_led->chip->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +#define LM3633_PATTERN_ATTR(name)	\
> +DEVICE_ATTR(pattern_##name, S_IWUSR, NULL, lm3633_led_store_pattern_##name)
> +
> +static LM3633_PATTERN_ATTR(time_delay);
> +static LM3633_PATTERN_ATTR(time_rise);
> +static LM3633_PATTERN_ATTR(time_high);
> +static LM3633_PATTERN_ATTR(time_fall);
> +static LM3633_PATTERN_ATTR(time_low);
> +static LM3633_PATTERN_ATTR(brightness_low);
> +static LM3633_PATTERN_ATTR(brightness_high);
> +static DEVICE_ATTR(run_pattern, S_IWUSR, NULL, lm3633_led_run_pattern);
> +
> +static struct attribute *lm3633_led_attrs[] = {
> +	&dev_attr_pattern_time_delay.attr,
> +	&dev_attr_pattern_time_rise.attr,
> +	&dev_attr_pattern_time_high.attr,
> +	&dev_attr_pattern_time_fall.attr,
> +	&dev_attr_pattern_time_low.attr,
> +	&dev_attr_pattern_brightness_low.attr,
> +	&dev_attr_pattern_brightness_high.attr,
> +	&dev_attr_run_pattern.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(lm3633_led);	/* lm3633_led_groups */
> +
> +static int lm3633_led_set_max_current(struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u8 reg = LM3633_REG_IMAX_LVLED_BASE + lmu_led->bank_id;
> +
> +	return regmap_write(regmap, reg, LMU_IMAX_30mA);
> +}
> +
> +static int lm3633_led_brightness_set(struct led_classdev *cdev,
> +				     enum led_brightness brightness)
> +{
> +	struct ti_lmu_led *lmu_led = container_of(cdev, struct ti_lmu_led,
> +						  cdev);
> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
> +	struct regmap *regmap = chip->lmu->regmap;
> +	u8 reg = LM3633_REG_BRT_LVLED_BASE + lmu_led->bank_id;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = regmap_write(regmap, reg, brightness);
> +	if (ret) {
> +		mutex_unlock(&chip->lock);
> +		return ret;
> +	}
> +
> +	if (brightness == 0)
> +		lm3633_led_disable_bank(lmu_led);

This should be checked at first, as I suppose that disabling
a bank suffices to turn the LED off.

> +	else
> +		lm3633_led_enable_bank(lmu_led);
> +
> +	mutex_unlock(&chip->lock);
> +
> +	return 0;
> +}
> +
> +static int lm3633_led_init(struct ti_lmu_led *lmu_led, int bank_id)
> +{
> +	struct device *dev = lmu_led->chip->dev;
> +	int ret;
> +
> +	/*
> +	 * Sequence
> +	 *
> +	 * 1) Configure LED bank which is used for brightness control
> +	 * 2) Set max current for each output channel
> +	 * 3) Add LED device
> +	 */
> +
> +	ret = lm3633_led_config_bank(lmu_led);
> +	if (ret) {
> +		dev_err(dev, "Output bank register err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = lm3633_led_set_max_current(lmu_led);
> +	if (ret) {
> +		dev_err(dev, "Set max current err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	lmu_led->cdev.max_brightness = lmu_led->max_brightness;
> +	lmu_led->cdev.brightness_set_blocking = lm3633_led_brightness_set;
> +	lmu_led->cdev.groups = lm3633_led_groups;
> +	lmu_led->cdev.name = lmu_led->name;
> +
> +	ret = devm_led_classdev_register(dev, &lmu_led->cdev);
> +	if (ret) {
> +		dev_err(dev, "LED register err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void lm3633_led_of_set_label(struct device_node *np,
> +				    struct ti_lmu_led *lmu_led)
> +{
> +	const char *name;
> +
> +	if (!of_property_read_string(np, "label", &name))
> +		lmu_led->name = name;
> +	else
> +		lmu_led->name = np->name;
> +}
> +
> +static int lm3633_led_of_create_channel(struct device_node *np,
> +					struct ti_lmu_led *lmu_led)
> +{
> +	int ret, num_sources;
> +	u32 sources[LM3633_MAX_LEDS];
> +
> +	ret = of_property_count_u32_elems(np, "led-sources");
> +	if (ret < 0 || ret > LM3633_MAX_LEDS)
> +		return -EINVAL;
> +
> +	num_sources = ret;
> +	ret = of_property_read_u32_array(np, "led-sources", sources,
> +					 num_sources);
> +	if (ret)
> +		return ret;
> +
> +	lmu_led->led_sources = 0;
> +	while (num_sources--)
> +		set_bit(sources[num_sources], &lmu_led->led_sources);
> +
> +	return 0;
> +}
> +
> +static u8 lm3633_led_convert_current_to_index(u32 imax_microamp)
> +{
> +	u8 imax_milliamp = imax_microamp / 1000;
> +	const u8 imax_table[] = {
> +		LMU_IMAX_6mA,  LMU_IMAX_7mA,  LMU_IMAX_8mA,  LMU_IMAX_9mA,
> +		LMU_IMAX_10mA, LMU_IMAX_11mA, LMU_IMAX_12mA, LMU_IMAX_13mA,
> +		LMU_IMAX_14mA, LMU_IMAX_15mA, LMU_IMAX_16mA, LMU_IMAX_17mA,
> +		LMU_IMAX_18mA, LMU_IMAX_19mA, LMU_IMAX_20mA, LMU_IMAX_21mA,
> +		LMU_IMAX_22mA, LMU_IMAX_23mA, LMU_IMAX_24mA, LMU_IMAX_25mA,
> +		LMU_IMAX_26mA, LMU_IMAX_27mA, LMU_IMAX_28mA, LMU_IMAX_29mA,
> +	};
> +
> +	/* Valid range is from 5mA to 30mA */
> +	if (imax_milliamp <= 5)
> +		return LMU_IMAX_5mA;
> +
> +	if (imax_milliamp >= 30)
> +		return LMU_IMAX_30mA;
> +
> +	return imax_table[imax_milliamp - LM3633_IMAX_OFFSET];
> +}
> +
> +static u8 lm3633_led_scale_max_brightness(struct ti_lmu_led *lmu_led, u32 imax)
> +{
> +	u8 max_current = lm3633_led_convert_current_to_index(imax);
> +	const u8 max_brightness_table[] = {
> +		[LMU_IMAX_5mA]  = 191,
> +		[LMU_IMAX_6mA]  = 197,
> +		[LMU_IMAX_7mA]  = 203,
> +		[LMU_IMAX_8mA]  = 208,
> +		[LMU_IMAX_9mA]  = 212,
> +		[LMU_IMAX_10mA] = 216,
> +		[LMU_IMAX_11mA] = 219,
> +		[LMU_IMAX_12mA] = 222,
> +		[LMU_IMAX_13mA] = 225,
> +		[LMU_IMAX_14mA] = 228,
> +		[LMU_IMAX_15mA] = 230,
> +		[LMU_IMAX_16mA] = 233,
> +		[LMU_IMAX_17mA] = 235,
> +		[LMU_IMAX_18mA] = 237,
> +		[LMU_IMAX_19mA] = 239,
> +		[LMU_IMAX_20mA] = 241,
> +		[LMU_IMAX_21mA] = 242,
> +		[LMU_IMAX_22mA] = 244,
> +		[LMU_IMAX_23mA] = 246,
> +		[LMU_IMAX_24mA] = 247,
> +		[LMU_IMAX_25mA] = 249,
> +		[LMU_IMAX_26mA] = 250,
> +		[LMU_IMAX_27mA] = 251,
> +		[LMU_IMAX_28mA] = 253,
> +		[LMU_IMAX_29mA] = 254,
> +		[LMU_IMAX_30mA] = 255,
> +	};

After analyzing the subject one more time I think that we need to
change the approach regarding max brightness issue.

At first - we shouldn't fix max current to max possible register value.
Instead we should take led-max-microamp property and write its value
to the [0x22 + bank offset] registers.

With this approach whole 0-255 range of brightness levels will be
valid for the driver.

In effect all LMU_IMAX* enums seem to be not needed.


> +	return max_brightness_table[max_current];
> +}
> +
> +static void lm3633_led_of_get_max_brightness(struct device_node *np,
> +					     struct ti_lmu_led *lmu_led)
> +{
> +	struct regmap *regmap = lmu_led->chip->lmu->regmap;
> +	u32 imax = 0;
> +	u8 mode = 0;
> +
> +	of_property_read_u32(np, "led-max-microamp", &imax);
> +
> +	if (imax <= LM3633_MIN_CURRENT)
> +		imax = LM3633_MIN_CURRENT;
> +	else
> +		imax = min_t(unsigned int, imax, LM3633_MAX_CURRENT);
> +
> +	/*
> +	 * Max brightness is determined by mapping mode - exponential or
> +	 * linear.
> +	 */
> +	regmap_read(regmap, LM3633_REG_LED_MAPPING_MODE, (unsigned int *)&mode);
> +
> +	if (mode & LM3633_LED_EXPONENTIAL)
> +		lmu_led->max_brightness =
> +				lm3633_led_scale_max_brightness(lmu_led, imax);
> +	else
> +		lmu_led->max_brightness =
> +				(imax * LM3633_MAX_PWM) / LM3633_MAX_CURRENT;
> +}
> +
> +static int lm3633_led_of_create(struct ti_lmu_led_chip *chip,
> +				struct device_node *np)
> +{
> +	struct device_node *child;
> +	struct device *dev = chip->dev;
> +	struct ti_lmu_led *lmu_led, *each;
> +	int ret, num_leds;
> +	int i = 0;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	num_leds = of_get_child_count(np);
> +	if (num_leds == 0 || num_leds > LM3633_MAX_LEDS) {
> +		dev_err(dev, "Invalid number of LEDs: %d\n", num_leds);
> +		return -EINVAL;
> +	}
> +
> +	lmu_led = devm_kzalloc(dev, sizeof(*lmu_led) * num_leds, GFP_KERNEL);
> +	if (!lmu_led)
> +		return -ENOMEM;
> +
> +	for_each_child_of_node(np, child) {
> +		each = lmu_led + i;
> +		each->bank_id = 0;
> +		each->chip = chip;
> +
> +		lm3633_led_of_set_label(child, each);
> +
> +		ret = lm3633_led_of_create_channel(child, each);
> +		if (ret) {
> +			of_node_put(np);
> +			return ret;
> +		}
> +
> +		lm3633_led_of_get_max_brightness(child, each);
> +		i++;
> +	}
> +
> +	chip->lmu_led = lmu_led;
> +	chip->num_leds = num_leds;
> +
> +	return 0;
> +}
> +
> +static int lm3633_led_fault_monitor_notifier(struct notifier_block *nb,
> +					     unsigned long action, void *unused)
> +{
> +	struct ti_lmu_led_chip *chip = container_of(nb, struct ti_lmu_led_chip,
> +						    nb);
> +	struct ti_lmu_led *each;
> +	int i, ret;
> +
> +	/*
> +	 * LMU fault monitor driver resets the device, so LED should be
> +	 * re-configured after fault detection procedure is done.
> +	 */
> +	if (action == LMU_EVENT_MONITOR_DONE) {
> +		for (i = 0; i < chip->num_leds; i++) {
> +			each = chip->lmu_led + i;
> +			ret = lm3633_led_config_bank(each);
> +			if (ret) {
> +				dev_err(chip->dev,
> +					"Output bank register err: %d\n", ret);
> +				return NOTIFY_STOP;
> +			}
> +
> +			ret = lm3633_led_set_max_current(each);
> +			if (ret) {
> +				dev_err(chip->dev, "Set max current err: %d\n",
> +					ret);
> +				return NOTIFY_STOP;
> +			}
> +
> +			led_set_brightness(&each->cdev, each->cdev.brightness);
> +		}
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int lm3633_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ti_lmu *lmu = dev_get_drvdata(dev->parent);
> +	struct ti_lmu_led_chip *chip;
> +	struct ti_lmu_led *each;
> +	int i, ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = dev;
> +	chip->lmu = lmu;
> +
> +	ret = lm3633_led_of_create(chip, dev->of_node);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&chip->lock);
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		each = chip->lmu_led + i;
> +
> +		ret = lm3633_led_init(each, i);
> +		if (ret) {
> +			dev_err(dev, "LED initialization err: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Notifier callback is required because LED device needs
> +	 * reconfiguration after open/short circuit fault monitoring
> +	 * by ti-lmu-fault-monitor driver.
> +	 */
> +	chip->nb.notifier_call = lm3633_led_fault_monitor_notifier;
> +	ret = blocking_notifier_chain_register(&chip->lmu->notifier, &chip->nb);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	return 0;
> +}
> +
> +static int lm3633_led_remove(struct platform_device *pdev)
> +{
> +	struct ti_lmu_led_chip *chip = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < chip->num_leds; i++)
> +		lm3633_led_deactivate_pattern(chip->lmu_led + i);
> +
> +	blocking_notifier_chain_unregister(&chip->lmu->notifier, &chip->nb);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver lm3633_led_driver = {
> +	.probe = lm3633_led_probe,
> +	.remove = lm3633_led_remove,
> +	.driver = {
> +		.name = "lm3633-leds",
> +	},
> +};
> +
> +module_platform_driver(lm3633_led_driver);
> +
> +MODULE_DESCRIPTION("TI LM3633 LED Driver");
> +MODULE_AUTHOR("Milo Kim");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:lm3633-leds");
>


-- 
Best Regards,
Jacek Anaszewski
