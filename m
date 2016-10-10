From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 07/10] leds: i2cs: Add I2CS FPGA leds driver
Date: Mon, 10 Oct 2016 11:41:34 +0200
Message-ID: <31a98da5-d5f1-f86c-ee98-6fd0707e6180@samsung.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <CGME20161007152345eucas1p1c9148d120c501a0299cda9006a29ee8a@eucas1p1.samsung.com>
 <1475853669-22480-8-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1475853669-22480-8-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pantelis,

Thanks for the patch. Please find my comments in the code below.

On 10/07/2016 05:21 PM, Pantelis Antoniou wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
>
> Add support for the FRU faceplate status LEDs (OK, FAIL,
> ACTIVE, STANDBY) controlled by the Juniper I2CS FPGA. This
> driver is a jnx-i2cs-core client.
>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/leds/Kconfig         |   9 ++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-jnx-i2cs.c | 219 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+)
>  create mode 100644 drivers/leds/leds-jnx-i2cs.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7a628c6..45c6612 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -659,6 +659,15 @@ config LEDS_MLXCPLD
>  	  This option enabled support for the LEDs on the Mellanox
>  	  boards. Say Y to enabled these.
>
> +config LEDS_JNX_I2CS
> +	tristate "LED support for the Juniper Networks I2CS FPGA"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  This option enables support for the FRU faceplate status
> +	  LEDs (OK, FAIL, ACTIVE, STANDBY) controlled by the Juniper
> +	  I2CS FPGA.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 3965070..1ce2d0b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
> +obj-$(CONFIG_LEDS_JNX_I2CS)		+= leds-jnx-i2cs.o
>
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-jnx-i2cs.c b/drivers/leds/leds-jnx-i2cs.c
> new file mode 100644
> index 0000000..c2d7274
> --- /dev/null
> +++ b/drivers/leds/leds-jnx-i2cs.c
> @@ -0,0 +1,219 @@
> +/*
> + * Juniper Networks I2CS FPGA LEDs driver
> + *
> + * Copyright (C) 2016 Juniper Networks
> + * Author: Georgi Vlaev <gvlaev@juniper.net>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/of.h>
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/jnx-i2cs-core.h>

Please arrange include directives in alphabetical order.

> +#define FRU_LEDS	4 /* Total LEDs (active, fail, ok, standby) */
> +#define HW_BLINK_LEDS	3 /* LEDs with hw blink cap (standby not supported) */
> +
> +/*
> + * I2CS fru_led [0x12]
> + *
> + * bit 6   | bit 5    | bit 4   |...                        | bit 0
> + * blink_ok|blink_fail|blink_act|led_standby|led_ok|led_fail|led_act
> + */
> +
> +/* TODO: Use the regmap from the parent MFD */

Isn't it a good moment to address that?

> +static struct regmap_config i2cs_leds_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = I2CS_SPARE_OE,
> +};
> +
> +struct i2cs_led {
> +	struct led_classdev lc;

Most drivers use led_cdev or cdev name for it.
It is more informative and improves readability.

> +	struct regmap *regmap;
> +	struct work_struct work;
> +	int blink;
> +	int on;
> +	int bit;
> +};
> +
> +struct i2cs_led_data {
> +	int num_leds;
> +	struct i2cs_led *leds;
> +};
> +
> +static void jnx_i2cs_leds_work(struct work_struct *work)
> +{
> +	struct i2cs_led *led = container_of(work, struct i2cs_led, work);
> +
> +	int mask = (BIT(led->bit) << 4) | BIT(led->bit);
> +	int value = ((led->blink << led->bit) << 4) | (led->on << led->bit);
> +
> +	regmap_update_bits(led->regmap, I2CS_FRU_LED, mask, value & 0x7f);
> +}

If you used brightness_set_blocking op instead of brightness_set,
then you could get rid of the in-driver work queue.

> +
> +static void jnx_i2cs_leds_brightness_set(struct led_classdev *lc,
> +				 enum led_brightness brightness)
> +{
> +	struct i2cs_led *led = container_of(lc, struct i2cs_led, lc);
> +
> +	led->on = (brightness != LED_OFF);
> +	led->blink = 0; /* always turn off hw blink on brightness_set() */

Some time ago we changed brightness setting semantics when blinking
is on. Now setting any brightness > 0 shouldn't disable blinking.
Following commit provides the details:

7cfe749fad51 ("leds: core: Fix brightness setting upon hardware blinking 
enabled")

It seems that the hardware supports only one brightness level.
In such a case I'd return immediately if the LED is on and
brightness to be set is 1.

> +	schedule_work(&led->work);
> +}
> +
> +static int jnx_i2cs_leds_blink_set(struct led_classdev *lc,
> +				   unsigned long *delay_on,
> +				   unsigned long *delay_off)
> +{
> +	struct i2cs_led *led = container_of(lc, struct i2cs_led, lc);
> +
> +	led->blink = (*delay_on > 0);

blink_set op should fail if hardware doesn't support delay_on
or delay_off periods. I lets the LED core to apply software blink
fallback.

> +	led->on = led->blink; /* 'on' bit should be set if blinking */
> +	schedule_work(&led->work);
> +
> +	return 0;
> +}
> +
> +static int jnx_i2cs_leds_init_one(struct device *dev, struct device_node *np,
> +				  struct i2cs_led_data *ild,
> +				  struct regmap *regmap, int num)
> +{
> +	struct i2cs_led *led;
> +	const char *string;
> +	bool hw_blink;
> +	int ret;
> +	u32 reg;
> +
> +	ret = of_property_read_u32(np, "reg", &reg);
> +	if (ret || reg >= FRU_LEDS)
> +		return -ENODEV;
> +
> +	led = &ild->leds[num];
> +	led->bit = reg;
> +	led->regmap = regmap;
> +
> +	if (!of_property_read_string(np, "label", &string))
> +		led->lc.name = string;
> +	else
> +		led->lc.name = np->name;
> +
> +	if (!of_property_read_string(np, "linux,default-trigger", &string))
> +		led->lc.default_trigger = string;
> +
> +	led->lc.brightness = LED_OFF;
> +	led->lc.brightness_set = jnx_i2cs_leds_brightness_set;

You need also:

led->lc.max_brightness = 1;

> +	if (led->bit <= HW_BLINK_LEDS) {
> +		hw_blink = of_property_read_bool(np, "hw-blink");
> +		if (hw_blink)
> +			led->lc.blink_set = jnx_i2cs_leds_blink_set;
> +	}
> +
> +	ret = devm_led_classdev_register(dev, &led->lc);
> +	if (ret)
> +		return ret;
> +
> +	INIT_WORK(&led->work, jnx_i2cs_leds_work);
> +
> +	return 0;
> +}
> +
> +static int jnx_i2cs_leds_of_init(struct device *dev, struct i2cs_led_data *ild)
> +{
> +	struct device_node *child, *np = dev->of_node;
> +	struct regmap *regmap;
> +	struct i2c_client *client;
> +	int ret, num_leds, i = 0;
> +
> +	if (!dev->parent)
> +		return -ENODEV;
> +
> +	client = i2c_verify_client(dev->parent);
> +	if (!client)
> +		return -ENODEV;
> +
> +	regmap = devm_regmap_init_i2c(client, &i2cs_leds_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to allocate register map\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	num_leds = of_get_child_count(np);
> +	if (!num_leds || num_leds > FRU_LEDS)
> +		return -ENODEV;
> +
> +	ild->num_leds = num_leds;
> +	ild->leds = devm_kzalloc(dev, sizeof(struct i2cs_led) * num_leds,
> +				 GFP_KERNEL);
> +	if (!ild->leds)
> +		return -ENOMEM;
> +
> +	for_each_child_of_node(np, child) {
> +		ret = jnx_i2cs_leds_init_one(dev, child, ild, regmap, i++);
> +		if (ret)
> +			return ret;

of_node_put(child) should be called on error to avoid memory leak.

> +	}
> +
> +	return 0;
> +}
> +
> +static int jnx_i2cs_leds_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct i2cs_led_data *ild;
> +	int ret;
> +
> +	ild = devm_kzalloc(dev, sizeof(*ild), GFP_KERNEL);
> +	if (!ild)
> +		return -ENOMEM;
> +
> +	ret = jnx_i2cs_leds_of_init(dev, ild);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, ild);
> +
> +	return 0;
> +}
> +
> +static int jnx_i2cs_leds_remove(struct platform_device *pdev)
> +{
> +	struct i2cs_led_data *ild = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < ild->num_leds; i++) {
> +		devm_led_classdev_unregister(&pdev->dev, &ild->leds[i].lc);

This is redundant.

> +		cancel_work_sync(&ild->leds[i].work);
> +	}
> +
> +	return 0;
> +}

This function will be redundant after removing work queue.

> +static const struct of_device_id jnx_i2cs_leds_match[] = {
> +	{ .compatible = "jnx,leds-i2cs", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, jnx_i2cs_leds_match);
> +
> +static struct platform_driver jnx_i2cs_leds_driver = {
> +	.driver = {
> +		.name  = "leds-i2cs",
> +		.of_match_table = jnx_i2cs_leds_match,
> +	},
> +	.probe = jnx_i2cs_leds_probe,
> +	.remove = jnx_i2cs_leds_remove,
> +};
> +
> +module_platform_driver(jnx_i2cs_leds_driver);
> +
> +MODULE_DESCRIPTION("Juniper Networks I2CS leds driver");
> +MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");
> +MODULE_LICENSE("GPL");
>


-- 
Best regards,
Jacek Anaszewski
