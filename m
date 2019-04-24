From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 20/26] leds: aat1290: Use generic support for
 composing LED names
Date: Wed, 24 Apr 2019 15:57:20 +0200
Message-ID: <20190424135719.GC14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-21-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-21-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net
List-Id: linux-leds@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Switch to using generic LED support for composing LED class
> device name.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

> @@ -257,9 +257,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *l=
ed,
>  		return -EINVAL;
>  	}
> =20
> -	led_cdev->name =3D of_get_property(child_node, "label", NULL) ? :
> -						child_node->name;
> -
>  	ret =3D of_property_read_u32(child_node, "led-max-microamp",
>  				&cfg->max_mm_current);
>  	/*
> @@ -469,6 +466,7 @@ static int aat1290_led_probe(struct platform_device *=
pdev)
>  	struct aat1290_led *led;
>  	struct led_classdev *led_cdev;
>  	struct led_classdev_flash *fled_cdev;
> +	struct led_init_data init_data =3D {};

You can do directly =3D { .devicename =3D ...; }, at least for the name.

Anyway, that's a detail.

8, 10, 12, 14, 16, 18, 20: Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAaz8ACgkQMOfwapXb+vKriQCcDwk6UeJr46HCVI+yRgKifC9c
4SQAnjIJmctKjqadfYavYRdvrDx2Llk9
=jlY7
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
