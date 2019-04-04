From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 2/2] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Thu, 4 Apr 2019 13:17:31 +0200
Message-ID: <20190404111731.GA18653@amd>
References: <20190403212757.132684-1-ncrews@chromium.org>
 <20190403212757.132684-2-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190403212757.132684-2-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, alexandre.belloni@bootlin.com, a.zummo@towertech.it, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-03 15:27:58, Nick Crews wrote:
> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled

Please use platform::kbd_backlight.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyl58sACgkQMOfwapXb+vJt3QCghaHErLDMJqTNyiuOdDItOitT
GksAn3e8UW+bDBwdh66UJ0k4HR+I51RZ
=yv61
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
