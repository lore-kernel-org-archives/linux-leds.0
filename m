From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Fri, 11 Aug 2017 15:47:57 +0200
Message-ID: <20170811134757.GA22561@amd>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50542 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752723AbdHKNr7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Aug 2017 09:47:59 -0400
Content-Disposition: inline
In-Reply-To: <1502199760-763-4-git-send-email-clg@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The PCA955x family of chips are I2C LED blinkers whose pins not used
> to control LEDs can be used as general purpose I/Os (GPIOs).
>=20
> The following adds such a support by defining different operation
> modes for the pins (See bindings documentation for more details). The
> pca955x driver is then extended with a gpio_chip when some of pins are
> operating as GPIOs. The default operating mode is to behave as a LED.
>=20
> The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

For the series,

Acked-by: Pavel Machek <pavel@ucw.cz>

with minor comments below.

> @@ -125,6 +130,7 @@ struct pca955x_led {
>  	struct led_classdev	led_cdev;
>  	int			led_num;	/* 0 .. 15 potentially */
>  	char			name[32];
> +	u32			type;

u32 is highly non-standard here. enum pca955x_led_type?

> +/*
> + * Read the INPUT register, which contains the state of LEDs.
> + */
> +static u8 pca955x_read_input(struct i2c_client *client, int n)
> +{
> +	return (u8)i2c_smbus_read_byte_data(client, n);
> +}

Is the cast needed? Should you attempt to handle errors?

> +#ifndef _DT_BINDINGS_LEDS_PCA955X_H
> +#define _DT_BINDINGS_LEDS_PCA955X_H
> +
> +#define PCA955X_TYPE_NONE         0
> +#define PCA955X_TYPE_LED          1
> +#define PCA955X_TYPE_GPIO         2

And make these into the new enum pca955x_led_type?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmNtY0ACgkQMOfwapXb+vLqVwCeLE1mLVdGwF5nUZ5/YcHZ4MXf
rr8AnAmbsYH1WDclTWXw6dXddHlLyDYH
=1Dbv
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
