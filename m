From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 2/2] leds: add Panasonic AN30259A support
Date: Thu, 26 Jul 2018 09:44:49 +0200
Message-ID: <20180726074449.GB4872@amd>
References: <20180721141228.2283-1-simon@lineageos.org>
 <20180721141228.2283-3-simon@lineageos.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180721141228.2283-3-simon@lineageos.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2018-07-22 00:12:27, Simon Shields wrote:
> AN30259A is a 3-channel LED driver which uses I2C. It supports timed
> operation via an internal PWM clock, and variable brightness. This
> driver offers support for basic hardware-based blinking and brightness
> control.
>=20
> The datasheet is freely available:
> https://www.alliedelec.com/m/d/a9d2b3ee87c2d1a535a41dd747b1c247.pdf
>=20
> Signed-off-by: Simon Shields <simon@lineageos.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAltZe/EACgkQMOfwapXb+vJvlwCbBXb2+g0cgKex/IjaREEUND6w
RKUAn3H8s5I6vHOaVpE+zHBQ6XP3ScOA
=/a69
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
