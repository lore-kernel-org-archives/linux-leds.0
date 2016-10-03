From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] leds/leds-lp5523.txt: make documentation match reality
Date: Mon, 3 Oct 2016 10:42:01 +0200
Message-ID: <20161003084201.GA2685@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:49448 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbcJCImH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 04:42:07 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, trivial@kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Files are visible all the time, so remove incorrect notes.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

index 0dbbd27..0961a06 100644
--- a/Documentation/leds/leds-lp5523.txt
+++ b/Documentation/leds/leds-lp5523.txt
@@ -34,8 +34,8 @@ There are two ways to run LED patterns.
   Control interface for the engines:
   x is 1 .. 3
   enginex_mode : disabled, load, run
-  enginex_load : microcode load (visible only in load mode)
-  enginex_leds : led mux control (visible only in load mode)
+  enginex_load : microcode load
+  enginex_leds : led mux control
=20
   cd /sys/class/leds/lp5523:channel2/device
   echo "load" > engine3_mode

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyGdkACgkQMOfwapXb+vIJLACdFa9EZ0XLhFMw/REgQ5ej7NHj
UO4An0g828XSWxSwnibXUKexXdetIgwF
=WVOB
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
