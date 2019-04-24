From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 02/26] leds: class: Improve LED and LED flash class
 registration API
Date: Wed, 24 Apr 2019 15:46:33 +0200
Message-ID: <20190424134633.GA14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-3-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-3-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +/**
> + * led_classdev_register_ext - register a new object of LED class with
> + *			       init data
> + * @parent: LED controller device this LED is driven by
> + * @led_cdev: the led_classdev structure for this device
> + * @init_data: the LED class device initialization data
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +extern int led_classdev_register_ext(struct device *parent,
> +				     struct led_classdev *led_cdev,
> +				     struct led_init_data *init_data);
> +#define led_classdev_register(parent, led_cdev)			\
> +	led_classdev_register_ext(parent, led_cdev, NULL)
> +extern int devm_led_classdev_register_ext(struct device *parent,
> +					  struct led_classdev *led_cdev,
> +					  struct led_init_data *init_data);
> +#define devm_led_classdev_register(parent, led_cdev)		\
> +	devm_led_classdev_register_ext(parent, led_cdev, NULL)

Static inline (instead of macro) might be preffered. More type safety
and less confusing behaviour in case of errors...
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAaLgACgkQMOfwapXb+vKyTgCgsOUBcfIzhs8Dz6QDfiZk6Tyz
xxUAn05DyUMlRjizCI1uRAyr3qr/T+Mw
=H8U1
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
