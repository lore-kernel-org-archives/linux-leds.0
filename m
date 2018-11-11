From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 01/24] leds: class: Improve LED and LED flash class
 registration API
Date: Sun, 11 Nov 2018 12:31:37 +0100
Message-ID: <20181111113137.GJ27666@amd>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-2-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541542052-10081-2-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org


--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-11-06 23:07:09, Jacek Anaszewski wrote:
> Replace of_led_classdev_register() with led_classdev_register_ext(), which
> accepts easily extendable struct led_init_data, instead of the fixed
> struct device_node argument. The latter can be now passed in a fwnode
> property of the struct led_init_data.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>

With Baolin's comments addressed:

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvoExkACgkQMOfwapXb+vLz0wCcD5nKabVm5lzed0fLSIVD0rn9
zeUAnRuW5de2sdtULFDnaXpUHsEl6s3b
=xv4A
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--
