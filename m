From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Mon, 30 May 2016 14:51:26 +0200
Message-ID: <574C374E.3070205@samsung.com>
References: <1464258368-20021-1-git-send-email-tony.makkiel@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9458 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754541AbcE3Mva (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 May 2016 08:51:30 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7Z00G8DQDRGI20@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 30 May 2016 13:51:27 +0100 (BST)
In-reply-to: <1464258368-20021-1-git-send-email-tony.makkiel@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Tony,

Thanks for the patch. Please refer to my comments in the code.

Please address also all issues filed by scripts/checkpatch.pl --strict.

On 05/26/2016 12:26 PM, Tony Makkiel wrote:
> Datasheet: http://www.ti.com/lit/gpn/lp3952

Please put this line at the end of the commit message.

>
> The chip can drive 2 sets of RGB leds. Controller can
> be controlled via PWM, I2C and audio sychnronisation.

s/sychnronisation/synchronisation/

> This driver use I2C to communicate with chip.

s/use/uses/
s/chip/the chip/

>
> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
> ---
>   drivers/leds/Kconfig        |  12 ++
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-lp3952.c  | 411 +++++++++++++++++++++++++++++++++=
+++++++++++
>   include/linux/leds-lp3952.h |  89 ++++++++++
>   4 files changed, 513 insertions(+)
>   create mode 100644 drivers/leds/leds-lp3952.c
>   create mode 100644 include/linux/leds-lp3952.h
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 5ae2834..305faf9 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -228,6 +228,18 @@ config LEDS_LP3944
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called leds-lp3944.
>
> +config LEDS_LP3952
> +	tristate "LED Support for TI LP3952 2 channel LED driver"
> +	depends on LEDS_CLASS
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  This option enables support for LEDs connected to the Texas
> +	  Instruments LP3952 LED driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp3952.
> +
>   config LEDS_LP55XX_COMMON
>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/850=
1"
>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP850=
1
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index cb2013d..0684c86 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_LEDS_PCA9532)		+=3D leds-pca9532.o
>   obj-$(CONFIG_LEDS_GPIO_REGISTER)	+=3D leds-gpio-register.o
>   obj-$(CONFIG_LEDS_GPIO)			+=3D leds-gpio.o
>   obj-$(CONFIG_LEDS_LP3944)		+=3D leds-lp3944.o
> +obj-$(CONFIG_LEDS_LP3952)		+=3D leds-lp3952.o
>   obj-$(CONFIG_LEDS_LP55XX_COMMON)	+=3D leds-lp55xx-common.o
>   obj-$(CONFIG_LEDS_LP5521)		+=3D leds-lp5521.o
>   obj-$(CONFIG_LEDS_LP5523)		+=3D leds-lp5523.o
> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
> new file mode 100644
> index 0000000..8229d5a
> --- /dev/null
> +++ b/drivers/leds/leds-lp3952.c
> @@ -0,0 +1,411 @@
> +/*
> + * Copyright (c) 2016, DAQRI, LLC.
> + *
> + * License Terms: GNU General Public License v2
> + *
> + * leds-lp3952 - LED class driver for TI lp3952 controller
> + *
> + * Based on:
> + * leds-tlc9516 - LED class driver for TLC95XX series
> + * of I2C driven LED controllers from NXP
> + *
> + * Derived from leds-atmel-pwm, leds-bd2802 and initial PWM led 3952
> + * driver written by Alex Feinman
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +/*#define DEBUG 1*/

This seems to be stray debug definition. Let's drop it.

> +
> +#include <linux/io.h>
> +#include <linux/pm.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>
> +#include <linux/leds.h>
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds-lp3952.h>

Please arrange include directives in the alphabetical order.

> +
> +#define LP3952_REG_LED_CTRL                 0x00
> +#define LP3952_REG_R1_BLNK_TIME_CTRL        0x01
> +#define LP3952_REG_R1_BLNK_CYCLE_CTRL       0x02
> +#define LP3952_REG_G1_BLNK_TIME_CTRL        0x03
> +#define LP3952_REG_G1_BLNK_CYCLE_CTRL       0x04
> +#define LP3952_REG_B1_BLNK_TIME_CTRL        0x05
> +#define LP3952_REG_B1_BLNK_CYCLE_CTRL       0x06
> +#define LP3952_REG_ENABLES                  0x0B
> +#define LP3952_REG_PAT_GEN_CTRL             0x11
> +#define LP3952_REG_RGB1_MAX_I_CTRL          0x12
> +#define LP3952_REG_RGB2_MAX_I_CTRL          0x13
> +#define LP3952_REG_CMD_0                    0x50
> +#define LP3952_REG_RESET                    0x60
> +
> +#define REG_MAX                 LP3952_REG_RESET
> +
> +struct lp3952_ctrl_hdl {
> +	struct led_classdev cdev;
> +	char name[10];
> +	enum lp3952_leds channel;
> +	void *priv;
> +};
> +
> +struct ptrn_gen_cmd {
> +	union {
> +		struct {
> +			u16 tt:3;
> +			u16 b:3;
> +			u16 cet:4;
> +			u16 g:3;
> +			u16 r:3;
> +		};
> +		struct {
> +			u8 lsb;
> +			u8 msb;
> +		} bytes;
> +	};
> +} __attribute__ ((packed));
> +
> +struct lp3952_led_array {
> +	u8 ndev;
> +	u32 enable_gpio;
> +	struct regmap *regmap;
> +	struct i2c_client *client;
> +	struct ptrn_gen_cmd pgm[8];

Why 8? Please add a macro definition for this constant.

> +	struct lp3952_ctrl_hdl *leds;
> +};
> +
> +int lp3952_register_write(struct i2c_client *client, u8 reg, u8 val)
> +{
> +	int ret;
> +	struct lp3952_led_array *priv =3D i2c_get_clientdata(client);
> +
> +	ret =3D regmap_write(priv->regmap, reg, val);
> +
> +	if (ret)
> +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> +			__func__, reg, val, ret);
> +	return ret;
> +}
> +
> +int lp3952_register_read(struct i2c_client *client, u8 reg, u8 len,
> +			 u8 *valarray)
> +{
> +	struct lp3952_led_array *priv =3D i2c_get_clientdata(client);
> +	int ret =3D regmap_bulk_read(priv->regmap, reg, valarray, len);
> +
> +	if (ret < 0)
> +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> +			__func__, reg, valarray[0], ret);
> +	return ret;
> +}

This function seems to be unused.

> +
> +static void lp3952_on_off(struct lp3952_led_array *priv, enum lp3952=
_leds led,
> +			  int on)
> +{
> +	int val =3D 1 << led;
> +
> +	dev_dbg(&priv->client->dev, "%s LED %d to %d\n", __func__, led, on)=
;

Please add empty line here.

> +	if (LP3952_LED_ALL =3D=3D led)
> +		val =3D 0x3f;
> +
> +	regmap_update_bits(priv->regmap, LP3952_REG_LED_CTRL, val,
> +			   on ? val : 0);

Please check return value.

> +}
> +
> +/*
> + * Using Imax to control brightness. There are 4 possible
> + * setting 25, 50, 75 and 100 % of Imax. Possible values are
> + * values 0-4. 0 meaning turn off.
> + */
> +static int lp3952_set_brightness(struct led_classdev *cdev,
> +				 enum lp3952_brightness b)
> +{

I'd prefer something more meaningful than 'b'. brightness or value?

> +	unsigned int reg, val, shiftVal;
> +	struct lp3952_ctrl_hdl *led =3D container_of(cdev,
> +						   struct lp3952_ctrl_hdl,
> +						   cdev);
> +	struct lp3952_led_array *priv =3D (struct lp3952_led_array *)led->p=
riv;
> +
> +	dev_dbg(cdev->dev, "Brightness request: %d on %d\n", b, led->channe=
l);
> +
> +	if (LP3952_OFF =3D=3D b) {
> +		lp3952_on_off(priv, led->channel, LP3952_OFF);
> +		return 0;
> +	}
> +
> +	val =3D b - 1;
> +	reg =3D LP3952_REG_RGB1_MAX_I_CTRL;
> +	shiftVal =3D (led->channel - LP3952_BLUE_1) * 2;
> +
> +	if (led->channel > LP3952_RED_1) {
> +		dev_err(cdev->dev, " %s Invalid LED requested", __func__);
> +		return -EINVAL;
> +	} else if (led->channel < LP3952_BLUE_1) {
> +		shiftVal =3D led->channel * 2;
> +		reg =3D LP3952_REG_RGB2_MAX_I_CTRL;
> +	}

Empty line here

> +	/* Enable the LED in case it is not enabled already */
> +	lp3952_on_off(priv, led->channel, 1);

and here would improve readability.

> +	return (regmap_update_bits(priv->regmap, reg, 3 << shiftVal,
> +				   val << shiftVal));
> +}
> +
> +static void lp3952_brightness_ctrl(struct led_classdev *cdev,
> +				   enum led_brightness b)

brightness_set_blocking op returns int.

> +{
> +	int range =3D LED_HALF / 2;
> +	enum lp3952_brightness val =3D LP3952_FULL_BRIGHT;
> +
> +	dev_dbg(cdev->dev, "Requested Brightness %d\n", b);
> +
> +	if (LED_OFF =3D=3D b)
> +		val =3D LP3952_OFF;
> +	else if (b < (LED_HALF - range))
> +		val =3D LP3952_QUARTER_BRIGHT;
> +	else if (b <=3D LED_HALF)
> +		val =3D LP3952_HALF_BRIGHT;
> +	else if (b <=3D LED_HALF + range)
> +		val =3D LP3952_THREE_QRTR_BRIGHT;

You should operate directly on brightness levels, i.e. write the
brightness level passed from user space directly to the device.
enum lp3952_brightness is redundant IMO.

> +
> +	lp3952_set_brightness(cdev, val);
> +}
> +
> +static int lp3952_register_led_classdev(struct lp3952_led_array *pri=
v)
> +{
> +	int ret, i;
> +	const char *led_name[] =3D {
> +		"blue2",
> +		"green2",
> +		"red2",
> +		"blue1",
> +		"green1",
> +		"red1"
> +	};

According to Documentation/leds/leds-class.txt LED class device name
should match following pattern: devicename:colour:function. Colour
can be omitted if not relevant.

> +	for (i =3D 0; i < priv->ndev; i++) {
> +		sprintf(priv->leds[i].name, "%s", led_name[i]);
> +		priv->leds[i].cdev.name =3D priv->leds[i].name;
> +		priv->leds[i].cdev.brightness =3D LED_OFF;
> +		priv->leds[i].cdev.max_brightness =3D LED_FULL;

max_brightness should reflect the maximum brightness level allowed for
given LED. LED_FULL is a legacy enum, that max_brightness property
overrides.

> +		priv->leds[i].cdev.brightness_set_blocking =3D
> +		    lp3952_brightness_ctrl;
> +		priv->leds[i].channel =3D i;
> +		priv->leds[i].priv =3D priv;
> +
> +		ret =3D led_classdev_register(&priv->client->dev,
> +					    &priv->leds[i].cdev);

Please use devm prefixed version.

> +		if (ret < 0) {
> +			dev_err(&priv->client->dev,
> +				"couldn't register LED %s\n",
> +				priv->leds[i].cdev.name);
> +			goto error;
> +		}
> +	}
> +	return 0;
> +
> +error:
> +	for (; i >=3D 0; i--)
> +		led_classdev_unregister(&priv->leds[i].cdev);
> +	return ret;
> +}
> +
> +static void lp3952_unregister_led_classdev(struct lp3952_led_array *=
priv)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < priv->ndev; i++)
> +		led_classdev_unregister(&priv->leds[i].cdev);
> +}
> +
> +static int lp3952_set_pattern_gen_cmd(struct lp3952_led_array *priv,
> +				      u8 cmd_index, u8 r, u8 g, u8 b,
> +				      enum lp3952_tt tt, enum lp3952_cet cet)
> +{
> +	struct ptrn_gen_cmd line =3D {
> +		.r =3D r,
> +		.g =3D g,
> +		.b =3D b,
> +		.cet =3D cet,
> +		.tt =3D tt
> +	};
> +	if (cmd_index >=3D 8)
> +		return -EINVAL;
> +
> +	priv->pgm[cmd_index] =3D line;
> +	lp3952_register_write(priv->client, LP3952_REG_CMD_0 + cmd_index * =
2,
> +			      line.bytes.msb);

Please check return value.

> +	return (lp3952_register_write(priv->client,
> +				      LP3952_REG_CMD_0 + cmd_index * 2 + 1,
> +				      line.bytes.lsb));
> +}
> +
> +static int lp3952_configure(struct lp3952_led_array *priv)
> +{
> +	int ret;
> +
> +	/* Disable any LEDs on from any previous conf. */
> +	ret =3D lp3952_register_write(priv->client, LP3952_REG_LED_CTRL, 0)=
;
> +	if (ret)
> +		return ret;

Empty line here please.

> +	/* enable rgb patter, loop */
> +	lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL, 0x06);

Please check return value and add empty line after that.

> +	/* Update Bit 6 (Active mode),1 and 0 for pattern Gen */
> +	ret =3D regmap_update_bits(priv->regmap, LP3952_REG_ENABLES, 0x43, =
0xfc);

Please add bit definitions for all the register bit fields.

> +	if (ret)
> +		return ret;

Empty line here please.

> +	/* Set Cmd1 for RGB intensity,cmd and transition time */
> +	return (lp3952_set_pattern_gen_cmd(priv, 0, I46, I71, I100, TT0,
> +					   CET197));
> +}
> +
> +static const struct regmap_config lp3952_regmap =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D REG_MAX,
> +};
> +
> +static int lp3952_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	int status;
> +	struct lp3952_ctrl_hdl *leds;
> +	struct lp3952_led_array *priv;
> +	struct lp3952_platform_data *pdata =3D dev_get_platdata(&client->de=
v);
> +
> +	dev_info(&client->dev, "lp3952 probe\n");

I believe this is stray debug log. Please remove it.

> +
> +	if (!pdata) {
> +		dev_err(&client->dev,
> +			"lp3952: failed to obtain platform_data\n");
> +		return -EINVAL;
> +	}
> +	priv =3D kzalloc(sizeof(struct lp3952_led_array), GFP_KERNEL);

Please use devm prefixed version.

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->ndev =3D 6;
> +
> +	leds =3D kcalloc(priv->ndev, sizeof(*leds), GFP_KERNEL);

Please use devm prefixed version.

> +	if (!leds) {
> +		kfree(priv);
> +		return -ENOMEM;
> +	}
> +	priv->leds =3D leds;
> +	priv->client =3D client;
> +	priv->enable_gpio =3D pdata->enable_gpio;
> +	priv->regmap =3D devm_regmap_init_i2c(client, &lp3952_regmap);
> +	if (IS_ERR(priv->regmap)) {
> +		int err =3D PTR_ERR(priv->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> +			err);
> +		return err;
> +	}

Empty line here please.

> +	status =3D gpio_request(priv->enable_gpio, "lp3952_gpio");
> +	if (status)
> +		dev_warn(&client->dev, "Unable to disable reset gpio: %d\n",
> +			 status);

Empty line here please.

> +	status =3D gpio_direction_output(priv->enable_gpio, 1);
> +	if (status)
> +		dev_warn(&client->dev, "Unable to disable reset gpio: %d\n",
> +			 status);

Empty line here please.

> +	i2c_set_clientdata(client, priv);
> +
> +	status =3D lp3952_configure(priv);
> +	if (status) {
> +		dev_err(&client->dev, "Probe failed. Device not found (%d)\n",
> +			status);
> +		kfree(leds);
> +		kfree(priv);
> +		return status;
> +	}

Empty line here please.

> +	lp3952_register_led_classdev(priv);

Please check return value.

> +
> +	lp3952_on_off(priv, LP3952_LED_ALL, 1);

If it is possible then device should remain in power down
mode if brightness equals 0. And this should be secured before
the LED class device is registered. Preferrably to be moved to the
lp3952_configure().

> +	return 0;
> +}
> +
> +static int lp3952_remove(struct i2c_client *client)
> +{
> +	struct lp3952_led_array *priv;
> +
> +	priv =3D i2c_get_clientdata(client);
> +	lp3952_on_off(priv, LP3952_LED_ALL, 0);
> +
> +	lp3952_unregister_led_classdev(priv);
> +
> +	kfree(priv->leds);
> +	gpio_direction_input(priv->enable_gpio);
> +	gpio_free(priv->enable_gpio);
> +	kfree(priv);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int lp3952_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct lp3952_led_array *priv =3D i2c_get_clientdata(client);
> +
> +	lp3952_on_off(priv, LP3952_LED_ALL, 0);
> +	gpio_direction_input(priv->enable_gpio);
> +	return 0;
> +}
> +
> +static int lp3952_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct lp3952_led_array *priv =3D i2c_get_clientdata(client);
> +
> +	gpio_direction_output(priv->enable_gpio, 1);
> +	return 0;
> +}

Power management is already handled in led-class.c. Please
refer to led_suspend(). It sets brightness to 0, and thus the LED
class drivers are expected to turn the devices they control into
power down mode in case all LEDs controlled by them are set to LED_OFF.

Therefore you should control the "enable_gpio" state in the
brightness_set_blocking() op.

> +
> +static SIMPLE_DEV_PM_OPS(lp3952_pm, lp3952_suspend, lp3952_resume);
> +#define LP3952_PM (&lp3952_pm)
> +#else /* CONFIG_PM */
> +#define LP3952_PM NULL
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id lp3952_acpi_match[] =3D {
> +	{LP3952_NAME, 0},
> +	{}
> +};
 >
> +
> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> +#endif
> +
> +static const struct i2c_device_id lp3952_id[] =3D {
> +	{LP3952_NAME, 0},
> +	{}
> +};
> +
> +static struct i2c_driver lp3952_i2c_driver =3D {
> +	.driver =3D {
> +		   .name =3D LP3952_NAME,
> +		   .owner =3D THIS_MODULE,
> +		   .pm =3D LP3952_PM,
> +#ifdef CONFIG_ACPI
> +		   .acpi_match_table =3D ACPI_PTR(lp3952_acpi_match),
> +#endif

Did you test booting using ACPI? Would it be possible to switch
to using Device Tree? This device is controlled via I2C so this
would be a more suitable way.

> +		   },
> +	.probe =3D lp3952_probe,
> +	.remove =3D __exit_p(lp3952_remove)

If not building the driver as a module I am getting the following:

drivers/leds/leds-lp3952.c:337:12: warning: =91lp3952_remove=92 defined=
 but=20
not used

Is there some specific reason for which you don't want to have
the "remove" op initialized when driver is built into the kernel?

What config are you using for building this driver?

,
> +	.id_table =3D lp3952_id,
> +};
> +
> +module_i2c_driver(lp3952_i2c_driver);
> +
> +MODULE_AUTHOR("Tony Makkiel <tony.makkiel@daqri.com>");
> +MODULE_DESCRIPTION("lp3952 I2C LED controller driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.=
h
> new file mode 100644
> index 0000000..1b1e7c3
> --- /dev/null
> +++ b/include/linux/leds-lp3952.h
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright (C) 2016, DAQRI LLC
> + *
> + * License Terms: GPL v2
> + *
> + * TI lp3952 Controller driver
> + *
> + * Author: Tony Makkiel <tony.makkiel@daqri.com>
> + *
> + */
> +
> +#ifndef LEDS_LP3952_H_
> +#define LEDS_LP3952_H_
> +
> +#define LP3952_NAME             "lp3952"
> +#define LP3952_DEV_ADDR         0x54
> +/* Following 2 MACRO are specific to Minnowboard Max
> + * Use the appropriate host specific values when
> + * instantiating device
> + */
> +#define LP3952_BUS_ADDR         7
> +#define LP3952_NRST_GPIO        464
> +
> +/* Transition Time in ms */
> +enum lp3952_tt {
> +	TT0,
> +	TT55,
> +	TT110,
> +	TT221,
> +	TT422,
> +	TT885,
> +	TT1770,
> +	TT3539
> +};
> +
> +/* Command Execution Time in ms */
> +enum lp3952_cet {
> +	CET197,
> +	CET393,
> +	CET590,
> +	CET786,
> +	CET1180,
> +	CET1376,
> +	CET1573,
> +	CET1769,
> +	CET1966,
> +	CET2163,
> +	CET2359,
> +	CET2556,
> +	CET2763,
> +	CET2949,
> +	CET3146
> +};
> +
> +/* Max Current in % */
> +enum lp3952_colour_I_log_0 {
> +	I0,
> +	I7,
> +	I14,
> +	I21,
> +	I32,
> +	I46,
> +	I71,
> +	I100
> +};
> +
> +enum lp3952_brightness {
> +	LP3952_OFF =3D 0,
> +	LP3952_QUARTER_BRIGHT,
> +	LP3952_HALF_BRIGHT,
> +	LP3952_THREE_QRTR_BRIGHT,
> +	LP3952_FULL_BRIGHT
> +};
> +
> +enum lp3952_leds {
> +	LP3952_BLUE_2,
> +	LP3952_GREEN_2,
> +	LP3952_RED_2,
> +	LP3952_BLUE_1,
> +	LP3952_GREEN_1,
> +	LP3952_RED_1,
> +	LP3952_LED_ALL
> +};
> +
> +struct lp3952_platform_data {
> +	u32 enable_gpio;
> +};
> +
> +#endif /* LEDS_LP3952_H_ */
>

--=20
Best regards,
Jacek Anaszewski
