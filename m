Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCE3D565D
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253520; cv=none; b=T8dSLZ/+XMDzpMwgDrUlCAIMfeQqWi29ueMU8AO/Pm9BX5IKbvH8S6vOEZF5YIGfJlyhubVRJZm3igEtuVyoOQ6DV6gwsBTbmWPkkwk3X3gsK/Wxnl8Hj+PDYii3hexYDWsCnu1Jy65lM66QnVQpAjrXdFOkdhYhdeSYCqkETPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253520; c=relaxed/simple;
	bh=OYa17tgE3gdhvj3LPx7fQFBBkMH6HJpYd3e2o85e8cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pXnfMP39xATUQSurjWqSoyAWcgpLTshpvu76kzKJ95Xl/imkug7Cri2W9scFouRfIlmfyMG3f721GrlTcQwEuLyBpeRTy1TY1CDZB4srOYM4wzVB5mbh3G/Bz6eRGs9VHjHNVsyxlgGI36xdtgjE4vVqKv7vieFSvullevuMr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYJyABWY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYJyABWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7EB1F000FF;
	Sat, 12 Sep 2026 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253519;
	bh=V8wTEtK1DzyhTtMt9SshNKJ6eIby0WDXnvPvXHSQnEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYJyABWYCeZinULxh++9EYNVTrPTeKWrGH5Tk3LuDOSB1kcyfKqwsiKvStWsq88Ml
	 iaHmxnKtmUqEZIum4bOtPcX1OBf5qgcSnGVbkt8QhgCn/f2v3B96F2iFAlwF9U/Tuf
	 XDJbJKNrafSYPjnJ95pJcLyPYTGx9ui1lccnLZBuHILVofYGIZIMvHKlvyq5TCMPPI
	 J6Sr7u24jHIEtNTmMEBriFAu7IyionosvTN27bdpxGnpKnFu2flYz5F6elQyQd7N6k
	 si5axXhMQdAZJfM0PwxaJsjY/dV/VeJxkRwYtNp93FFpukrNHwAhhVkK4zHlDxkIXq
	 6Dp9WkRvw2DBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/11] leds: st1202: Scale pattern brightness to the
 12-bit PWM range
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497EBB43F4FFDECC7C8854CC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497EBB43F4FFDECC7C8854CC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:51:58 +0000
Message-Id: <20260912225158.CD7EB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Race condition when starting the hardware pattern sequencer: the=
 base current (ILED_REG0) is written after the sequence is enabled.

Pre-existing issues:
- [High] The hardware pattern durations and execution sequencer are globall=
y shared, but the driver allows per-LED independent configurations, causing=
 destructive interference.
--

commit eaa2a40ee6c9df54ecd9aef2a8ff245af05bc058
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Scale pattern brightness to the 12-bit PWM range

The LED1202 PWM registers are 12 bits wide, but st1202_led_pattern_set()
writes the 8-bit brightness value carried by struct led_pattern into
them unscaled. A pattern step asking for full brightness therefore
drives the channel at 255 out of 4095, about 6% duty cycle, so a pattern
is dimmer than the same brightness set directly.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 9985b4b609891..5558ac9612a15 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -254,7 +267,8 @@ static int st1202_led_pattern_set(struct led_classdev=
 *ldev,
> =20
>  	for (int pattern =3D 0; pattern < len; pattern++) {
>  		ret =3D st1202_pwm_pattern_write(chip, led->led_num, pattern,
> -						patterns[pattern].brightness);
> +					st1202_brightness_to_pwm(patterns[pattern].brightness,
> +								max_brightness));
>  		if (ret !=3D 0)
>  			return ret;

[Severity: High]
This is a pre-existing issue, but does this cause destructive interference
across independent LED channels?

The ST1202 chip has a single global sequencer and a shared set of pattern
duration registers (ST1202_PATTERN_DUR). The driver exposes multiple
independent LED channels to userspace.

When a hardware pattern or blink is configured on one LED via
st1202_led_pattern_set() or st1202_blink_set(), the driver unconditionally
overwrites the global duration registers:

drivers/leds/leds-st1202.c:st1202_duration_pattern_write() {
    ...
    return st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern),
                            st1202_milliseconds_to_prescaler(value));
}

Similarly, st1202_led_pattern_clear() clears the PATS bit in
ST1202_CONFIG_REG, which stops the global sequencer:

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHA=
SE_SHIFT);
    ...
}

Will starting or stopping a pattern on one LED corrupt or freeze the running
pattern on all other LEDs, leading to severely incorrect functional behavior
for multi-channel usage?

[Severity: Medium]
Is there a race condition when starting the hardware pattern sequencer?

In st1202_led_pattern_set(), the analog current scalar (max_brightness) for
the sequence is written after the sequence is enabled:

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    ...
    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG,
                           ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS=
 |
                           ST1202_CONFIG_REG_PHASE_SHIFT);
    if (ret !=3D 0)
        return ret;

    ret =3D st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, max_bri=
ghtness);
    ...
}

Because I2C transactions are relatively slow and the hardware sequencer runs
independently, will the initial steps of the new pattern execute using the
stale ILED_REG0 value (which may be 0 from a prior pattern_clear)?

Does this lead to a noticeable visual glitch where the first cycle of the
pattern is truncated or plays at an incorrect brightness? Should the base
current be fully programmed before initiating the hardware sequencer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D6
