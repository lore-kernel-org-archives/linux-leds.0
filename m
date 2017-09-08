From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] media: leds: as3645a: add V4L2_FLASH_LED_CLASS
 depdendency
Date: Fri, 8 Sep 2017 14:35:13 +0200
Message-ID: <20170908123513.GM18365@amd>
References: <20170905071345.3807685-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3FyYKcuUbgqNYeqV"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40442 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754713AbdIHMfO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Sep 2017 08:35:14 -0400
Content-Disposition: inline
In-Reply-To: <20170905071345.3807685-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--3FyYKcuUbgqNYeqV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-09-05 09:13:20, Arnd Bergmann wrote:
> We get a link error when V4L2_FLASH_LED_CLASS=3Dm and AS3645A is built-in:
>=20
> drivers/leds/leds-as3645a.o: In function `as3645a_v4l2_setup':
> leds-as3645a.c:(.text+0x258): undefined reference to `v4l2_flash_init'
> leds-as3645a.c:(.text+0x284): undefined reference to `v4l2_flash_indicato=
r_init'
> leds-as3645a.c:(.text+0x2a4): undefined reference to `v4l2_flash_release'
> drivers/leds/leds-as3645a.o: In function `as3645a_remove':
> leds-as3645a.c:(.text+0x784): undefined reference to `v4l2_flash_release'
>=20
> This adds the same Kconfig dependency that the other V4L2 flash
> drivers in drivers/leds use, to avoid that broken configuration.
>=20
> Fixes: a56ba8fbcb55 ("media: leds: as3645a: Add LED flash class driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3FyYKcuUbgqNYeqV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmyjoEACgkQMOfwapXb+vIb2ACfYo10uOC1BPbHjDgt5+efk/5D
thcAn27J8L9HwfrGZ+46Aqxh6aYIq/ei
=D8rt
-----END PGP SIGNATURE-----

--3FyYKcuUbgqNYeqV--
