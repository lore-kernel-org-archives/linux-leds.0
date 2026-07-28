Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE6429CD0
	for <linux-leds@vger.kernel.org>; Tue, 28 Jul 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237317; cv=none; b=iIzDxmzcH86xEjuvRpnyMADgdxHjZeRZbelJPgJOQ61FgYoEfaZ6enVyJhyraDGRMMvJEK0HgqAN94QPiOCRbX0Qadg9WfPuU/9TuPP3gK99k3JZwU9+6B78NbEfxF2qPeQ9XeZ5iNhg4R1URwyNAgAfWdZxDsUQzZ/wUpfhwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237317; c=relaxed/simple;
	bh=wo+B/BNePAuF33BYNE6evsRMbWzKWdWCnr0IxzNcbjY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XEJTYLpRFcQrWoKlvWpmrtEyfE4fsbPWbTfS6+3y8f8yzYRa2PYKqrUfXh4oCiExgG64AT+/Pmbs/FiRmaZe8mt9AolvFcXVo+FarH3IUdRQeG8PnTgfcK/QsrzCFwVGiqBgujOaSW9oywBl3Fgk8FmuvAKoiIkzW01Fl4/QDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyU7W85g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyU7W85g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BF01F000E9;
	Tue, 28 Jul 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237315;
	bh=VHViln57Fe3nm87wOx4tyQ4rlveAEuw9EMMSqd80b28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyU7W85g1ExWbr5yc09w7QMgo98sxdG1WSefqL+2DgGgwEUKnI6laQiOMXIT7EX4z
	 /WKsBn29/CTPRKd+3CfMsLSh8BrLraJ+uOXmCAH4Sg4n6mUsyxrVHHYVYtLMwK0uPB
	 nKLpUw0Ra3IQ7OCrRqwL8hHCY33YlLdDhhz9smJmlDB0z9p52bL+tEyNfp4cVLWHlI
	 59itAOypPxA+G8ulbpwnSGc9+cswGSY+0kd31sffKH/VmuD9t2OiOZNRXuXXyFqL+v
	 uAtebiCAJJh9Mwr9r0ZuAtq4ayt+AU6nTKGysYFAEye6HG0C/51b0hF2Lb0ofoJbsp
	 6nxZZKVbhuuBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84978D8B519C60DA18A6E3B4C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84978D8B519C60DA18A6E3B4C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 11:15:14 +0000
Message-Id: <20260728111515.04BF01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] State corruption of other active LEDs during blink configuration
- [Medium] Hardcoded maximum brightness in hardware blink setup
- [Medium] Early return on I2C failure leaves hardware in an inconsistent, =
broken state

Pre-existing issues:
- [High] Sleeping function assigned to non-blocking `brightness_set` callba=
ck
- [High] Use-After-Free due to missing reference count on cached `fwnode`
--

--- Patch [1]: [PATCH v4 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit 1ace91a22756ce86eb8f13dd6355ad0a1403ce04
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

This patch implements blink_set() for the st1202 LED driver to enable
hardware-accelerated blinking using the timer trigger. It utilizes the chip=
's
pattern engine to create the blink sequence and clamps user-requested delays
to the supported hardware ranges.

> Other active channels have their PWM slots zeroed for
> both pattern steps so they remain dark rather than outputting unintended
> values when the sequencer runs.

[Severity: High]
Is this description accurate? Looking at st1202_brightness_set(), it appears
steady-ON LEDs are configured with ST1202_PATTERN_PWM_FULL across their
pattern slots, meaning they naturally stay solid-ON when the global sequenc=
er
is running.

Could zeroing out the PWM slots here inadvertently corrupt the hardware
state of other active LEDs, forcing them permanently off until user-space
reconfigures them?

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..4e0128c7c94d4 100644
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
[ ... ]
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
> +		if (ret)
> +			return ret;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If one of these I2C writes fails, we return early and release the mutex. Si=
nce
the sequencer was stopped by the initial ST1202_CONFIG_REG write and PWM
slots for other LEDs might now be partially clobbered, would this error path
leave the chip in a permanently inconsistent state where all active LEDs st=
op
functioning?

> +	}
> +
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_=
PWM_FULL);
> +	if (ret)
> +		return ret;
> +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
> +	if (ret)
> +		return ret;
[ ... ]
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);

[Severity: Medium]
Will writing U8_MAX to the analog brightness register cause hardware blinki=
ng
to always occur at maximum brightness, completely overriding the user's
previously configured brightness level?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);
[ ... ]
> @@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)

[Severity: High]
This isn't a bug introduced by this patch, but looking at st1202_dt_init()
earlier in this function:

    led =3D &chip->leds[reg];
    led->is_active =3D true;
    led->fwnode =3D of_fwnode_handle(child);

Might caching the fwnode pointer here result in a use-after-free later on?
The for_each_available_child_of_node_scoped() iterator automatically drops =
the
device tree node reference at the end of each iteration. If the node is
dynamically removed or memory is freed before devm_led_classdev_register_ex=
t()
uses it, this stale pointer could be accessed.

>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but is there a risk of a "sleeping in atomic
context" panic here?

The LED subsystem requires brightness_set to be strictly non-blocking since
it can be called from software timers or other atomic contexts. Looking at
st1202_brightness_set(), it acquires a mutex and performs I2C transfers whi=
ch
can sleep.

Should this driver rely exclusively on brightness_set_blocking instead?

>  		led->led_cdev.brightness_get =3D st1202_brightness_get;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84978D8B51=
9C60DA18A6E3B4C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
