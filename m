From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: Convert to using %pOFn instead of device_node.name
Date: Tue, 28 Aug 2018 13:37:43 +0200
Message-ID: <20180828113743.GA3328@amd>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-25-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828015252.28511-25-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-08-27 20:52:26, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>=20
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAluFNAcACgkQMOfwapXb+vICxQCfVJ56LGFu+PYja3Mejl10Xbf5
8p8An3jLaX5JpGYbi86Gy/hPaFNVDoHm
=WMsF
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
