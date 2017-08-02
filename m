From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/4] leds: pca955x: add GPIO support
Date: Wed, 2 Aug 2017 13:33:51 +0200
Message-ID: <20170802113351.GA2528@amd>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51407 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752305AbdHBLdx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2017 07:33:53 -0400
Content-Disposition: inline
In-Reply-To: <1501589349-5681-1-git-send-email-clg@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The PCA955x family of chips are I2C LED blinkers whose pins not used
> to control LEDs can be used as general purpose I/Os (GPIOs).
>=20
> The following adds support for device tree and Open Firmware to be
> able do define different operation modes for each pin. See bindings
> documentation for more details. The pca955x driver is then extended
> with a gpio_chip when pins are operating in GPIO mode.
>=20
> The driver follows the scheme of the leds-pca9532 driver which behaves
> quite similarly.

Is there reason not to treat pca955x chip as a GPIO extender, and then
use leds-gpio on top?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmBuJ8ACgkQMOfwapXb+vKZ1QCguQfBP/wRRWye2ZrEYS7JlV5q
U7QAoIXZcTddJdKZZfVpnOL2+0G+qW7S
=SrYk
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
