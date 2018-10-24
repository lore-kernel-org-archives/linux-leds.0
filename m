From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 2/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Wed, 24 Oct 2018 15:43:24 +0200
Message-ID: <20181024134324.GA12125@amd>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-2-dmurphy@ti.com>
 <20181024090421.GB24997@amd>
 <e8800c2e-8ada-7a0d-c1a6-14ddcbe1576d@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e8800c2e-8ada-7a0d-c1a6-14ddcbe1576d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> The LM3697 is a single function LED driver. The single function LED
> >> driver needs to reside in the LED directory as a dedicated LED driver
> >> and not as a MFD device.  The device does have common brightness and r=
amp
> >=20
> > So it is single function LED driver. That does not mean it can not
> > share bindings with the rest. Where the bindings live is not imporant.
>=20
> It can share bindings that are correctly done, not ones that are incomple=
te and incorrect.

If you see wrong binding you are welcome to fix it. If it is in wrong
place, you can move it around.

You are not welcome to create 2 "fixed" versions, while leaving
original "buggy" version in tree!

=2E..but that's what your series does. Better changelogs will _not_ help.

> Where bindings live is important to new Linux kernel developers and produ=
ct=20
> developers looking for the proper documentation on the H/W bindings.

We have talked about this before.

> >> @@ -9,7 +9,6 @@ TI LMU driver supports lighting devices below.
> >>    LM3632       Backlight and regulator
> >>    LM3633       Backlight, LED and fault monitor
> >>    LM3695       Backlight
> >> -  LM3697       Backlight and fault monitor
> >> =20
> >>  Required properties:
> >>    - compatible: Should be one of:
> >=20
> > NAK. You can use existing binding.
>=20
> Thank you for the consistency

You are wasting your time. What is worse, you are wasting my time,
too, and time of people on the list.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvQdvwACgkQMOfwapXb+vKIVQCdHKRZaUqDYczyawaKzJ6Jh/hc
RhAAni+U1fIHCxm+J71dz9ORidtXH868
=cFuT
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
