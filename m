From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RFC 3/3] leds: add SN3218 LED driver
Date: Fri, 29 Jan 2016 13:54:27 +0100
Message-ID: <56AB6103.6010702@samsung.com>
References: <1454013667-25889-1-git-send-email-stefan.wahren@i2se.com>
 <1454013667-25889-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24395 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307AbcA2Myb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Jan 2016 07:54:31 -0500
In-reply-to: <1454013667-25889-4-git-send-email-stefan.wahren@i2se.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Stefan,

Thanks for the patch. Please find my comments in the code below.

On 01/28/2016 09:41 PM, Stefan Wahren wrote:
> This patch adds support for Si-En SN3218 18 Channel LED Driver.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>   drivers/leds/Kconfig       |    8 ++
>   drivers/leds/Makefile      |    1 +
>   drivers/leds/leds-sn3218.c |  254 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 263 insertions(+)
>   create mode 100644 drivers/leds/leds-sn3218.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f940c2..4a1bb4e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -568,6 +568,14 @@ config LEDS_SEAD3
>   	  This driver can also be built as a module. If so the module
>   	  will be called leds-sead3.
>
> +config LEDS_SN3218
> +	tristate "LED support for Si-En SN3218 I2C chip"
> +	depends on LEDS_CLASS && I2C
> +	depends on OF
> +	help
> +	  This option enables support for the Si-EN SN3218 LED driver
> +	  through I2C. Say Y to enable support for the SN3218 LED.

s/through/connected through/

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
> index 0000000..f52e7cc
> --- /dev/null
> +++ b/drivers/leds/leds-sn3218.c
> @@ -0,0 +1,254 @@
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
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +
> +#define SN3218_MODE		0x00
> +#define SN3218_PWM_BASE		0x01
> +#define SN3218_LED_BASE		0x13	/* 6 channels per reg */
> +#define SN3218_UPDATE		0x16	/* applies to reg 0x01 .. 0x15 */
> +#define SN3218_RESET		0x17
> +
> +#define SN3218_LED_MASK		0x3F
> +#define SN3218_LED_ON		0x01
> +#define SN3218_LED_OFF		0x00
> +
> +#define NUM_LEDS		18
> +
> +static const struct i2c_device_id sn3218_id[] = {
> +	{ "sn3218", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sn3218_id);

Please put the above i2c_device_id definition at the end of file,
similarly to e.g. drivers/leds/leds-lp5523.c.

> +
> +struct sn3218_led;
> +
> +/**
> + * struct sn3218 -
> + * @lock - Lock for writing the device
> + * @client - Pointer to the I2C client
> + * @leds - Pointer to the individual LEDs
> + * @leds_state - Copy of LED CTRL registers
> +**/
> +struct sn3218 {
> +	struct mutex lock;
> +	struct i2c_client *client;
> +	struct sn3218_led *leds;
> +	u8 leds_state[3];
> +};
> +
> +/**
> + * struct sn3218_led -
> + * @chip - Pointer to the container
> + * @led_cdev - led class device pointer
> + * @led_num - LED index ( 0 .. 17 )
> + * @name - LED name
> +**/
> +struct sn3218_led {
> +	struct sn3218 *chip;
> +	struct led_classdev led_cdev;
> +	int led_num;
> +	char name[32];

You don't need to cache the LED name - it is required only
during LED class device registration. Just assign the pointer
to led_cdev->name.

> +};
> +
> +static int sn3218_led_set(struct led_classdev *led_cdev,
> +			  enum led_brightness brightness)
> +{
> +	struct sn3218_led *led =
> +			container_of(led_cdev, struct sn3218_led, led_cdev);
> +	struct i2c_client *client = led->chip->client;
> +	u8 bank = led->led_num / 6;
> +	u8 mask = 0x1 << (led->led_num % 6);
> +	int ret;
> +
> +	mutex_lock(&led->chip->lock);
> +
> +	if (brightness == LED_OFF)
> +		led->chip->leds_state[bank] &= ~mask;
> +	else
> +		led->chip->leds_state[bank] |= mask;

If you used regmap you could get rid of led_state, as you'd
have the caching for free. Please check regmap_update_bits().

> +	ret = i2c_smbus_write_byte_data(client, SN3218_LED_BASE + bank,
> +					led->chip->leds_state[bank]);

This should be switched to regmap_write then.

> +	if (ret < 0)
> +		goto unlock;
> +
> +	if (brightness > LED_OFF) {
> +		ret = i2c_smbus_write_byte_data(client,
> +				SN3218_PWM_BASE + led->led_num,	brightness);
> +		if (ret < 0)
> +			goto unlock;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client, SN3218_UPDATE, 0xFF);
> +
> +unlock:
> +	mutex_unlock(&led->chip->lock);
> +	return ret;
> +}
> +
> +static struct led_platform_data *sn3218_init(struct i2c_client *client)
> +{
> +	struct device_node *np = client->dev.of_node, *child;
> +	struct led_platform_data *pdata;
> +	struct led_info *sn3218_leds;
> +	int count;
> +
> +	count = of_get_child_count(np);
> +	if (!count || count > NUM_LEDS)
> +		return NULL;
> +
> +	sn3218_leds = devm_kzalloc(&client->dev,
> +				sizeof(struct led_info) * NUM_LEDS, GFP_KERNEL);

Please don't use struct led_info and struct led_platform_data.
You can assign parsed data directly to the struct sn3218_led and its
member - led_cdev. It could be allocated in sn3218_probe() and passed
here as an argument. Return type could be switched to int (error code)
then.

I'd also allocate a memory only for the number of LEDs defined in
the DT ("count" in this case).

> +	if (!sn3218_leds)
> +		return NULL;
> +
> +	for_each_child_of_node(np, child) {
> +		struct led_info led = {};
> +		u32 reg;
> +		int ret;
> +
> +		ret = of_property_read_u32(child, "reg", &reg);
> +		if (ret != 0 || reg < 0 || reg >= NUM_LEDS)
> +			continue;

I'd prefer to fail in case of DT validation error.
Please keep in mind that before breaking the loop we have to release
the child by calling of_node_put().

> +		led.name =
> +			of_get_property(child, "label", NULL) ? : child->name;
> +		led.default_trigger =
> +			of_get_property(child, "linux,default-trigger", NULL);
> +		sn3218_leds[reg] = led;
> +	}
> +
> +	pdata = devm_kzalloc(&client->dev, sizeof(struct led_platform_data),
> +			     GFP_KERNEL);
> +
> +	pdata->leds = sn3218_leds;
> +	pdata->num_leds = NUM_LEDS;
> +
> +	return pdata;
> +}
> +
> +static const struct of_device_id of_sn3218_match[] = {
> +	{ .compatible = "si-en,sn3218", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_sn3218_match);

Please put it at the end of file.

> +
> +static int sn3218_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct led_platform_data *pdata;
> +	struct sn3218 *sn3218_chip;
> +	struct sn3218_led *sn3218;
> +	int i, ret;
> +
> +	pdata = sn3218_init(client);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +
> +	sn3218_chip = devm_kzalloc(&client->dev, sizeof(*sn3218_chip),
> +				   GFP_KERNEL);
> +	if (!sn3218_chip)
> +		return -ENOMEM;
> +
> +	sn3218 = devm_kzalloc(&client->dev, NUM_LEDS * sizeof(*sn3218),
> +			      GFP_KERNEL);
> +	if (!sn3218)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, sn3218_chip);
> +
> +	mutex_init(&sn3218_chip->lock);
> +	sn3218_chip->client = client;
> +	sn3218_chip->leds = sn3218;
> +
> +	for (i = 0; i < NUM_LEDS; i++) {
> +		sn3218[i].led_num = i;
> +		sn3218[i].chip = sn3218_chip;
> +
> +		if (i < pdata->num_leds) {
> +			if (pdata->leds[i].name)
> +				snprintf(sn3218[i].name,
> +					 sizeof(sn3218[i].name), "sn3218:%s",
> +					 pdata->leds[i].name);
> +			if (pdata->leds[i].default_trigger)
> +				sn3218[i].led_cdev.default_trigger =
> +					pdata->leds[i].default_trigger;
> +		}
> +
> +		if (i >= pdata->num_leds || !pdata->leds[i].name) {

Name will be always not NULL - either pointer to the "label" property
or to the child->name.

> +			snprintf(sn3218[i].name, sizeof(sn3218[i].name),
> +				 "sn3218:%d:%.2x:%d", client->adapter->nr,
> +				 client->addr, i);

Just use the string obtained from DT.

> +		}
> +
> +		sn3218[i].led_cdev.name = sn3218[i].name;
> +		sn3218[i].led_cdev.brightness_set_blocking = sn3218_led_set;
> +		sn3218[i].led_cdev.max_brightness = LED_FULL;
> +
> +		ret = led_classdev_register(&client->dev, &sn3218[i].led_cdev);
> +		if (ret < 0)
> +			goto exit;

Use devm_ prefixed version.

> +	}
> +
> +	/* Reset chip to default, all LEDs off */
> +	i2c_smbus_write_byte_data(client, SN3218_RESET, 0xFF);
> +
> +	/* Set normal mode */
> +	i2c_smbus_write_byte_data(client, SN3218_MODE, 0x01);
> +
> +	return 0;
> +
> +exit:
> +	while (i--)
> +		led_classdev_unregister(&sn3218[i].led_cdev);
> +
> +	return ret;
> +}
> +
> +static int sn3218_remove(struct i2c_client *client)
> +{
> +	struct sn3218 *sn3218 = i2c_get_clientdata(client);
> +	int i;
> +
> +	for (i = 0; i < NUM_LEDS; i++)
> +		led_classdev_unregister(&sn3218->leds[i].led_cdev);
> +
> +	/* Set shutdown mode */
> +	i2c_smbus_write_byte_data(client, SN3218_MODE, 0x00);
> +
> +	return 0;
> +}
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
> +MODULE_LICENSE("GPL");

s/GPL/GPL v2/ - to be in accordance with the statement in the beginning.

-- 
Best Regards,
Jacek Anaszewski
