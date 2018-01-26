From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 22:32:39 +0100
Message-ID: <20180126213238.GA10985@amd>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <20180126102507.GA13775@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33261 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752178AbeAZVcl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jan 2018 16:32:41 -0500
Content-Disposition: inline
In-Reply-To: <20180126102507.GA13775@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, sakari.ailus@iki.fi


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-01-26 11:25:07, Pavel Machek wrote:
> On Fri 2018-01-26 09:38:28, Andy Shevchenko wrote:
> > LM3555 is supported by AS3645A.
> > Clarify this in Kconfig by referencing to AS3645A.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/leds/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)

Actually, what about this?

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 318a28f..2acf864 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -69,7 +69,7 @@ config LEDS_APU
 	  module will be called leds-apu.
=20
 config LEDS_AS3645A
-	tristate "AS3645A LED flash controller support"
+	tristate "AS3645A and LM3555 LED flash controller support"
 	depends on I2C && LEDS_CLASS_FLASH
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	help
@@ -587,12 +587,12 @@ config LEDS_MAX8997
 	  MAXIM MAX8997 PMIC.
=20
 config LEDS_LM355x
-	tristate "LED support for LM355x Chips, LM3554 and LM3556"
+	tristate "LED support for LM3554 and LM3556 chips"
 	depends on LEDS_CLASS && I2C
 	select REGMAP_I2C
 	help
-	  This option enables support for LEDs connected to LM355x.
-	  LM355x includes Torch, Flash and Indicator functions.
+	  This option enables support for LEDs connected to LM3554
+	  and lM3556. It includes Torch, Flash and Indicator functions.
=20
 config LEDS_OT200
 	tristate "LED support for the Bachmann OT200"






--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlprnnYACgkQMOfwapXb+vIYUwCgh3iP/YCDhpXfw1ap499h9jPQ
54oAnRhQii60OOj+xUWv94Za9Sh1Xd+V
=YJRW
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
