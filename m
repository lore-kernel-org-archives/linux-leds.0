From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 5/5] leds: lm36274: Introduce the TI LM36274 LED driver
Date: Thu, 6 Jun 2019 12:07:59 +0200
Message-ID: <20190606100759.GB1825@amd>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-6-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-6-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-06-05 07:56:34, Dan Murphy wrote:
> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
> MFD driver to probe this LED driver.  The driver configures only the
> LED registers and enables the outputs according to the config file.
>=20
> The driver utilizes the TI LMU (Lighting Management Unit) LED common
> framework to set the brightness bits.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Actually, one more thing. Not too important, but.. how did Jacek's
signoff get there? He should add his signoff when he applies it to the
git...

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz45f8ACgkQMOfwapXb+vKL+gCeMex2PG2Uitc6YIKYv/eT33nC
btgAmwXJiiYzEKZ+X1ldCmbovfr8/JtA
=dGFR
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
