From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Fri, 8 Mar 2019 22:08:43 +0100
Message-ID: <20190308210843.GA16125@amd>
References: <20190308203801.57920-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190308203801.57920-1-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, dlaurie@chromium.org, derat@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-03-08 13:38:02, Nick Crews wrote:
> This patch is meant to be applied on top of the for-next
> branch of the platform/chrome repository, as it uses some of
> the code staged there.
>=20
> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/wilco::kbd_backlight. This driver is modeled
> after the standard Chrome OS keyboard backlight driver at
> drivers/platform/chrome/cros_kbd_led_backlight.c

Can you make it "platform::kbd_backlight"? We want some consistency
there.

> Some Wilco devices do not support a keyboard backlight. This
> is checked in probe(), and in this case the sysfs entry will
> not appear, and everything will behave normally.

Good.

> When the EC is reset (loses all AC and battery power), it will
> restart in some unpredictable state. The brightness on the
> keyboard could be anything, and reading the brightness
> from the EC is undefined behavior. Therefore, at startup the
> brightness should be set, and then everything will work.

Really? Undefined behavior?=20

> index e09e4cebe9b4..15b56f5ce090 100644
> --- a/drivers/platform/chrome/wilco_ec/Kconfig
> +++ b/drivers/platform/chrome/wilco_ec/Kconfig
> @@ -18,3 +18,12 @@ config WILCO_EC_DEBUGFS
>  	  manipulation and allow for testing arbitrary commands.  This
>  	  interface is intended for debug only and will not be present
>  	  on production devices.
> +
> +config WILCO_EC_KBD_BACKLIGHT
> +	tristate "Enable keyboard led backlight control"

Delete "led" or make it "LED".

> +	depends on WILCO_EC
> +	help
> +	  If you say Y here, you get support to set the keyboard backlight led

Same here.

> +#define DRV_NAME		"wilco-kbd-backlight"
> +
> +#define EC_COMMAND_KB_BKLIGHT	0x75
> +#define KBBL_MSG_SIZE		16
> +/* The EC can set the backlight brightness in several different modes.
> +The mode we care about is PWM mode, where we separately supply a
> +literal percentage to set the brightness to. We need to set the proper
> +KBBL_PWM_MODE flag in the KBBL_MODE_INDEX-th byte in the message, and
> +then supply the percentage within the KBBL_BRIGHTNESS_INDEX-th byte
> +within the message. When we read the brightness, the percentage is
> +returned in this same byte location. */

Please use comment style specified in CodingStyle.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyC2dsACgkQMOfwapXb+vLqDwCfWEk3QW//F3XG6WrdOqGyEUt3
uvAAoIittL7JdDnqPtKLU43LUVzDGBsh
=2nf1
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
