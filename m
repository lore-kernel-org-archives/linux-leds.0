Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909036;
	b=a9orbibFeiSABka9vB7Lu9XBoRDPFaBCOZwGmA8UGqdo5nWkWATWk+qTlNp+chixBsQS
	 tk5EJkjGUuRz3tmF85sLNTtE4T6CxQztkHOI8KJt44NMUdUG4ltxNjHWZiR8ANIxzXg8Z
	 GVdqWEA6QFcTfQo8jk0gAMsMoSZ1TcDFwFJpZpt+wOEr6iOPFVi/gnfXpOyLj7bpQ0Z4v
	 9YAa5M68BonhcgqTaEio3WfEwpCntR9YE3UtIY0vj4c3BgdUDF6bOL1Ww3NQoNaD9W7ru
	 WzmLOUkzpgZotqLrAWdox9YFi4iRhORJtdXH+I6ZECoXbArx744/M42uDppk5s/qHnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909036;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QvpCjy4EEIFquFZTvE4EbfcVt0taNTxD+5YOWag/6zA=;
	b=b2/0QGQBcn/Jsa1rcktfdpwdHf4JX1nMpx+Y/AQRx/JT0pqFvrXgEP6S7pYqnP/jq9Ye
	 ZvPGvuIBMdJ1OJYqFBxUiS1+AdLK+tHArMiSGMQcrfshm5sBz6ae+NgBQiqToX0t9ocw2
	 3nmimpShKb+aqV4cDACyV3CqYW15XYORcKzPtM9Wtoi/IfovAFd+0jTaCj0oVhkQiCn/+
	 V0+925dgBi7vB66mw6LWdYIk/n33xfkkAEfpxXcStQp6u6D4+3Waev8bf9yBFanNbSv2A
	 2F7UJT/KAm6Viu+JhH2SA02m+CTmkmabCISR6bX3hymg0tL+yAQrMOyktpvBRMqNuvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pm60ej+6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12816606A32F
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pm60ej+6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650BE1F000C4;
	Tue, 17 Nov 2026 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909035;
	bh=QvpCjy4EEIFquFZTvE4EbfcVt0taNTxD+5YOWag/6zA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pm60ej+6OHNiodCETmBmnsDbSVcIlS50iKusBPxUTrLMLUiDl8VB1Rx5cRZ8PT95j
	 9pJpSzRP+OYrSYDWP5Ge+hDnmzoj9slg0f3eqby1h8sXX9c6H6E2a/S1zA3ILFK9QA
	 ZlYnyvpl5tqeoVCirmBS8AgFTwtY3fcogR9GWgiVr+OuMJfllUJNm7NYhgRw7zPnPu
	 g2/xr+RC+KMpDUQ4/ktmg7WArNI9L6Ky6Sl7t0AH7DXRVT1ejiwm5vMbKa+V0R6OWV
	 kHY+ydRthuYrEeJshaOzt7AFYQFF7J8jyjEe0KfPYz3tArrr3VeF+fnwzd0tFt2eFR
	 DgR1QodHkRALw==
Message-ID: <sashiko-outbox-218529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] leds: rgb: leds-qcom-lpg: Fix LED color balancing
 in HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-2-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
 <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-2-7a862240683f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:50:34 +0000
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
- [High] leds: qcom-lpg: unupdated brightness in lpg_pattern_mc_set()
  stops pattern
- [Medium] leds: qcom-lpg: lpg_pattern_mc_update() scales LUTs by
  intensity not brightness
--

commit a4d32f1ef168124af51072d5038cd7e0df021524
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode

This commit scales multicolor hardware patterns per LPG channel and caches
the normalized pattern so per-channel LUTs can be rebuilt when brightness
or multi_intensity changes.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index e14a3316bf221..175b3680766f1 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
[ ... ]
> @@ -876,18 +900,25 @@ static int lpg_brightness_single_set(struct led_cla=
ssdev *cdev,
>  	return 0;
>  }
> =20
> +static int lpg_pattern_mc_update(struct lpg_led *led);
> +
>  static int lpg_brightness_mc_set(struct led_classdev *cdev,
>  				 enum led_brightness value)
>  {
>  	struct led_classdev_mc *mc =3D lcdev_to_mccdev(cdev);
>  	struct lpg_led *led =3D container_of(mc, struct lpg_led, mcdev);
> +	int ret =3D 0;
> =20
> -	mutex_lock(&led->lpg->lock);
> +	guard(mutex)(&led->lpg->lock);
> =20
>  	led_mc_calc_color_components(mc, value);
> -	lpg_brightness_set(led, cdev, mc->subled_info);
> +	if (led->pattern.len) {
> +		ret =3D lpg_pattern_mc_update(led);
> +		if (ret)
> +			return ret;
> +	}
> =20
> -	mutex_unlock(&led->lpg->lock);
> +	lpg_brightness_set(led, cdev, mc->subled_info);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -1152,24 +1197,133 @@ static int lpg_pattern_single_set(struct led_cla=
ssdev *cdev,
[ ... ]
> +/* Caller must hold lpg->lock. */
> +static int lpg_pattern_mc_update(struct lpg_led *led)
> +{
> +	struct led_classdev_mc *mc =3D &led->mcdev;
> +	struct led_classdev *cdev =3D &mc->led_cdev;
> +	struct lpg_pattern *pattern =3D &led->pattern;
> +	struct led_pattern *scaled =3D led->scaled_pattern;
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_channel *chan;
> +	unsigned int lo_idx, hi_idx;
> +	unsigned int i, j;
> +	int ret;
> +
> +	ret =3D lpg_pattern_stop(led);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < led->num_channels; i++)
> +		lpg_lut_free(led->channels[i]);
> +
> +	/* Rebuild each channel from the unscaled pattern and current intensity=
. */
> +	for (i =3D 0; i < led->num_channels; i++) {
> +		chan =3D led->channels[i];
> +		if (!mc->subled_info[i].brightness)
> +			continue;
> +
> +		for (j =3D 0; j < pattern->len; j++) {
> +			scaled[j].brightness =3D DIV_ROUND_CLOSEST(
> +				(u32)pattern->data[j].brightness * mc->subled_info[i].intensity,
> +				cdev->max_brightness);
> +			scaled[j].delta_t =3D pattern->data[j].delta_t;
> +		}

[Severity: Medium]
Should scaled[j].brightness multiply by mc->subled_info[i].brightness
instead of mc->subled_info[i].intensity?

When lpg_brightness_mc_set() runs, led_mc_calc_color_components() stores
the brightness-adjusted channel values in mc->subled_info[i].brightness,
leaving mc->subled_info[i].intensity unchanged.  Using .intensity here
means changing brightness while a pattern is active never scales the
programmed LUT values; instead, channels stay at full intensity until
mc->subled_info[i].brightness rounds down to 0 and abruptly shuts the
channel off, skewing the color balance.

[ ... ]
> +static int lpg_pattern_mc_set(struct led_classdev *cdev,
> +			      struct led_pattern *led_pattern, u32 len,
> +			      int repeat)
> +{
> +	struct led_classdev_mc *mc =3D lcdev_to_mccdev(cdev);
> +	struct lpg_led *led =3D container_of(mc, struct lpg_led, mcdev);
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_pattern pattern;
> +	int ret;
> +
> +	ret =3D lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
>  	if (ret < 0)
>  		return ret;
> =20
> +	struct led_pattern *prep_data __free(kfree) =3D pattern.data;
> +
> +	if (pattern.len > lpg->lut_size)
> +		return -EINVAL;
> +
> +	guard(mutex)(&lpg->lock);
> +
> +	memcpy(led->pattern.data, prep_data, pattern.len * sizeof(*prep_data));
> +	pattern.data =3D led->pattern.data;
> +	led->pattern =3D pattern;
> +	led->pattern_oneshot =3D repeat !=3D -1;
> +
>  	led_mc_calc_color_components(mc, LED_FULL);
> +	ret =3D lpg_pattern_mc_update(led);
> +	if (ret) {
> +		led->pattern.len =3D 0;
> +		return ret;
> +	}
> +
>  	lpg_brightness_set(led, cdev, mc->subled_info);
> =20
>  	return 0;
>  }

[Severity: High]
Does leaving cdev->brightness at 0 in lpg_pattern_mc_set() cause a later
multi_intensity write to stop the running pattern?

cdev->brightness is set to 0 when the pattern trigger activates (or at
probe when default-state is not "on"), and pattern_trig_start_pattern() ->
lpg_pattern_mc_set() never updates it.  If userspace then writes to
multi_intensity while the pattern is running, multi_intensity_store()
calls led_set_brightness(cdev, cdev->brightness) with 0, which invokes
lpg_brightness_mc_set(cdev, 0), zeroes every mc->subled_info[i].brightness,
frees all per-channel LUTs in lpg_pattern_mc_update(), and disables all
channels.

Also, on LUT-backed LPG hardware where cdev->max_brightness is 511
(LPG_RESOLUTION_9BIT - 1), passing LED_FULL (255) instead of
cdev->max_brightness to led_mc_calc_color_components() rounds
mc->subled_info[i].brightness down to 0 when intensity is 1, leaving that
channel disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-led-qcom-l=
eds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com?pa=
rt=3D2
