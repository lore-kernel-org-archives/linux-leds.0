Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9C26299
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253432; cv=none; b=gRJeA7NssY0p7PsiH6fNrVegEk9ojTgO/pFP0CywJL0Fv1qnZ1tcXS4q8B7plnqvL7bHua80RVftqBRfnBDC3S0ObAwoJjYr4eKkVEQ7BRwXA6sYFMIUU6sS6obE61oujFP1bs7bZPVlsLjipp0YyjKqb7rTI8L1asbrU2zkpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253432; c=relaxed/simple;
	bh=0owkl/RMNJe1r+197NQRQjEMrUhH3/dVOyL/B2ouDJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WRDqyuF9pLRsImuUDLBn6IjYzHtZMXB29tiE3CEzdnh0jg3/YWKoFMiIW31NuQZsdlkoyGKEouahuNpcRapiMxufWUXC1jp9r92ZI2/Gw5lUqMssK6tH8Xsj18qWasyfUnEl78R8wOtb/ok13mKf43MGWccwU86rDhQTDinqopU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtZmaWoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtZmaWoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BBD1F000FF;
	Sat, 12 Sep 2026 22:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253431;
	bh=Wf2YyS5Gc1T6QSI4pvJ7CsiaByU7ECnU0TgrHqQxNeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtZmaWoAEz3LNKjlfgdneCZqlWSgM4QbGOgxPVHAXTikVbTPmRL9oTlhMdN7teeXx
	 XhVAxiaYenLyrNcQdS6MqinpSWMlLm6KeTRzlDauBQmntxB+Q8N5oQA299sB0f9oBp
	 1ToEHhb/BSfSZw3FxEmPH/KaY0tdczNbmslkqtAuTO0HdjclKgTHiCzBF6OKA4GqaV
	 JLP/d/CP++HVncfTUQBBybq3jkwTIX411146R8t2d+K6/zeJeFmzWnnrn8igw7mnzq
	 MfSm0w3T14ymzv3+HRPij48+KqiCiS/mjo/awPs88LeF2dxJLgzX0sJs4ZJUnmOGbF
	 ACbmwo4p+7KRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/11] leds: st1202: Spell out the phase-shift
 configuration bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497C0EF1F3979EEC073AAAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497C0EF1F3979EEC073AAAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:50:30 +0000
Message-Id: <20260912225030.E2BBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Blinking an LED destructively zeroes out the PWM values for all ot=
her channels, permanently breaking steady-ON LEDs.
- [High] Hardware state clobbering: per-LED pattern operations corrupt glob=
al sequencer configuration and step durations.
--

commit 2c776e6568e7de2682a8142a57768cace68e6086
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: Spell out the phase-shift configuration bit

This commit renames ST1202_CONFIG_REG_SHFT to ST1202_CONFIG_REG_PHASE_SHIFT
to improve readability and properly document the phase-shift delay feature.
It also adjusts line wrapping in the register writes to adhere to column
limits without introducing functional changes.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 5a2202fb4c223..d8a04e96fb46c 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -210,7 +211,7 @@ static int st1202_led_pattern_clear(struct led_classd=
ev *ldev)
> =20
>  	guard(mutex)(&chip->lock);
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
> +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHA=
SE_SHIFT);

[Severity: High]
This is a pre-existing issue, but by writing only the phase-shift bit to the
global ST1202_CONFIG_REG, doesn't this unconditionally clear the PATS and
PATSR bits?=20

Since the ST1202 chip appears to use a single global sequencer, clearing
these bits would instantly halt the sequencer for all other active LEDs on
the chip. Additionally, when setting patterns in st1202_led_pattern_set(),
the shared global ST1202_PATTERN_DUR step durations are unconditionally
overwritten.=20

Does the driver need a way to coordinate or reject conflicting requests for
the global sequencer instead of silently clobbering the state of other LEDs?

[ ... ]
> @@ -299,7 +301,7 @@ static int st1202_blink_set(struct led_classdev *led_=
cdev,
> =20
>  	guard(mutex)(&chip->lock);
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);
> +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHA=
SE_SHIFT);

[Severity: High]
This isn't a bug introduced by this patch, but does st1202_blink_set()
inadvertently break steady-ON LEDs?=20

When a given LED starts blinking, the function iterates over all other acti=
ve
channels and unconditionally zero-fills their PWM slots to prevent them from
blinking:

st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
st1202_pwm_pattern_write(chip, chan, 1, LED_OFF);

If those other channels were previously configured to be steady ON, this ze=
ro
fill causes them to turn completely off during patterns 0 and 1. When the
blinking LED is later disabled, the original full PWM slots for the other
channels are never restored, which seems to leave them permanently disabled.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D2
