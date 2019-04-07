From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 2/3] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Mon, 8 Apr 2019 00:18:46 +0200
Message-ID: <20190407221846.GB6327@amd>
References: <20190404171007.160878-1-ncrews@chromium.org>
 <20190404171007.160878-2-ncrews@chromium.org>
 <20190405201534.GA4426@roeck-us.net>
 <20190406084157.GA27043@amd>
 <CAE_wzQ9WG1+K1ZzVoii8ukDe_g+4Ha0bh6YvsRhceinwPjC+Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE_wzQ9WG1+K1ZzVoii8ukDe_g+4Ha0bh6YvsRhceinwPjC+Kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Nick Crews <ncrews@chromium.org>, enric.balletbo@collabora.com, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, alexandre.belloni@bootlin.com, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, dlaurie@chromium.org, sjg@google.com, Guenter Roeck <groeck@google.com>
List-Id: linux-leds@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > This document also states "The naming scheme above leaves scope
> > > for further attributes should they be needed". It does not permit,
> > > however, to redefine one of the fields to mean "location", much less
> > > the declaration that a devicename of "platform" shall refer to an
> > > "internal" backlight, or that there shall be no more than one
> > > "internal" backlight in a given system.
> >
> > "platform" is as good devicename as "wilco" or "chromeos".
>=20
> No, because "platform" is not a device, it is something that you are
> trying to assign a magic meaning to.

"chromeos" is not a device, either.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyqd0YACgkQMOfwapXb+vLtYwCdGp9/oNzPX4vOhq2Yzpll0S50
mmcAnirJtJ2D5e4gsKwodYatGCp+mInX
=DsRh
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
