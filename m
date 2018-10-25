From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: gpio: set led_dat->gpiod pointer for OF defined
 GPIO leds
Date: Thu, 25 Oct 2018 15:08:20 +0200
Message-ID: <20181025130820.GA10294@amd>
References: <20181018001432.710-1-liviu@dudau.co.uk>
 <20181023111842.GA29083@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181023111842.GA29083@bart.dudau.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-10-23 12:18:44, Liviu Dudau wrote:
> On Thu, Oct 18, 2018 at 01:14:32AM +0100, Liviu Dudau wrote:
> > Commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> > removed the common code path that set the led_dat->gpiod pointer in
> > create_gpio_led(), but only added it back for the devices that have
> > a valid gpio_led_platform_data structure. Calling gpio_leds_create()
> > in gpio_led_probe() is not enough to get a valid gpiod pointer.
> >=20
> > Fortunately enough, gpio_leds_create() already gets the needed pointer,
> > we just need to assign it to the relevant gpio_led_data structure.
> >=20
> > Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvRwEQACgkQMOfwapXb+vLnlQCfVuN9x6W44LTDBA8LOvC3ydfe
PGEAn114L8PUMDo1fD6c3sbODcP4JeA/
=8K2O
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
