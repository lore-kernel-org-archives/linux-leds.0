From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/3] backlight: lm3630a: add device tree supprt
Date: Tue, 2 Apr 2019 18:45:33 +0200
Message-ID: <20190402164533.GA21197@amd>
References: <20190401103034.21062-1-masneyb@onstation.org>
 <20190401103034.21062-4-masneyb@onstation.org>
 <7bcd94ee-a4f8-c91b-697d-cc4c6337ec88@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7bcd94ee-a4f8-c91b-697d-cc4c6337ec88@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org, jacek.anaszewski@gmail.com, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, jonathan@marek.ca
List-Id: linux-leds@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-04-02 08:45:40, Dan Murphy wrote:
> Hello
>=20
> On 4/1/19 5:30 AM, Brian Masney wrote:
> > Add device tree support to the lm3630a driver and allow configuring
> > independently on both banks the mapping mode (linear or exponential),
> > initial and maximum LED brightness.
> >=20
> > Driver was tested on a LG Nexus 5 (hammerhead) phone.
> >=20
>=20
> Don't need this in the commit message.

Actually yes, we want that in commit message.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyjka0ACgkQMOfwapXb+vJlLQCfb+QClcjkBs0Gz/ZOrNVc67Ym
Q5AAn2zrd/Y8a0Olh+hEaIMAtfAIiIRx
=/PdP
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
