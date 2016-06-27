From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Mon, 27 Jun 2016 10:14:12 +0200
Message-ID: <5770E054.5040608@samsung.com>
References: <1467010990-28070-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467010990-28070-3-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:11080 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbcF0IOR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2016 04:14:17 -0400
In-reply-to: <1467010990-28070-3-git-send-email-florian.vaussard@heig-vd.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

Hi Florian,

Thanks for the update. I have few comments below.

On 06/27/2016 09:03 AM, Florian Vaussard wrote:
> The NCP5623 is a 3-channel LED driver from On Semiconductor controlled
> through I2C. The PWM of each channel can be independently set with 32
> distinct levels. In addition, the intensity of the current source can be
> globally set using an external bias resistor fixing the reference
> current (Iref) and a dedicated register (ILED), following the
> relationship:
>
> I = 2400*Iref/(31-ILED)
>
> with Iref = Vref/Rbias, and Vref = 0.6V.
>
> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
> ---
>   drivers/leds/Kconfig        |  11 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-ncp5623.c | 269 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 281 insertions(+)
>   create mode 100644 drivers/leds/leds-ncp5623.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 5ae2834..6d3e44d 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -588,6 +588,17 @@ config LEDS_BLINKM
>   	  This option enables support for the BlinkM RGB LED connected
>   	  through I2C. Say Y to enable support for the BlinkM LED.
>
> +config LEDS_NCP5623
> +	tristate "LED Support for NCP5623 I2C chip"
> +	depends on LEDS_CLASS
> +	depends on I2C
> +	help
> +	  This option enables support for LEDs connected to NCP5623
> +	  LED driver chips accessed via the I2C bus.
> +	  Driver supports brightness control.
> +
> +	  Say Y to enable this driver.
> +
>   config LEDS_POWERNV
>   	tristate "LED support for PowerNV Platform"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index cb2013d..a2f0e10 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>   obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
>   obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
>   obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
> +obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-ncp5623.c b/drivers/leds/leds-ncp5623.c
> new file mode 100644
> index 0000000..6e4c969
> --- /dev/null
> +++ b/drivers/leds/leds-ncp5623.c
> @@ -0,0 +1,269 @@
> +/*
> + * Copyright 2016 Florian Vaussard <florian.vaussard@heig-vd.ch>
> + *
> + * Based on leds-tlc591xx.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +
> +#define NCP5623_MAX_LEDS	3
> +#define NCP5623_MAX_STEPS	31
> +#define NCP5623_MAX_CURRENT	31
> +#define NCP5623_MAX_CURRENT_UA	30000
> +
> +#define NCP5623_CMD_SHIFT	5
> +#define CMD_SHUTDOWN		(0x00 << NCP5623_CMD_SHIFT)
> +#define CMD_ILED		(0x01 << NCP5623_CMD_SHIFT)
> +#define CMD_PWM1		(0x02 << NCP5623_CMD_SHIFT)
> +#define CMD_PWM2		(0x03 << NCP5623_CMD_SHIFT)
> +#define CMD_PWM3		(0x04 << NCP5623_CMD_SHIFT)
> +#define CMD_UPWARD_DIM		(0x05 << NCP5623_CMD_SHIFT)
> +#define CMD_DOWNWARD_DIM	(0x06 << NCP5623_CMD_SHIFT)
> +#define CMD_DIM_STEP		(0x07 << NCP5623_CMD_SHIFT)
> +
> +#define LED_to_CMD(led)		((0x02 + led) << NCP5623_CMD_SHIFT)

Please use only capital letters in the macro name.

> +
> +#define NCP5623_DATA_MASK	GENMASK(NCP5623_CMD_SHIFT - 1, 0)
> +#define NCP5623_CMD(cmd, data)	(cmd | (data & NCP5623_DATA_MASK))
> +
> +struct ncp5623_led {
> +	bool active;
> +	unsigned int led_no;
> +	u32 led_max_current;
> +	struct led_classdev ldev;
> +	struct ncp5623_priv *priv;
> +};
> +
> +struct ncp5623_priv {
> +	struct ncp5623_led leds[NCP5623_MAX_LEDS];
> +	u32 led_iref;
> +	u32 leds_max_current;
> +	struct i2c_client *client;
> +};
> +
> +static struct ncp5623_led *ldev_to_led(struct led_classdev *ldev)
> +{
> +	return container_of(ldev, struct ncp5623_led, ldev);
> +}
> +
> +static int ncp5623_send_cmd(struct ncp5623_priv *priv, u8 cmd, u8 data)
> +{
> +	char cmd_data[1] = { NCP5623_CMD(cmd, data) };
> +	int err;
> +
> +	err = i2c_master_send(priv->client, cmd_data, ARRAY_SIZE(cmd_data));
> +
> +	return (err < 0 ? err : 0);
> +}
> +
> +static int ncp5623_set_pwm(struct ncp5623_led *led, u8 brightness)
> +{
> +	struct ncp5623_priv *priv = led->priv;
> +	u8 cmd;

cmd is redundant here, you can pass the macro directly.

> +
> +	cmd = LED_to_CMD(led->led_no);
> +
> +	return ncp5623_send_cmd(priv, cmd, brightness);

How about just one line:

return ncp5623_send_cmd(led->priv, LED_TO_CMD(led->led_no), brightness);

> +}
> +
> +static int ncp5623_brightness_set(struct led_classdev *led_cdev,
> +				  enum led_brightness brightness)
> +{
> +	struct ncp5623_led *led = ldev_to_led(led_cdev);
> +
> +	return ncp5623_set_pwm(led, brightness);

return ncp5623_set_pwm(ldev_to_led(led_cdev), brightness);

> +}
> +
> +static void ncp5623_destroy_devices(struct ncp5623_priv *priv)
> +{
> +	struct ncp5623_led *led;
> +	int i;
> +
> +	for (i = 0; i < NCP5623_MAX_LEDS; i++) {
> +		led = &priv->leds[i];
> +		if (led->active) {
> +			led_classdev_unregister(&led->ldev);
> +			led->active = false;
> +		}
> +	}
> +}

This function is redundant when using devm_led_classdev_register().

> +
> +static int ncp5623_configure(struct device *dev,
> +			     struct ncp5623_priv *priv)
> +{
> +	unsigned int i;
> +	unsigned int n;
> +	struct ncp5623_led *led;
> +	int effective_current;
> +	int err;
> +
> +	/* Setup the internal current source, round down */
> +	n = 2400 * priv->led_iref / priv->leds_max_current + 1;
> +	if (n > NCP5623_MAX_CURRENT)
> +		n = NCP5623_MAX_CURRENT;
> +
> +	effective_current = 2400 * priv->led_iref / n;
> +	dev_dbg(dev, "setting maximum current to %u uA\n", effective_current);
> +
> +	err = ncp5623_send_cmd(priv, CMD_ILED, NCP5623_MAX_CURRENT - n);
> +	if (err < 0) {
> +		dev_err(dev, "cannot set the current\n");
> +		return err;
> +	}
> +
> +	/* Setup each individual LED */
> +	for (i = 0; i < NCP5623_MAX_LEDS; i++) {
> +		led = &priv->leds[i];
> +
> +		if (!led->active)
> +			continue;
> +
> +		led->priv = priv;
> +		led->led_no = i;
> +		led->ldev.brightness_set_blocking = ncp5623_brightness_set;
> +
> +		led->ldev.max_brightness = led->led_max_current *
> +			NCP5623_MAX_STEPS / effective_current;
> +		if (led->ldev.max_brightness > NCP5623_MAX_STEPS)
> +			led->ldev.max_brightness = NCP5623_MAX_STEPS;
> +
> +		err = devm_led_classdev_register(dev, &led->ldev);
> +		if (err < 0) {
> +			dev_err(dev, "couldn't register LED %s\n",
> +				led->ldev.name);
> +			goto exit;
> +		}
> +	}
> +
> +	return 0;
> +
> +exit:
> +	ncp5623_destroy_devices(priv);
> +	return err;
> +}
> +
> +static int ncp5623_parse_dt(struct ncp5623_priv *priv, struct device_node *np)
> +{
> +	struct device_node *child;
> +	struct ncp5623_led *led;
> +	u32 reg;
> +	int count;
> +	int err;
> +
> +	err = of_property_read_u32(np, "onnn,led-iref-microamp",
> +				   &priv->led_iref);
> +	if (err)
> +		return -EINVAL;
> +
> +	priv->leds_max_current = 0;

priv is allocated with kzalloc, so this is redundant.

> +
> +	count = of_get_child_count(np);
> +	if (!count || count > NCP5623_MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_child_of_node(np, child) {
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err)
> +			return err;

Empty line here please.

> +		if (reg < 0 || reg >= NCP5623_MAX_LEDS) {
> +			err = -EINVAL;
> +			goto dt_child_parse_error;
> +		}
> +
> +		led = &priv->leds[reg];
> +		if (led->active) {
> +			err = -EINVAL;
> +			goto dt_child_parse_error;
> +		}
 > +
> +		led->active = true;

Is the 'active' property really needed? You could verify if the LED
has been already initialized e.g. by checking led->ldev.name for
being NULL.

> +
> +		err = of_property_read_u32(child, "led-max-microamp",
> +					   &led->led_max_current);
> +		if (err || led->led_max_current > NCP5623_MAX_CURRENT_UA)
> +			return -EINVAL;
> +		if (led->led_max_current > priv->leds_max_current)
> +			priv->leds_max_current = led->led_max_current;
> +
> +		led->ldev.name =
> +			of_get_property(child, "label", NULL) ? : child->name;
> +		led->ldev.default_trigger =
> +			of_get_property(child, "linux,default-trigger", NULL);
> +	}
> +
> +	return 0;
> +
> +dt_child_parse_error:
> +	of_node_put(child);
> +
> +	return err;
> +}
> +
> +static const struct of_device_id ncp5623_of_match[] = {
> +	{ .compatible = "onnn,ncp5623" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ncp5623_of_match);
> +
> +static int ncp5623_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct ncp5623_priv *priv;
> +	int err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = client;
> +	i2c_set_clientdata(client, priv);
> +
> +	err = ncp5623_parse_dt(priv, np);
> +	if (err)
> +		return err;
> +
> +	return ncp5623_configure(dev, priv);
> +}
> +
> +static int ncp5623_remove(struct i2c_client *client)
> +{
> +	struct ncp5623_priv *priv = i2c_get_clientdata(client);
> +
> +	ncp5623_destroy_devices(priv);
> +
> +	return 0;
> +}

remove callback is not needed with devm prefixed registration.

> +
> +static const struct i2c_device_id ncp5623_id[] = {
> +	{ "ncp5623" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ncp5623_id);
> +
> +static struct i2c_driver ncp5623_driver = {
> +	.driver = {
> +		.name = "ncp5623",
> +		.of_match_table = of_match_ptr(ncp5623_of_match),
> +	},
> +	.probe = ncp5623_probe,
> +	.remove = ncp5623_remove,
> +	.id_table = ncp5623_id,
> +};
> +
> +module_i2c_driver(ncp5623_driver);
> +
> +MODULE_AUTHOR("Florian Vaussard <florian.vaussard@heig-vd.ch>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("NCP5623 LED driver");
>


-- 
Best regards,
Jacek Anaszewski
