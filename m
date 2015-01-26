From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel
 i2c LED driver
Date: Mon, 26 Jan 2015 13:32:40 +0200
Message-ID: <54C625D8.7040305@ti.com>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch> <1421879364-8573-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8EkOJan97sM2SJxmq3wKfULNGs7fVMHec"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:60632 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753547AbbAZLdg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 26 Jan 2015 06:33:36 -0500
In-Reply-To: <1421879364-8573-3-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, tomi.valkeinen@ti.com, vigneshr@ti.com, Matthew.Fatheree@belkin.com

--8EkOJan97sM2SJxmq3wKfULNGs7fVMHec
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/01/15 00:29, Andrew Lunn wrote:
> The TLC59116 is an I2C bus controlled 16-channel LED driver.  The
> TLC59108 is an I2C bus controlled 8-channel LED driver, which is very
> similar to the TLC59116. Each LED output has its own 8-bit
> fixed-frequency PWM controller to control the brightness of the LED.
> The LEDs can also be fixed off and on, making them suitable for use as
> GPOs.
>=20
> This is based on a driver from Belkin, but has been extensively
> rewritten and extended to support both 08 and 16 versions.
>=20
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Matthew.Fatheree@belkin.com
> ---
>  drivers/leds/Kconfig         |   8 ++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-tlc591xx.c | 309 +++++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 318 insertions(+)
>  create mode 100644 drivers/leds/leds-tlc591xx.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a6c3d2f153f3..67cba2032543 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -457,6 +457,14 @@ config LEDS_TCA6507
>  	  LED driver chips accessed via the I2C bus.
>  	  Driver support brightness control and hardware-assisted blinking.
> =20
> +config LEDS_TLC591XX
> +	tristate "LED driver for TLC59108 and TLC59116 controllers"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  This option enables support for Texas Instruments TLC59108
> +	  and TLC59116 LED controllers.
> +
>  config LEDS_MAX8997
>  	tristate "LED support for MAX8997 PMIC"
>  	depends on LEDS_CLASS && MFD_MAX8997
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 1c65a191d907..0558117a9407 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_LEDS_LP8501)		+=3D leds-lp8501.o
>  obj-$(CONFIG_LEDS_LP8788)		+=3D leds-lp8788.o
>  obj-$(CONFIG_LEDS_LP8860)		+=3D leds-lp8860.o
>  obj-$(CONFIG_LEDS_TCA6507)		+=3D leds-tca6507.o
> +obj-$(CONFIG_LEDS_TLC591XX)		+=3D leds-tlc591xx.o
>  obj-$(CONFIG_LEDS_CLEVO_MAIL)		+=3D leds-clevo-mail.o
>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+=3D leds-ipaq-micro.o
>  obj-$(CONFIG_LEDS_HP6XX)		+=3D leds-hp6xx.o
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.=
c
> new file mode 100644
> index 000000000000..531e83f54465
> --- /dev/null
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -0,0 +1,309 @@
> +/*
> + * Copyright 2014 Belkin Inc.
> + * Copyright 2015 Andrew Lunn <andrew@lunn.ch>
> + *
> + * This program is free software; you can redistribute it and/or modif=
y
> + * it under the terms of the GNU General Public License as published b=
y
> + * the Free Software Foundation; version 2 of the License.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>
> +
> +#define TLC59116_LEDS		16
> +#define TLC59108_LEDS		8

These two are quite confusing. In some places they are used as "number
of leds on TLC5910x device", and in some places they are used as "max
leds on any TLC device".

When defining the static values for struct tlc59116 and tlc59108 I think
it would be much cleaner to just use the integer there, instead of one
of the defines above. And if you needs a "max leds on any TLC device",
define it clearly, like TLC591XX_MAX_LEDS or such.

> +
> +#define TLC591XX_REG_MODE1	0x00
> +#define MODE1_RESPON_ADDR_MASK	0xF0
> +#define MODE1_NORMAL_MODE	(0 << 4)
> +#define MODE1_SPEED_MODE	(1 << 4)
> +
> +#define TLC591XX_REG_MODE2	0x01
> +#define MODE2_DIM		(0 << 5)
> +#define MODE2_BLINK		(1 << 5)
> +#define MODE2_OCH_STOP		(0 << 3)
> +#define MODE2_OCH_ACK		(1 << 3)
> +
> +#define TLC591XX_REG_PWM(x)	(0x02 + (x))
> +
> +#define TLC591XX_REG_GRPPWM	0x12
> +#define TLC591XX_REG_GRPFREQ	0x13
> +
> +/* LED Driver Output State, determine the source that drives LED outpu=
ts */
> +#define LEDOUT_OFF	0x0	/* Output LOW */
> +#define LEDOUT_ON	0x1	/* Output HI-Z */
> +#define LEDOUT_DIM	0x2	/* Dimming */
> +#define LEDOUT_BLINK	0x3	/* Blinking */
> +#define LEDOUT_MASK	0x3
> +
> +#define ldev_to_led(c)		container_of(c, struct tlc591xx_led, ldev)
> +#define work_to_led(work)	container_of(work, struct tlc591xx_led, work=
)
> +
> +struct tlc591xx_led {
> +	bool active;
> +	struct regmap *regmap;
> +	unsigned int led_no;
> +	struct led_classdev ldev;
> +	struct work_struct work;
> +	const struct tlc591xx *tlc591xx;
> +};

The struct above contains fields that are common to all led instances.
Maybe a matter of taste, but I'd rather have one struct representing the
whole device (struct tlc591xx_priv I guess), which would contains
'regmap' and 'tlc591xx' fields. And tlc591xx_led would contain a pointer
to the tlc591xx_priv.

Not a big difference, but having regmap in the struct above makes me
think that each leds has its own regmap.

> +
> +struct tlc591xx_priv {
> +	struct tlc591xx_led leds[TLC59116_LEDS];
> +};
> +
> +static int
> +tlc59116_reg_ledout(unsigned int led) {
> +
> +	return (0x14 + (led >> 2));
> +}
> +
> +static int
> +tlc59108_reg_ledout(unsigned int led) {
> +
> +	return (0x0c + (led >> 2));
> +}

You could just have the offset (0x14 or 0x0c) as a value in the struct
below, and then you would not need the functions above.

> +
> +struct tlc591xx {
> +	unsigned int maxleds;
> +	int (*reg_ledout)(unsigned int);
> +};
> +
> +static const struct tlc591xx tlc59116 =3D {
> +	.maxleds =3D TLC59116_LEDS,
> +	.reg_ledout =3D tlc59116_reg_ledout,
> +};
> +
> +static const struct tlc591xx tlc59108 =3D {
> +	.maxleds =3D TLC59108_LEDS,

So here using "8", and "16" above, would look much cleaner to me.

> +	.reg_ledout =3D tlc59108_reg_ledout,
> +};
> +
> +static int
> +tlc591xx_set_mode(struct regmap *regmap, u8 mode)
> +{
> +	int err;
> +	u8 val;
> +
> +	if ((mode !=3D MODE2_DIM) && (mode !=3D MODE2_BLINK))
> +		mode =3D MODE2_DIM;

If mode is not DIM or BLINK, should this function return an error?

> +	/* Configure MODE1 register */
> +	err =3D regmap_write(regmap, TLC591XX_REG_MODE1, MODE1_NORMAL_MODE);
> +	if (err)
> +		return err;
> +
> +	/* Configure MODE2 Reg */
> +	val =3D MODE2_OCH_STOP | mode;
> +
> +	return regmap_write(regmap, TLC591XX_REG_MODE2, val);
> +}
> +
> +static int
> +tlc591xx_set_ledout(struct tlc591xx_led *led, u8 val)
> +{
> +	struct regmap *regmap =3D led->regmap;
> +	unsigned int i =3D (led->led_no % 4) * 2;
> +	unsigned int addr =3D led->tlc591xx->reg_ledout(led->led_no);
> +	unsigned int mask =3D LEDOUT_MASK << i;
> +
> +	val =3D val << i;
> +
> +	return regmap_update_bits(regmap, addr, mask, val);
> +}
> +
> +static int
> +tlc591xx_set_pwm(struct tlc591xx_led *led, u8 val)
> +{
> +	struct regmap *regmap =3D led->regmap;
> +	u8 pwm =3D TLC591XX_REG_PWM(led->led_no);
> +
> +	return regmap_write(regmap, pwm, led->ldev.brightness);
> +}
> +
> +static void
> +tlc591xx_led_work(struct work_struct *work)
> +{

Maybe it's normal for LED drivers, but why is the workqueue needed? Why
not just do the work synchronously?

> +	struct tlc591xx_led *led =3D work_to_led(work);
> +	int err;
> +
> +	switch (led->ldev.brightness) {

Can the brightness here be < 0 or > LED_FULL?

> +	case 0:
> +		err =3D tlc591xx_set_ledout(led, LEDOUT_OFF);
> +		break;
> +	case LED_FULL:
> +		err =3D tlc591xx_set_ledout(led, LEDOUT_ON);
> +		break;
> +	default:
> +		err =3D tlc591xx_set_ledout(led, LEDOUT_DIM);
> +		if (!err)
> +			err =3D tlc591xx_set_pwm(led, led->ldev.brightness);
> +	}

There doesn't seem to be any locking used for the fields this function
accesses. Perhaps none is needed, but an async work without locks and
without comments about it makes me feel a bit nervous.

> +
> +	if (err)
> +		dev_err(led->ldev.dev, "Failed setting brightness\n");
> +}
> +
> +static void
> +tlc591xx_led_set(struct led_classdev *led_cdev, enum led_brightness va=
lue)
> +{
> +	struct tlc591xx_led *led =3D ldev_to_led(led_cdev);
> +
> +	led->ldev.brightness =3D value;
> +	schedule_work(&led->work);
> +}
> +
> +static void
> +tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
> +{
> +	int i =3D j;
> +
> +	while (--i >=3D 0) {
> +		if (priv->leds[i].active) {
> +			led_classdev_unregister(&priv->leds[i].ldev);
> +			cancel_work_sync(&priv->leds[i].work);
> +		}
> +	}
> +}
> +
> +static int
> +tlc591xx_configure(struct device *dev,
> +		   struct tlc591xx_priv *priv,
> +		   struct regmap *regmap,
> +		   const struct tlc591xx *tlc591xx)
> +{
> +	unsigned int i;
> +	int err =3D 0;
> +
> +	tlc591xx_set_mode(regmap, MODE2_DIM);
> +	for (i =3D 0; i < TLC59116_LEDS; i++) {

Looping for tlc591xx->maxleds should be enough?

> +		struct tlc591xx_led *led =3D &priv->leds[i];
> +
> +		if (!led->active)
> +			continue;
> +
> +		led->regmap =3D regmap;
> +		led->led_no =3D i;
> +		led->tlc591xx =3D tlc591xx;
> +		led->ldev.brightness_set =3D tlc591xx_led_set;

A matter of taste, but I'd rather have 'tlc591xx_brightness_set'.

> +		led->ldev.max_brightness =3D LED_FULL;
> +		INIT_WORK(&led->work, tlc591xx_led_work);
> +		err =3D led_classdev_register(dev, &led->ldev);
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
> +	tlc591xx_destroy_devices(priv, i);
> +	return err;
> +}
> +
> +static const struct regmap_config tlc591xx_regmap =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D 0x1e,
> +};
> +
> +static const struct of_device_id of_tlc591xx_leds_match[] =3D {
> +	{ .compatible =3D "ti,tlc59116",
> +	  .data =3D &tlc59116 },
> +	{ .compatible =3D "ti,tlc59108",
> +	  .data =3D &tlc59108 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_tlc591xx_leds_match);
> +
> +static int
> +tlc591xx_probe(struct i2c_client *client,
> +	       const struct i2c_device_id *id)
> +{
> +	struct device_node *np =3D client->dev.of_node, *child;
> +	struct device *dev =3D &client->dev;
> +	const struct tlc591xx *tlc591xx;
> +	struct tlc591xx_priv *priv;
> +	struct regmap *regmap;
> +	int err, count, reg;
> +
> +	tlc591xx =3D of_match_device(of_tlc591xx_leds_match, dev)->data;

I presume of_match_device() can return NULL or an error, making the
above crash.

> +
> +	count =3D of_get_child_count(np);

'np' may be NULL. I'm not sure how of_get_child_count() likes that.

 Tomi



--8EkOJan97sM2SJxmq3wKfULNGs7fVMHec
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxiXYAAoJEPo9qoy8lh71L34P/iJGVN0SEyNKbu0i1fEKJoSs
57u5er0F9lo9EHV6fBXHdMm5yNcvwJtBp4xOPR2YuwN/77RQgqFxHHuZ+54sUsxC
Sz1KnQDT2FDQZmnoq4CUrSNNCqkuhcmBDuAHln21z7bsL7oM4lmTGMbMuyRPCfw8
tQBU2YnqIhVTLQM3C7cTVFmVdNspDMIkkGHgNgcqWTvEq2FK6c7mR+YMP9lbBj0+
2QMTwUYepuaTsGmbDfODwSsxwzWhgXKRxQF7jZS1itPk8SUjoDK0FlEQczwtoIEW
X9BgnLsODT6BJnDVtqbguc2V5Jjc+jyufGbYKJJmBlR7P3kS7xxox9/N7DJQX17M
sePKDS9/peFJJS11YkBcM4dJfOdpPcuv9HbQ6WS10rQjHV6rnB2FfrSYVjJkmY7Y
TL5ytt8iNZIJHl3iqK7eiCrbrCuSFnx/faOurPAUM44nQ59aUD2vwLUb5xodfkli
bpuFPhydAVMG6XUx9KHJApXXVMa7YaG1g7LSysMAGYK9nAqMP6DcpLRCJzPiT7pj
yqJJ48Fgu6gpLh52btPcigGd+xiDkC+KEq2O7rJddWdCL2OGNGsDc8S4o404YUUW
+gTC6eLDVyA/tRVtDshZUpKclH6whFHv0yjM++KO5pQZeIZ1N4AkvCcARQPyRrv0
wZFOZzs49uQy/wwnLNaj
=dhBu
-----END PGP SIGNATURE-----

--8EkOJan97sM2SJxmq3wKfULNGs7fVMHec--
