Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EF245A2B3
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699802; cv=none; b=RwzYeTyC71onBGTuoGLu05HGItS3OPhvNxBRW8fRNABJpd4hvwz6ajrC+xVtx3LF1r9uvN1PlVxNdi9bKMW1RteFeooCNRVWZCq+LCsEaade+njvrvtctktMtMOjTSyAvMjW6wOo8lTOrI+ROVmKT8HZ2j+gpcHhqQBrheYbmQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699802; c=relaxed/simple;
	bh=nUWkMxvaXU5fUBppJS5BRsf7eFFLqebCT3DC0izhAyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sUBmob+0Fbl2qr7G2j5IUWdQcBxziQ1CqKXbSGpL7d3ib/J7kUtNcwDjP97JxRBXIaw9D3afhILeNLR4xhmSj2I3VNQplyuyeXxnN8AAHAgjF3HIOpDXkHBRjbYWqb9lkdJcqrQZ5fU4tZXGx5CXYgdCpJtArrMvEiQjjzuL+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOthTVdY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOthTVdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4191F00A3D;
	Fri, 14 Aug 2026 09:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786699801;
	bh=V3RAJXc4hSDMzw7tMZOyGULX4QZcKz0XrX+2qaCQbWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hOthTVdYwVG/TCgDNTBr4VQJpKw9adkKOgPDJSwQUJPZHUsuOvFDU3Mbr85M5m7G5
	 uZ02G5wf6a1aKm/6t1QswLJHwvKdD6BmHP1j3DcnyUvJMlaB8rzmaC7uT+yyFmNyuh
	 fGYHqHQ8U/oEP3zaViEsIQkacOz7l7ARkKjy8MhlPgyRDrGqNsEf1vZDe/6sGxnrsb
	 mkgb1OVcJyfv96CtLqENX96fJm4wC/+r9Xa81+7D6eDP8WnsKDaqS+bHhYyYym2htc
	 509L69RpfgfVH4rUo5C+fc9UfmCdcbZm5wHdsyGWpPQJz5wsE6IWtvaH2ieHhvYvc6
	 Rq2mRbvjaPZwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 09:30:00 +0000
Message-Id: <20260814093000.9E4191F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] st1202_blink_set alters the hardware state of sibling LED channels=
 by zeroing out their PWM configurations, permanently turning off solid-ON =
LEDs and desynchronizing their physical state from the LED subsystem.
- [High] Hardware blink implementation incorrectly intercepts 0-delay value=
s, breaking timer trigger off/on states.
- [Medium] st1202_blink_set hardcodes maximum brightness, completely ignori=
ng the user's requested blink brightness.

Pre-existing issues:
- [High] st1202_brightness_set is incorrectly assigned to the non-blocking =
brightness_set callback, violating the atomic context requirement.
--

--- Patch [1]: [PATCH v7 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit 88e3d78cc1a73cce68a7f3ccf668fb1f654b398e
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

This commit implements blink_set() to enable hardware-accelerated blinking
using the LED1202 pattern engine. Requested delays are clamped to hardware
ranges, and active channels have their PWM slots zeroed to prevent unintend=
ed
blinking when the sequencer runs.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..ead1441558497 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c

[ ... ]

> +static int st1202_blink_set(struct led_classdev *led_cdev,
> +			unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip =3D led->chip;
> +	unsigned long on, off;
> +	int ret;
> +
> +	if (!*delay_on)
> +		*delay_on =3D ST1202_BLINK_DEFAULT_DELAY;
> +	if (!*delay_off)
> +		*delay_off =3D ST1202_BLINK_DEFAULT_DELAY;

[Severity: High]
By silently overriding a requested zero delay to 500ms and returning succes=
s,
does this break the core's fallback contract?

When a user requests a steady state via the timer trigger, the core expects
the driver to return -EINVAL if it cannot natively support the zero-delay
condition. This expectation allows a software fallback via
led_set_software_blink().

> +
> +	on =3D *delay_on;

[ ... ]

> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int chan =3D 0; chan < ST1202_MAX_LEDS; chan++) {
> +		if (!chip->leds[chan].is_active || chan =3D=3D led->led_num)
> +			continue;
> +
> +		ret =3D st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D st1202_pwm_pattern_write(chip, chan, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}

[Severity: High]
Does this loop permanently turn off solid-ON sibling LEDs and desynchronize
their physical state from the LED subsystem?

The original PWM states of these independent channels are destructed here
without being tracked or restored later.

> +
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_=
PWM_FULL);

[ ... ]

> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does this unconditionally hardcode the blink setting to maximum intensity?

This appears to completely ignore the user-configured led_cdev->blink_brigh=
tness
or fallback led_cdev->brightness states.

> +
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);

[ ... ]

> @@ -301,6 +389,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but can this cause 'scheduling while atomic'
panics?

By assigning st1202_brightness_set() to the non-blocking brightness_set
callback, the LED core will invoke it directly from softirq/timer contexts.

Since st1202_brightness_set() performs sleeping I2C transfers and
immediately calls:

st1202_brightness_set()
    guard(mutex)(&chip->lock);

is this safe to run in an atomic context, or should this be mapped to
brightness_set_blocking instead?

>  		led->led_cdev.brightness_get =3D st1202_brightness_get;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84973F79E8=
71176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
