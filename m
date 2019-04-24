From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 26/26] leds: an30259a: Use generic support for
 composing LED names
Date: Wed, 24 Apr 2019 16:05:07 +0200
Message-ID: <20190424140507.GF14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-27-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H4SyuGOnfnj3aJqJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-27-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


--H4SyuGOnfnj3aJqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-17 22:54:39, Jacek Anaszewski wrote:
> Switch to using generic LED support for composing LED class
> device name.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Simon Shields <simon@lineageos.org>

> @@ -312,13 +306,20 @@ static int an30259a_probe(struct i2c_client *client)
>  	chip->regmap =3D devm_regmap_init_i2c(client, &an30259a_regmap_config);
> =20
>  	for (i =3D 0; i < chip->num_leds; i++) {
> +		struct led_init_data init_data;
> +
>  		an30259a_init_default_state(&chip->leds[i]);
>  		chip->leds[i].cdev.brightness_set_blocking =3D
>  			an30259a_brightness_set;
>  		chip->leds[i].cdev.blink_set =3D an30259a_blink_set;
> =20
> -		err =3D devm_led_classdev_register(&client->dev,
> -						 &chip->leds[i].cdev);
> +		init_data.fwnode =3D chip->leds[i].fwnode;
> +		init_data.devicename =3D AN30259A_NAME;
> +		init_data.default_label =3D ":";
> +
> +		err =3D devm_led_classdev_register_ext(&client->dev,
> +						 &chip->leds[i].cdev,
> +						 &init_data);
>  		if (err < 0)
>  			goto exit;
>  	}

Again, uninitialized field in init_data... AFAICT.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H4SyuGOnfnj3aJqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAbRMACgkQMOfwapXb+vLtWQCgtsoesGVMGHnNJ1R6dDT2LiLr
xS8AoIOJG2/DoSof86TJfxX9cIiDS7rm
=iEHy
-----END PGP SIGNATURE-----

--H4SyuGOnfnj3aJqJ--
