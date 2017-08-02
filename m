From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/4] leds: pca955x: add GPIO support
Date: Wed, 2 Aug 2017 14:48:44 +0200
Message-ID: <20170802124844.GA3123@amd>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
 <20170802113351.GA2528@amd>
 <dad22552-3314-c315-a3c5-89e6718230b0@kaod.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53617 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbdHBMsr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2017 08:48:47 -0400
Content-Disposition: inline
In-Reply-To: <dad22552-3314-c315-a3c5-89e6718230b0@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-08-02 13:57:29, C=E9dric Le Goater wrote:
> On 08/02/2017 01:33 PM, Pavel Machek wrote:
> > Hi!
> >=20
> >> The PCA955x family of chips are I2C LED blinkers whose pins not used
> >> to control LEDs can be used as general purpose I/Os (GPIOs).
> >>
> >> The following adds support for device tree and Open Firmware to be
> >> able do define different operation modes for each pin. See bindings
> >> documentation for more details. The pca955x driver is then extended
> >> with a gpio_chip when pins are operating in GPIO mode.
> >>
> >> The driver follows the scheme of the leds-pca9532 driver which behaves
> >> quite similarly.
> >=20
> > Is there reason not to treat pca955x chip as a GPIO extender, and then
> > use leds-gpio on top?
>=20
> I would say mostly because there is already a leds-pca955x driver and
> that the primary nature of the chip is being a LED blinker. It also=20
> supports different blinking rates.

Ok, I guess gpio-led driver can not to blinking, so this makes sense.

      	    	     	    	       		    	       Pavel
							      =20
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmByiwACgkQMOfwapXb+vL7HwCfcI4EiMeNtiQvqeF4Zu3lIVHk
94kAoK4bpMn5s1wLxikE9elBVjxlIbtj
=YiFS
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
