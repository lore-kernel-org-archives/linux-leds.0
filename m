From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Wed, 19 Dec 2018 20:34:55 +0100
Message-ID: <20181219193455.GA21159@amd>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219162626.12297-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +static DEVICE_ATTR_WO(ctrl_bank_a_mix);
> +static DEVICE_ATTR_WO(ctrl_bank_b_mix);
> +static DEVICE_ATTR_WO(ctrl_bank_c_mix);
> +
> +static struct attribute *lp5024_ctrl_bank_attrs[] =3D {
> +	&dev_attr_ctrl_bank_a_mix.attr,
> +	&dev_attr_ctrl_bank_b_mix.attr,
> +	&dev_attr_ctrl_bank_c_mix.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(lp5024_ctrl_bank);

=2E..
> +
> +static DEVICE_ATTR_WO(led1_mix);
> +static DEVICE_ATTR_WO(led2_mix);
> +static DEVICE_ATTR_WO(led3_mix);
> +
> +static struct attribute *lp5024_led_independent_attrs[] =3D {
> +	&dev_attr_led1_mix.attr,
> +	&dev_attr_led2_mix.attr,
> +	&dev_attr_led3_mix.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(lp5024_led_independent);

Ok, so you are adding new sysfs files. Are they _really_ neccessary?
We'd like to have uniform interfaces for the leds.

If they are neccessary, we need documentation for them.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwanV8ACgkQMOfwapXb+vJcsgCgoDf6Ygk2LIK09xDjs70WVjLa
F40An31rlizGm0+OPasF2r2CeWK+pGOi
=bOXm
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
