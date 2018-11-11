From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/3] mfd: upboard: Add UP2 platform controller driver
Date: Sun, 11 Nov 2018 12:29:44 +0100
Message-ID: <20181111112944.GA27666@amd>
References: <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1541018689-20625-1-git-send-email-dan@emutex.com>
 <1541018689-20625-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541018689-20625-2-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>
List-Id: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +static void __reg_io_start(const struct upboard_ddata * const ddata)
> +{
> +	/*
> +	 * CLEAR signal must be pulsed low before any register access.
> +	 * This resets internal counters in the controller and marks
> +	 * the start of a new register access.
> +	 */
> +	set_clear(ddata, 0);
> +	set_clear(ddata, 1);
> +}

We normally reserve __ prefix for different stuff. This is not using
it appropriately.
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvoEqgACgkQMOfwapXb+vJW6QCggp4a+m3xauUoHQ3g7SOBg8Kw
w/8AoLHm+xmWtStIi0AZooRWYKr4kZnw
=puC8
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
