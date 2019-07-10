From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 4/4] backlight: add led-backlight driver
Date: Wed, 10 Jul 2019 21:16:37 +0200
Message-ID: <20190710191637.GD22995@amd>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-5-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710123932.28244-5-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-07-10 14:39:32, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

> +
> +		/*
> +		 *try to map actual LED brightness to backlight brightness
> +		 * level
> +		 */

"* Try"

> +		db =3D priv->default_brightness;
> +		for (i =3D 0 ; i < num_levels; i++) {
> +			if ((i && db > levels[i-1]) && db <=3D levels[i])
> +				break;
> +		}
> +		priv->default_brightness =3D i;
> +		priv->max_brightness =3D num_levels - 1;
> +		priv->levels =3D levels;
> +	} else if (num_levels >=3D 0)
> +		dev_warn(dev, "not enought levels defined\n");

"Not enough"

> +	ret =3D of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret && value <=3D priv->max_brightness)
> +		priv->default_brightness =3D value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "invalid default brightness. ignoring it\n");

"Invalid... Ignoring it."

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0mOZUACgkQMOfwapXb+vKGjACbBk0etpxF6Viyuje0o1lj4McY
wJgAoKbPa8b/CQqQPf5ELQ7VvqyxdarH
=TOSr
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
