From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 2/2] leds: lm3692x: Introduce LM3692x dual string
 driver
Date: Wed, 15 Nov 2017 22:12:36 +0100
Message-ID: <20171115211236.GD6183@amd>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <20171115194203.13572-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115194203.13572-2-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introducing the LM3692x Dual-String white LED driver.
>=20
> Data sheet is located

"located at"? (Twice.)

> http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
>=20
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>

> +config LEDS_LM3692X
> +	tristate "LED support for LM3692x Chips"
> +	depends on LEDS_CLASS && I2C
> +	select REGMAP_I2C
> +	help
> +	  This option enables support for the TI LM3692x family
> +	  of LED drivers.

"If unsure ..., module will be named..."

Might want to say this is for backlight LEDs here.

> +static int lm3692x_fault_check(struct lm3692x_led *led)
> +{
> +	int ret, fault;
> +	unsigned int read_buf;
> +
> +	ret =3D regmap_read(led->regmap, LM3692X_FAULT_FLAGS, &read_buf);
> +	if (ret)
> +		return ret;
> +
> +	fault =3D read_buf;
> +
> +	if (fault)
> +		dev_err(&led->client->dev, "Detected a fault 0x%X\n",
> +			fault);
> +
> +	return ret;
> +}

Get rid of "fault" variable?

Does fault need to be propagated to the caller?


> +static int lm3692x_init(struct lm3692x_led *led)
> +{
> +	int ret;
> +
> +	if (led->regulator) {
> +		ret =3D regulator_enable(led->regulator);
> +		if (ret)
> +			dev_err(&led->client->dev,
> +				"Failed to enable regulator\n");
> +			goto out;
> +	}
> +
> +	if (led->enable_gpio)
> +		gpiod_direction_output(led->enable_gpio, 1);
> +
> +	ret =3D lm3692x_fault_check(led);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Cannot read/clear faults\n");
> +		goto out;
> +	}
> +
> +	ret =3D regmap_write(led->regmap, LM3692X_BRT_CTRL, 0x00);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Fail writing BRT CTRL\n");
> +		goto out;
> +	}

How often are those fails reached? Maybe regmap wrapper that would
print "reading/writing register XY failed" would be enough?

Otherwise looks good,

Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAloMrcQACgkQMOfwapXb+vLJCwCguccgCwBrhXD6hW8vFlhgzqv+
1SQAl09TEinO3lEwreCz4cLAZzZd38M=
=AiUT
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
