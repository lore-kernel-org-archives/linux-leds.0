From: Evan McClain <aeroevan@gmail.com>
Subject: Re: [PATCH v4] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 23 Feb 2016 10:40:11 -0500
Message-ID: <1456242011.3234.3.camel@gmail.com>
References: <1456232462-2925-1-git-send-email-aeroevan@gmail.com>
	 <56CC73D0.80106@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-chcyAXX0T7zkTCWcVE4E"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:36686 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753758AbcBWPkU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 10:40:20 -0500
Received: by mail-qg0-f52.google.com with SMTP id y9so140717408qgd.3
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2016 07:40:20 -0800 (PST)
In-Reply-To: <56CC73D0.80106@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Simon Que <sque@chromium.org>, Duncan Laurie <dlaurie@chromium.org>, Richard Purdie <rpurdie@rpsys.net>, Olof Johansson <olof@lixom.net>


--=-chcyAXX0T7zkTCWcVE4E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like most keyboard backlight drivers currently live in
drivers/platform, with a few exceptions.

Moving this driver to platform/chrome should be easy enough if that is
the proper location.

Thanks,
Evan McClain

On Tue, 2016-02-23 at 15:59 +0100, Jacek Anaszewski wrote:
> Hi Jingoo, Lee,
>=20
> I have my doubts if this driver wouldn't better fit for
> backlight subsystem. Actually the two are very similar
> and I wonder what are the criteria to follow when deciding
> if a driver should belong to one or to the other. Is the
> advertised purpose of the hardware the only one?
>=20
> Best regards,
> Jacek Anaszewski
>=20
> On 02/23/2016 02:01 PM, Evan McClain wrote:
> > From: Simon Que <sque@chromium.org>
> >=20
> > Some Chrome OS devices use ACPI-based keyboard backlight LEDs.
> >=20
> > Enable with menuconfig option under Device Drivers -> LED Support.
> >=20
> > Signed-off-by: Simon Que <sque@chromium.org>
> > Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
> > Signed-off-by: Evan McClain <aeroevan@gmail.com>
> > ---
> > =C2=A0 drivers/leds/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A0=C2=A07 +++
> > =C2=A0 drivers/leds/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=
=C2=A01 +
> > =C2=A0 drivers/leds/leds-chromeos-keyboard.c | 110
> > ++++++++++++++++++++++++++++++++++
> > =C2=A0 3 files changed, 118 insertions(+)
> > =C2=A0 create mode 100644 drivers/leds/leds-chromeos-keyboard.c
> >=20
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1034696..89c81b6 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -619,6 +619,13 @@ config LEDS_VERSATILE
> > =C2=A0=C2=A0	=C2=A0=C2=A0This option enabled support for the LEDs on th=
e ARM
> > Versatile
> > =C2=A0=C2=A0	=C2=A0=C2=A0and RealView boards. Say Y to enabled these.
> >=20
> > +config LEDS_CHROMEOS_KEYBOARD
> > +	tristate "LED support for Chrome OS keyboards"
> > +	depends on LEDS_CLASS && ACPI
> > +	help
> > +	=C2=A0=C2=A0This option enables support for the LEDs on Chrome OS
> > keyboards.
> > +	=C2=A0=C2=A0Say Y to enable keyboard LEDs on Chrome OS systems.
> > +
> > =C2=A0 comment "LED Triggers"
> > =C2=A0 source "drivers/leds/trigger/Kconfig"
> >=20
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 89c9b6f..5b96d15 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+=3D
> > leds-ktd2692.o
> > =C2=A0 obj-$(CONFIG_LEDS_POWERNV)		+=3D leds-powernv.o
> > =C2=A0 obj-$(CONFIG_LEDS_SEAD3)		+=3D leds-sead3.o
> > =C2=A0 obj-$(CONFIG_LEDS_SN3218)		+=3D leds-sn3218.o
> > +obj-$(CONFIG_LEDS_CHROMEOS_KEYBOARD)	+=3D leds-chromeos-
> > keyboard.o
> >=20
> > =C2=A0 # LED SPI Drivers
> > =C2=A0 obj-$(CONFIG_LEDS_DAC124S085)		+=3D leds-dac124s085.o
> > diff --git a/drivers/leds/leds-chromeos-keyboard.c
> > b/drivers/leds/leds-chromeos-keyboard.c
> > new file mode 100644
> > index 0000000..4611fae
> > --- /dev/null
> > +++ b/drivers/leds/leds-chromeos-keyboard.c
> > @@ -0,0 +1,110 @@
> > +/*
> > + *=C2=A0=C2=A0LED driver for Chrome OS keyboard backlight
> > + *
> > + *=C2=A0=C2=A0Copyright (C) 2012 Google, Inc.
> > + *
> > + *=C2=A0=C2=A0This program is free software; you can redistribute it a=
nd/or
> > modify
> > + *=C2=A0=C2=A0it under the terms of the GNU General Public License as
> > published by
> > + *=C2=A0=C2=A0the Free Software Foundation; either version 2 of the Li=
cense,
> > or
> > + *=C2=A0=C2=A0(at your option) any later version.
> > + *
> > + *=C2=A0=C2=A0This program is distributed in the hope that it will be
> > useful,
> > + *=C2=A0=C2=A0but WITHOUT ANY WARRANTY; without even the implied warra=
nty of
> > + *=C2=A0=C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=
=A0=C2=A0See the
> > + *=C2=A0=C2=A0GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +/* Keyboard LED ACPI Device must be defined in firmware */
> > +#define ACPI_KEYBOARD_BACKLIGHT_DEVICE	"\\_SB.KBLT"
> > +#define ACPI_KEYBOARD_BACKLIGHT_READ	ACPI_KEYBOARD_BACKLIGH
> > T_DEVICE ".KBQC"
> > +#define ACPI_KEYBOARD_BACKLIGHT_WRITE	ACPI_KEYBOARD_BACKLIG
> > HT_DEVICE ".KBCM"
> > +
> > +#define ACPI_KEYBOARD_BACKLIGHT_MAX		100
> > +
> > +static void keyboard_led_set_brightness(struct led_classdev *cdev,
> > +					enum led_brightness
> > brightness)
> > +{
> > +	union acpi_object param;
> > +	struct acpi_object_list input;
> > +	acpi_status status;
> > +
> > +	if (!(cdev->flags & LED_SUSPENDED))
> > +		cdev->brightness =3D brightness;
> > +
> > +	param.type =3D ACPI_TYPE_INTEGER;
> > +	param.integer.value =3D brightness;
> > +	input.count =3D 1;
> > +	input.pointer =3D &param;
> > +
> > +	status =3D acpi_evaluate_object(NULL,
> > ACPI_KEYBOARD_BACKLIGHT_WRITE,
> > +					=C2=A0=C2=A0&input, NULL);
> > +	if (ACPI_FAILURE(status))
> > +		dev_err(cdev->dev, "Error setting keyboard LED
> > value");
> > +}
> > +
> > +static int keyboard_led_probe(struct platform_device *pdev)
> > +{
> > +	struct led_classdev *cdev;
> > +	acpi_handle handle;
> > +	acpi_status status;
> > +	int ret;
> > +
> > +	/* Look for the keyboard LED ACPI Device */
> > +	status =3D acpi_get_handle(ACPI_ROOT_OBJECT,
> > +				=C2=A0ACPI_KEYBOARD_BACKLIGHT_DEVICE,
> > +				=C2=A0&handle);
> > +	if (ACPI_FAILURE(status)) {
> > +		dev_err(&pdev->dev, "Unable fo find ACPI device
> > %s\n",
> > +			ACPI_KEYBOARD_BACKLIGHT_DEVICE);
> > +		return -ENODEV;
> > +	}
> > +
> > +	cdev =3D devm_kzalloc(&pdev->dev, sizeof(struct
> > led_classdev), GFP_KERNEL);
> > +	if (!cdev)
> > +		return -ENOMEM;
> > +
> > +	cdev->name =3D "chromeos::kbd_backlight";
> > +	cdev->brightness_set =3D keyboard_led_set_brightness;
> > +	cdev->max_brightness =3D ACPI_KEYBOARD_BACKLIGHT_MAX;
> > +	cdev->flags |=3D LED_CORE_SUSPENDRESUME;
> > +
> > +	ret =3D devm_led_classdev_register(&pdev->dev, cdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	platform_set_drvdata(pdev, cdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct acpi_device_id keyboard_led_id[] =3D {
> > +	{ "GOOG0002", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
> > +
> > +static struct platform_driver keyboard_led_driver =3D {
> > +	.driver		=3D {
> > +		.name	=3D "chromeos-keyboard-leds",
> > +		.owner	=3D THIS_MODULE,
> > +		.acpi_match_table =3D ACPI_PTR(keyboard_led_id),
> > +	},
> > +	.probe		=3D keyboard_led_probe,
> > +};
> > +
> > +module_platform_driver(keyboard_led_driver);
> > +
> > +MODULE_AUTHOR("Simon Que <sque@chromium.org>");
> > +MODULE_DESCRIPTION("ChromeOS Keyboard LED Driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:chromeos-keyboard-leds");
> >=20
>=20
--=20
Evan McClain
https://keybase.io/aeroevan

--=-chcyAXX0T7zkTCWcVE4E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWzH1cAAoJEPQx78gG1JMfqjwH/12jWLSHyZpAy/tBOy+PjHBL
31HXRlK42RCMFmHvVYTODP/VPdyP2xU9U9mEaNMTUkruycLP7cp+Mk0q0FwXIQOs
2fzhT4Hds3xzdBHw6D5yEhs0R5rnT2YfTvTI+lhDw7oOkmFOIyAJkr/gg653CLxS
JFFlYCTF4tsxODf/kwYRlec7Fok5+oXzNHV2hiWs+l+EIxKlQyyHBEH/xewcuWbF
lC5bw+8Evxgqbq3Gg3qVSiuoHkkMXpoYfVKMFrhLQvXrW/2i3SoPJQCBCRkvNYJ2
dbRYnELVvovEZHgg+XMJYLZWXoO6tkdKe65ABUad5aQDKKiXDU7c4pjd8pzfd0c=
=Oq0r
-----END PGP SIGNATURE-----

--=-chcyAXX0T7zkTCWcVE4E--
