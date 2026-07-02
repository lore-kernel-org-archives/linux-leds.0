Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353635F179
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 17:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014917; cv=none; b=scpTyk98W2KQFE/miqv2f/g4LBp4m86KBW7DwNInfP2p5M/2FnPq8NnUh1CIDFSHpVfTJz6QMQe8Hg4azRKomJe3+1X0YLF/eLMObyOTh6WR9++vQswlOnefHlLplzGd6L2bTKXM94O1SVCHPtSlczMG4ATU5LUD0CRXnQXSik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014917; c=relaxed/simple;
	bh=EIMOVVEuhgmz47QseyEe0QoVkikwcJ+1ZcksmDbK6Oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYB7vKg8Nan2cfoTNO5lUJSouWJjk5HDbnmWx6iM0hSm/Pma53Iw3kS98gcPfIECWxcwOUHleI4g+FcSfmBrjKCCme3v67O1Z6wie8vbLU2gBcALN2fCMVKl0KRvLog/bmiHz2bV2ysde8NEn2YWS+RB/YBVbZFvA/bMj9y0R/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glmh3Cxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glmh3Cxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83CB1F000E9;
	Thu,  2 Jul 2026 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783014916;
	bh=AsqsNL1ZN/UkM63n1Sm5y32NyeIPsEulcItQA0TKEbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glmh3CxxrcMEHypfpKkjUbvctSPGKeIRWxaHSWb4ZAwqSh4EFLZ7HTlSRD5Fg1tbM
	 /0ApbJwl2ANt+xnM09RuOoQ0DbXpHRrPDQ+rWzbFz+cHKFP7JnXeYJo6iGDiY7/rle
	 VyQYdXrXXf/s0NX3WOCzScpuOco4ENdpdlLi2AB3i9X0AMzNrpeXBEfQzaXp5RvB3I
	 IhQuW5wiT+ZFJZYlYKBTYJsY+TAVJtXW2KR18yJXX6afKi+TnqARXAiFrEgOqCK/JR
	 IlEch0XQ7HP+kRbC+mgAx6xC+kHBCwS6ksUBqoqmprpJ2+cv6SXAFdA4eYnmQmk9Ix
	 BdZcm2p6CE+qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] leds: st1202: fix pattern duration prescaler and
 pattern_clear skip marker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497E6FE3F611C57006E80EDC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497E6FE3F611C57006E80EDC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 17:55:15 +0000
Message-Id: <20260702175515.D83CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver exposes a single global hardware sequencer as a per-LED=
 pattern, causing pattern operations on one channel to destructively overwr=
ite and halt patterns on all other channels.
- [High] The `brightness_set` callback points to a sleeping function, while=
 `brightness_set_blocking` fails to actually set the analog brightness.
- [Medium] `st1202_led_pattern_set()` fails to clear duration registers for=
 unused pattern steps, causing stale steps to leak into new, shorter patter=
ns.
- [Medium] Pattern brightness is written directly to 12-bit registers, but =
`max_brightness` is advertised as 8-bit (255), severely capping output.
--

commit 9be44f88b33b68ec231e7f9681b7161f1bb21c36
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix pattern duration prescaler and pattern_clear skip marker

The commit fixes the ST1202 LED driver where the pattern duration prescaler
calculation was off by one, causing durations to be too short. It corrects
the maximum duration constant to reflect the 8-bit register limit.
Additionally, it explicitly clears unused pattern slots by writing 0 to the
duration register to mark them as skipped.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index a750c95ef3f89..b4adade49898e 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, i=
nt reg, uint8_t val)
> =20
>  static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
>  {
> -	return value / ST1202_MILLIS_PATTERN_DUR_MIN - 1;
> +	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
>  }
> =20
>  static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_nu=
m,

[Severity: Medium]
This is a pre-existing issue, but is the brightness value getting scaled
properly to the hardware's 12-bit range?

In drivers/leds/leds-st1202.c:st1202_pwm_pattern_write():

    value_l =3D (u8)value;
    value_h =3D (u8)(value >> 8);

The user's requested pattern brightness is scaled to the advertised
max_brightness of 255, but the driver appears to pass this value directly
to the hardware's 12-bit PWM register (max 4095).=20

Does this cause requesting maximum brightness to cap the PWM duty cycle
at roughly 6.2%, making patterns extremely dim?

[ ... ]
> @@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classd=
ev *ldev)
>  		if (ret !=3D 0)
>  			return ret;
> =20
> -		ret =3D st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTER=
N_DUR_MIN);
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
>  		if (ret !=3D 0)
>  			return ret;
>  	}

[Severity: Medium]
This isn't a bug introduced by this patch, but while pattern_clear resets
all slots, does st1202_led_pattern_set() fail to clear duration registers
for unused pattern steps?

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    for (int patt =3D 0; patt < len; patt++) {
        ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt,
                                       pattern[patt].brightness);
        ...
        ret =3D st1202_duration_pattern_write(chip, patt,
                                            pattern[patt].delta_t);
    }
}

If a user programs a shorter pattern sequence after a longer one, the
loop updates only up to len steps, failing to zero out the durations of
the remaining ST1202_MAX_PATTERNS - len steps.=20

Will the hardware sequencer continue to execute the stale un-cleared
trailing steps?

[Severity: High]
This is a pre-existing issue, but does clearing the pattern for one LED
destructively overwrite and halt patterns on all other channels?

In st1202_led_pattern_clear():

    ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHF=
T);

And in st1202_duration_pattern_write():

    return st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern),
                            st1202_prescalar_to_miliseconds(value));

Since ST1202_PATTERN_DUR and ST1202_CONFIG_REG are globally shared
registers, it appears that programming or clearing a pattern on one LED
corrupts the duration registers and sequencer state of all other active
patterns.=20

Is there a lack of isolation between independent LED devices on the same
chip?

[Severity: High]
This isn't a bug introduced by this patch, but are the brightness
callbacks mapped correctly in st1202_dt_init()?

drivers/leds/leds-st1202.c:st1202_dt_init() {
    ...
    led->led_cdev.brightness_set_blocking =3D st1202_led_set;
    led->led_cdev.brightness_set =3D st1202_brightness_set;
    ...
}

The brightness_set callback is strictly required to be non-blocking, but
it is mapped to st1202_brightness_set, which is an I2C-dependent sleeping
function.=20

Could this cause a kernel panic (scheduling while atomic) if a kernel LED
trigger calls it from a softirq context?

Additionally, st1202_led_set() acts only as an on/off toggle:

drivers/leds/leds-st1202.c:st1202_led_set() {
    ...
    return st1202_channel_set(led->chip, led->led_num, !!value);
}

Since this is assigned to brightness_set_blocking, it completely drops the
requested brightness magnitude.=20

Will this break sysfs writes if blocking is required?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB84972A16ED=
557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D3
