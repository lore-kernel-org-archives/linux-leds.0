From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 3/3] leds: add SN3218 LED driver
Date: Mon, 01 Feb 2016 10:58:59 +0100
Message-ID: <56AF2C63.6000404@samsung.com>
References: <1454245156-15747-1-git-send-email-stefan.wahren@i2se.com>
 <1454245156-15747-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1454245156-15747-4-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Stefan,

Thanks for the update. A few more comments below.

On 01/31/2016 01:59 PM, Stefan Wahren wrote:
> This patch adds support for Si-En SN3218 18 Channel LED Driver.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   drivers/leds/Kconfig       |   12 ++
>   drivers/leds/Makefile      |    1 +
>   drivers/leds/leds-sn3218.c |  297 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 310 insertions(+)
>   create mode 100644 drivers/leds/leds-sn3218.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f940c2..920c2da 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -568,6 +568,18 @@ config LEDS_SEAD3
>   	  This driver can also be built as a module. If so the module
>   	  will be called leds-sead3.
>
> +config LEDS_SN3218
> +	tristate "LED support for Si-En SN3218 I2C chip"
> +	depends on LEDS_CLASS && I2C
> +	depends on OF
> +	select REGMAP_I2C
> +	help
> +	  This option enables support for the Si-EN SN3218 LED driver
> +	  connected through I2C. Say Y to enable support for the SN3218 LED.
> +
> +	  This driver can also be built as a module. If so the module
> +	  will be called leds-sn3218.
> +
>   comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>
>   config LEDS_BLINKM
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e9d5309..89c9b6f 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
>   obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
> +obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-sn3218.c b/drivers/leds/leds-sn3218.c
> new file mode 100644
> index 0000000..7a96323
> --- /dev/null
> +++ b/drivers/leds/leds-sn3218.c
> @@ -0,0 +1,297 @@
> +/*
> + * Si-En SN3218 18 Channel LED Driver
> + *
> + * Copyright (C) 2016 Stefan Wahren <stefan.wahren@i2se.com>
> + *
> + * Based on leds-pca963x.c
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * Datasheet: http://www.si-en.com/uploadpdf/s2011517171720.pdf
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define SN3218_MODE		0x00
> +#define SN3218_PWM_1		0x01
> +#define SN3218_PWM_2		0x02
> +#define SN3218_PWM_3		0x03
> +#define SN3218_PWM_4		0x04
> +#define SN3218_PWM_5		0x05
> +#define SN3218_PWM_6		0x06
> +#define SN3218_PWM_7		0x07
> +#define SN3218_PWM_8		0x08
> +#define SN3218_PWM_9		0x09
> +#define SN3218_PWM_10		0x0a
> +#define SN3218_PWM_11		0x0b
> +#define SN3218_PWM_12		0x0c
> +#define SN3218_PWM_13		0x0d
> +#define SN3218_PWM_14		0x0e
> +#define SN3218_PWM_15		0x0f
> +#define SN3218_PWM_16		0x10
> +#define SN3218_PWM_17		0x11
> +#define SN3218_PWM_18		0x12
> +#define SN3218_LED_1_6		0x13
> +#define SN3218_LED_7_12		0x14
> +#define SN3218_LED_13_18	0x15
> +#define SN3218_UPDATE		0x16	/* applies to reg 0x01 .. 0x15 */
> +#define SN3218_RESET		0x17
> +
> +#define SN3218_LED_MASK		0x3f
> +#define SN3218_LED_ON		0x01
> +#define SN3218_LED_OFF		0x00
> +
> +#define NUM_LEDS		18
> +
> +struct sn3218_led;
> +
> +/**
> + * struct sn3218 -
> + * @client - Pointer to the I2C client
> + * @leds - Pointer to the individual LEDs
> + * @num_leds - Actual number of LEDs
> +**/
> +struct sn3218 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct sn3218_led *leds;
> +	int num_leds;
> +};
> +
> +/**
> + * struct sn3218_led -
> + * @chip - Pointer to the container
> + * @led_cdev - led class device pointer
> + * @led_num - LED index ( 0 .. 17 )
> +**/
> +struct sn3218_led {
> +	struct sn3218 *chip;

You don't need this if you have led id here. Please refer to
drivers/leds/leds-max77693.c, sub_led_to_led() to check how to get
a pointer to the parent structure in similar case.

> +	struct led_classdev led_cdev;
> +	int led_num;
> +};
> +
> +static int sn3218_led_set(struct led_classdev *led_cdev,
> +			  enum led_brightness brightness)
> +{
> +	struct sn3218_led *led =
> +			container_of(led_cdev, struct sn3218_led, led_cdev);
> +	struct regmap *regmap = led->chip->regmap;
> +	u8 bank = led->led_num / 6;
> +	u8 mask = 0x1 << (led->led_num % 6);
> +	u8 val;
> +	int ret;
> +
> +	if (brightness == LED_OFF)
> +		val = 0;
> +	else
> +		val = mask;
> +
> +	ret = regmap_update_bits(regmap, SN3218_LED_1_6 + bank, mask, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (brightness > LED_OFF) {
> +		ret = regmap_write(regmap, SN3218_PWM_1 + led->led_num,
> +				   brightness);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(regmap, SN3218_UPDATE, 0xff);
> +
> +	return ret;
> +}
> +
> +void sn3218_led_init(struct sn3218 *sn3218, struct device_node *node, u32 reg)

s/void/static void/

> +{
> +	struct sn3218_led *leds = sn3218->leds;
> +	struct led_classdev *cdev = &leds[reg].led_cdev;
> +
> +	leds[reg].led_num = reg;
> +	leds[reg].chip = sn3218;
> +
> +	if (of_property_read_string(node, "label", &cdev->name))
> +		cdev->name = node->name;
> +
> +	of_property_read_string(node, "linux,default-trigger",
> +				&cdev->default_trigger);
> +
> +	cdev->brightness_set_blocking = sn3218_led_set;
> +	cdev->max_brightness = LED_FULL;

Skip this line. If max_brightness is 0 led_classdev_register()
automatically initializes it to LED_FULL.

> +}
> +
> +static const struct reg_default sn3218_reg_defs[] = {
> +	{ SN3218_MODE, 0x00},
> +	{ SN3218_PWM_1, 0x00},
> +	{ SN3218_PWM_2, 0x00},
> +	{ SN3218_PWM_3, 0x00},
> +	{ SN3218_PWM_4, 0x00},
> +	{ SN3218_PWM_5, 0x00},
> +	{ SN3218_PWM_6, 0x00},
> +	{ SN3218_PWM_7, 0x00},
> +	{ SN3218_PWM_8, 0x00},
> +	{ SN3218_PWM_9, 0x00},
> +	{ SN3218_PWM_10, 0x00},
> +	{ SN3218_PWM_11, 0x00},
> +	{ SN3218_PWM_12, 0x00},
> +	{ SN3218_PWM_13, 0x00},
> +	{ SN3218_PWM_14, 0x00},
> +	{ SN3218_PWM_15, 0x00},
> +	{ SN3218_PWM_16, 0x00},
> +	{ SN3218_PWM_17, 0x00},
> +	{ SN3218_PWM_18, 0x00},
> +	{ SN3218_LED_1_6, 0x00},
> +	{ SN3218_LED_7_12, 0x00},
> +	{ SN3218_LED_13_18, 0x00},
> +	{ SN3218_UPDATE, 0x00},
> +	{ SN3218_RESET, 0x00},
> +};
> +
> +static const struct regmap_config sn3218_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = SN3218_RESET,
> +	.reg_defaults = sn3218_reg_defs,
> +	.num_reg_defaults = ARRAY_SIZE(sn3218_reg_defs),
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static int sn3218_init(struct i2c_client *client, struct sn3218 *sn3218)
> +{
> +	struct device_node *np = client->dev.of_node, *child;
> +	struct sn3218_led *leds;
> +	int ret, count;
> +
> +	count = of_get_child_count(np);
> +	if (!count)
> +		return -ENODEV;
> +
> +	if (count > NUM_LEDS) {
> +		dev_err(&client->dev, "Invalid LED count %d\n", count);
> +		return -EINVAL;
> +	}
> +
> +	leds = devm_kzalloc(&client->dev, count * sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	sn3218->leds = leds;
> +	sn3218->num_leds = count;
> +	sn3218->client = client;
> +
> +	sn3218->regmap = devm_regmap_init_i2c(client, &sn3218_regmap_config);
> +	if (IS_ERR(sn3218->regmap)) {
> +		ret = PTR_ERR(sn3218->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	for_each_child_of_node(np, child) {
> +		u32 reg;
> +
> +		ret = of_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			goto fail;
> +
> +		if (reg >= count) {
> +			dev_err(&client->dev, "Invalid LED (%u >= %d)\n", reg,
> +				count);
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +
> +		sn3218_led_init(sn3218, child, reg);
> +	}
> +
> +	return 0;
> +
> +fail:
> +	of_node_put(np);

s/np/child/

> +	return ret;
> +}
> +
> +static int sn3218_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct sn3218 *sn3218;
> +	struct sn3218_led *leds;
> +	struct device *dev = &client->dev;
> +	int i, ret;
> +
> +	sn3218 = devm_kzalloc(dev, sizeof(*sn3218), GFP_KERNEL);
> +	if (!sn3218)
> +		return -ENOMEM;
> +
> +	ret = sn3218_init(client, sn3218);
> +	if (ret)
> +		return ret;
> +
> +	i2c_set_clientdata(client, sn3218);
> +	leds = sn3218->leds;
> +
> +	/*
> +	 * Since the chip is write-only we need to reset him into
> +	 * a defined state (all LEDs off).
> +	 */
> +	ret = regmap_write(sn3218->regmap, SN3218_RESET, 0xff);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < sn3218->num_leds; i++) {
> +		ret = devm_led_classdev_register(dev, &leds[i].led_cdev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set normal mode */
> +	return regmap_write(sn3218->regmap, SN3218_MODE, 0x01);
> +}
> +
> +static int sn3218_remove(struct i2c_client *client)
> +{
> +	struct sn3218 *sn3218 = i2c_get_clientdata(client);
> +
> +	/* Set shutdown mode */
> +	regmap_write(sn3218->regmap, SN3218_MODE, 0x00);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sn3218_id[] = {
> +	{ "sn3218", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sn3218_id);
> +
> +static const struct of_device_id of_sn3218_match[] = {
> +	{ .compatible = "si-en,sn3218", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_sn3218_match);
> +
> +static struct i2c_driver sn3218_driver = {
> +	.driver = {
> +		.name	= "leds-sn3218",
> +		.of_match_table = of_match_ptr(of_sn3218_match),
> +	},
> +	.probe	= sn3218_probe,
> +	.remove	= sn3218_remove,
> +	.id_table = sn3218_id,
> +};
> +
> +module_i2c_driver(sn3218_driver);
> +
> +MODULE_DESCRIPTION("Si-En SN3218 LED Driver");
> +MODULE_AUTHOR("Stefan Wahren <stefan.wahren@i2se.com>");
> +MODULE_LICENSE("GPL v2");
>


-- 
Best Regards,
Jacek Anaszewski
