From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] leds: lm3692x: Introduce LM3692x dual string driver
Date: Thu, 16 Nov 2017 06:46:39 -0600
Message-ID: <c8042c65-5bf8-53fb-806b-4eb037bdd8d5@ti.com>
References: <20171113205052.25884-1-dmurphy@ti.com>
 <20171113205052.25884-2-dmurphy@ti.com>
 <3e209041-561c-84a0-d0dd-253cf37f060a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3e209041-561c-84a0-d0dd-253cf37f060a-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Andrew

Thanks

On 11/15/2017 09:48 PM, Andrew F. Davis wrote:
> On 11/13/2017 02:50 PM, Dan Murphy wrote:
>> Introducing the LM3692x Dual-String white LED driver.
>>
>> Data sheet is located
>> http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> ---
> 
> Looks like v3 is posted but I can't find it in my mailbox :/ but the
> comments below should still be valid.

v3 did post and some of the changes you pointed out were made

> 
>>  drivers/leds/leds-lm3692x.c | 380 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 380 insertions(+)
>>  create mode 100644 drivers/leds/leds-lm3692x.c
>>
>> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
>> new file mode 100644
>> index 000000000000..beb753abc7b0
>> --- /dev/null
>> +++ b/drivers/leds/leds-lm3692x.c
>> @@ -0,0 +1,380 @@
>> +/*
>> + * TI lm3692x LED Driver
>> + *
>> + * Copyright (C) 2017 Texas Instruments
>> + *
>> + * Author: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * version 2 as published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/leds.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/slab.h>
>> +
>> +#define LM3692X_LED_NAME	"lm3692x_led"
>> +
>> +#define LM3692X_REV		0x0
>> +#define LM3692X_RESET		0x1
>> +#define LM3692X_EN		0x10
>> +#define LM3692X_BRT_CTRL	0x11
>> +#define LM3692X_PWM_CTRL	0x12
>> +#define LM3692X_BOOST_CTRL	0x13
>> +#define LM3692X_AUTO_FREQ_HI	0x15
>> +#define LM3692X_AUTO_FREQ_LO	0x16
>> +#define LM3692X_BL_ADJ_THRESH	0x17
>> +#define LM3692X_BRT_LSB		0x18
>> +#define LM3692X_BRT_MSB		0x19
>> +#define LM3692X_FAULT_CTRL	0x1e
>> +#define LM3692X_FAULT_FLAGS	0x1f
>> +
>> +#define LM3692X_SW_RESET	BIT(0)
>> +#define LM3692X_DEVICE_EN	BIT(0)
>> +#define LM3692X_LED1_EN		BIT(1)
>> +#define LM3692X_LED2_EN		BIT(2)
>> +
>> +/* Brightness Control Bits */
>> +#define LM3692X_BL_ADJ_POL	BIT(0)
>> +#define LM3692X_RAMP_RATE_125us	0x00
>> +#define LM3692X_RAMP_RATE_250us	BIT(1)
>> +#define LM3692X_RAMP_RATE_500us BIT(2)
>> +#define LM3692X_RAMP_RATE_1ms	(BIT(1) | BIT(2))
>> +#define LM3692X_RAMP_RATE_2ms	BIT(3)
>> +#define LM3692X_RAMP_RATE_4ms	(BIT(3) | BIT(1))
>> +#define LM3692X_RAMP_RATE_8ms	(BIT(2) | BIT(3))
>> +#define LM3692X_RAMP_RATE_16ms	(BIT(1) | BIT(2) | BIT(3))
> 
> The above look like you are just counting in binary, I'd just list the
> numbers then shift them by one.

This is just another way to do it.
Its just a matter of preference.

> 
>> +#define LM3692X_RAMP_EN		BIT(4)
>> +#define LM3692X_BRHT_MODE_REG	0x00
>> +#define LM3692X_BRHT_MODE_PWM	BIT(5)
>> +#define LM3692X_BRHT_MODE_MULTI_RAMP BIT(6)
>> +#define LM3692X_BRHT_MODE_RAMP_MULTI (BIT(5) | BIT(6))
>> +#define LM3692X_MAP_MODE_EXP	BIT(7)
>> +
>> +/* PWM Register Bits */
>> +#define LM3692X_PWM_FILTER_100	BIT(0)
>> +#define LM3692X_PWM_FILTER_150	BIT(1)
>> +#define LM3692X_PWM_FILTER_200	(BIT(0) | BIT(1))
>> +#define LM3692X_PWM_HYSTER_1LSB BIT(2)
>> +#define LM3692X_PWM_HYSTER_2LSB	BIT(3)
>> +#define LM3692X_PWM_HYSTER_3LSB (BIT(3) | BIT(2))
>> +#define LM3692X_PWM_HYSTER_4LSB BIT(4)
>> +#define LM3692X_PWM_HYSTER_5LSB (BIT(4) | BIT(2))
>> +#define LM3692X_PWM_HYSTER_6LSB (BIT(4) | BIT(3))
> 
> Same here, looks like a couple below too.

Same as above

> 
>> +#define LM3692X_PWM_POLARITY	BIT(5)
>> +#define LM3692X_PWM_SAMP_4MHZ	BIT(6)
>> +#define LM3692X_PWM_SAMP_24MHZ	BIT(7)
>> +
>> +/* Boost Control Bits */
>> +#define LM3692X_OCP_PROT_1A	BIT(0)
>> +#define LM3692X_OCP_PROT_1_25A	BIT(1)
>> +#define LM3692X_OCP_PROT_1_5A	(BIT(0) | BIT(1))
>> +#define LM3692X_OVP_21V		BIT(2)
>> +#define LM3692X_OVP_25V		BIT(3)
>> +#define LM3692X_OVP_29V		(BIT(2) | BIT(3))
>> +#define LM3692X_MIN_IND_22UH	BIT(4)
>> +#define LM3692X_BOOST_SW_1MHZ	BIT(5)
>> +#define LM3692X_BOOST_SW_NO_SHIFT	BIT(6)
>> +
>> +/* Fault Control Bits */
>> +#define LM3692X_FAULT_CTRL_OVP BIT(0)
>> +#define LM3692X_FAULT_CTRL_OCP BIT(1)
>> +#define LM3692X_FAULT_CTRL_TSD BIT(2)
>> +#define LM3692X_FAULT_CTRL_OPEN BIT(3)
>> +
>> +/* Fault Flag Bits */
>> +#define LM3692X_FAULT_FLAG_OVP BIT(0)
>> +#define LM3692X_FAULT_FLAG_OCP BIT(1)
>> +#define LM3692X_FAULT_FLAG_TSD BIT(2)
>> +#define LM3692X_FAULT_FLAG_SHRT BIT(3)
>> +#define LM3692X_FAULT_FLAG_OPEN BIT(4)
>> +
>> +/**
>> + * struct lm3692x_led -
>> + * @lock - Lock for reading/writing the device
>> + * @client - Pointer to the I2C client
>> + * @led_dev - led class device pointer
>> + * @regmap - Devices register map
>> + * @enable_gpio - VDDIO/EN gpio to enable communication interface
>> + * @regulator - LED supply regulator pointer
>> + * @label - LED label
>> + **/
>> +struct lm3692x_led {
>> +	struct mutex lock;
>> +	struct i2c_client *client;
>> +	struct led_classdev led_dev;
>> +	struct regmap *regmap;
>> +	struct gpio_desc *enable_gpio;
>> +	struct regulator *regulator;
>> +	const char *label;
>> +};
>> +
>> +static const struct reg_default lm3692x_reg_defs[] = {
>> +	{LM3692X_EN, 0xf},
>> +	{LM3692X_BRT_CTRL, 0x61},
>> +	{LM3692X_PWM_CTRL, 0x73},
>> +	{LM3692X_BOOST_CTRL, 0x6f},
>> +	{LM3692X_AUTO_FREQ_HI, 0x0},
>> +	{LM3692X_AUTO_FREQ_LO, 0x0},
>> +	{LM3692X_BL_ADJ_THRESH, 0x0},
>> +	{LM3692X_BRT_LSB, 0x7},
>> +	{LM3692X_BRT_MSB, 0xff},
>> +	{LM3692X_FAULT_CTRL, 0x7},
>> +};
>> +
>> +static const struct regmap_config lm3692x_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = LM3692X_FAULT_FLAGS,
>> +	.reg_defaults = lm3692x_reg_defs,
>> +	.num_reg_defaults = ARRAY_SIZE(lm3692x_reg_defs),
>> +	.cache_type = REGCACHE_RBTREE,
>> +};
>> +
>> +static int lm3692x_fault_check(struct lm3692x_led *led)
>> +{
>> +	int ret, fault;
>> +	unsigned int read_buf;
>> +
>> +	ret = regmap_read(led->regmap, LM3692X_FAULT_FLAGS, &read_buf);
>> +	if (ret)
>> +		goto out;
>> +
>> +	fault = read_buf;
>> +
>> +	if (fault)
>> +		dev_err(&led->client->dev, "Detected a fault 0x%X\n",
>> +			fault);
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int lm3692x_brightness_set(struct led_classdev *led_cdev,
>> +				enum led_brightness brt_val)
>> +{
>> +	struct lm3692x_led *led =
>> +			container_of(led_cdev, struct lm3692x_led, led_dev);
>> +	int led_brightness = (brt_val << 4) + 7;
> 
> Magic numbers?
> 
> BRIGHTNESS_SHIFT/MASK maybe?
> 
> And below we undo the operation anyway before we write it to the
> register. Why not just drop that and to the shift/mask when you write it.
> 

v3 has this changed anyway to something newer.

<snip>
-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
