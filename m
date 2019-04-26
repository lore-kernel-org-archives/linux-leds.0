From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Thinkpad ACPI led -- it keeps blinking
Date: Fri, 26 Apr 2019 14:35:13 +0200
Message-ID: <20190426123513.GA18172@amd>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5079868255258339490=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--===============5079868255258339490==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Something is wrong with blinking on thinkpad

pavel@amd:~/bt/blee$ cat /sys/class/leds/tpacpi\:\:power/trigger
[none] bluetooth-power rfkill-any rfkill-none kbd-scrolllock
kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock
kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock
kbd-ctrlrlock AC-online BAT0-charging-or-full BAT0-charging BAT0-full
BAT0-charging-blink-full-solid rfkill0 phy0rx phy0tx phy0assoc
phy0radio phy0tpt mmc0 timer heartbeat audio-mute audio-micmute
rfkill1 hci0-power rfkill5
pavel@amd:~/bt/blee$ echo 1 >
/sys/class/leds/tpacpi\:\:power/brightness
pavel@amd:~/bt/blee$ echo 0 >
/sys/class/leds/tpacpi\:\:power/brightness
pavel@amd:~/bt/blee$

Trigger indicates "none" but it keeps blinking, until I echo 0 >
brightness to stop it. I have python script to trigger this
behaviour... it seems to work from shell.

It behaves strangely. If I ask for blinking twice, it stops blinking
on second request.

pavel@amd:~/bt/blee$ echo timer >
/sys/class/leds/tpacpi\:\:power/trigger
pavel@amd:~/bt/blee$ echo timer >
/sys/class/leds/tpacpi\:\:power/trigger

echoing none fixes it.=20

Kernel 5.1.0-rc1 + some unrelated bits.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzC+wEACgkQMOfwapXb+vK6IQCgkrnOOiwQBWd6TqolHFla/r8f
PR4AoK243I1FDg66AYyy6UxsiPtNAmHg
=S2Ah
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--


--===============5079868255258339490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5079868255258339490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============5079868255258339490==--
