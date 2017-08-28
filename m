From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] Documentation: small fixes for LEDs, hide notes about
 vibration
Date: Mon, 28 Aug 2017 11:50:52 +0200
Message-ID: <20170828095051.GA19930@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, Andrew Morton <akpm@osdl.org>, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Spell "LED" consistently with uppercase.

We do not want people to use LED subsystem for vibrations; there's
already support for that in input subsystem. Remove notes about
vibrations not to confuse people.

Signed-off-by: Pavel Machek <pavel@ucw.cz>


diff --git a/Documentation/leds/ledtrig-transient.txt b/Documentation/leds/=
ledtrig-transient.txt
index 3bd38b4..f412603 100644
--- a/Documentation/leds/ledtrig-transient.txt
+++ b/Documentation/leds/ledtrig-transient.txt
@@ -1,7 +1,7 @@
 LED Transient Trigger
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The leds timer trigger does not currently have an interface to activate
+The LED timer trigger does not currently have an interface to activate
 a one shot timer. The current support allows for setting two timers, one f=
or
 specifying how long a state to be on, and the second for how long the state
 to be off. The delay_on value specifies the time period an LED should stay
@@ -16,17 +16,11 @@ set a timer to hold a state, however when user space ap=
plication crashes or
 goes away without deactivating the timer, the hardware will be left in that
 state permanently.
=20
-As a specific example of this use-case, let's look at vibrate feature on
-phones. Vibrate function on phones is implemented using PWM pins on SoC or
-PMIC. There is a need to activate one shot timer to control the vibrate
-feature, to prevent user space crashes leaving the phone in vibrate mode
-permanently causing the battery to drain.
-
 Transient trigger addresses the need for one shot timer activation. The
-transient trigger can be enabled and disabled just like the other leds
+transient trigger can be enabled and disabled just like the other LED
 triggers.
=20
-When an led class device driver registers itself, it can specify all leds
+When an LED class device driver registers itself, it can specify all LED
 triggers it supports and a default trigger. During registration, activation
 routine for the default trigger gets called. During registration of an led
 class device, the LED state does not change.
@@ -42,12 +36,12 @@ that are active at the time driver gets suspended, cont=
inue to run, without
 being able to actually change the LED state. Once driver is resumed, trigg=
ers
 start functioning again.
=20
-LED state changes are controlled using brightness which is a common led
+LED state changes are controlled using brightness which is a common LED
 class device property. When brightness is set to 0 from user space via
 echo 0 > brightness, it will result in deactivating the current trigger.
=20
 Transient trigger uses standard register and unregister interfaces. During
-trigger registration, for each led class device that specifies this trigger
+trigger registration, for each LED class device that specifies this trigger
 as its default trigger, trigger activation routine will get called. During
 registration, the LED state does not change, unless there is another trigg=
er
 active, in which case LED state changes to LED_OFF.
@@ -56,12 +50,12 @@ During trigger unregistration, LED state gets changed t=
o LED_OFF.
=20
 Transient trigger activation routine doesn't change the LED state. It
 creates its properties and does its initialization. Transient trigger
-deactivation routine, will cancel any timer that is active before it cleans
+deactivation routine will cancel any timer that is active before it cleans
 up and removes the properties it created. It will restore the LED state to
 non-transient state. When driver gets suspended, irrespective of the trans=
ient
 state, the LED state changes to LED_OFF.
=20
-Transient trigger can be enabled and disabled from user space on led class
+Transient trigger can be enabled and disabled from user space on LED class
 devices, that support this trigger as shown below:
=20
 echo transient > trigger
@@ -144,7 +138,6 @@ repeat the following step as needed:
 	echo none > trigger
=20
 This trigger is intended to be used for for the following example use case=
s:
- - Control of vibrate (phones, tablets etc.) hardware by user space app.
  - Use of LED by user space app as activity indicator.
  - Use of LED by user space app as a kind of watchdog indicator -- as
        long as the app is alive, it can keep the LED illuminated, if it di=
es

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj53sACgkQMOfwapXb+vJ2YACcCgbbqUzypB3IPjZ6zpuEoTUU
LCAAoJen3uzGzFvlA7ZjsfxQIK8/YCsR
=BU14
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
