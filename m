Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896676;
	b=LcfbWNC7teYMuRJ4YbeYmgd43HCBby4vn52BXQv7CE83AdnJSFykQw0CmqBreXV21yt7
	 oeMp02GezgTzRmtEeE//xRCIv0cleGM5gNTMMOrahqVWdtuMfRC4JTVIQehKI1k+9vLM0
	 fshckS3StW5Jkkel4fZSLFEqyst1Cq/T57mb5nkEfAndd1AzYjjmrN6kpHMGD3UZ22m8e
	 JDmwcqJknzCyC8RASEdz4qfVsXWP7gg45lj7ddzwAZupYwFok5dq6zyNPvDjOV6irQhhD
	 VmJXy755opJ6GgV/QY8Iyi5oLDgDnei3izKpccxtSLVMD4wUGqzVrtQTMPWcdu/bqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896676;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h0dLpP4FIJcw/z8/ZgWTqrMO/HmWiIwp1l+S+/ygJLA=;
	b=fHkCP3TLynX5TS9PQ3Qi+pS+OZAx/dzCo55nbHJB/sF2gCVbSZbIkYSKtin0vuU5ws51
	 yLs1lP6NZ0ZbarkS1hPRMaYzLpNi84tyQQOYPQA7TsrVpjxq2OeUF+KL3dAGS9sx8F5rI
	 VGnV4siHPzWQ7FRTMrJcWehN26rsZQsToiyb3OoGPJhyodlckZQdgNOUn8k10ZliwyoGk
	 sfLpZS57n5gsNh4OOvDlriBW1WGRlc3qt4Hxi8k18gb+oIy0++q1Tv5BcyBdHriaAYR6U
	 qk9nPn0wfw3qchYtb6iggaY8ATlYZn0B7tpiMMw+vvwLVsfKL+yYV47GGvGWaBgyUHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFmEMV5a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83C606A33B;
	Tue, 17 Nov 2026 06:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFmEMV5a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA561F000C4;
	Tue, 17 Nov 2026 06:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794896675;
	bh=h0dLpP4FIJcw/z8/ZgWTqrMO/HmWiIwp1l+S+/ygJLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFmEMV5avfWMxiFR/gLxPK+d+MiKsMzXtKj8H1nAw5cZM7lWzBIazn7EiZ9GOBKZ+
	 Pyq6mSLFhnuBzYb4vNYPPm2L2qN1+kgCeazqW9jo+EwRTuZAti1wQaSxpud+ckiKBh
	 SlbYAeQrqIcFYLk3qtehys453R3aphtjbSukdJZAJA3F2TXMoiN4iQbbg1rRdD1/xM
	 7l0JDLYg9OsFCHKxnxFIdsx6D8f4uDI78lcJE/uaVpUFDXnU8os64+zH6OVwsZKzqF
	 0sM4d9syjjJHG9V9YQPwzTTVeuKA6lTGN5HRXVF13FDApgzlMs8545eP0ErJEqEGDB
	 j53Fw1dikXvkg==
Message-ID: <sashiko-outbox-218250@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>, linux-leds@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117060002.3752-1-t3127430@gmail.com>
References: <20261117060002.3752-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 06:24:35 +0000
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
- [Medium] leds: pca9532: software blink fallback broken in
  pca9532_set_blink()
--

commit 68a4ebaa5c8871e0f2cc482a8a248aba7009e6bc
Author: Daniil Demakov <t3127430@gmail.com>

leds: pca9532: Propagate I2C errors

This commit checks SMBus read and write return values across LED, PWM,
blink, GPIO, and probe paths in leds-pca9532, restoring previous state on
failure and serializing shared state updates under update_lock.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c8085427696ff..19b993d9ac9f5 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c

[ ... ]

> @@ -144,68 +148,147 @@ static int pca9532_calcpwm(struct i2c_client *clie=
nt, int pwm, int blink,

[ ... ]

>  static int pca9532_set_brightness(struct led_classdev *led_cdev,
> -	enum led_brightness value)
> +				  enum led_brightness value)
>  {
> -	int err =3D 0;
>  	struct pca9532_led *led =3D ldev_to_led(led_cdev);
> +	struct pca9532_data *data =3D i2c_get_clientdata(led->client);
> +	int old_state;
> +	u8 old_pwm;
> +	u8 old_psc;
> +	bool pwm_updated =3D false;
> +	int restore_err;
> +	int err =3D 0;
> +
> +	mutex_lock(&data->update_lock);
> +	old_state =3D led->state;
> +	old_pwm =3D data->pwm[PCA9532_PWM_ID_0];
> +	old_psc =3D data->psc[PCA9532_PWM_ID_0];
> =20
>  	if (value =3D=3D LED_OFF) {
>  		led->state =3D PCA9532_OFF;
>  	} else if (led->state =3D=3D PCA9532_PWM1) {
> -		return 0; /* Non-zero brightness shall not stop HW blinking */
> +		goto out;
>  	} else if (value =3D=3D LED_FULL) {

[ ... ]

> @@ -223,29 +306,64 @@ static int pca9532_update_hw_blink(struct pca9532_l=
ed *led,
>  		}
>  	}
> =20
> -	psc =3D ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> -	if (psc > U8_MAX) {
> -		/* Blink period too long to be handled by hardware */
> +	if (delay_on > ULONG_MAX - delay_off)
>  		return -EINVAL;
> +
> +	period =3D delay_on + delay_off;
> +
> +	if (!delay_on || !delay_off)
> +		return -EINVAL;
> +
> +	if (period > ((U8_MAX + 1) * 1000) /
> +		     PCA9532_PWM_PERIOD_DIV)
> +		return -EINVAL;

[ ... ]

> @@ -255,26 +373,47 @@ static int pca9532_set_blink(struct led_classdev *l=
ed_cdev,
> =20
>  	err =3D pca9532_update_hw_blink(led, *delay_on, *delay_off);
>  	if (err)
> -		return err;
> +		goto restore_state;
> +
> +	err =3D __pca9532_setled(led);
> +	if (err < 0) {
> +		led->state =3D old_state;
> +		data->pwm[PCA9532_PWM_ID_1] =3D old_pwm;
> +		data->psc[PCA9532_PWM_ID_1] =3D old_psc;
> +
> +		restore_err =3D __pca9532_setpwm(client, PCA9532_PWM_ID_1);
> +		if (restore_err < 0)
> +			dev_warn(&client->dev,
> +				 "Failed to restore PWM settings: %d\n",
> +				 restore_err);
> +	}
> =20
> -	pca9532_setled(led);
> +	goto out;
> =20
> -	return 0;
> +restore_state:
> +	led->state =3D old_state;
> +out:
> +	mutex_unlock(&data->update_lock);
> +	return err;
>  }

[Severity: Medium]
Does returning -EINVAL from pca9532_set_blink() while leaving led->state set
to PCA9532_PWM1 break the fallback to software blinking?

When an LED is already hardware blinking (led->state =3D=3D PCA9532_PWM1) a=
nd
is reconfigured with delays rejected by pca9532_update_hw_blink() (such as
setting delay_off to 0 under the timer trigger, which this patch now rejects
with -EINVAL, or a period longer than the hardware limit), led_blink_setup()
falls back to led_set_software_blink().  For delay_off =3D=3D 0,
led_set_software_blink() calls led_set_brightness_nosleep(led_cdev,
led_cdev->blink_brightness) to turn the LED steady on, and for software
timer blinking, led_timer_function() alternates brightness between 0 and
blink_brightness.  However, pca9532_set_brightness() ignores all non-zero
brightness values while led->state is PCA9532_PWM1, so the LED stays
hardware-blinking at the old PWM1 rate or fails to turn on during software
blink on-phases.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117060002.3752=
-1-t3127430@gmail.com?part=3D1
