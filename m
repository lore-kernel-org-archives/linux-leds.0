Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2A37F730
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253469; cv=none; b=PfMFNmXL5qvvG2LGvF2XM6GEZZy79f9slMOPqRHshRBgXGMWzEpX2n7ttn3GlNCMU49hUSiJliYb+71JWtdcwi+wqvCBcgcn+uOTibdo+a+KWrNwqoLfEQnMsT49hnavS5i3xjK3BDPObvhNz6RotCAqV5q9xldZYqGw7WtmlQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253469; c=relaxed/simple;
	bh=JODmf323GqrozwVR5/AEgDXknghXb4srNgpTB/kMviQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JUtwq0T55WyodIub3WfF9NWlXftRthImotT0f8HxM4JNcKEsZYLGFYWDBH4PqTWy9fBZH/LehIXJuiJ+v+5ZCpr+iWVGXkOr+tze4lcUjEt8NbTMFx3eQpoSuyNdio/iu3jIYWiiVEKkLgBKo8GcZtj/h2mc1ojxhaFeyCylo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsmALL/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsmALL/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAD81F000FF;
	Sat, 12 Sep 2026 22:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253466;
	bh=C4JLkHN+kr5bj6jQuDuwX1FeUvEXGAPseOCy1Nna3jY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IsmALL/hKb6QJJuWvnNFjwMGZqqOyFEPoeykcptkbY21ixC6fsZXFsJYI8X3+9tlh
	 ybZ/yjiPmcp5SwdgnQs0tovudAzEKXIUP8NMwzB1adqEUCIX147gutJiLpY0XRXGs9
	 lBH8LdUU1V1eok5G4QarhmaBE7BVAjtdUiKj6Y2dYYpIo65lAXM1PBeP1p8zoDdVMM
	 wbEGhuc6kV3H8S2TRJx6h4kPCS34cBhBhvEXKKF123avy7jzbPX1WeFOzNUgb1inQC
	 YAacOgfnAy/n0VvERK5p2SltG6EjxrQtxVkNMWYQ3Ub8Ihp9IrjfvVz1hqLMd5w5zT
	 uzW+7Mkql3Hcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 03/11] leds: st1202: Name pattern index variables
 consistently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497495AB757A3CFF797654EC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497495AB757A3CFF797654EC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:51:06 +0000
Message-Id: <20260912225106.9BAD81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete cleanup of remaining hardware pattern durations in st12=
02_led_pattern_set.
- [High] Global hardware duration registers are corrupted by independent LE=
D pattern or blink requests.
- [High] st1202_blink_set inadvertently turns off continuously lit LEDs.
--

commit 46a022fdeb18fd45b309d2df4aa547f0116cf2c4
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Name pattern index variables consistently

This commit renames the loop variables for pattern indices from "patt"
to "pattern" across several functions to maintain consistency. It also
renames the "pattern" array parameter to "patterns" in
st1202_led_pattern_set() to avoid shadowing.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index d8a04e96fb46c..ddb8c60277067 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c

[ ... ]

> @@ -251,12 +252,13 @@ static int st1202_led_pattern_set(struct led_classd=
ev *ldev,
>  	if (ret !=3D 0)
>  		return ret;
> =20
> -	for (int patt =3D 0; patt < len; patt++) {
> -		ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[pat=
t].brightness);
> +	for (int pattern =3D 0; pattern < len; pattern++) {
> +		ret =3D st1202_pwm_pattern_write(chip, led->led_num, pattern,
> +						patterns[pattern].brightness);
>  		if (ret !=3D 0)
>  			return ret;
> =20
> -		ret =3D st1202_duration_pattern_write(chip, patt, pattern[patt].delta_=
t);
> +		ret =3D st1202_duration_pattern_write(chip, pattern, patterns[pattern]=
.delta_t);

[Severity: High]
This isn't a bug introduced by this patch, but will this write clobber
any pattern durations set by other LEDs?

Since the ST1202_PATTERN_DUR registers are global to the chip, if userspace
sets a pattern on one LED, and then sets a pattern or blink on another LED,
it seems the second LED's duration writes will overwrite the first LED's
timing.

The driver appears to expose shared hardware state as independent without
-EBUSY synchronization, and this behavior remains unresolved at the end of
the patch series.

>  		if (ret !=3D 0)
>  			return ret;
>  	}

[Severity: High]
This is a pre-existing issue, but does this function leave durations for
trailing slots intact?

The loop sets durations up to 'len', but finishes without zeroing the global
duration registers for slots 'len' through ST1202_MAX_PATTERNS - 1.

Could this cause the hardware sequencer to execute trailing steps from a
previous longer pattern? During these ghost steps, the LED would be off,
which could lead to unexpected dark pauses that break the timing of the new
shorter pattern. This can be triggered if userspace sets a long pattern
followed by a short pattern via sysfs on the same LED.

This behavior persists through the entire patch series (including patch 5
which only clears the PWM registers, failing to clear the duration register=
s).


Also, looking at st1202_blink_set() which is not modified in this patch:

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

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_blink_set()
inadvertently turn off continuously lit LEDs?

This unconditionally clears the first two pattern slots for all other chann=
els,
which ruins the ST1202_PATTERN_PWM_FULL state set by st1202_led_set() and
forces them OFF.

If a second LED is set to a continuous brightness, and userspace requests a
blink on the first LED, st1202_blink_set() will overwrite the second LED's
slots 0 and 1 to LED_OFF. Since the global sequencer loops only over slots 0
and 1 during blink, the second LED will output 0 brightness.

This remains unresolved at the end of the patch series (including patch 10).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D3
