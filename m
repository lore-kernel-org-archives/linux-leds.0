From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Wed, 25 Apr 2018 09:04:05 +0200
Message-ID: <20180425070405.GA14812@amd>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
 <20180425064133.GC5352@amd>
 <20180425070227.exixjo64spvt36vo@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425070227.exixjo64spvt36vo@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > If it is single bit, max_brightness should be one, and !=3D LED_OFF test
> > should not be needed.
>=20
> Got it. Will do for v2.

Good, you can add

Acked-by: Pavel Machek <pavel@ucw.cz>

for the v2.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrgKGUACgkQMOfwapXb+vJa0QCcDZ6hrzV/KPjfZ5qINA6vGjkE
IkIAmQEjRa7yoPt6+B3cCIPvum7ed92j
=DB99
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
