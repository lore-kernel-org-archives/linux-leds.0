Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666742;
	b=CgOSAMP+vuKgBIY8vMoDJTHzsShUEG2S3uDJvvH5Oq5Fr93KBkcdbi0jf//jwN7O0W98
	 pzWQXfSpSwJOoEmJ1I9evMhLWgD1ObKHHUS/lIcgZqhh7mSiWhwOlqNFs9uWPTcKHADc0
	 yNX9pvUq3BFs2OURaw6skMgQlHibUEiy08wzUbaiX2hyU3iJdrVIvoI57sn5u6AmRbwlX
	 NnX+a1oloKD5YCMTZ+x22GzIX+TewGCQcGMJIWnGckRJvSv8wWp1aUB+JvEVekLrsmoIZ
	 VDNAUPoLOd0VSyxdBKrOwehafLxtcgumyDf54ez/TUeu5thMcnCGefHhzDOZrAMnGVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666742;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LClllKIerSdAlQJe9A28+CttvmZiwSvh2DPbZ4Z3Z3Y=;
	b=cV241bzemOxgzMfGRPpEi7IdUs2VW3gnT9l4zTpcCedMv9Ob3kE+Ehqk9z8TH7X7a+Eb
	 N7wFdosE0+pzYeBKZS5PnWrHoHNld+PeLbrFASxHeNEEwSL3viNAii0gqJEDJF7pu6baH
	 N2wXFp8oYasbgFVEjQfzD0sfh4nsJlIKfquLUsgJIHCmIhopbeT0x8xt8Hn2DMHBxY8VY
	 oKdStPJZuyIwARccuYklql4rMUUY1WWVFBLHS+xclVXPQMnGL9+kEoi7IZn5d7uemv2qE
	 b5bXFsNK0ZsT80xneOvUR6y5u34G4znjd5gPfvwmmXe0FRaWEQvKGtmX8xmzlgd6Pag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ej8oi2Ax;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA39606A329;
	Sat, 14 Nov 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ej8oi2Ax
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BBB1F000C4;
	Sat, 14 Nov 2026 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794666742;
	bh=LClllKIerSdAlQJe9A28+CttvmZiwSvh2DPbZ4Z3Z3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ej8oi2AxYkg7vefJli0Mi4IduQF0tlh0fNqUwfLpQoPdu5/v/Xj7tSBZb07r8cOfu
	 cbNNvghU+8sJVe7e09jxsX/VfxIkpoRFV6RbtzhD0Dpbr2nSt1fKpuV/Et5uf3S1ik
	 ZdMUxgX3I1JB1dQ7B6QsyrLEKqdCHmedqOm9etDfG0jxK9Nj9JR1B/2LKmasvQfiXP
	 esfLmDvoipTePimNHGP87MtmqDOQ6gSREHSNzqxpPzer7d88ig2v9MQ/30DRoZHK1I
	 FQoKYXN1tTfxcgQ2EQVfB04WcW1GYeoGXTo1Xe3cMzZTaiPDGbkVf0CaIYkXMcZljm
	 f7CBksR4PY9Yw==
Message-ID: <sashiko-outbox-214636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>, linux-leds@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114141926.92737-1-t3127430@gmail.com>
References: <20261114141926.92737-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 14:32:21 +0000
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
- [Medium] leds: pca9532: unrestored led->state on I2C failure breaks
  blink fallback
- [Low] leds: pca9532: dev_warn() log spam on software blink fallback in
  pca9532_set_blink()
--

commit 85607316f9a97fea0c814965c666330e54cd0fdc
Author: Daniil Demakov <t3127430@gmail.com>

leds: pca9532: Propagate I2C errors

This commit checks return values from SMBus read and write calls in the
pca9532 driver and propagates errors through LED, PWM, blink, GPIO, and
device initialization paths.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c8085427696ff..3357955204903 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c

[ ... ]

> @@ -223,15 +262,28 @@ static int pca9532_update_hw_blink(struct pca9532_l=
ed *led,
>  		}
>  	}
> =20
> -	psc =3D ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> -	if (psc > U8_MAX) {
> -		/* Blink period too long to be handled by hardware */
> +	if (delay_on > ULONG_MAX - delay_off)
> +		return -EINVAL;
> +
> +	period =3D delay_on + delay_off;
> +
> +	if (!period)
> +		return -EINVAL;
> +
> +	if (period > ((U8_MAX + 1) * 1000) /
> +		     PCA9532_PWM_PERIOD_DIV) {
> +		dev_warn(&led->client->dev,
> +			 "Blink period too long: %lu ms on, %lu ms off\n",
> +			 delay_on, delay_off);
>  		return -EINVAL;
>  	}
> =20
> +	psc =3D (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> +
>  	led->state =3D PCA9532_PWM1;
>  	data->psc[PCA9532_PWM_ID_1] =3D psc;
> -	data->pwm[PCA9532_PWM_ID_1] =3D (delay_on * PCA9532_PWM_DUTY_DIV) / (de=
lay_on + delay_off);
> +	data->pwm[PCA9532_PWM_ID_1] =3D
> +		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
> =20
>  	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
>  }

[Severity: Medium]
Does propagating an error from pca9532_setpwm() or pca9532_setled() leave
led->state stuck at PCA9532_PWM1 when hardware blink setup fails?

When pca9532_set_blink() returns an error to led_blink_setup(), the LED core
falls back to software blinking via led_set_software_blink().  Because
pca9532_set_brightness() ignores non-zero brightness updates whenever
led->state =3D=3D PCA9532_PWM1, software blinking can never turn the LED on=
, and
pca9532_update_hw_blink() will also treat PWM1 as busy for other LEDs on the
chip.

pca9532_set_brightness() and pca9532_gpio_set_value() similarly overwrite
led->state before pca9532_calcpwm(), pca9532_setpwm(), and pca9532_setled()
succeed, leaving software state out of sync with the hardware registers on
I2C errors.

> @@ -244,8 +296,10 @@ static int pca9532_set_blink(struct led_classdev *le=
d_cdev,
>  	struct pca9532_data *data =3D i2c_get_clientdata(client);
>  	int err;
> =20
> -	if (!data->hw_blink)
> +	if (!data->hw_blink) {
> +		dev_warn(&client->dev, "Blinking not supported on this device\n");
>  		return -EINVAL;
> +	}
> =20
>  	if (*delay_on =3D=3D 0 && *delay_off =3D=3D 0) {
>  		/* led subsystem ask us for a blink rate */
> @@ -254,19 +308,18 @@ static int pca9532_set_blink(struct led_classdev *l=
ed_cdev,
>  	}
> =20
>  	err =3D pca9532_update_hw_blink(led, *delay_on, *delay_off);
> -	if (err)
> +	if (err) {
> +		dev_warn(&client->dev, "Failed to set blink: %d\n", err);
>  		return err;
> +	}
> =20
> -	pca9532_setled(led);
> -
> -	return 0;
> +	return pca9532_setled(led);
>  }

[Severity: Low]
Should these dev_warn() calls in pca9532_update_hw_blink() and
pca9532_set_blink() be dropped?

In led_blink_setup(), a non-zero return from blink_set() is the normal way =
to
decline hardware offload and fall back to software blinking.  Warning when
!data->hw_blink, when the period exceeds the hardware limit, or whenever
pca9532_update_hw_blink() returns -EINVAL floods the kernel log on normal
software-blink fallback (and duplicates the warning already printed by
pca9532_setpwm() on I2C failure), reintroducing the log noise removed by
2aad93b6de0d ("leds: pca9532: Remove irrelevant blink configuration error
message").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114141926.9273=
7-1-t3127430@gmail.com?part=3D1
