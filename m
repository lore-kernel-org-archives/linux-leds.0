From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Thu, 23 May 2019 14:03:11 +0100
Message-ID: <20190523130311.GA17245@sirena.org.uk>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.

> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_dev=
ice *pdev)
> =20
>  	if (gpiod) {
>  		cfg.ena_gpiod =3D gpiod;
> -
> -		ret =3D regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
> +		ret =3D regmap_update_bits(regmap,
> +					 lm363x_regulator_desc[id].enable_reg,
>  					 LM3632_EXT_EN_MASK,
>  					 LM3632_EXT_EN_MASK);
>  		if (ret) {

Is it guaranteed that the bitmask for enabling the use of the GPIO is
going to be the same for all regulators?  The bitmasks for the regulator
enable look to be different, and it also looks like this setting might
affect multiple regulators since it seems there are multiple enable bits
in the same register.  If this affects multiple regulators then how's
that working at the minute?

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmmgwACgkQJNaLcl1U
h9AW+wf/W9R9Ah4Ahge5WpgUG5KcZlhb1Pg8RHBA9nrw5Wo/xEXiczOYi+we0nb2
AyLzhBfpufQOzZM3Ua+zUoMjjTs2yFvaTb25zSN5EHHJ2QzpWjveSKVRfnl7rpxQ
VyvXzwc9q1dPC7zDHS/jjixCw/pM1we2U7/xMhNspPNY7+RIf4Q9K4HBjyXl8bY0
Hzt1mUMXUAcFThQu8Jd1J7CF/rdXBqhtHKjDMnlvG6w2q6WqQufQHJ3TZR43yFAc
0raknJuO5029WwxMxA1jJbuE1e/k2Vm1K3pKWq/XK1PeyA2sekcenFnZdieJgbvd
RJTQ7GG0xr6edBiR0q8GdwduhSUN9A==
=vcQI
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
