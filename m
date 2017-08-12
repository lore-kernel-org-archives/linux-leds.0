From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 12:56:20 +0200
Message-ID: <20170812105620.GA23543@amd>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
 <20170812093024.GA21428@amd>
 <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58186 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdHLK4W (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Aug 2017 06:56:22 -0400
Content-Disposition: inline
In-Reply-To: <83fdd755-c978-079c-32c0-9b1ab7fa0039@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: linux-leds@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
> >> This patch adds a LED class driver for the RGB LEDs found on
> >> the Crane Merchandising System CR0014114 LEDs board.
> >=20
> > What kind of hardware is this?=20
>=20
> It's from vending machines produced by Crane Merchandising System http://=
cranems.com/
> =20
> >> Driver creates LED devices with name written using the following
> >> pattern "LABEL-{N}:{red,green,blue}:".
> >=20
> > Is the "-{N} suffix needed?
>=20
> It's number of RGB LED, board has 6 LEDs.

Normally label differentiates them...?

> > How special hardware is this? Does it make sense to ask this question
> > for x86 users, for example?
>=20
> I think it's possible to connect it to x86 hardware, but I don't try it.
> Board need not only SPI connection, but good power supply.

Aha, ok.

> >> +/* CR0014114 SPI commands */
> >> +#define CR0014114_SET_BRIGHTNESS	0x80
> >> +#define CR0014114_INIT_REENUMERATE	0x81
> >> +#define CR0014114_NEXT_REENUMERATE	0x82
> >=20
> > can we s/cr0014114/cr00/g, or something? There are local to the
> > module, so they can be shorter...
>=20
> Sure, may be CMD_SET_BRIGHTNESS

Please do the replace for all static symbols.> >> +fail:

> >> +	while (i--)
> >> +		led_classdev_unregister(&priv->leds[i].ldev);
> >=20
> > Can devm_* be used to simplify this?
>=20
> I think no, because it will cause race condition.

Please take a look at devm_led_classdev_register() and friends. It
should be possible to simplify code without races.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmO3tQACgkQMOfwapXb+vLqMgCcDJsJ2LJHSrHBh/a9lXCb4j5L
cIYAoKNE6lGY414GJJn0Cxui4B+Z6Rh2
=p/s9
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
