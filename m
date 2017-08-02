From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch v3 1/1] leds: add driver for support Mellanox regmap LEDs
 for BMC
Date: Wed, 2 Aug 2017 10:38:58 +0200
Message-ID: <20170802083858.GA754@amd>
References: <1501518091-100730-1-git-send-email-vadimp@mellanox.com>
 <1501518091-100730-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:46331 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752641AbdHBIjB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2017 04:39:01 -0400
Content-Disposition: inline
In-Reply-To: <1501518091-100730-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, =jacek.anaszewski@gmail.com


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Driver obtains LED devices according to system configuration and creates
> devices in form: "devicename:color:function", like
> The full path is to be:
> /sys/class/leds/mlxreg\:status\:amber/brightness
> After timer trigger activation:
> echo timer > /sys/class/leds/mlxreg\:status\:amber/trigger
> Attributes for LED blinking will appaer in sysfs infrastructure:
> /sys/class/leds/mlxreg\:status\:amber/delay_off
> /sys/class/leds/mlxreg\:status\:amber/delay_on
>=20
> LED setting is controlled through the on-board programmable devices,
> which exports its register map. This device could be attached to any
> bus type, for which register mapping is supported.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

=2E..

> +/* Codes for LEDs. */
> +#define MLXREG_LED_OFFSET_HALF	0x01 /* Offset from solid: 3Hz blink */
> +#define MLXREG_LED_OFFSET_FULL	0x02 /* Offset from solid: 6Hz

Can it do half brightness?

> +	ret =3D regmap_read(pdata->regmap, led_pdata->led->reg, &regval);
> +	if (ret < 0) {
> +		dev_warn(led_pdata->led_cdev.dev, "Failed to get current brightness, e=
rror: %d\n",
> +			 ret);
> +		/* Assume the LED is OFF */
> +		ret =3D LED_OFF;
> +		goto access_error;

Just "return  LED_OFF;".

> +	if (regval >=3D led_pdata->base_color &&
> +	    regval <=3D (led_pdata->base_color + MLXREG_LED_OFFSET_FULL))
> +		ret =3D LED_FULL;
> +	else
> +		ret =3D LED_OFF;

Because it does not seem so here.

> +	for (i =3D 0; i < pdata->counter; i++, data++) {
> +		led_data =3D &pdata->data[i];
> +		led_cdev =3D &led_data->led_cdev;
> +		led_data->data_parent =3D priv;
> +		if (strstr(data->label, "red")) {
> +			brightness =3D LED_OFF;
> +			led_data->base_color =3D MLXREG_LED_RED_SOLID;
> +		} else if (strstr(data->label, "amber")) {
> +			brightness =3D LED_OFF;
> +			led_data->base_color =3D MLXREG_LED_AMBER_SOLID;
> +		} else {
> +			brightness =3D LED_OFF;
> +			led_data->base_color =3D MLXREG_LED_GREEN_SOLID;
> +		}

i don't know about the future, but you may check for "green"
substring, too? (Besides the fact that substring search is
"interesting"...)

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmBj6IACgkQMOfwapXb+vLuMQCgjq8vL2DGKiBmWsj2uSvyLScx
+5YAnRcUdYOJ5yABxgaLeZh33Llp3CdD
=LCU7
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
