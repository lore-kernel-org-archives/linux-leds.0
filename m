From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/3] platform/chrome: Add Wilco EC keyboard backlight
 LEDs support
Date: Fri, 22 Mar 2019 12:35:09 +0100
Message-ID: <20190322113509.GE8681@amd>
References: <20190321221334.240059-3-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321221334.240059-3-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> after the standard Chrome OS keyboard backlight driver at
> drivers/platform/chrome/cros_kbd_led_backlight.c

Please make it platform::kbd_backlight . Userland should not need to
know what wilco is...

What is wilco, anyway?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyUyG0ACgkQMOfwapXb+vI3PQCeNMpXRM3HzrbVPlrFbv5HDU1p
QCYAnAr7iz4pAf8qslk9HOAkNNTzvVxZ
=jRXk
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
