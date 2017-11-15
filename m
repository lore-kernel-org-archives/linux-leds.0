From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] leds: lm3692x: Introduce LM3692x dual string driver
Date: Wed, 15 Nov 2017 11:45:26 +0100
Message-ID: <20171115104526.GC456@amd>
References: <20171113205052.25884-1-dmurphy@ti.com>
 <20171113205052.25884-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57189 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932136AbdKOKp3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 05:45:29 -0500
Content-Disposition: inline
In-Reply-To: <20171113205052.25884-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-11-13 14:50:52, Dan Murphy wrote:
> Introducing the LM3692x Dual-String white LED driver.
>=20
> Data sheet is located
> http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lm3692x.c | 380 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 380 insertions(+)
>  create mode 100644 drivers/leds/leds-lm3692x.c
>=20
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> new file mode 100644
> index 000000000000..beb753abc7b0
> --- /dev/null
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -0,0 +1,380 @@
> +/*
> + * TI lm3692x LED Driver
> + *
> + * Copyright (C) 2017 Texas Instruments
> + *
> + * Author: Dan Murphy <dmurphy@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + */

I'd put data sheet link here.

> +/**
> + * struct lm3692x_led -
> + * @lock - Lock for reading/writing the device
> + * @client - Pointer to the I2C client
> + * @led_dev - led class device pointer
> + * @regmap - Devices register map
> + * @enable_gpio - VDDIO/EN gpio to enable communication interface
> + * @regulator - LED supply regulator pointer
> + * @label - LED label
> + **/

Are you sure this is linuxdoc? Would */ at the end be enough?

> +static int lm3692x_fault_check(struct lm3692x_led *led)
> +{
> +	int ret, fault;
> +	unsigned int read_buf;
> +
> +	ret =3D regmap_read(led->regmap, LM3692X_FAULT_FLAGS, &read_buf);
> +	if (ret)
> +		goto out;

Just return here.

> +	/*
> +	 * For glitch free operation, the following data should
> +	 * only be written while device enable bit is 0
> +	 * Per Section 7.5.14 of the data sheet
> +	 */

"per section 7.5.14 of the data sheet."

> +	ret =3D regmap_write(led->regmap, LM3692X_PWM_CTRL,
> +		LM3692X_PWM_FILTER_100 | LM3692X_PWM_SAMP_24MHZ);
> +	if (ret)
> +		dev_err(&led->client->dev, "Failed programming PWM CTRL\n");
> +
> +	ret =3D regmap_write(led->regmap, LM3692X_BOOST_CTRL,
> +			LM3692X_BRHT_MODE_RAMP_MULTI |
> +			LM3692X_BL_ADJ_POL |
> +			LM3692X_RAMP_RATE_250us);
> +	if (ret)
> +		dev_err(&led->client->dev, "Failed programming BOOST CTRL\n");
> +
> +	ret =3D regmap_write(led->regmap, LM3692X_AUTO_FREQ_HI, 0x00);
> +	if (ret)
> +		dev_err(&led->client->dev, "Failed programming AUTO HI FREQ\n");

If something fails, is it wise to continue?

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloMGsYACgkQMOfwapXb+vI3OQCdGNR0M2lgrijup1wlkxqyVjDg
jXsAnR3ktcJe4R/1Li8grmOywRMePNYg
=9Nel
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
