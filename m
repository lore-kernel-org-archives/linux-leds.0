From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2] leds: Clarify supported chips by LM355x driver
Date: Thu, 1 Feb 2018 21:26:34 +0100
Message-ID: <20180201202634.GA29617@amd>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
 <1517149809.7000.1288.camel@linux.intel.com>
 <5968dfb2-8bf9-917f-4299-47bf1cd97124@gmail.com>
 <1517310500.7000.1319.camel@linux.intel.com>
 <15971fbb-2c6d-5c15-d5d7-1718af904ebb@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59508 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754954AbeBAU0g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Feb 2018 15:26:36 -0500
Content-Disposition: inline
In-Reply-To: <15971fbb-2c6d-5c15-d5d7-1718af904ebb@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Clarify which controllers are supported by which driver.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 318a28f..9a538de 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -69,7 +69,7 @@ config LEDS_APU
 	  module will be called leds-apu.
=20
 config LEDS_AS3645A
-	tristate "AS3645A LED flash controller support"
+	tristate "AS3645A and LM3555 LED flash controllers support"
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
+	  and LM3556. It includes Torch, Flash and Indicator functions.
=20
 config LEDS_OT200
 	tristate "LED support for the Bachmann OT200"

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpzd/oACgkQMOfwapXb+vKNmQCfX71sdM9ZFqvDu8MrMuvXMXyJ
uSoAn0nlBrOLIUWCBje21mpdxn/tpx++
=mlvi
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
