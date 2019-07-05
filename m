From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: tlc591xx: Use the OF version of the LED
 registration function
Date: Fri, 5 Jul 2019 22:24:33 +0200
Message-ID: <20190705202433.GB5445@amd>
References: <20190701152602.31716-1-jjhiblot@ti.com>
 <20190701152602.31716-3-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701152602.31716-3-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-01 17:26:02, Jean-Jacques Hiblot wrote:
> The driver parses the device-tree to identify which LED should be handled.
> Since the information about the device node is known at this time, we can
> provide the LED core with it. It may be useful later.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> @@ -207,7 +207,7 @@ tlc591xx_probe(struct i2c_client *client,
>  		led->led_no =3D idx++;
>  		led->ldev.brightness_set_blocking =3D tlc591xx_brightness_set;
>  		led->ldev.max_brightness =3D LED_FULL;
> -		err =3D devm_led_classdev_register(dev, &led->ldev);
> +		err =3D devm_of_led_classdev_register(dev, child, &led->ldev);
>  		if (err < 0) {
>  			dev_err(dev, "couldn't register LED %s\n",
>  				led->ldev.name);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0fsgEACgkQMOfwapXb+vKPnQCfUiBHIn7co+XTi2pYp86P5jQJ
Q34AoKL08ZM/9tjJFzZAXpHW0GjTfrB5
=URtF
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
