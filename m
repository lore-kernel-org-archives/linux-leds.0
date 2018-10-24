From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 1/7] leds: add TI LMU backlight driver
Date: Wed, 24 Oct 2018 11:14:07 +0200
Message-ID: <20181024091407.GC24997@amd>
References: <20181023170623.31820-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181023170623.31820-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com, Milo Kim <milo.kim@ti.com>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-leds@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-10-23 12:06:17, Dan Murphy wrote:
> From: Pavel Machek <pavel@ucw.cz>
>=20
> This adds backlight support for the following TI LMU
> chips: LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
>=20
> It controls LEDs on Droid 4
> smartphone, including keyboard and screen backlights.
>=20
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> [add LED subsystem support for keyboard backlight and rework DT
> binding according to Rob Herrings feedback]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> [remove backlight subsystem support for now]
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

This is not correct way to sign off a patch.

What is worse, this is very different from patch I submitted; this
misses imporant parts while my patch was complete.

I already submitted better patch for both the driver and device tree
bindings. Can we go back and apply that?

Then you can add your changes on top of that, if they actually make
the situation better.

Thanks,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQN98ACgkQMOfwapXb+vIOCACfQN8uM9Mm9rBT85ynEiWjE19w
zKEAn2XQzpMu+BYx1591Y+bK54grktTX
=4gGL
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
