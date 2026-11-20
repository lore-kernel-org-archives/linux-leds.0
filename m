Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134343;
	b=QLD5D0pipw8EwP4LVXXfFFxiLfmaoPnTTfdiw8CNpGtdHXaWq7cRjHs43Qz45YIopZU3
	 08lXI7NQdw3LUnTl2/wBPXGQ7U2r/QCRhyZxJe/ovFYtoKrEZ3Qq57F0e7CD4ebM0AoBL
	 3TEZb2ks2cS7QQK71ql/MiTT0yS5/75MYnzu9NB3FVVshLVpBqgOHQoBJ6eviHWUgrO8J
	 c6GRBOoVzWnvG4SB3sbQtDmHrWp/Ryoyutz3Aoj2bGQ+KRVTTwEMHgIt3w9tJz7+Ud30l
	 Wi0hiK6M6ZoNks9hBRTqCgXSZ2dTQz3jd8/5tby3W3XIGXR4IcSaQbCNkBzgLVyoHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gI7MBb2ZKcdmNhRoO5ucZlyCJxqXOn884fXACSuIVpE=;
	b=fdt9qShDAUdXxhnw8r9Ndx4PdAxTHQ4oseQ6qrRiFGaJ19GTJmPk3SDFFfhu0Thbm8yv
	 nz1OPvzmItk81ZQJ6M/GhhMZv3sW+5iruw4uMcW9KKdPywCYfo8tdbjIH7G6dD621Q/PP
	 oyZKerTyYeb5WaL/Cb5XZltUzKB1QAr/xS/LDN/VxPr+9QjZM/Z2v6kqF/Ks+Lwv2xnvH
	 w4vdw2ZzeTjKMkVCB9e1C+AYwzJbF7mNDf2ADDXhGsGwzPbd+WockL49ASuf0FjE7NUz7
	 I8e6//57Lq4/rCWLJ90pQ03fzDfZYrdS8OK+Al911zimUy0K5+AFFRV61nKdQ9ZpgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TF0R9Jr6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBC606A325;
	Fri, 20 Nov 2026 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TF0R9Jr6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC02E1F000C4;
	Fri, 20 Nov 2026 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134343;
	bh=gI7MBb2ZKcdmNhRoO5ucZlyCJxqXOn884fXACSuIVpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TF0R9Jr6MSNlW4GfvGJ6BZ6Y3wZhaIh7LDDSJonhLJKuJLdDkXUtTsCqOF7drCPqe
	 yRj1fw6JLEyJTOFGLP+HgpfBh2LZeL/ctAb0Ltc2V+vCmWZABM7QUKs6PVawGE9SUe
	 5CUrZsdzC0imf1JPHQcuTGGQ3Zo4IgfQw3Fefty76moX86mixLfKhYv/Jn0B4Y4G+I
	 OpkYZOwZObot0lE26oUVTy1jJT7LyxbRukgIxcL/wwSPywXRKQnqc6Tkts0aiyxw0Z
	 V19Eyl63LiLkxv5Gi6f6UIKPlErosMLiUl3s+vgHNtwyHKnDlZVZAAQDBveWQSDm46
	 I3RJm5Ape90PQ==
Message-ID: <sashiko-outbox-224266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-11-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-11-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:25:42 +0000
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
- [Medium] leds: rgb: ktd202x: race on cdev.brightness in
  ktd202x_chip_in_use()
--

commit 53a1322c29ce0429d0f7e6ad7328dce239f5bd4f
Author: Joseph Telaak <joseph@telaak.dev>

leds: rgb: ktd202x: Don't let a blinking LED retime another one

This commit tracks which LEDs on a ktd202x chip are using the shared PWM1
flash timer, rejects incompatible concurrent timer requests with -EBUSY,
and holds the chip mutex across setting brightness and programming the
timer.

> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd2=
02x.c
> index c9f1a5234d6e2..2e84fed016f9f 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
[ ... ]
> @@ -266,26 +264,46 @@ static int ktd202x_brightness_set(struct ktd202x_le=
d *led,
>  	return 0;
>  }
> =20
> -static int ktd202x_brightness_single_set(struct led_classdev *cdev,
> -					 enum led_brightness value)
> +/* Called with the chip mutex held */
> +static int __ktd202x_brightness_single_set(struct ktd202x_led *led,
> +					   enum led_brightness value)
>  {
> -	struct ktd202x_led *led =3D container_of(cdev, struct ktd202x_led, cdev=
);
>  	struct mc_subled info;
> -	int ret;
> -
> -	cdev->brightness =3D value;
> =20
> -	mutex_lock(&led->chip->mutex);
> +	led->cdev.brightness =3D value;
> =20
>  	info.brightness =3D value;
>  	info.channel =3D led->index;
> -	ret =3D ktd202x_brightness_set(led, &info, 1);
> =20
> +	return ktd202x_brightness_set(led, value, &info, 1);
> +}
[ ... ]
> @@ -427,7 +519,21 @@ static int ktd202x_blink_single_set(struct led_class=
dev *cdev,
>  	if (!*delay_on)
>  		return ktd202x_brightness_single_set(cdev, LED_OFF);
> =20
> -	info.brightness =3D cdev->brightness;
> +	guard(mutex)(&led->chip->mutex);
> +
> +	/*
> +	 * The LED core may have changed the brightness without the chip mutex
> +	 * and not applied it yet, so read it once and apply it here. An unlit
> +	 * LED blinks at the brightness of a software blink, which may be in its
> +	 * off phase, or else at full brightness.
> +	 */
> +	brightness =3D READ_ONCE(cdev->brightness) ?: cdev->blink_brightness ?:=
 cdev->max_brightness;
> +
> +	ret =3D __ktd202x_brightness_single_set(led, brightness);
> +	if (ret)
> +		return ret;
> +
> +	info.brightness =3D brightness;
>  	info.channel =3D led->index;
> =20
>  	return ktd202x_blink_set(led, delay_on, delay_off, &info, 1);

[Severity: Medium]
Can a concurrent unlocked write to cdev->brightness in the LED core cause
ktd202x_brightness_set() to disable the chip right before
ktd202x_blink_set() or ktd202x_timer_set() programs the timer?

ktd202x_chip_in_use() still determines whether the chip is active by
reading chip->leds[i].cdev.brightness:

drivers/leds/rgb/leds-ktd202x.c:ktd202x_chip_in_use() {
	for (i =3D 0; i < chip->num_leds; i++) {
		if (chip->leds[i].cdev.brightness)
			return true;
	}
	return false;
}

Because led_set_brightness_nosleep() updates led_cdev->brightness without
holding chip->mutex before queuing set_brightness_work, a concurrent
LED_OFF update can zero cdev.brightness after
__ktd202x_brightness_single_set() sets it:

CPU0                                  CPU1
ktd202x_blink_single_set()
  guard(mutex)(&led->chip->mutex)
  __ktd202x_brightness_single_set()
    led->cdev.brightness =3D brightness
    ktd202x_brightness_set()
      ktd202x_chip_enable()
      regmap_write(..., IOUT, ...)
                                      led_set_brightness(cdev, LED_OFF)
                                        led_set_brightness_nosleep()
                                          cdev->brightness =3D 0
                                          queue_work(set_brightness_work)
      if (!ktd202x_chip_in_use(chip))
        ktd202x_chip_disable()
  ktd202x_blink_set()
    ktd202x_timer_set()
      regmap_write(...)               <-- writes to sleeping/unpowered chip

If no other LED on the chip is lit, ktd202x_brightness_set() puts the chip
to sleep and disables its regulators, and ktd202x_timer_set() (in the
single/mc blink and pattern callbacks) then writes the timer and channel
registers over I2C to the unpowered chip.

The same race occurs when two lit LEDs on the chip are turned off together
(for instance via led_trigger_event(trig, LED_OFF)): both cdev.brightness
fields are zeroed before the first LED's set_brightness_work finishes, so
the first LED disables the chip and regulators before the second LED's
ktd202x_brightness_set() writes KTD202X_REG_CHANNEL_CTRL. Tracking each
LED's applied hardware brightness under chip->mutex and checking that in
ktd202x_chip_in_use() would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D11
