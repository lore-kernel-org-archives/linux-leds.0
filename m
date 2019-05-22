From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RESEND PATCH v4 2/6] dt-bindings: mfd: Add lm36274 bindings to
 ti-lmu
Date: Wed, 22 May 2019 23:22:53 +0200
Message-ID: <20190522212253.GB28132@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-22 14:27:29, Dan Murphy wrote:
> Add the LM36274 backlight driver with regulator support.
> This is a multi-function device for backlight applications.
>=20
> Backlight properties will be documented in it's a supplemental
> bindings document.
>=20
> Regulator support is documented in the regulator/lm363x-regulator.txt
>=20
> http://www.ti.com/lit/ds/symlink/lm36274.pdf
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzlva0ACgkQMOfwapXb+vLRMQCfUIG06GRH58hBGTFUDluaE1G5
jfEAn16m0pdjhyipbsCFd8H3Be4i/DqN
=HH1p
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
