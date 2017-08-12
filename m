From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add LED driver for CR0014114 board
Date: Sat, 12 Aug 2017 11:30:24 +0200
Message-ID: <20170812093024.GA21428@amd>
References: <20170812090935.3129-1-oleg@kaa.org.ua>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55848 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750762AbdHLJa0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 12 Aug 2017 05:30:26 -0400
Content-Disposition: inline
In-Reply-To: <20170812090935.3129-1-oleg@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sat 2017-08-12 12:09:35, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System CR0014114 LEDs board.

What kind of hardware is this?=20

> Driver creates LED devices with name written using the following
> pattern "LABEL-{N}:{red,green,blue}:".

Is the "-{N} suffix needed?

> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  23 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +

You'll need to cc device tree maintainers to get their acks. Also you
should probably cc: Jacek and me.

> @@ -76,6 +76,18 @@ config LEDS_BCM6358
>  	  This option enables support for LEDs connected to the BCM6358
>  	  LED HW controller accessed via MMIO registers.
> =20
> +config LEDS_CR0014114
> +	tristate "LED Support for Crane Merchandising Systems CR0014114"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  The CR0014114 LED board used in vending machines produced
> +	  by Crane Merchandising Systems.
> +
> +	  This driver creates LED devices with name written using the
> +	  following pattern "LABEL-{N}:{red,green,blue}:".

How special hardware is this? Does it make sense to ask this question
for x86 users, for example?

> +/* CR0014114 SPI commands */
> +#define CR0014114_SET_BRIGHTNESS	0x80
> +#define CR0014114_INIT_REENUMERATE	0x81
> +#define CR0014114_NEXT_REENUMERATE	0x82

can we s/cr0014114/cr00/g, or something? There are local to the
module, so they can be shorter...

> +static void cr0014114_test(struct cr0014114 *priv)
> +{
> +	unsigned int		mdelay;
> +	size_t			i;
> +	struct led_classdev	*ldev;
> +
> +	/* blink all LEDs in 500 milliseconds */
> +	mdelay =3D 500 / priv->leds_count - CR0014114_FW_DELAY_MSEC;
> +	if (mdelay < CR0014114_FW_DELAY_MSEC)
> +		mdelay =3D CR0014114_FW_DELAY_MSEC;
> +
> +	for (i =3D 0; i < priv->leds_count; i++) {
> +		ldev =3D &priv->leds[i].ldev;
> +
> +		ldev->brightness_set(ldev, CR0014114_MAX_BRIGHTNESS);
> +		msleep(mdelay);
> +		ldev->brightness_set(ldev, LED_OFF);
> +	}
> +}

I'd remove this.

> +fail:
> +	while (i--)
> +		led_classdev_unregister(&priv->leds[i].ldev);

Can devm_* be used to simplify this?

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmOyrAACgkQMOfwapXb+vJ0gwCgiJvfSOKaYdOgogwH6/4F+QrX
CMcAn0xdOq4EEC7LDny0wC8CGMumq0wd
=sX86
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
