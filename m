From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] cleanup LED documentation and make it match reality
Date: Mon, 3 Oct 2016 10:10:50 +0200
Message-ID: <20161003081049.GA12419@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: j.anaszewski@samsung.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>
List-Id: linux-leds@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


sysfs-class-led fails to mention some important details. Also fix led
vs LED and english.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -4,16 +4,25 @@ KernelVersion:	2.6.17
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Set the brightness of the LED. Most LEDs don't
-		have hardware brightness support so will just be turned on for
+		have hardware brightness support, so will just be turned on for
 		non-zero brightness settings. The value is between 0 and
 		/sys/class/leds/<led>/max_brightness.
=20
+		Writing 0 to this file clears active trigger.
+
+		Writing non-zero to this file while trigger is active changes the
+		top brightness trigger is going to use.
+	=09
+
 What:		/sys/class/leds/<led>/max_brightness
 Date:		March 2006
 KernelVersion:	2.6.17
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
-		Maximum brightness level for this led, default is 255 (LED_FULL).
+		Maximum brightness level for this LED, default is 255 (LED_FULL).
+
+		If the LED does not support different brightness levels, this
+		should be 1.
=20
 What:		/sys/class/leds/<led>/trigger
 Date:		March 2006
@@ -21,7 +30,7 @@ KernelVersion:	2.6.17
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Set the trigger for this LED. A trigger is a kernel based source
-		of led events.
+		of LED events.
 		You can change triggers in a similar manner to the way an IO
 		scheduler is chosen. Trigger specific parameters can appear in
 		/sys/class/leds/<led> once a given trigger is selected.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfyEokACgkQMOfwapXb+vJkUgCgs4DR7zW+Cfa9MZvZcYYxzwwi
otMAmwWfY9qKP50JWan0cSBcRNKrHL0u
=4SbV
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
