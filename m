From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Mon, 12 Nov 2018 20:05:55 +0100
Message-ID: <20181112190554.GA13959@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd>
 <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd>
 <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
 <20181112103513.GB5695@amd>
 <662c02ba-455b-e2bf-a5e2-ae3933161894@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <662c02ba-455b-e2bf-a5e2-ae3933161894@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> My system looks like this:
> >>>
> >>> input16::capslock    tpacpi::bay_active    tpacpi::standby
> >>> input16::numlock     tpacpi::dock_active   tpacpi::thinklight
> >>> input16::scrolllock  tpacpi::dock_batt	      tpacpi::thinkvantage
> >>> input5::capslock     tpacpi::dock_status1  tpacpi::unknown_led
> >>> input5::numlock      tpacpi::dock_status2  tpacpi::unknown_led2
> >>> input5::scrolllock   tpacpi:green:batt	      tpacpi::unknown_led3

> > But it is not just for backwards compatibility. See my examples above,
> > it is needed to tell which device the LED is asociated with, and it is
> > absolutely required for USB devices (for example).
>=20
> For USB devices there is already ledtrig-usbport available, which
> provides sysfs interface for defining and reading the usb ports,
> the status of which the LED indicates. Since the USB devices can be
> attached/removed dynamically, it would be impossible to reflect
> the associations in the LED class device name.

I'm not talking USB activity. I'm talking USB devices with LEDs on
them, like for example keyboards.

Please take a look at example above. input16::numlock ;
input5::numlock . You absolutely need device part.

> > And even for "embedded" stuff like routers, we want eth0:green:link,
> > eth0:yellow:activity and not some kind of hack.
>=20
> eth0 is not something you can be certain of at the stage of defining DT
> node.

In the common case DT is used for, yes, you can, because whole system
is in one box.

(And really DT does not matter. We are talking kernel <-> user
interface here).

> > Ideally, colors would come from fixed list, functions would come from
> > fixed list, and device part would come from name used elsewhere in the
> > kernel.
> >=20
> > (And yes, it probably means we should have something in device tree to
> > link LED to its device. device =3D "name" would be good start...)
>=20
> Why would you need such link?

Because userspace needs that information?

Say you have raid array, with "error" leds for each drive (your list
already contains "hdderr"). Now userland detects problem with hdparm
on /dev/sdi. It would like to turn on corresponding LED.

How do you propose we do that?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvpzxIACgkQMOfwapXb+vKHRwCfULNoqi7nqurfv2LaLbnmDUNJ
QK0AoKtEbe3EnDfkz6s6KDONqzCSTxz7
=PU0k
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
