From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Wed, 9 Jan 2019 16:39:46 +0100
Message-ID: <20190109153946.GA5938@amd>
References: <1547045089-19128-1-git-send-email-krzk@kernel.org>
 <1547045089-19128-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547045089-19128-3-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-01-09 15:44:46, Krzysztof Kozlowski wrote:
> Multiple LED triggers might need to access default pattern so add a
> helper for that.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlw2FcIACgkQMOfwapXb+vJBOACgkCpcsS9eqDCeVHHB8Nis+xUN
V3wAn3jeU1LepYCnYHirxGUMD8Kq3s6C
=yFfp
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
