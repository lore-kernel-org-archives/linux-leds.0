From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Thu, 20 Dec 2018 10:06:12 +0100
Message-ID: <20181220090612.GA21972@amd>
References: <20181219162626.12297-3-dmurphy@ti.com>
 <20181219193455.GA21159@amd>
 <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
 <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <20181219220326.GA28244@amd>
 <a3214ab3-9281-19d6-7fcc-5abae9a60ebd@ti.com>
 <20181219222737.GB30496@amd>
 <d7edfd57-20df-bd83-b616-5b18e8bc2c64@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d7edfd57-20df-bd83-b616-5b18e8bc2c64@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Anyway, if your 36 channels can be set independently, I believe you
> > just want them to export as 36 LEDs.
>=20
> I am not sure that is what the "customers" would want to have to set 36 d=
ifferent nodes or even declare those 36 nodes.
> That is 36 independent user space to kernel space calls that are very exp=
ensive just to set a LED color and brightness.
>=20

No, 36 independend calls to kernel space are not that expensive.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwbW4QACgkQMOfwapXb+vIX5gCfbSoZAB6VrN4h8DnjYJr1VN0/
XJ0AoKGMJ00yzItHxFC4vtxppLvmclBq
=G+17
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
