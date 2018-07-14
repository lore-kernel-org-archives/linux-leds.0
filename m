From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce generic pattern interface
Date: Sat, 14 Jul 2018 08:29:16 +0200
Message-ID: <20180714062916.GB13242@amd>
References: <a0b874372f9ccd0491b54c79ac63b41812efef56.1531460834.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a0b874372f9ccd0491b54c79ac63b41812efef56.1531460834.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -446,4 +455,14 @@ static inline void led_classdev_notify_brightness_hw=
_changed(
>  	struct led_classdev *led_cdev, enum led_brightness brightness) { }
>  #endif
> =20
> +/**
> + * struct led_pattern - brigheness value in a pattern

"brightness".

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltJmDsACgkQMOfwapXb+vKCeQCfUNRrcPgzKJM2XY9H7bGGIM4n
NToAnA24PLxSwKB/HhUVHJwwF3LesEjH
=Tk+O
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
