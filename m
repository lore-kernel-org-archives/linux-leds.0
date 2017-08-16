From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Thu, 17 Aug 2017 00:30:22 +0200
Message-ID: <20170816223022.GA13540@amd>
References: <20170815213541.26985-1-me@paulo.costa.nom.br>
 <20170815223413.GA8886@amd>
 <CADbEYbk5US=SDpwPV8SLNsZMwrYgktPcXRp8RjYpm9+6iC8HAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35433 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752353AbdHPWaY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Aug 2017 18:30:24 -0400
Content-Disposition: inline
In-Reply-To: <CADbEYbk5US=SDpwPV8SLNsZMwrYgktPcXRp8RjYpm9+6iC8HAA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paulo Costa <me@paulo.costa.nom.br>
Cc: linux-leds@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-08-16 00:55:04, Paulo Costa wrote:
> > Hmm. Can we simply use blinking trigger to do that?
>=20
> To some extent...
>=20
> If you just want to have 50% brightness, set timeon=3D1, timeoff=3D1 and
> you are done.
>=20
> But, accurately seting the brightness to weird numbers is harder.
> E.g., To get 37% brightness your only chance is to set timeon=3D37,
> timeoff=3D63 (Or multiples of it).
>=20
> The larger delay causes very visible flickering, which sucks.

Well, to set 37% brightness you just set timeon=3D1 timeoff=3D2 ;-).

> This trigger uses error propagation to continously adjusts the delay,
> getting a higher blink frequency and accurate average brightness.
>=20
> E.g., For 37% it will alternate between 33% (timeon=3D1,timeoff=3D2) and
> 50% (timeon=3D1,timeoff=3D1)

Hmm, ok, clever.

> Unfortunately, it doesn't really help when the brightness is near 0%
> or near 100%.
> E.g., for 1% brightness, this trigger it is equivalent to
> timeon=3D1,timeoff=3D99 -- Flickering is very visible.

Hmm. You could do led=3Don, udelay(100), led=3Doff. Do that 100 times a
second, and I believe you'll get quite nice low levels.

Now... nice hack. Probably can be improved. But is it suitable for
mainline?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmUx34ACgkQMOfwapXb+vIpzACfU8TGoPftd10SvTi7tG8Fv4mB
CNIAoJLXwDQli+reJEwhhlphOZ+v6pFM
=SXKZ
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
