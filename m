From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/2] leds: lm3697: Introduce the lm3697 driver
Date: Fri, 24 Aug 2018 12:05:49 +0200
Message-ID: <20180824100549.GC4045@amd>
References: <20180817151528.21623-1-dmurphy@ti.com>
 <20180817151528.21623-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180817151528.21623-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +/**
> + * struct lm3697 -
> + * @enable_gpio - Hardware enable gpio
> + * @regulator - LED supply regulator pointer
> + * @client - Pointer to the I2C client
> + * @regmap - Devices register map
> + * @dev - Pointer to the devices device struct
> + * @lock - Lock for reading/writing the device
> + * @leds - Array of LED strings.
> + */

extra .

> +	ret =3D regmap_write(led->priv->regmap, brt_msb_reg, brt_val);
> +	if (ret) {
> +		dev_err(&led->priv->client->dev, "Cannot write MSB\n");
> +		goto out;
> +	}
> +out:

I'd avoid this goto.

> +static int lm3697_set_control_bank(struct lm3697 *priv)
> +{
> +	u8 control_bank_config =3D 0;
> +	struct lm3697_led *led;
> +	int ret, i;
> +
> +	led =3D &priv->leds[0];
> +	if (led->control_bank =3D=3D LM3697_CONTROL_A)
> +		led =3D &priv->leds[1];

I'd expect CONTROL_A to correspond to leds[0]...?

> +	for (i =3D 0; i < LM3697_MAX_LED_STRINGS; i++) {
> +		if (led->hvled_strings[i] =3D=3D LM3697_HVLED_ASSIGNMENT)
> +			control_bank_config |=3D 1 << i;
> +	}

Extra {}s.

> +	priv->regulator =3D devm_regulator_get(&priv->client->dev, "vled");
> +	if (IS_ERR(priv->regulator))
> +		priv->regulator =3D NULL;

If vled regulator is specified in dt and _get fails, is it worth a
warning?

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlt/2H0ACgkQMOfwapXb+vLSQACfbOzfw9WCO0CVnAcjrNIxSKyz
eS8An0UchEiAIjiBDMn9u7bzWP9+Sx9C
=7GoP
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
