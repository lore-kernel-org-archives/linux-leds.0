Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208561;
	b=tN5WJjWJ0SIDbU9H93T2k8PU3vA7pl5Y9A0NcC/uzfeK7lzlLxVekoTPFaq/CnA+JKPG
	 +o3+Ff3OHCUHDGF5eSlmBwelSdWpsrgdc4GnzjV0vnYSeX2g5IKVww65IfFWG6slBI3k8
	 33ahfViHI9mpkH/hUXYWCkshcqASoPF/4Pt5ZNP9sYl4Bu5gp76/VD1bCjMgsnhbQLN+e
	 ALqkgN5WiT5VvacMN1JykObxQbhcKQ2RGKpSUMQlpNFC108I3anOl/GS+Ox8FTcsyftN9
	 xa7sqHjgmTWk2h40OsBiDzybutM6y2c04X/1SQHMAGmHMSXbeoRMR3pZNLQcAEe8KmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208561;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ymTOM94xEZHiEsD9/neciLmkWV3rmXhIY0LPeIEnTk=;
	b=y87fGK6KWnlWXi1Douw2GhAiz/sM9qBb31Mmf9KLFTSc7l20tPkrM+zH6bzF9iV4QX4p
	 PvWYu+1U5Hwn8KcpwsJ+9iSfJn37qFrSeqS+KrlOhqUExdCfeWur9QiB+zslFEKEfTxeY
	 a4Kx6maLVq+FWH+Awy69sXMXd8w2zoFV4eKxn/gV5ehUREokWqAJrppsuMslKtGpG/fFm
	 iN3jvgjgc4qrFOVrmdNjgpW6OQpYhhtWG3XBHfMOzHk2dMVQytK11FqOPpO05BNfLTdN3
	 lOuwZhIpyUsHTmDh0lxY3IG+51ICcLfIgPVOChbqY2gmqIpB8UekU450Pq3j+1Xskww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXkBtXda;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0082606A6AE
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXkBtXda
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042CF1F000C0;
	Fri, 20 Nov 2026 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795208561;
	bh=+ymTOM94xEZHiEsD9/neciLmkWV3rmXhIY0LPeIEnTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXkBtXdaNxSUhDaq8Ml6WQWvFKCQ3xhbJuoxZtpp4Eomoje6ToKnm46x4I8lks+/T
	 dPYmg0gyn0JAxolYBV1mXVtQY1ZKI3I5OR7VcnXkH4Q8ak52JrdFBI8OJUwHedLtls
	 aBBTDeTCZM938hTk+Q19ssbkJM9Tlr7j/u49CUn3X/WlG6jXz7J8wuGKUG7GO6pfo8
	 OU87ppGbu8mwtRSf2aWpbOyvQQX/xaExTxop/bUOwn+taoxpiYpIgLeSNe4C1w/f7T
	 mbnCu67EO1K1KdaSBTACuvE5vIjZieddrxga1lgKDFNWLu7Fx9dpUMr11/fb8zp7RW
	 lHgpwbenWy/9g==
Message-ID: <sashiko-outbox-226118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] leds: multicolor: Adjust maximum subled
 intensity during initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120204246.6645-11-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
 <20261120204246.6645-11-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:02:40 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] leds: multicolor: led_classdev_multicolor_register_ext()
  latches wrong max_intensity for ktd202x
--

commit 706a75de816141a3e96080019779e79d9bf12aa0
Author: Armin Wolf <W_Armin@gmx.de>

leds: multicolor: Adjust maximum subled intensity during initialization

This commit removes led_mc_get_max_intensity() and instead populates unset
subled_info[i].max_intensity fields from led_cdev->max_brightness during
led_classdev_multicolor_register_ext().

> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class=
-multicolor.c
> index 0656ca2361b37..09c52bc1a55ae 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c

[ ... ]

> @@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct devi=
ce *parent,
>  	if (ret < 0)
>  		return ret;
> =20
> +	/*
> +	 * The maximum global brightness value might have been changed by
> +	 * led_classdev_init() using devicetree properties. Because of this
> +	 * we can only adjust subled_info[X].max_intensity after said function
> +	 * was called.
> +	 */
> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
> +	{
> +		if (!mcled_cdev->subled_info[i].max_intensity)
> +			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightness;
> +	}
> +
>  	led_cdev->dev->type =3D &led_multicolor_device_type;
> =20
>  	return led_classdev_add(led_cdev, init_data);

[Severity: Medium]
Does latching subled_info[i].max_intensity here break leds-ktd202x RGB LEDs?

ktd202x_add_led() calls ktd202x_setup_led_rgb() ->
devm_led_classdev_multicolor_register_ext() with max_brightness and
subled_info[i].max_intensity still set to 0, and only assigns
cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS (192) after registration
returns:

drivers/leds/rgb/leds-ktd202x.c:ktd202x_add_led() {
	...
	if (color =3D=3D LED_COLOR_ID_RGB) {
		cdev =3D &led->mcdev.led_cdev;
		ret =3D ktd202x_setup_led_rgb(chip, fwnode, led, &init_data);
	} else {
		cdev =3D &led->cdev;
		ret =3D ktd202x_setup_led_single(chip, fwnode, led, &init_data);
	}

	if (ret) {
		dev_err(chip->dev, "unable to register %s\n", cdev->name);
		return ret;
	}

	cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
	...
}

When the devicetree node does not specify max-brightness, led_classdev_init=
()
defaults led_cdev->max_brightness to LED_FULL (255), so this loop latches
subled_info[i].max_intensity to 255 instead of 192.  Writing intensities
above 192 via multi_intensity then causes led_mc_calc_color_components() to
compute subled_info[i].brightness up to 255 (dividing by max_brightness =3D
192), and ktd202x_brightness_set() writes out-of-range values above
KTD202X_MAX_BRIGHTNESS - 1 to KTD202X_REG_LED_IOUT(channel).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120204246.6645=
-1-W_Armin@gmx.de?part=3D10
