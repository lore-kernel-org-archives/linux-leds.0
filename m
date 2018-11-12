From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Mon, 12 Nov 2018 11:35:13 +0100
Message-ID: <20181112103513.GB5695@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd>
 <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
 <20181111201605.GA20160@amd>
 <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57b77d4e-39a0-aaf2-5952-c2c25dc58593@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> It's overcomplicating the naming again. In every case you can tweak
> >> the function name to eth0_link, eth1_link etc.
> >=20
> > Well, but in such case it would be good to keep existing scheme.
> >=20
> > My system looks like this:
> >=20
> > input16::capslock    tpacpi::bay_active    tpacpi::standby
> > input16::numlock     tpacpi::dock_active   tpacpi::thinklight
> > input16::scrolllock  tpacpi::dock_batt	      tpacpi::thinkvantage
> > input5::capslock     tpacpi::dock_status1  tpacpi::unknown_led
> > input5::numlock      tpacpi::dock_status2  tpacpi::unknown_led2
> > input5::scrolllock   tpacpi:green:batt	      tpacpi::unknown_led3
> >=20
> > I agree that we should get rid of "tpacpi:" part in some cases. But
> > it does not make sense to get rid of "input16:" part -- it tells you
> > if the LED is on USB or on built-in keyboard.
> >=20
> > Ideally, tpacpi::thinklight would be input5::frontlight (as it is
> > frontlight for the keyboard).
> >=20
> > Yes we should simplify, but it still needs to work in all cases.
>=20
> Well, label is not being removed. You still can use it an the old
> fashion, even when using new led_compose_name().
>=20
> Maybe removing the description of the old LED naming from
> Documentation/leds/leds-class.txt was too drastic move.
> I'll keep it next to the new one, and only add a note that
> it is kept only for backwards compatibility.

I agree that removing it is "just too drastic".

But it is not just for backwards compatibility. See my examples above,
it is needed to tell which device the LED is asociated with, and it is
absolutely required for USB devices (for example).

And even for "embedded" stuff like routers, we want eth0:green:link,
eth0:yellow:activity and not some kind of hack.

Ideally, colors would come from fixed list, functions would come from
fixed list, and device part would come from name used elsewhere in the
kernel.

(And yes, it probably means we should have something in device tree to
link LED to its device. device =3D "name" would be good start...)

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvpV2EACgkQMOfwapXb+vJHygCfZngO0ozX1gBL+B+xCkXI/KeM
YvwAoJQTbDB5UxyDTDl2rTh8xZe+Unvn
=WFvx
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
