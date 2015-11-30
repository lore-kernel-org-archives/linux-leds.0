From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH v2 8/9] leds: add LM3633 driver
Date: Mon, 30 Nov 2015 17:48:47 +0900
Message-ID: <565C0D6F.9000709@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-9-git-send-email-milo.kim@ti.com>
 <56583C37.1050307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:59209 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753294AbbK3Is5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 30 Nov 2015 03:48:57 -0500
In-Reply-To: <56583C37.1050307@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jacek,

Thanks for your detailed feedback. Please refer to my comments below.

On 11/27/2015 8:19 PM, Jacek Anaszewski wrote:
> Hi Milo,
>
> Thanks for the update. I have few comments below.
>
>> diff --git a/drivers/leds/leds-lm3633.c b/drivers/leds/leds-lm3633.c
>> new file mode 100644
>> index 0000000..9c391ca
>> --- /dev/null
>> +++ b/drivers/leds/leds-lm3633.c
>> @@ -0,0 +1,840 @@
>> +/*
>> + * TI LM3633 LED driver
>> + *
>> + * Copyright 2015 Texas Instruments
>> + *
>> + * Author: Milo Kim <milo.kim@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/mfd/ti-lmu.h>
>> +#include <linux/mfd/ti-lmu-register.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/notifier.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +#define LM3633_MAX_PWM				255
>> +#define LM3633_MIN_CURRENT			5000
>> +#define LM3633_MAX_CURRENT			30000
>> +#define LM3633_MAX_PERIOD			9700
>> +#define LM3633_SHORT_TIMESTEP			16
>> +#define LM3633_LONG_TIMESTEP			131
>> +#define LM3633_TIME_OFFSET			61
>> +#define LM3633_PATTERN_REG_OFFSET		16
>> +#define LM3633_IMAX_OFFSET			6
>> +
>> +enum lm3633_led_bank_id {
>> +	LM3633_LED_BANK_C,
>> +	LM3633_LED_BANK_D,
>> +	LM3633_LED_BANK_E,
>> +	LM3633_LED_BANK_F,
>> +	LM3633_LED_BANK_G,
>> +	LM3633_LED_BANK_H,
>> +	LM3633_MAX_LEDS,
>> +};
>> +
>> +/**
>> + * struct ti_lmu_led_chip
>> + *
>> + * @dev:		Parent device pointer
>> + * @lmu:		LMU structure. Used for register R/W access.
>> + * @lock:		Secure handling for multiple user interface access
>> + * @lmu_led:		Multiple LED strings
>
> Could you clarify what "string" means here?
>
>> + * @num_leds:		Number of LED strings
>
> and here?

Oops! I forgot to replace this term with 'output channel'. Thanks for 
catching this.

>> +static u8 lm3633_convert_time_to_index(unsigned int msec)
>> +{
>> +	u8 idx, offset;
>> +
>> +	/*
>> +	 * Find an approximate index
>
> I think that we shouldn't approximate but clamp the msec
> to the nearest possible device setting.
>
>> +	 *
>> +	 *      0 <= time <= 1000 : 16ms step
>> +	 *   1000 <  time <= 9700 : 131ms step, base index is 61
>> +	 */
>> +
>> +	msec = min_t(int, msec, LM3633_MAX_PERIOD);
>> +
>> +	if (msec <= 1000) {
>> +		idx = msec / LM3633_SHORT_TIMESTEP;
>> +		if (idx > 1)
>> +			idx--;
>> +		offset = 0;
>> +	} else {
>> +		idx = (msec - 1000) / LM3633_LONG_TIMESTEP;
>> +		offset = LM3633_TIME_OFFSET;
>> +	}
>> +
>> +	return idx + offset;
>> +}
>> +
>> +static u8 lm3633_convert_ramp_to_index(unsigned int msec)
>> +{
>> +	const int ramp_table[] = { 2, 250, 500, 1000, 2000, 4000, 8000, 16000 };
>> +	int size = ARRAY_SIZE(ramp_table);
>> +	int i;
>> +
>> +	if (msec <= ramp_table[0])
>> +		return 0;
>> +
>> +	if (msec > ramp_table[size - 1])
>> +		return size - 1;
>> +
>> +	for (i = 1; i < size; i++) {
>> +		if (msec == ramp_table[i])
>> +			return i;
>> +
>> +		/* Find an approximate index by looking up the table */
>
> Similarly here. So you should have an array of the possible msec
> values and iterate through it to look for the nearest one.

Driver uses 'ramp_table[]' for this purpose. Could you describe it in 
more details?

>> +
>> +static int lm3633_led_brightness_set(struct led_classdev *cdev,
>> +				     enum led_brightness brightness)
>> +{
>> +	struct ti_lmu_led *lmu_led = container_of(cdev, struct ti_lmu_led,
>> +						  cdev);
>> +	struct ti_lmu_led_chip *chip = lmu_led->chip;
>> +	struct regmap *regmap = chip->lmu->regmap;
>> +	u8 reg = LM3633_REG_BRT_LVLED_BASE + lmu_led->bank_id;
>> +	int ret;
>> +
>> +	mutex_lock(&chip->lock);
>> +
>> +	ret = regmap_write(regmap, reg, brightness);
>> +	if (ret) {
>> +		mutex_unlock(&chip->lock);
>> +		return ret;
>> +	}
>> +
>> +	if (brightness == 0)
>> +		lm3633_led_disable_bank(lmu_led);
>
> This should be checked at first, as I suppose that disabling
> a bank suffices to turn the LED off.

Well, it's not a big deal when turn off the LED. However, our silicon 
designer recommended brightness update should be done prior to enabling 
LED bank. Let me share some block diagram.

[I2C logic] - [brightness control] - [control bank] - [output channel]

If control bank is enabled first, then previous brightness value in 
register can be used instead of new updated brightness. So brightness 
update should be done first.

>> +static u8 lm3633_led_scale_max_brightness(struct ti_lmu_led *lmu_led, u32 imax)
>> +{
>> +	u8 max_current = lm3633_led_convert_current_to_index(imax);
>> +	const u8 max_brightness_table[] = {
>> +		[LMU_IMAX_5mA]  = 191,
>> +		[LMU_IMAX_6mA]  = 197,
>> +		[LMU_IMAX_7mA]  = 203,
>> +		[LMU_IMAX_8mA]  = 208,
>> +		[LMU_IMAX_9mA]  = 212,
>> +		[LMU_IMAX_10mA] = 216,
>> +		[LMU_IMAX_11mA] = 219,
>> +		[LMU_IMAX_12mA] = 222,
>> +		[LMU_IMAX_13mA] = 225,
>> +		[LMU_IMAX_14mA] = 228,
>> +		[LMU_IMAX_15mA] = 230,
>> +		[LMU_IMAX_16mA] = 233,
>> +		[LMU_IMAX_17mA] = 235,
>> +		[LMU_IMAX_18mA] = 237,
>> +		[LMU_IMAX_19mA] = 239,
>> +		[LMU_IMAX_20mA] = 241,
>> +		[LMU_IMAX_21mA] = 242,
>> +		[LMU_IMAX_22mA] = 244,
>> +		[LMU_IMAX_23mA] = 246,
>> +		[LMU_IMAX_24mA] = 247,
>> +		[LMU_IMAX_25mA] = 249,
>> +		[LMU_IMAX_26mA] = 250,
>> +		[LMU_IMAX_27mA] = 251,
>> +		[LMU_IMAX_28mA] = 253,
>> +		[LMU_IMAX_29mA] = 254,
>> +		[LMU_IMAX_30mA] = 255,
>> +	};
>
> After analyzing the subject one more time I think that we need to
> change the approach regarding max brightness issue.
>
> At first - we shouldn't fix max current to max possible register value.
> Instead we should take led-max-microamp property and write its value
> to the [0x22 + bank offset] registers.
>
> With this approach whole 0-255 range of brightness levels will be
> valid for the driver.
>
> In effect all LMU_IMAX* enums seem to be not needed.

Good to hear that, it's the most simplest work for the device ;)
Let me update the driver. Thanks!

Best regards,
Milo
