Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA085340281
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253555; cv=none; b=O7IIoO9gxxXzqFd9lqGAHjrjxORaU8w+jh5mWvrAsCbiNYvfIpe7NYjNxEzLFh1GRR1E7eIjFIanXhsxG+kVSeNil91t4L9v4vWpeFr//SWlU/IbxvHAi8ZQSBUCV5TPZoTGx/z/bC3Y6KFcHWX8gbDnjqz+BsGhg4wdaCl0OQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253555; c=relaxed/simple;
	bh=r4mOz+KY72YvWc0VveC+yv/UbTMgJ01ZWuXsAksrTJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U5fvsIxgjCW+ISKU5yacFmMdwUp8/3t7MD7vBC5zW5gNDp0Od2AQCQgGbXx0euL2EmvbS4pNA4/KE0+DfzUHj1Xl7On/hwzJDufWi1Yhaj2F0PZzhnk9SX803wx6C4rq9AqjvLx7E1npeT5o/vAXhlY9f+0u3lWvzypnMuqHtH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNGXXrjl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNGXXrjl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7995D1F000FF;
	Sat, 12 Sep 2026 22:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253554;
	bh=/FdbjGBj/FgUJWBbHfP0g563FPo+ovfvrTX9Gvw0Axk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNGXXrjlOessi+poNRuhZzl4TC2Cg7+cY9BJDXiLWf2ymYo1x+b3xKwUVmbxL/Ycb
	 cd6RtroPhXf62egHAaMyEcfpcTCfEVpbsjoaCZJZ8SFb51K87dG81pNDi6OAbC168E
	 fVHxmvPKCmxt8hVREdQpD1sQc2bbnPsHGABxRwSN2/fQbknUfB7h/Aq+K7OfR7Swl9
	 4/X46dr7GbLZcb2ISEl0ufHgRuux6dW6rTVAuo/stjJUjrQVcR18X7p0SB3TKExHdy
	 JpdZ5hq8AYP/V/7wB70V9bLDTMSKLS7NVMh/KfF9IE7BFNpuWoOkeMh65Tx2OWO02S
	 ktMUYbfIJVhXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/11] leds: st1202: Clear unused pattern slots in
 pattern_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB84973A1571DF402225FB78AFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84973A1571DF402225FB78AFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:52:34 +0000
Message-Id: <20260912225234.7995D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Activating a blink on one channel forcibly turns off all other act=
ive LED channels during the blink cycle.
- [High] Clearing or blinking a pattern on one LED abruptly terminates or c=
orrupts hardware patterns running on all other LEDs due to shared sequencer=
 registers.
--

commit f903bd8ba806fde42df12463784beaf198812cd9
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Clear unused pattern slots in pattern_set()

This commit clears the PWM registers for unused slots in a pattern sequence,
setting them to LED_OFF. It fixes an issue where the channel's PWM for those
slots was left at ST1202_PATTERN_PWM_FULL, causing it to sit at full bright=
ness
for the rest of the sequence. It leaves the shared duration registers alone=
 to
avoid truncating longer patterns on other channels.

>     Zero this channel's PWM for the unused slots so it stays dark for the
>     remainder of the timeline, as st1202_blink_set() already does for the
>     channels it is not driving.

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_blink_set()
corrupt the PWM state of independent channels?

When activating a blink on one channel, it forcibly turns off all other
active LED channels during the blink cycle by explicitly zeroing out PWM
slots 0 and 1 for all other active channels:

drivers/leds/leds-st1202.c:st1202_blink_set() {
...
	/* Zero out PWM for all other active channels to prevent them from blinkin=
g */
	for (int chan =3D 0; chan < ST1202_MAX_LEDS; chan++) {
		if (!chip->leds[chan].is_active || chan =3D=3D led->led_num)
			continue;

		ret =3D st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
		if (ret)
			return ret;

		ret =3D st1202_pwm_pattern_write(chip, chan, 1, LED_OFF);
...
}

Because the ST1202 chip shares a single hardware sequencer, zeroing these
slots causes steady-state channels (which rely on full PWM across all slots)
to output zero and go completely dark while the sequencer loops.

>     The duration registers are deliberately left alone. All twelve channe=
ls
>     share them, so clearing them would truncate a longer pattern still
>     running elsewhere on the same device. A channel whose pattern is shor=
ter
>     than the active timeline therefore keeps the longer period; that foll=
ows
>     from having a single hardware sequencer and is not something this can
>     correct.

[Severity: High]
This is a pre-existing issue, but does clearing a pattern on one LED abrupt=
ly
terminate or corrupt hardware patterns running on all other LEDs?

Calling st1202_led_pattern_clear() on one channel unconditionally clears the
sequencer enable bits (PATS and PATSR) in the chip-wide ST1202_CONFIG_REG,
and zeroes out the globally shared pattern duration registers
(ST1202_PATTERN_DUR):

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
...
	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_=
SHIFT);
	if (ret !=3D 0)
		return ret;

	for (int pattern =3D 0; pattern < ST1202_MAX_PATTERNS; pattern++) {
		ret =3D st1202_pwm_pattern_write(chip, led->led_num, pattern,
						ST1202_PATTERN_PWM_FULL);
		if (ret !=3D 0)
			return ret;

		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
...
}

Because the sequencer is a single shared hardware resource, per-channel
operations shouldn't unconditionally halt it or wipe its timeline if other
channels are actively using it. Hardware patterns on independent channels
might instantly fail or skip steps.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 90f69ac167147..9985b4b609891 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -263,6 +263,12 @@ static int st1202_led_pattern_set(struct led_classde=
v *ldev,
>  			return ret;
>  	}
> =20
> +	for (int pattern =3D len; pattern < ST1202_MAX_PATTERNS; pattern++) {
> +		ret =3D st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
> +		if (ret !=3D 0)
> +			return ret;
> +	}
> +
>  	ret =3D st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
>  	if (ret !=3D 0)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D5
