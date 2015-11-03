From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND 15/16] leds: add LM3633 driver
Date: Tue, 03 Nov 2015 17:15:21 +0100
Message-ID: <5638DD99.9070502@samsung.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-16-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1446441875-1256-16-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Milo,

Thanks for the patch. Please find my comments in the code.

On 11/02/2015 06:24 AM, Milo Kim wrote:
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
>    To enable it, three attributes are used.
>    'pattern_times', 'pattern_levels' and 'run_pattern'.
>    Sysfs ABI describes it.
>
> LMU HWMON event handling
> ------------------------
>    As soon as LMU HWMON operation is done, LMU HWMON driver sends the event,
>    'LMU_EVENT_HWMON_DONE'. Then, LM3633 device should be reinitialized
>    because the device was reset by LMU HWMON driver.
>    lm3633_led_hwmon_notifier() handles this event.
>
> Data structure
> --------------
>    ti_lmu_led_chip:	LED device data.
>    ti_lmu_led:		LED output channel data.
> 			One LED device can have multiple LED channels.
>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>   Documentation/ABI/testing/sysfs-class-led-lm3633 |  60 ++
>   drivers/leds/Kconfig                             |  10 +
>   drivers/leds/Makefile                            |   1 +
>   drivers/leds/leds-lm3633.c                       | 749 +++++++++++++++++++++++
>   4 files changed, 820 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-lm3633
>   create mode 100644 drivers/leds/leds-lm3633.c
>
> diff --git a/Documentation/ABI/testing/sysfs-class-led-lm3633 b/Documentation/ABI/testing/sysfs-class-led-lm3633
> new file mode 100644
> index 0000000..c1d8759
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-lm3633
> @@ -0,0 +1,60 @@
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
> +What:		/sys/class/leds/<led>/pattern_times

"time" noun is uncountable.

> +Date:		Oct 2015
> +KernelVersion:	4.3

These properties certainly will not appear in 4.3.

> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	read/write
> +                Set pattern time dimension. There are five arguments.
> +                  (1) startup delay
> +                  (2) rising dimming time
> +                  (3) how much time stays at high level
> +                  (4) falling dimming time
> +                  (5) how much time stays at low level
> +                Ranges are
> +                  (1), (3), (5): 0 ~ 10000. Unit is millisecond.
> +                  (2), (4): 0 ~ 16000. Unit is millisecond.
> +
> +                Example:
> +                No delay, rising 200ms, high 300ms, falling 100ms, low 400ms.
> +                echo "0 200 300 100 400" > /sys/class/leds/<led>/pattern_times
> +
> +                cat /sys/class/leds/<led>/pattern_times
> +                delay: 0, rise: 200, high: 300, fall: 100, low: 400

Generally a sysfs attribute should represent a single value.
There are cases where the attribute comprises a list of space separated
values, but certainly colons and commas adds to much noise, and are
cumbersome to parse. I'd opt for creating a separate sysfs attribute
for each of the above 5 properties.

> +What:		/sys/class/leds/<led>/pattern_levels
> +Date:		Oct 2015
> +KernelVersion:	4.3
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	read/write
> +                Set pattern level(brightness). There are two arguments.
> +                  (a) Low brightness level
> +                  (b) High brightness level
> +                Ranges are from 0 to 255.
> +
> +                Example:
> +                Low level is 0, high level is 255.
> +                echo "0 255" > /sys/class/leds/<led>/pattern_levels

I'd go also for two separate attributes. E.g. pattern_brightness_lo and
pattern_brightness_hi, or maybe you'll have better idea.

> +                cat /sys/class/leds/<led>/pattern_levels
> +                low brightness: 0, high brightness: 255
> +
> +What:		/sys/class/leds/<led>/run_pattern
> +Date:		Oct 2015
> +KernelVersion:	4.3
> +Contact:	Milo Kim <milo.kim@ti.com>
> +Description:	write only
> +                After 'pattern_times' and 'pattern_levels' are updated,
> +                run the pattern by writing 1 to 'run_pattern'.
> +                To stop running pattern, writes 0 to 'run_pattern'.

I wonder how registering an in-driver trigger would work. It would
allow for hiding above pattern attributes when the trigger is inactive,
and thus making the sysfs interface more transparent. You could avoid
the need for run_pattern attribute, as setting the trigger would itself
activate the pattern, and setting brightness to 0 would turn it off.

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 42990f2..bc41a0e 100644
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
> index b503f92..984f44a 100644
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
> index 0000000..66da609
> --- /dev/null
> +++ b/drivers/leds/leds-lm3633.c
> @@ -0,0 +1,749 @@
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
> +#define LM3633_LED_MAX_BRIGHTNESS		255
> +#define LM3633_DEFAULT_LED_NAME			"indicator"
> +#define LM3633_MAX_PERIOD			9700
> +#define LM3633_SHORT_TIMESTEP			16
> +#define LM3633_LONG_TIMESTEP			131
> +#define LM3633_TIME_OFFSET			61
> +#define LM3633_PATTERN_REG_OFFSET		16
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
> +struct lm3633_pattern_time {
> +	unsigned int delay;
> +	unsigned int rise;
> +	unsigned int high;
> +	unsigned int fall;
> +	unsigned int low;
> +};
> +
> +struct lm3633_pattern_level {
> +	u8 low;
> +	u8 high;
> +};
> +
> +/**
> + * struct ti_lmu_led_chip
> + *
> + * @dev:		Parent device pointer
> + * @lmu:		LMU structure. Used for register R/W access.
> + * @lock:		Secure handling for multiple user interface access
> + * @lmu_led:		Multiple LED strings
> + * @num_leds:		Number of LED strings
> + * @nb:			Notifier block for handling hwmon event
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
> + * @led_string:		LED string configuration.
> + *			Bit mask is set on parsing DT.
> + * @imax:		[Optional] Max current index.
> + *			It's result of ti_lmu_get_current_code().

Why is this optional?

> + * @work:		Used for scheduling brightness control
> + * @brightness:		Brightness value
> + * @time:		Pattern time dimension
> + * @level:		Pattern level dimension
> + *
> + * Each LED device has its own channel configuration.
> + * For chip control, parent chip data structure is used.
> + */
> +struct ti_lmu_led {
> +	struct ti_lmu_led_chip *chip;
> +	enum lm3633_led_bank_id bank_id;
> +	struct led_classdev cdev;
> +	const char *name;
> +
> +	unsigned long led_string;	/* bit OR mask of LMU_LVLEDx */;
> +	#define LMU_LVLED1	BIT(0)
> +	#define LMU_LVLED2	BIT(1)
> +	#define LMU_LVLED3	BIT(2)
> +	#define LMU_LVLED4	BIT(3)
> +	#define LMU_LVLED5	BIT(4)
> +	#define LMU_LVLED6	BIT(5)
> +
> +	struct work_struct work;
> +	enum led_brightness brightness;
> +	enum ti_lmu_max_current imax;
> +
> +	/* Pattern specific data */
> +	struct lm3633_pattern_time time;
> +	struct lm3633_pattern_level level;
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
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return ti_lmu_update_bits(lmu_led->chip->lmu, LM3633_REG_ENABLE,
> +				  mask, mask);
> +}
> +
> +static int lm3633_led_disable_bank(struct ti_lmu_led *lmu_led)
> +{
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return ti_lmu_update_bits(lmu_led->chip->lmu, LM3633_REG_ENABLE,
> +				  mask, 0);
> +}
> +
> +static int lm3633_led_enable_pattern(struct ti_lmu_led *lmu_led)
> +{
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return ti_lmu_update_bits(lmu_led->chip->lmu, LM3633_REG_PATTERN, mask,
> +				  mask);
> +}
> +
> +static int lm3633_led_disable_pattern(struct ti_lmu_led *lmu_led)
> +{
> +	u8 mask = lm3633_led_get_enable_mask(lmu_led);
> +
> +	return ti_lmu_update_bits(lmu_led->chip->lmu, LM3633_REG_PATTERN, mask,
> +				  0);
> +}
> +
> +static int lm3633_led_config_bank(struct ti_lmu_led *lmu_led)
> +{
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
> +	for (i = 0; i < LM3633_MAX_LEDS; i++) {
> +		/* LED 0 and LED 3 are fixed, so no assignment is required */
> +		if (i == 0 || i == 3)
> +			continue;
> +
> +		if (test_bit(i, &lmu_led->led_string)) {
> +			if (lmu_led->led_string & group_led[i]) {
> +				lmu_led->bank_id = default_id[i];
> +				val = 0;
> +			} else {
> +				lmu_led->bank_id = separate_id[i];
> +				val = BIT(i);
> +			}
> +
> +			ret = ti_lmu_update_bits(lmu_led->chip->lmu,
> +						 LM3633_REG_BANK_SEL,
> +						 BIT(i), val);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t lm3633_led_show_pattern_times(struct device *dev,
> +					     struct device_attribute *attr,
> +					     char *buf)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +
> +	return sprintf(buf,
> +		       "delay: %u, rise: %u, high: %u, fall: %u, low: %u\n",
> +		       lmu_led->time.delay, lmu_led->time.rise,
> +		       lmu_led->time.high, lmu_led->time.fall,
> +		       lmu_led->time.low);
> +}
> +
> +static u8 lm3633_convert_time_to_index(unsigned int msec)
> +{
> +	u8 idx, offset;
> +
> +	/*
> +	 * Find appropriate register index around input time value
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
> +		/* Find the most closest value by looking up the table */
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
> +static ssize_t lm3633_led_store_pattern_times(struct device *dev,
> +					      struct device_attribute *attr,
> +					      const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
> +	struct lm3633_pattern_time *time = &lmu_led->time;
> +	u8 offset = lmu_led->bank_id * LM3633_PATTERN_REG_OFFSET;
> +	int ret;
> +	u8 reg, val;
> +
> +	/*
> +	 * Sequence
> +	 *
> +	 * 1) Read pattern time data (unit: msec)
> +	 * 2) Update DELAY register
> +	 * 3) Update HIGH TIME register
> +	 * 4) Update LOW TIME register
> +	 * 5) Update RAMP TIME registers
> +	 *
> +	 * Time register addresses need offset number based on the LED bank.
> +	 * Register values are index domain, so input time value should be
> +	 * converted to index.
> +	 * Please note that ramp register address has no offset value.
> +	 */
> +
> +	ret = sscanf(buf, "%u %u %u %u %u", &time->delay, &time->rise,
> +		     &time->high, &time->fall, &time->low);
> +	if (ret != 5)
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +
> +	reg = LM3633_REG_PTN_DELAY + offset;
> +	val = lm3633_convert_time_to_index(time->delay);
> +	ret = ti_lmu_write_byte(chip->lmu, reg, val);
> +	if (ret)
> +		goto skip;
> +
> +	reg = LM3633_REG_PTN_HIGHTIME + offset;
> +	val = lm3633_convert_time_to_index(time->high);
> +	ret = ti_lmu_write_byte(chip->lmu, reg, val);
> +	if (ret)
> +		goto skip;
> +
> +	reg = LM3633_REG_PTN_LOWTIME + offset;
> +	val = lm3633_convert_time_to_index(time->low);
> +	ret = ti_lmu_write_byte(chip->lmu, reg, val);
> +	if (ret)
> +		goto skip;
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
> +		ret = -EINVAL;
> +		goto skip;
> +	}
> +
> +	val = lm3633_convert_ramp_to_index(time->rise);
> +	ret = ti_lmu_update_bits(chip->lmu, reg, LM3633_PTN_RAMPUP_MASK,
> +				 val << LM3633_PTN_RAMPUP_SHIFT);
> +	if (ret)
> +		goto skip;
> +
> +	val = lm3633_convert_ramp_to_index(time->fall);
> +	ret = ti_lmu_update_bits(chip->lmu, reg, LM3633_PTN_RAMPDN_MASK,
> +				 val << LM3633_PTN_RAMPDN_SHIFT);
> +	if (ret)
> +		goto skip;
> +
> +	mutex_unlock(&chip->lock);
> +	return len;
> +
> +skip:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static ssize_t lm3633_led_show_pattern_levels(struct device *dev,
> +					      struct device_attribute *attr,
> +					      char *buf)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +
> +	return sprintf(buf, "low brightness: %u, high brightness: %u\n",
> +		       lmu_led->level.low, lmu_led->level.high);
> +}
> +
> +static ssize_t lm3633_led_store_pattern_levels(struct device *dev,
> +					       struct device_attribute *attr,
> +					       const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
> +	unsigned int low, high;
> +	u8 reg, offset, val;
> +	int ret;
> +
> +	/*
> +	 * Sequence
> +	 *
> +	 * 1) Read pattern level data
> +	 * 2) Disable a bank before programming a pattern
> +	 * 3) Update LOW BRIGHTNESS register
> +	 * 4) Update HIGH BRIGHTNESS register
> +	 *
> +	 * Level register addresses have offset number based on the LED bank.
> +	 */
> +
> +	ret = sscanf(buf, "%u %u", &low, &high);
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	low = min_t(unsigned int, low, LM3633_LED_MAX_BRIGHTNESS);

Why don't you take into account the value defined by led-max-microamp
DT property here?

> +	high = min_t(unsigned int, high, LM3633_LED_MAX_BRIGHTNESS);

Ditto.

> +	lmu_led->level.low = (u8)low;
> +	lmu_led->level.high = (u8)high;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lm3633_led_disable_bank(lmu_led);
> +	if (ret)
> +		goto skip;
> +
> +	offset = lmu_led->bank_id * LM3633_PATTERN_REG_OFFSET;
> +	reg = LM3633_REG_PTN_LOWBRT + offset;
> +	val = lmu_led->level.low;
> +	ret = ti_lmu_write_byte(chip->lmu, reg, val);
> +	if (ret)
> +		goto skip;
> +
> +	offset = lmu_led->bank_id;
> +	reg = LM3633_REG_PTN_HIGHBRT + offset;
> +	val = lmu_led->level.high;
> +	ret = ti_lmu_write_byte(chip->lmu, reg, val);
> +	if (ret)
> +		goto skip;
> +
> +	mutex_unlock(&chip->lock);
> +	return len;
> +
> +skip:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static ssize_t lm3633_led_run_pattern(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf, size_t len)
> +{
> +	struct ti_lmu_led *lmu_led = to_ti_lmu_led(dev);
> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
> +	unsigned long enable;
> +	int ret;
> +
> +	if (kstrtoul(buf, 0, &enable))
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +
> +	if (enable)
> +		ret = lm3633_led_enable_pattern(lmu_led);
> +	else
> +		ret = lm3633_led_disable_pattern(lmu_led);
> +
> +	if (ret) {
> +		mutex_unlock(&chip->lock);
> +		return ret;
> +	}
> +
> +	if (enable)
> +		lm3633_led_enable_bank(lmu_led);
> +
> +	mutex_unlock(&chip->lock);
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR(pattern_times, S_IRUGO | S_IWUSR,
> +		   lm3633_led_show_pattern_times,
> +		   lm3633_led_store_pattern_times);
> +static DEVICE_ATTR(pattern_levels, S_IRUGO | S_IWUSR,
> +		   lm3633_led_show_pattern_levels,
> +		   lm3633_led_store_pattern_levels);
> +static DEVICE_ATTR(run_pattern, S_IWUSR, NULL,
> +		   lm3633_led_run_pattern);
> +
> +static struct attribute *lm3633_led_attrs[] = {
> +	&dev_attr_pattern_times.attr,
> +	&dev_attr_pattern_levels.attr,
> +	&dev_attr_run_pattern.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(lm3633_led);	/* lm3633_led_groups */
> +
> +static int lm3633_led_set_max_current(struct ti_lmu_led *lmu_led)
> +{
> +	u8 reg = LM3633_REG_IMAX_LVLED_BASE + lmu_led->bank_id;
> +
> +	return ti_lmu_write_byte(lmu_led->chip->lmu, reg, lmu_led->imax);
> +}
> +
> +static void lm3633_led_work(struct work_struct *work)
> +{
> +	struct ti_lmu_led *lmu_led = container_of(work, struct ti_lmu_led,
> +						  work);
> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +
> +	ret = ti_lmu_write_byte(chip->lmu,
> +				LM3633_REG_BRT_LVLED_BASE + lmu_led->bank_id,
> +				lmu_led->brightness);
> +	if (ret) {
> +		mutex_unlock(&chip->lock);
> +		return;
> +	}
> +
> +	if (lmu_led->brightness == 0)
> +		lm3633_led_disable_bank(lmu_led);
> +	else
> +		lm3633_led_enable_bank(lmu_led);

Is it possible to control a brightness of a whole bank only,
and not individual LEDs?

> +	mutex_unlock(&chip->lock);
> +}
> +
> +static void lm3633_led_brightness_set(struct led_classdev *cdev,
> +				      enum led_brightness brt_val)
> +{
> +	struct ti_lmu_led *lmu_led = container_of(cdev, struct ti_lmu_led,
> +						  cdev);
> +
> +	lmu_led->brightness = brt_val;
> +	schedule_work(&lmu_led->work);
> +}
> +
> +static int lm3633_led_init(struct ti_lmu_led *lmu_led, int bank_id)
> +{
> +	struct device *dev = lmu_led->chip->dev;
> +	char name[12];
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
> +	lmu_led->cdev.max_brightness = LM3633_LED_MAX_BRIGHTNESS;

The value assigned here should be determined by led-max-microamp
DT property.

> +	lmu_led->cdev.brightness_set = lm3633_led_brightness_set;
> +	lmu_led->cdev.groups = lm3633_led_groups;
> +
> +	if (lmu_led->name) {
> +		lmu_led->cdev.name = lmu_led->name;
> +	} else {
> +		snprintf(name, sizeof(name), "%s:%d", LM3633_DEFAULT_LED_NAME,
> +			 bank_id);
> +		lmu_led->cdev.name = name;
> +	}
> +
> +	ret = led_classdev_register(dev, &lmu_led->cdev);

Please use devm prefixed version.

> +	if (ret) {
> +		dev_err(dev, "LED register err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	INIT_WORK(&lmu_led->work, lm3633_led_work);

Work queue should be initialized before LED class device is registered.

> +	return 0;
> +}
> +
> +static int lm3633_led_of_create(struct ti_lmu_led_chip *chip,
> +				struct device_node *np)
> +{
> +	struct device_node *child;
> +	struct device *dev = chip->dev;
> +	struct ti_lmu_led *lmu_led, *each;
> +	int num_leds;
> +	int i = 0;
> +	u32 imax;
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
> +
> +		of_property_read_string(child, "channel-name", &each->name);
> +
> +		/* Make LED strings */
> +		each->led_string = 0;
> +		if (of_property_read_bool(child, "lvled1-used"))
> +			each->led_string |= LMU_LVLED1;
> +		if (of_property_read_bool(child, "lvled2-used"))
> +			each->led_string |= LMU_LVLED2;
> +		if (of_property_read_bool(child, "lvled3-used"))
> +			each->led_string |= LMU_LVLED3;
> +		if (of_property_read_bool(child, "lvled4-used"))
> +			each->led_string |= LMU_LVLED4;
> +		if (of_property_read_bool(child, "lvled5-used"))
> +			each->led_string |= LMU_LVLED5;
> +		if (of_property_read_bool(child, "lvled6-used"))
> +			each->led_string |= LMU_LVLED6;
> +
> +		imax = 0;
> +		of_property_read_u32(child, "led-max-microamp", &imax);
> +		each->imax = ti_lmu_get_current_code(imax);
> +
> +		each->bank_id = 0;
> +		each->chip = chip;
> +		i++;
> +	}
> +
> +	chip->lmu_led = lmu_led;
> +	chip->num_leds = num_leds;
> +
> +	return 0;
> +}
> +
> +static int lm3633_led_hwmon_notifier(struct notifier_block *nb,
> +				     unsigned long action, void *unused)
> +{
> +	struct ti_lmu_led_chip *chip = container_of(nb, struct ti_lmu_led_chip,
> +						    nb);
> +	struct ti_lmu_led *each;
> +	int i, ret;
> +
> +	/* LED should be reconfigured after hwmon procedure is done */
> +	if (action == LMU_EVENT_HWMON_DONE) {
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
> +	/*
> +	 * Notifier callback is required because LED device needs
> +	 * reconfiguration after opened/shorted circuit fault monitoring

Shouldn't this be open/short circuit?

> +	 * by ti-lmu-hwmon driver.
> +	 */
> +	chip->nb.notifier_call = lm3633_led_hwmon_notifier;
> +	ret = blocking_notifier_chain_register(&chip->lmu->notifier, &chip->nb);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		each = chip->lmu_led + i;
> +		ret = lm3633_led_init(each, i);
> +		if (ret) {
> +			dev_err(dev, "LED initialization err: %d\n", ret);
> +			goto cleanup_leds;
> +		}
> +	}
> +
> +	mutex_init(&chip->lock);

Please initialize the mutex above the loop.

> +	platform_set_drvdata(pdev, chip);
> +
> +	return 0;
> +
> +cleanup_leds:
> +	while (--i >= 0) {
> +		each = chip->lmu_led + i;
> +		led_classdev_unregister(&each->cdev);
> +	}
> +	return ret;
> +}
> +
> +static int lm3633_led_remove(struct platform_device *pdev)
> +{
> +	struct ti_lmu_led_chip *chip = platform_get_drvdata(pdev);
> +	struct ti_lmu_led *each;
> +	int i;
> +
> +	blocking_notifier_chain_unregister(&chip->lmu->notifier, &chip->nb);
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		each = chip->lmu_led + i;
> +		led_classdev_unregister(&each->cdev);
> +		flush_work(&each->work);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lm3633_led_of_match[] = {
> +	{ .compatible = "ti,lm3633-leds" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lm3633_led_of_match);
> +
> +static struct platform_driver lm3633_led_driver = {
> +	.probe = lm3633_led_probe,
> +	.remove = lm3633_led_remove,
> +	.driver = {
> +		.name = "lm3633-leds",
> +		.of_match_table = lm3633_led_of_match,
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
