Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C862403AE0
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846465; cv=none; b=Wqo4ipIj/weeKyT65qTjHCXIOQ+axpM09AThFlCtqd4GpvKyOif1SJx46n4aXZ2L8dC2OfUCs3Uyr1lMChr0ACMZj4RFKoF+4ti/hQlDjWWNrza+dINah1vUWGpHyDn16T8GucGNWnDwHVVoSHnhlxBSnoHMRPiPQQuK/kUESAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846465; c=relaxed/simple;
	bh=aiAtBwwjlW0+QODgBAKJRNgraLIxZ/dRH6YULfElX88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iQ3KEQjTzM65ryLqZ/YD3psWxxO8hCrfZZcPtnwGOWnmDMWOIhYyzTU2k599hszbGBp+6gPXUJoawRsFNzLvXi5LPiPMWrt+hv+sxrVRNBZcaex7WCQwn9LlJZLIqxeEJWrBJY/FvsqO4TUehxdkr+yL4by9frjcavBZW4jkOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6vlb4ZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6vlb4ZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC83A1F000E9;
	Thu, 23 Jul 2026 22:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784846464;
	bh=TwwmH+HiQE+yd01GbJYUy/g+y/D7iu7RMChFSSz5Wgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6vlb4ZL0RrZWcIO96OV70xha5QUoxwGUDGc4qpw381elqu/lixbGg4XSCBKdaeip
	 5faPjZScLenS/M0vjuBiBzCkCUjiYlr1wcuhporvUnM6tgpgbLuXubtVTfX76i/eVa
	 901pIv93Wa7j7z47P9opHCDhA20iF9xRDLWhejrF/D6R9VRRL6AkQLo8uycZxLXd4O
	 FViBzJ+B1UnT5A3LqF2fwX1yzu9HTC9oxpgZshfyeze4grpjOiUt2KB/UKImwXJq5k
	 yz9Swik97FSrA7YB73X0BQLcSPseGSMsjahdi+shV/5OTfAia7EDPqlDPs7XuQ/1tJ
	 lbPL/IfEd52/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497BAA7ABE9F424FD6B6153C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497BAA7ABE9F424FD6B6153C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 22:41:03 +0000
Message-Id: <20260723224103.DC83A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] `st1202_blink_set` breaks all other active LEDs by destructively z=
eroing their PWM registers and clobbering global sequencer durations.
- [Medium] `st1202_blink_set` unconditionally forces maximum brightness, ig=
noring the user's configured brightness level.
- [Medium] Arithmetic overflow in delay calculations leads to clamping extr=
emely large delays to the minimum duration instead of the maximum.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the driver incor=
rectly registers a sleeping function (`st1202_brightness_set`) as the non-b=
locking `brightness_set` callback, leading to 'scheduling while atomic' pan=
ics.
--

--- Patch [1]: [PATCH v2 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit 0c45ca2d77a60a4118919a5f1d1afac3386caf4b
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..fff42fc164412 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c

[ ... ]

> @@ -275,6 +276,86 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  	return 0;
>  }
> =20
> +static int st1202_blink_set(struct led_classdev *led_cdev,
> +			unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct st1202_led *led =3D cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip =3D led->chip;
> +	unsigned long on, off;
> +	int ret;
> +
> +	on =3D *delay_on ?: ST1202_BLINK_DEFAULT_DELAY;
> +	off =3D *delay_off ?: ST1202_BLINK_DEFAULT_DELAY;
> +
> +	on =3D roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> +	off =3D roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);

[Severity: Medium]
Will this cause an integer overflow if userspace provides a very large delay
near ULONG_MAX for delay_on or delay_off?

The roundup() macro performs an addition of the value and the divisor minus
one. If the delay is extremely large, this addition can wrap around to a
small number, which then mathematically rounds to 0.

The subsequent clamp_val() will then erroneously clamp this 0 to the minimum
hardware delay (22ms) instead of the maximum.

Should the inputs be clamped before rounding?

> +	on =3D clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTE=
RN_DUR_MAX);
> +	off =3D clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PAT=
TERN_DUR_MAX);
> +
> +	guard(mutex)(&chip->lock);
> +
> +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
> +	if (ret)
> +		return ret;
> +
> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> +			continue;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 0, LED_OFF);

[Severity: High]
Does this inadvertently break independent channels that are configured to be
solid-ON?

This blindly zeroes the PWM slots of all other active LEDs. Since the
hardware sequencer is global, when it runs for the blinking LED, it applies
the 0 PWM to the solid-ON LEDs during steps 0 and 1, forcing them dark.

[ ... ]

> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR,
> +				st1202_prescalar_to_miliseconds(on));
> +	if (ret)
> +		return ret;
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
> +				st1202_prescalar_to_miliseconds(off));
> +	if (ret)
> +		return ret;
> +
> +	for (int patt =3D 2; patt < ST1202_MAX_PATTERNS; patt++) {
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);

[Severity: High]
Are global duration registers unconditionally overwritten here without
tracking sequencer ownership or concurrency?

[ ... ]

> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);

[Severity: Medium]
Is this bypassing and corrupting the subsystem's tracked brightness state?

This unconditionally forces maximum brightness by writing U8_MAX to the
ST1202_ILED_REG0 register, completely ignoring any user's previously
configured brightness level.

Furthermore, since st1202_brightness_get() reads directly from this registe=
r,
does this permanently corrupt the internal sysfs state if the user had
configured a lower brightness before activating the blink trigger?

[ ... ]

> @@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but does assigning st1202_brightness_set to t=
he
non-blocking brightness_set callback lead to scheduling while atomic panics?

The LED subsystem expects brightness_set to never sleep, calling it directly
from atomic softirq contexts for software-based timer triggers.=20

Because st1202_brightness_set() acquires a mutex and performs I2C writes, it
will sleep in an atomic context.

Should this driver leave brightness_set unassigned and rely solely on
brightness_set_blocking to safely defer writes to a workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497BAA7AB=
E9F424FD6B6153C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
