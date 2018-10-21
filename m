From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Sun, 21 Oct 2018 10:31:59 +0200
Message-ID: <20181021083159.GA7893@amd>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <CAHp75VcOxBFvr4MSd=y61t7eFAv=9pFzMsumd7=2jbW3aZ4O4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcOxBFvr4MSd=y61t7eFAv=9pFzMsumd7=2jbW3aZ4O4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dan O'Donovan <dan@emutex.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, carlos.iglesias@emutex.com, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2018-10-20 14:17:58, Andy Shevchenko wrote:
1;2802;0c> On Fri, Oct 19, 2018 at 8:27 PM Dan O'Donovan <dan@emutex.com> w=
rote:
> >
> > From: Javier Arteaga <javier@emutex.com>
> >
> > Allow userspace to use the on-board LEDs as "upboard:<color>:".
>=20
>=20
>=20
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/upboard.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/acpi.h>
>=20
> For better maintenance keep this ordered.

This is good as-is.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvMOX8ACgkQMOfwapXb+vJ5QACfcVC9dJE79Pdp2IXxB/lAt3IC
Za4Anjew84xudUHv++zcwxjD8P8dyTln
=efvM
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
