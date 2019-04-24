From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 24/26] leds: gpio: Use generic support for composing
 LED names
Date: Wed, 24 Apr 2019 16:04:17 +0200
Message-ID: <20190424140417.GE14360@amd>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-25-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417205439.17685-25-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-04-17 22:54:37, Jacek Anaszewski wrote:
> Switch to using generic LED support for composing LED class
> device name.
>=20
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/leds/leds-gpio.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index b26cf78993d1..60fb3c85cf05 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -77,11 +77,11 @@ static int gpio_blink_set(struct led_classdev *led_cd=
ev,
> =20
>  static int create_gpio_led(const struct gpio_led *template,
>  	struct gpio_led_data *led_dat, struct device *parent,
> -	struct device_node *np, gpio_blink_set_t blink_set)
> +	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>  {
> +	struct led_init_data init_data =3D {};
>  	int ret, state;
> =20
> -	led_dat->cdev.name =3D template->name;
>  	led_dat->cdev.default_trigger =3D template->default_trigger;
>  	led_dat->can_sleep =3D gpiod_cansleep(led_dat->gpiod);
>  	if (!led_dat->can_sleep)
> @@ -112,7 +112,13 @@ static int create_gpio_led(const struct gpio_led *te=
mplate,
>  	if (ret < 0)
>  		return ret;
> =20
> -	return devm_led_classdev_register(parent, &led_dat->cdev);
> +	if (template->name)
> +		led_dat->cdev.name =3D template->name;
> +	else
> +		init_data.fwnode =3D fwnode;
> +
> +	return devm_led_classdev_register_ext(parent, &led_dat->cdev,
> +					      &init_data);

Won't register_ext() overwrite template->name?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzAbOEACgkQMOfwapXb+vIgpgCgvGx71t3YniNRoAyQcibBFCRD
FxkAoMRwBe9KhXB++Dl2qZE1RYbxCXjr
=BLw0
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
