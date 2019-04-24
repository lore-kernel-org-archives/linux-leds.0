From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 22/26] leds: as3645a: Use generic support for
 composing LED names
Date: Wed, 24 Apr 2019 16:01:28 +0200
Message-ID: <20190424140128.GD14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-23-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-23-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Switch to using generic LED support for composing LED class
> device name.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

> +static int as3645a_led_class_setup(struct as3645a *flash)
>  {
>  	struct led_classdev *fled_cdev =3D &flash->fled.led_cdev;
>  	struct led_classdev *iled_cdev =3D &flash->iled_cdev;
> +	struct led_init_data init_data;

Not initialized.

>  	struct led_flash_setting *cfg;
>  	int rval;
> =20
> -	iled_cdev->name =3D names->indicator;
>  	iled_cdev->brightness_set_blocking =3D as3645a_set_indicator_brightness;
>  	iled_cdev->max_brightness =3D
>  		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
>  	iled_cdev->flags =3D LED_CORE_SUSPENDRESUME;
> =20
> -	rval =3D led_classdev_register(&flash->client->dev, iled_cdev);
> +	init_data.fwnode =3D flash->indicator_node;
> +	init_data.devicename =3D AS_NAME;
> +	init_data.default_label =3D "indicator";

And struct has one more field:

	 +       /*
	 +        * indicates if LED name should always comprise
         devicename section;
	 +        * only LEDs exposed by drivers of hot-pluggable
         devices should
	 +        * set it to true
	 +        */
	 +       bool devname_mandatory;
	  };

I believe it would be cleaner to always initialize struct with zeros;
that way you can also expand it in future.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAbDgACgkQMOfwapXb+vKq5ACglcaCN/9FwvYniQtE1vovSced
OvYAoI/2Wc8TqlBTLFMD/nofn+dxGPQI
=K0fz
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
