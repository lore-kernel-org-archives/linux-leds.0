From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Fri, 26 Apr 2019 23:42:46 +0200
Message-ID: <20190426214246.GA24966@amd>
References: <20190426123513.GA18172@amd>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8697371477894435697=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190426123513.GA18172@amd>
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


--===============8697371477894435697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Kernel 5.1.0-rc1 + some unrelated bits.

I tried adding
https://marc.info/?l=3Dlinux-kernel&m=3D151622365715313&q=3Draw as Jacek
suggested, and it is still broken.

Test code is this: ledtest actually works as expected on first try,
but keeps blinking on second run. Strange.

								Pavel

#!/usr/bin/python
# -*- python -*-
# Copyright Bluez project, GPLv2
# Adapted from test/monitor-bluetooth

=66rom __future__ import absolute_import, print_function, unicode_literals

import sys
import time
import os

import dbus
import dbus.mainloop.glib
try:
  from gi.repository import GObject
except ImportError:
  import gobject as GObject

relevant_ifaces =3D [ "org.bluez.Device1" ]

class LED:
	def __init__(self):
        	self.path =3D "/sys/class/leds/tpacpi::power/"
        	#self.path =3D "/sys/class/leds/input5::capslock/"
                self.brightness =3D self.path + "brightness"
                self.trigger =3D self.path + "trigger"

        def set(self, name, val):
        	f =3D open(name, "w")
                f.write(val)
                f.close()

        def solid(self, b):
        	self.set(self.trigger, "none")
        	self.set(self.brightness, "0")
        	self.set(self.brightness, str(b))

        def blink(self):
        	self.set(self.trigger, "timer")

        def as_root(self):
        	os.chmod(self.trigger, 0777)
        	os.chmod(self.brightness, 0777)

def led_test():
	l =3D LED()
        l.solid(0)
        time.sleep(2)
	l.solid(1)
        time.sleep(2)
        l.blink()
        time.sleep(2)
	l.solid(1)

def handle_params(args):
        if len(args) < 2 or args[1] =3D=3D "run":
                LED().blink()
        	run()
                return
        if args[1] =3D=3D "ledtest":
        	led_test()
                return
        if args[1] =3D=3D "stop":
                LED().solid(0)
        if args[1] =3D=3D "startup":
        	LED().as_root()
                return

        print("Unknown parameters", args)

handle_params(sys.argv)




--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzDe1YACgkQMOfwapXb+vLpkwCeMc4XkJPQlhoYAiu2M2NAtZ0A
SOIAoIOOCQshxvhjWlj520VLZ2mNAJUV
=PP1+
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


--===============8697371477894435697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8697371477894435697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============8697371477894435697==--
