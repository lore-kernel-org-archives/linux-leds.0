Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C925418A33
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895130; cv=none; b=aurNrtRdnnxVfVKpDYd+kZ8qcVaQlXLvLVXBn091+d+qOxPZTfTax1WImXQDvfDD5djZV0om4qg0gis1tViSXc1yuO5Eg9Vmmh+N8cogaIn/SDOm0/gs33UpJWzpHrUprexLHYnLIfhb8sBrfwtRa3Y/SYvzKCNOu40DBQrffAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895130; c=relaxed/simple;
	bh=dY1SUnNTEvqGhbe0Jto9AZ27VOc79+vHUJmFdqDb2yE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BRI7uv7doZzL+0cXe0mSAxSD7Z+GgOqJudbwFfU+ReW+hSDJI4KdEcfMWm6qfnNXJBSuu7FJfkHcBhOrJAcNpJB7B90n/ByDvpsaqp5yEA+qqSJfU3pghvsC6INQqvu8pvWFHplSUGL3Zh7ZrNofg9TScOIFZ14hubkT8q1h1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+PsnTwU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+PsnTwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764491F000E9;
	Fri, 24 Jul 2026 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784895127;
	bh=dHyJldoSwaKA1Zg2fBWO1BpHRh/AbK1rIe0W9lWRW9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+PsnTwUzJdvPMo3kxhgP4kpq9q4gqN0+svwKGH6OiH8NFFdz0MyJsUFPSRuRy4fe
	 x3MLC6M7Hjkx+Glo37dTCjzuPInSK6+DtjfoOkhb7bHC5BZzUwAOyDN9vZTVMI3Bqo
	 +apJIZK50AkbckDJGEuxl6t58HASV1c1Jzjyv4CjXqEq0/9akIMFrle6LYjllVQlTM
	 yvFTkqjmTELfMtpp+fuBVJQ3k+wFKZekCFi7Gwz3cMpKfvoDnDHhfSMWp7Nlddc6cC
	 lRLNIJ4xQd6ldSW0gn3m8q9iWqRZRFFwzJ/11nRxT8mMdnrCrD54v5eR2MSg6hFo5s
	 nK40eR6cwSy9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 12:12:06 +0000
Message-Id: <20260724121207.764491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] st1202_blink_set() forcibly zeroes out the active PWM pattern slot=
s for all other LEDs, unintentionally destroying the state of independently=
 configured steady-ON LEDs.
- [Medium] st1202_blink_set() ignores the LED's configured brightness and f=
orces the hardware current limit to maximum (U8_MAX).

Pre-existing issues:
- [High] The driver assigns a sleeping function (st1202_brightness_set) to =
the non-blocking led_cdev.brightness_set callback, leading to kernel panics=
 when called from atomic context.
--

--- Patch [1]: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink =
support ---
commit d1f0e631f570c78c507b9a24936dea1d4c6fa4f3
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Add hardware-accelerated blink support

This commit implements blink_set() to enable hardware-accelerated blinking
via the timer trigger on the ST1202 LED controller. It configures the
chip's pattern sequencer to alternate between full brightness and off for
the specified durations.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b7..3600409d4bc25 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -275,6 +276,88 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
[ ... ]
> +	/* Zero out PWM for all other active channels to prevent them from blin=
king */
> +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> +			continue;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 0, LED_OFF);

[Severity: High]
Does this unintentionally destroy the state of other independently configur=
ed
steady-ON LEDs on the same chip? By forcing the PWM pattern slots to 0 for
all other active LEDs, they will be forced dark when the blink sequencer
starts, which seems to break their independent channel operation.

> +		if (ret)
> +			return ret;
> +		ret =3D st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);

[Severity: Medium]
Will this hardcoded maximum current limit (U8_MAX) overwrite the user's
previously configured brightness level? It looks like this ignores the LED's
configured brightness (or led_cdev->blink_brightness) and forces blinking
LEDs to output at 100% hardware intensity.

> +	if (ret)
> +		return ret;
> +
> +	ret =3D __st1202_channel_set(chip, led->led_num, true);
[ ... ]
> @@ -301,6 +384,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set =3D st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear =3D st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger =3D "pattern";
> +		led->led_cdev.blink_set =3D st1202_blink_set;
>  		led->led_cdev.brightness_set =3D st1202_brightness_set;

[Severity: High]
This is a pre-existing issue, but does assigning st1202_brightness_set() to
the non-blocking led_cdev.brightness_set callback risk a kernel panic?

Looking at st1202_brightness_set(), it takes a sleepable mutex:

    guard(mutex)(&chip->lock);

If an atomic trigger (like a software timer or heartbeat) attempts to update
the LED brightness via this callback, which is strictly documented as
non-sleeping, wouldn't it result in a "scheduling while atomic" panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497508C31=
C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1
