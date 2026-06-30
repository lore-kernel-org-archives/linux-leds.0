Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97122367DF
	for <linux-leds@vger.kernel.org>; Tue, 30 Jun 2026 03:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782790458; cv=none; b=Hqbh84ZRxAoOi7Yib7IlUcK7qCA3rNUEAopuXN9RcZ8gfdCo9BHSPVADBE17NsPRPqTglyN9XuBf30s/vbKsXWhgSrSf9Vxw6SlYkV5Jhn2DyXrODoXgwupbGJe6OtZ+DNKm2JJ4lM9mhypiAkYNPQbMK+zlKW3NEafIun53lY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782790458; c=relaxed/simple;
	bh=PKjhT1GKZUoXtK7kbvzx7x3cvw3Ar1S0UgWF1/Xm8Ew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IZBbvtN48SvyV5w5RDlEONDF5DR8CA8gN/jk65pgyTaBKXZhnEpLGD2pbWYqlHIKslGUX/I4DULheRS1Ok2C0xhgNSX2OS/3UB1aWW1X8N3YyGzJlYN6zC9X1+UxFl2ZGCJg5jnfl3RRtblqkRE94Qp66YNaag4RSbQ+pAwITNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVK68BKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVK68BKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4406E1F00A3A;
	Tue, 30 Jun 2026 03:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782790456;
	bh=REWCmAwa1TCCnZ4U2CTO15EeCnuu5ScAilqKl1KdrgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZVK68BKQSTNvQtWJ6TEEvSKPnOwgDHd0V79AicWqoov6Xcahatt7uq8absfBeYA7R
	 +bNdUQPKaYDNXbokrR5TUT7G/d8Vos3vrYpn3VmIkfl/UDjbr/S5llqF6QYFAY3Nv+
	 it0N33DlJBKvJ9RSNiq4nKPUwZeWblm7ItEj4yN+U8yBusx9NR1O/Eyfu/2iqQdNKO
	 fAkG0cZBQCQWPRkfxrd8tXCsk8xC3KIcv1dR9CPKjb/tRQzZUwFjme6fmOzIlU78Wf
	 buVxxj1JKk5QDbfhAy0otF3IgrkDK8ms+FUkoGYy//G1JoGHY2suJ1a0bMA/mTXkSl
	 scs4VGDB5ypGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
References: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 03:34:15 +0000
Message-Id: <20260630033416.4406E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-after-free and double-free of LED pattern data due to missing =
ownership transfer
- [Medium] Subsystem guidelines violation: mixing goto and scope-based clea=
nup
--

commit 902ea70efa572e9fe23362e3de394a74dc4bce83
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

    leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
   =20
    Currently, when the LED is configured as a RGB LED or a multi-color
    LED device, the same pattern is programmed for all LED channels
    regardless of the sub-led intensities when triggered by HW pattern.
    It results that the LED device is always working in a white-balanced
    mode regardless of the intensity settings.
   =20
    To fix this, scale the pattern data according to the sub-led intensity
    and program the HW pattern separately for each LPG channel.

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index d7d6518de30f2..e407742ec3b31 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c

[ ... ]

> @@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, st=
ruct led_pattern *led_pattern,
>  	if (len % 2)
>  		return -EINVAL;
> =20
> -	pattern =3D kzalloc_objs(*pattern, len / 2);
> +	struct led_pattern *pattern __free(kfree) =3D kzalloc_objs(*pattern, le=
n / 2);
> +
>  	if (!pattern)
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < len; i +=3D 2) {

[ ... ]

>  	if (lpg->lut_base || lpg->lut_sdam) {
> -		lo_pause =3D pattern[0].delta_t;
> -		hi_pause =3D pattern[actual_len - 1].delta_t;
> +		prep->lo_pause =3D pattern[0].delta_t;
> +		prep->hi_pause =3D pattern[actual_len - 1].delta_t;
>  	} else {
>  		if (delta_t !=3D pattern[0].delta_t || delta_t !=3D pattern[actual_len=
 - 1].delta_t)
> -			goto out_free_pattern;
> +			return -EINVAL;
> +		prep->lo_pause =3D 0;
> +		prep->hi_pause =3D 0;
>  	}
> =20
> +	prep->data =3D pattern;
> +	prep->len =3D actual_len;
> +	prep->delta_t =3D delta_t;
> +	prep->ping_pong =3D ping_pong;
> =20
> -	mutex_lock(&lpg->lock);
> +	return 0;
> +}

[Severity: High]
Does this code inadvertently free the pattern buffer? Since pattern was
allocated with the __free(kfree) attribute, it will be automatically freed
upon returning from lpg_prepare_pattern(). The caller receives a dangling
pointer in prep->data. Should this use no_free_ptr(pattern) to transfer
ownership to the lpg_pattern structure?

> +
> +static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_=
pattern,
> +			   u32 len, int repeat)
> +{
> +	struct lpg_channel *chan;
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_pattern pattern;
> +	unsigned int lo_idx;
> +	unsigned int hi_idx;
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&lpg->lock);
> =20
>  	if (lpg->lut_base)
> -		ret =3D lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> +		ret =3D lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx=
);
>  	else
> -		ret =3D lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> +		ret =3D lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &h=
i_idx);
> =20
>  	if (ret < 0)
> -		goto out_unlock;
> +		goto free_pattern;

[Severity: Medium]
Is it okay to mix guard(mutex) and goto-based error handling in the same
function? The subsystem guidelines for cleanup recommend converting all
resources in a function to scope-based cleanup or converting none of them,
as mixing the two approaches creates confusing ownership semantics.

[ ... ]

> -out_unlock:
> -	mutex_unlock(&lpg->lock);
> -out_free_pattern:
> -	kfree(pattern);
> -
> +free_pattern:
> +	kfree(pattern.data);

[Severity: High]
Will this result in a double-free? If pattern.data was already freed when
lpg_prepare_pattern() returned due to the __free() attribute, calling
kfree() here on the same pointer could lead to memory corruption.

>  	return ret;
>  }

[ ... ]

>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
> -			      struct led_pattern *pattern, u32 len,
> +			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
>  {
>  	struct led_classdev_mc *mc =3D lcdev_to_mccdev(cdev);
>  	struct lpg_led *led =3D container_of(mc, struct lpg_led, mcdev);
> +	struct lpg *lpg =3D led->lpg;
> +	struct lpg_channel *chan;
> +	struct lpg_pattern pattern;
>  	unsigned int triled_mask =3D 0;
> -	int ret, i;
> +	unsigned int lo_idx;
> +	unsigned int hi_idx;
> +	unsigned int scale;
> +	unsigned int i, j;
> +	int ret;
> +
> +	ret =3D lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Allocate buffer for the per-channel scaled pattern copy */
> +	struct led_pattern *scaled __free(kfree) =3D
> +			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
> +	if (!scaled) {
> +		kfree(pattern.data);
> +		return -ENOMEM;
> +	}
> =20
>  	for (i =3D 0; i < led->num_channels; i++)
>  		triled_mask |=3D led->channels[i]->triled_mask;
> -	triled_set(led->lpg, triled_mask, 0);
> +	triled_set(lpg, triled_mask, 0);
> =20
> -	ret =3D lpg_pattern_set(led, pattern, len, repeat);
> +	led_mc_calc_color_components(mc, LED_FULL);
> +
> +	/*
> +	 * Each channel gets its own LUT block scaled by subled_info[i].brightn=
ess
> +	 * so the pattern respects the configured colour balance.
> +	 */
> +	guard(mutex)(&lpg->lock);

[Severity: Medium]
This function also mixes __free(kfree), guard(mutex) and goto-based
cleanup labels. Does this violate the subsystem cleanup guidelines?

> +
> +	for (i =3D 0; i < led->num_channels; i++) {
> +		chan =3D led->channels[i];
> +		scale =3D mc->subled_info[i].brightness;
> +
> +		for (j =3D 0; j < pattern.len; j++) {
> +			scaled[j].brightness =3D DIV_ROUND_CLOSEST(
> +				(u32)pattern.data[j].brightness * scale, LED_FULL);

[Severity: High]
Could this result in a use-after-free? Because lpg_prepare_pattern() uses
scope-based cleanup on the pattern buffer without transferring ownership,
the memory backing pattern.data is already freed by the time we attempt to
read its contents here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-lpg-rgb-co=
lor-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com?part=3D1
