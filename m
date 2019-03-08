From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Fri, 8 Mar 2019 22:06:49 +0100
Message-ID: <20190308210649.GC17626@amd>
References: <20190307220947.20057-1-dmurphy@ti.com>
 <20190307220947.20057-2-dmurphy@ti.com>
 <20190308151422.GA10378@amd>
 <6d9a5821-a634-8ea2-4fe3-0603af757668@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6d9a5821-a634-8ea2-4fe3-0603af757668@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> +		led@1 {
> >> +			reg =3D <1>;
> >> +			led-sources =3D <1>;
> >> +			ti,led-mode =3D <LM3532_BL_MODE_MANUAL>;
> >> +			label =3D "keypad";
> >=20
> > I guess best variant would be inputX::backlight here, but that might
> > be tricky to implement.
> >=20
>=20
> Yeah because we don't know what input the keyboard would be on.
> Unless there are APIs to retrieve that info.  I have not looked at the in=
put
> framework in a while.

Lets just make it "platform::kbd_backlight". *:kbd_backlight is
already used by quite a few drivers.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyC2WkACgkQMOfwapXb+vJx0ACfZz5PHKgNv4bvOLr/u/p353w6
FxQAoIVoAFfzvlfc9ajebJ+3+YA2gzz6
=hkmh
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
