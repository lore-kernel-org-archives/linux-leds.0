Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506190;
	b=KdkY70aw8aDWiMGBcOKLyIfOreAA/jd/el5f3+Ha5DTHN2wVdxKyLYC3Imm30chGzhvt
	 6QCPBAG8rEc7ufd4DCTXEZLnHJoAHu2K5bS/94oT9B4XvesS9DtTEJ+2MSnDTNWcu+/LY
	 o+d5mul2MYTD4rXyo9EE48D6XlNGYJN59fwtOAi9dRhy1WOeaOX5W5rsjEqjn4gXDl9QQ
	 qV1jTE5t0FujahCEslZkQrE2VtIKvonZbvvcij/5Q64IhkV50bWrbgo7+4dB1nPxfRJpA
	 /CwtR++0TZyF9fEgoSgcvGKchkVWodR4N4YzSJuMD6bj7oOtl30FymfXQxXFnWpK4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=And74U+ePDRlyflZlf3fB4e3zTWBL9Fyfc+LUbduZfE=;
	b=JMa7x1nQlRINfoK89QYAIJL5ZYwZ8PYmkIzAGCPxSalYl9TxXyy8csU/IZSwlcyL3akw
	 eD9E2qk9k0AyRotef6A+GjuWfDnGiYKUzj3h/IkupuJoSQoVJ22AksAzS3pg5A5FMXseZ
	 Fdt/U+vB/FqYtg5CbZwoSWXwtZZPAIhJCu/uZisG1I8gvdzbQKRdEGGcJTZYYNwO/+Wf7
	 WsGoSep99EulAKnpRpiqjEdnIANgU7yXh7ALtHw4EbI+RPVHqFkOBr7zQtIq2U+9etfq0
	 zD3Q6Ty2vbKp8mLNtG9ww63lyTdVpEkDf4L8K7Gnu/RdHZJ6jF66muCAoS2eyE7JLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3LsjDqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F38A606A31E;
	Tue, 24 Nov 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3LsjDqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762A81F000D3;
	Tue, 24 Nov 2026 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795506189;
	bh=And74U+ePDRlyflZlf3fB4e3zTWBL9Fyfc+LUbduZfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3LsjDqLmkLFgKJ8NOUXJK0VczL4Bdw1JO52vvHtYTu3jdNoD+fEXAukYjFyOWxk9
	 73nb1vdDMHtYyMAPzFNQNJqB2G7r255p44o3MpyaLjc6wOUdoBxHrjOdWAaSeFJyMA
	 +Vwho678uPStqQQExoTuMDeKLtgEqQM0KpJQmvLcCLzC+VGPRNLuC4TF9EFJIxYG4E
	 5KN8kikqv8gB4eaquIaZlzAnMo22Bs2y5+TgPhXo8/Gd3iZaeP0XVIDyK22gqUjuig
	 fyqZUStfm+PSE9g8AOQtmIKVQfGJJ07EcaKTqLJJzxZ0OfBWKBylVmqeTwHqndPrSp
	 kJ7pE2CPh8giQ==
Message-ID: <sashiko-outbox-230662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/20] gpio: twl4030: Support REGEN GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <5fe8b5155067e0b1fc9b34c53e3b89a40e53234c.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
 <5fe8b5155067e0b1fc9b34c53e3b89a40e53234c.1795505160.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 07:43:09 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] gpio: twl4030: REGEN usage_count corruption breaks
  REG_GPIO_CTRL power control
- [Medium] gpio: twl4030: unchecked use_leds in twl_request() exposes
  disabled LED GPIOs
--

commit 21b2429c7b13ebb306ae7f98703ac0b013d40ac3
Author: H. Nikolaus Schaller <hns@goldelico.com>

gpio: twl4030: Support REGEN GPIO

This commit adds optional support for exposing the TWL4030 REGEN control
signal as an output-only GPIO when the ti,use-regen device tree property
is present.

> diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
> index 3e06ef9e22336..30ac6f7e0e56a 100644
> --- a/drivers/gpio/gpio-twl4030.c
> +++ b/drivers/gpio/gpio-twl4030.c
[ ... ]
> @@ -211,8 +301,16 @@ static int twl_request(struct gpio_chip *chip, unsig=
ned offset)
> =20
>  	mutex_lock(&priv->mutex);
> =20
> +	/*
> +	 * REGEN is controlled through the power-management registers
> +	 * and does not require enabling the GPIO module.
> +	 */
> +	if (offset =3D=3D TWL4030_GPIO_REGEN)
> +		goto done;
> +
>  	/* Support the two LED outputs as output-only GPIOs. */
> -	if (offset >=3D TWL4030_GPIO_MAX) {
> +	if (offset >=3D TWL4030_GPIO_LED_A &&
> +	    offset <=3D TWL4030_GPIO_LED_B) {
>  		u8	ledclr_mask =3D LEDEN_LEDAON | LEDEN_LEDAEXT
>  				| LEDEN_LEDAPWM | LEDEN_PWM_LENGTHA;
>  		u8	reg =3D TWL4030_PWMAON_REG;
> @@ -249,6 +347,15 @@ static int twl_request(struct gpio_chip *chip, unsig=
ned offset)
>  		goto done;
>  	}
> =20
> +	/*
> +	 * Offsets 18/19 are reserved for the optional LEDs.  If the LEDs
> +	 * aren't enabled, they must not be treated as LED GPIOs.
> +	 */
> +	if (offset >=3D TWL4030_GPIO_MAX) {
> +		status =3D -EINVAL;
> +		goto done;
> +	}

[Severity: Medium]
Can this `offset >=3D TWL4030_GPIO_MAX` check ever be reached, or does
twl_request() still treat offsets 18 and 19 as valid LED GPIOs when
ti,use-regen is enabled without ti,use-leds?

In gpio_twl4030_probe(), pdata->use_regen extends ngpio to
TWL4030_GPIO_REGEN + 1 without recording whether pdata->use_leds is set.
Because TWL4030_GPIO_LED_A and TWL4030_GPIO_LED_B are unconditionally
matched right above this check (and TWL4030_GPIO_REGEN is handled at the
top), requesting or driving offset 18 or 19 succeeds and reprograms the
TWL4030_MODULE_LED registers even when ti,use-leds is not enabled.

> +
>  	/* on first use, turn GPIO module "on" */
>  	if (!priv->usage_count) {
>  		struct twl4030_gpio_platform_data *pdata;
> @@ -277,8 +384,18 @@ static void twl_free(struct gpio_chip *chip, unsigne=
d offset)
>  	struct gpio_twl4030_priv *priv =3D gpiochip_get_data(chip);
> =20
>  	mutex_lock(&priv->mutex);
> +	if (offset =3D=3D TWL4030_GPIO_REGEN)
> +		goto out;
> +
> +	if (offset >=3D TWL4030_GPIO_LED_A &&
> +	    offset <=3D TWL4030_GPIO_LED_B) {
> +		WARN_ON_ONCE(twl4030_led_set_value(offset -
> +				TWL4030_GPIO_LED_A, 1));
> +		goto out;
> +	}
> +
>  	if (offset >=3D TWL4030_GPIO_MAX) {
> -		WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1));
> +		WARN_ON_ONCE(true);
>  		goto out;
>  	}
> =20

[Severity: High]
Does jumping to `done` in twl_request() and `out` in twl_free() for
TWL4030_GPIO_REGEN break REG_GPIO_CTRL power management via
priv->usage_count?

In twl_request(), `if (offset =3D=3D TWL4030_GPIO_REGEN) goto done;` skips
enabling REG_GPIO_CTRL on first use, but `done:` still sets
BIT(TWL4030_GPIO_REGEN) in priv->usage_count.  If REGEN is requested
before any regular GPIO (0..17), `!priv->usage_count` is already false
when the first regular GPIO is requested, so REG_GPIO_CTRL is never
written and the GPIO module stays powered off.

In twl_free(), `if (offset =3D=3D TWL4030_GPIO_REGEN) goto out;` jumps past
`priv->usage_count &=3D ~BIT(offset);`, leaving BIT(TWL4030_GPIO_REGEN) set
forever once REGEN has been requested.  As a result, freeing all regular
GPIOs can never power down REG_GPIO_CTRL, and twl_get() continues to
treat REGEN as requested after it is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795505160.gi=
t.hns@goldelico.com?part=3D2
