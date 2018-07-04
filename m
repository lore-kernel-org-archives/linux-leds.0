From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 23:21:19 +0200
Message-ID: <20180704212119.GA18063@amd>
References: <20180703155328.GA18299@arbeit>
 <20180704065305.GA23509@amd>
 <b10a8282-0297-8cd6-5d29-fb4adcf72366@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b10a8282-0297-8cd6-5d29-fb4adcf72366@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Andreas Klinger <ak@it-klinger.de>, ben.whitten@gmail.com, geert+renesas@glider.be, w@1wt.eu, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >LED pattern trigger should be merged, instead.
>=20
> We've already agreed in [0] upon pattern sysfs file, and related
> patch set [1] is just to be merged.
>=20
> [0] https://lkml.org/lkml/2018/5/12/142
> [1] https://patchwork.kernel.org/patch/10495595/

Well, [1] is for LEDs that can do patterns in hardware. I'm aware of
that work.

I still believe that we want to do "trigger" that can do the same on
hardware that is not so lucky.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAls9Ok8ACgkQMOfwapXb+vIDMwCguvk+PcxIkoANV0G9UBM42mZQ
vV4AnAivyw4C/MU/NEUKyDY4pFBe4dIr
=g1PS
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
