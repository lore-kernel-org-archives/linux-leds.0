From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/3] as3645a: Use ams,input-max-microamp as documented in
 DT bindings
Date: Fri, 8 Sep 2017 15:14:46 +0200
Message-ID: <20170908131446.GP18365@amd>
References: <20170908124213.18904-1-sakari.ailus@linux.intel.com>
 <20170908124213.18904-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1BKOZKwX7DAU5odC"
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170908124213.18904-2-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--1BKOZKwX7DAU5odC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-09-08 15:42:11, Sakari Ailus wrote:
> DT bindings document the property "ams,input-max-microamp" that limits the
> chip's maximum input current. The driver and the DTS however used
> "peak-current-limit" property. Fix this by using the property documented
> in DT binding documentation.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1BKOZKwX7DAU5odC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmyl8YACgkQMOfwapXb+vLVdgCgiln3J3aNM5Q3QjTZyMgLyXcL
mVcAnR2KFrhC3QzUMquZthXFgPhrV3dx
=pSsB
-----END PGP SIGNATURE-----

--1BKOZKwX7DAU5odC--
