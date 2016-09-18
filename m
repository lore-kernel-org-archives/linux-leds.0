From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Sun, 18 Sep 2016 20:20:44 +0200
Message-ID: <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-3-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474025672-5040-3-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Florian,

Thanks for the updated patch set. I have few comments below.

On 09/16/2016 01:34 PM, Florian Vaussard wrote:
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
> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
> ---
>  drivers/leds/Kconfig        |  11 +++
>  drivers/leds/Makefile       |   1 +
>  drivers/leds/leds-ncp5623.c | 234 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 246 insertions(+)
>  create mode 100644 drivers/leds/leds-ncp5623.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7a628c6..1eda9bd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -659,6 +659,17 @@ config LEDS_MLXCPLD
>  	  This option enabled support for the LEDs on the Mellanox
>  	  boards. Say Y to enabled these.
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
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 3965070..dc53dd8 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
> +obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
>
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-ncp5623.c b/drivers/leds/leds-ncp5623.c
> new file mode 100644
> index 0000000..875785a
> --- /dev/null
> +++ b/drivers/leds/leds-ncp5623.c
> @@ -0,0 +1,234 @@
> +/*
> + * Copyright 2016 Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
> + *
> + * Based on leds-tlc591xx.c

I think that besides LED class facilities the only
common thing is led_no. I'd skip this statement.

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

Both values refer in fact to the same thing.
And actually the name is not accurate since max current level
is 30.

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
> +#define LED_TO_PWM_CMD(led)	((0x02 + led) << NCP5623_CMD_SHIFT)
> +
> +#define NCP5623_DATA_MASK	GENMASK(NCP5623_CMD_SHIFT - 1, 0)
> +#define NCP5623_CMD(cmd, data)	(cmd | (data & NCP5623_DATA_MASK))
> +
> +struct ncp5623_led {
> +	int led_no;
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
> +static int ncp5623_brightness_set(struct led_classdev *led_cdev,
> +				  enum led_brightness brightness)
> +{
> +	struct ncp5623_led *led = ldev_to_led(led_cdev);
> +
> +	return ncp5623_send_cmd(led->priv, LED_TO_PWM_CMD(led->led_no),
> +				brightness);
> +}
> +
> +static int ncp5623_configure(struct device *dev,
> +			     struct ncp5623_priv *priv)
> +{
> +	unsigned int i;
> +	unsigned int n;
> +	struct ncp5623_led *led;
> +	int effective_current;
> +	int err;

Below way of calculating max_brightness is not clear to me.
Let's analyze it below, using values from your DT example.

> +
> +	/* Setup the internal current source, round down */
> +	n = 2400 * priv->led_iref / priv->leds_max_current + 1;

n = 2400 * 10 / 20000 + 1 = 2

> +	if (n > NCP5623_MAX_CURRENT)
> +		n = NCP5623_MAX_CURRENT;
> +
> +	effective_current = 2400 * priv->led_iref / n;

effective_current = 2400 * 10 / 2 = 12000

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
> +		if (led->led_no < 0)
> +			continue;
> +
> +		led->priv = priv;
> +		led->ldev.brightness_set_blocking = ncp5623_brightness_set;
> +
> +		led->ldev.max_brightness = led->led_max_current *
> +			NCP5623_MAX_STEPS / effective_current;

led->ldev.max_brightness = 20000 * 31 / 12000 = 51

This is not intuitive, and I'm not even sure if the result is in line
with what you intended.

Instead I propose the following:

n_iled_max =
      31 - (priv->led_iref * 2400 / priv->leds_max_current +
            !!(priv->led_iref * 2400 % priv->leds_max_current))

(n_iled_max =
      31 - (24000 / 20000 + !!(24000 % 20000)) = 31 - (1 + 1) = 29)

ncp5623_send_cmd(priv, CMD_ILED, n_iled_max)

and then below for each LED:

led->ldev.max_brightness =
      31 - (priv->led_iref * 2400 / led->led_max_current +
            !!(priv->led_iref * 2400 % led->led_max_current))

(for led-max-microamp = 5000
  led->ldev.max_brightness =
  31 - (24000 / 5000 + !!(24000 % 5000)) = 31 - (4 + 1) = 26,
  which reflects quite well the logarithmic relation shown
  on Figure 5 in the documentation)

Of course 31 should be replaced with NCP5623_MAX_CURRENT_LEVEL + 1,
or another macro with some smart name, but I am currently unable
to come up with satisfactory name.

> +		if (led->ldev.max_brightness > NCP5623_MAX_STEPS)
> +			led->ldev.max_brightness = NCP5623_MAX_STEPS;
> +
> +		err = devm_led_classdev_register(dev, &led->ldev);
> +		if (err < 0) {
> +			dev_err(dev, "couldn't register LED %s\n",
> +				led->ldev.name);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
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
> +	count = of_get_child_count(np);
> +	if (!count || count > NCP5623_MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_child_of_node(np, child) {
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err)
> +			return err;
> +
> +		if (reg >= NCP5623_MAX_LEDS) {
> +			err = -EINVAL;
> +			goto dt_child_parse_error;
> +		}
> +
> +		led = &priv->leds[reg];
> +		if (led->led_no >= 0) {
> +			/* Already registered */
> +			err = -EINVAL;
> +			goto dt_child_parse_error;
> +		}
> +		led->led_no = reg;
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

Please move it below ncp5623_probe().

> +
> +static int ncp5623_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct ncp5623_priv *priv;
> +	int i, err;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Mark all LEDs as inactive by default */
> +	for (i = 0; i < NCP5623_MAX_LEDS; i++)
> +		priv->leds[i].led_no = -ENODEV;

If you assumed that valid led_no start from 1 (in the documentation
they LEDs are also called LED1, LED2, LED3), and modified your macros
slightly, then you could get rid of this loop as led_no is zeroed by
kzalloc().

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
> +	.id_table = ncp5623_id,
> +};
> +
> +module_i2c_driver(ncp5623_driver);
> +
> +MODULE_AUTHOR("Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("NCP5623 LED driver");
>

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
