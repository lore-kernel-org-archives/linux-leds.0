From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Fri, 15 Dec 2017 21:57:35 +0100
Message-ID: <20171215205735.GB19442@amd>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com>
 <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org>
 <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Yes, I think that how you describe luminance and lightness is right,
> and sounds good improve the doc.
>=20
> To be clear the correction table for PWM values can be calculated with
> this code.
>=20
> OUTPUT_SIZE =3D 65535      # Output integer size
> INPUT_SIZE =3D 2047
>=20
> def cie1931(L):
>     L =3D L*100.0
>     if L <=3D 8:
>         return (L/902.3)
>     else:
>         return ((L+16.0)/116.0)**3
>=20
> x =3D range(0,int(INPUT_SIZE+1))
> y =3D [int(round(cie1931(float(L)/INPUT_SIZE)*(OUTPUT_SIZE))) for L in x]

Can we just generate the table on the fly? Should not be hard to do in
fixed point, right?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo0Nz8ACgkQMOfwapXb+vLmAQCfZ/eCnsMCbiLrCZ2klKjeLoF1
1TgAnjhGLjdHwXQiirMX6DAAK4tef9Ut
=LWQK
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
