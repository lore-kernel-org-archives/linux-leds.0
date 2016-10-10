From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Mon, 10 Oct 2016 16:25:05 +0200
Message-ID: <20161010142505.GA26643@amd>
References: <20160825080546.27182-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160825080546.27182-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This commit adds a new trigger responsible for turning on LED when USB
> device gets connected to the specified USB port. This can can useful for
> various home routers that have USB port(s) and a proper LED telling user
> a device is connected.
>=20
> The trigger gets its documentation file but basically it just requires
> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
>=20
> During work on this trigger there was a plan to add DT bindings for it,
> but there wasn't an agreement on the format yet. This can be worked on
> later, a sysfs interface is needed anyway for platforms not using DT.
>=20
> Another planned feature is support for LED reacting to the USB activity.
> This can be implemented with another sysfs file for setting mode. The
> default mode wouldn't change so there won't be ABI breakage and such
> feature can be safely implemented later.

Actually... USB device plugs/unplugs are pretty rare events... Can we
just do this in userspace using udevd?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlf7pMEACgkQMOfwapXb+vIH8ACfa357E2gtYMdSf0iM82ireXjJ
riYAn19VCz5lSQddAJ1uts/QD+/jjTh1
=9rxm
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
