From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Fri, 4 Jan 2019 21:12:56 +0100
Message-ID: <20190104201256.GA2931@amd>
References: <8740cfd6-a6b5-ad27-313b-984a9febf18a@ti.com>
 <20181219201047.GA23448@amd>
 <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
 <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
 <7f205102-e854-f1cb-cc03-1307d1cddc87@gmail.com>
 <c9f8965a-90f4-b456-8225-c70694c9f071@gmail.com>
 <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Vesa =?iso-8859-1?B?SuTkc2tlbORpbmVu?= <dachaac@gmail.com>, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >I suppose if one would just make it an array of values (separated by
> >space) and then one file with string array of color element names and on
> >file with maximum value array it could be within those words.
> >
> >The it would be something like:
> >
> >$ echo "23 54 32" > color
>=20
> Go ahead, but first convince Pavel, and then Greg :-)
>=20
> I'd personally would not have much against, especially that the
> list of values will not grow for that one like in case of old patch set
> [0] where Pavel and Greg thwarted my similar attempt.

Oh, you can get this past Pavel (and probably Greg) -- if you have a
good reason. Performance is _not_ a good reason. You don't need to
change LED color 50000 times a second.

If you can demonstrate a reasonable design, where user selects color
=66rom well-known RGB pallete and either kernel or library+kernel acts
to set that color on the LED, we can talk.

When user asks for white, it has to be white. Exact color temperature
does not matter. When user asks for pink, it has to be pink. Again,
exact color does not matter; different monitors display slightly
different colors, too.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwvvkgACgkQMOfwapXb+vLC5gCeJzY/t2GKL7z2FxsIPH/gnKYJ
obgAn0oHvXGS41dRhGdbciUlflxl8+Rr
=ywxG
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
