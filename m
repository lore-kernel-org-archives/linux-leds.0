From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC LEDs
Date: Mon, 11 Feb 2019 14:17:26 +0100
Message-ID: <20190211131726.GA11067@amd>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190209221213.24052-2-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190209221213.24052-2-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +static struct cht_wc_led cht_wc_leds[] =3D {
> +	{
> +		.name =3D "pmic::charge",
> +		.ctrl_reg =3D CHT_WC_LED1_CTRL,
> +		.fsm_reg =3D CHT_WC_LED1_FSM,
> +		.pwm_reg =3D CHT_WC_LED1_PWM,
> +		.enable_mask =3D CHT_WC_LED1_ON,
> +	},
> +	{
> +		.name =3D "pmic::gpled",
> +		.ctrl_reg =3D CHT_WC_LED2_CTRL,
> +		.fsm_reg =3D CHT_WC_LED2_FSM,
> +		.pwm_reg =3D CHT_WC_LED2_PWM,
> +		.enable_mask =3D CHT_WC_LED2_ON,
> +	},
> +};

Unfortunately, these LED names will not be too useful for
userspace. What about "platform::charging" and "status-led::"?

Should we have some default triggers?
								Pavel

-*- org -*-

It is somehow important to provide consistent interface to the
userland. LED devices have one problem there, and that is naming of
directories in /sys/class/leds. It would be nice if userland would
just know right "name" for given LED function, but situation got more
complex.

Anyway, if backwards compatibility is not an issue, new code should
use one of the "good" names from this list, and you should extend the
list where applicable.

Bad names are listed, too, in case you are writing application that
wants to use particular feature, you should probe for good name first
but then try the bad ones, too".

* Keyboards

Good: "input*:*:capslock"
Good: "input*:*:scrolllock"
Good: "input*:*:numlock"
Bad: "shift-key-light" (Motorola Droid 4, capslock)

Set of common keyboard LEDs, going back to PC AT or so.

Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)

Frontlight/backlight of main keyboard.

Bad: "button-backlight" (Motorola Droid 4)

Some phones have touch buttons below screen; it is different from main
keyboard. And this is their backlight.

* Sound subsystem

Good: "platform:*:mute"
Good: "platform:*:micmute"

LEDs on notebook body, indicating that sound input / output is muted.

* System notification

Good: "status-led:{red,green,blue}" (Motorola Droid 4)
Bad: "lp5523:{r,g,b}" (Nokia N900)

Phones usually have multi-color status LED.



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlxhdeYACgkQMOfwapXb+vKS/QCgtC3/Gf6zzcQqzu0fez4oidOt
+YIAoKsZQQ1ST4JMnguKyUYfWWsA3KL+
=TLC1
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
