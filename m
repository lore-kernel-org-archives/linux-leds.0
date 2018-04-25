From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH RESEND 2/3] leds: upboard: Add LED support
Date: Wed, 25 Apr 2018 08:41:33 +0200
Message-ID: <20180425064133.GC5352@amd>
References: <20180421085009.28773-1-javier@emutex.com>
 <20180421085009.28773-3-javier@emutex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180421085009.28773-3-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2018-04-21 09:50:08, Javier Arteaga wrote:
> Allow userspace to use the on-board LEDs as "upboard:<color>:".
>=20
> Signed-off-by: Javier Arteaga <javier@emutex.com>

> +static enum led_brightness upboard_led_brightness_get(struct led_classde=
v *cdev)
> +{
> +	struct upboard_led *led =3D container_of(cdev, struct upboard_led, cdev=
);
> +	int brightness =3D 0;
> +
> +	regmap_field_read(led->field, &brightness);
> +
> +	return brightness;
> +};

I'm slightly confused here. Is each led controlled by single bit?

> +static void upboard_led_brightness_set(struct led_classdev *cdev,
> +				       enum led_brightness brightness)
> +{
> +	struct upboard_led *led =3D container_of(cdev, struct upboard_led, cdev=
);
> +
> +	regmap_field_write(led->field, brightness !=3D LED_OFF);
> +};

What is going on with ";" at end of function? We don't do that.

If it is single bit, max_brightness should be one, and !=3D LED_OFF test
should not be needed.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrgIx0ACgkQMOfwapXb+vLP/wCeObvNSVSgW6bpxoY4s1PqXv3B
N8YAn3vU/1h/+9wsoQPYbjsRBWnpWLnG
=8EzT
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
