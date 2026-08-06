Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EB3909A5;
	Thu,  6 Aug 2026 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023939; cv=none; b=LjPSXyyy0f11xsx4kKzPzWblMH3h1YIei/+Qox21q0fwit2w3R0bbFFpWR4Bz9IKMtsQO8VQQH2mSEIp1Z1eRS216Y/iYRVsS3UeacSKiDS7bgbFEWwvJM48AlxeKihXQ4aOxumsEIJo9ZbR4bioOipplhG7cCo2g3vgCW5cc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023939; c=relaxed/simple;
	bh=RYnjO8y3yrq54hVbbcQjRQeoOV7M144oxFRti2mPhLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRz42HfQ7K6os0j824jQk2azczMx4OSz918kNnGh+tjBP16+/6qvt/zK/QXQNVihY+iwdLxu5kgDl2kDAJi5vR0G+p5Dkdo2vN45YnkavkmWKdIrSLT3ZIuSOj940LNoG7PcrBG6QKsafxTeWtGkhTuCpgkNog72iupjOOMrGF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCUA26nz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCUA26nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F3B1F000E9;
	Thu,  6 Aug 2026 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023938;
	bh=9kIymwadNFf8XCb1/j/i24Hw6WsWV2qQLffLquON/w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCUA26nzqn4WqvlyVivo5CeZ+Inqo8e3UzClZ5Uz9x7eY6nkSA1eWgwkP4Kw8zz6i
	 gQgK5aY7eJ6ZnTLkOy11B1ZCn5c+6csHoATDJnKh18TmMpFwKyyZluCX0PB/rVypCW
	 tgrXegEzDca+e8/d/cs3OCqGU2l3tawa3vGFZJyG5xrIQZzM9e9/Ctv8wXVoRZnYt0
	 h3lER6RcwuDLid++ajklE64noIdC5zt7VHbtn9KphHkWkPymKtXZWf4NQ0IeHPpUtI
	 kjWje7PGGpp2UVapOrxxrpZ+0H+RXV451MoU6PPr2IQoTEqVJFMNiuBKH5naZXDsTt
	 6z0JR5jT2NMZg==
Date: Thu, 6 Aug 2026 14:45:33 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink
 support
Message-ID: <20260806134533.GG2869284@google.com>
References: <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Fri, 24 Jul 2026, Manuel Fombuena wrote:

> Implement blink_set() to enable hardware-accelerated blinking via the
> timer trigger. The LED1202 pattern engine is used to produce a two-step
> sequence: full brightness for delay_on, off for delay_off, repeating
> indefinitely.
> 
> Requested delays are clamped to the hardware maximum before rounding up
> to the nearest 22ms step, then clamped again to the full hardware range
> [22ms, 5610ms]. The pre-clamp prevents integer overflow in roundup() for
> extreme input values near ULONG_MAX. A zero delay is replaced with the
> default of 500ms independently for each of delay_on and delay_off.
> 
> The LED1202 pattern sequencer is global and its timing registers are
> shared across all channels, so only one blink configuration can be
> active at a time. Other active channels have their PWM slots zeroed for
> both pattern steps so they remain dark rather than outputting unintended
> values when the sequencer runs. The target channel's ILED register is
> set to full brightness and the channel is enabled, since the timer
> trigger deactivates the current trigger before calling blink_set which
> would otherwise leave the channel disabled.
> 
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> ---
>  drivers/leds/leds-st1202.c | 84 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b..3600409d4bc2 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> +#define ST1202_BLINK_DEFAULT_DELAY         500
>  #define ST1202_CHAN_DISABLE_ALL            0x00
>  #define ST1202_CHAN_ENABLE_HIGH            0x03
>  #define ST1202_CHAN_ENABLE_LOW             0x02
> @@ -275,6 +276,88 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
>  	return 0;
>  }
>  
> +static int st1202_blink_set(struct led_classdev *led_cdev,
> +			unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
> +	struct st1202_chip *chip = led->chip;
> +	unsigned long on, off;
> +	int ret;
> +
> +	on = *delay_on ?: ST1202_BLINK_DEFAULT_DELAY;
> +	off = *delay_off ?: ST1202_BLINK_DEFAULT_DELAY;

Could we simplify this by initialising '*delay_on' and '*delay_off' first
using standard 'if' statements, as is common in other 'blink_set'
implementations?

> +
> +	on = min_t(unsigned long, on, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	off = min_t(unsigned long, off, ST1202_MILLIS_PATTERN_DUR_MAX);

Since 'on', 'off', and the maximum duration are all of type 'unsigned long',
should we use the simpler 'min()' macro here instead of 'min_t()'?

> +	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> +	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
> +	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);

Is the second 'clamp_val()' call redundant here? Since the maximum limit is
already a multiple of the minimum step, any rounded-up value should naturally
fall within the valid range.

> +
> +	guard(mutex)(&chip->lock);
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
> +	if (ret)
> +		return ret;
> +
> +	/* Zero out PWM for all other active channels to prevent them from blinking */
> +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
> +		if (!chip->leds[i].is_active || i == led->led_num)
> +			continue;
> +		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
> +		if (ret)
> +			return ret;
> +		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
> +	if (ret)
> +		return ret;
> +	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR,
> +				st1202_prescalar_to_miliseconds(on));

We know that neither of these words are spelt correctly, right?

> +	if (ret)
> +		return ret;
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
> +				st1202_prescalar_to_miliseconds(off));
> +	if (ret)
> +		return ret;
> +
> +	for (int patt = 2; patt < ST1202_MAX_PATTERNS; patt++) {

pattern

> +		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
> +	if (ret)
> +		return ret;
> +
> +	ret = __st1202_channel_set(chip, led->led_num, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
> +				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
> +				ST1202_CONFIG_REG_SHFT);
> +	if (ret)
> +		return ret;
> +
> +	*delay_on = on;
> +	*delay_off = off;
> +
> +	return 0;
> +}
> +
>  static int st1202_dt_init(struct st1202_chip *chip)
>  {
>  	struct device *dev = &chip->client->dev;
> @@ -301,6 +384,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
>  		led->led_cdev.pattern_set = st1202_led_pattern_set;
>  		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
>  		led->led_cdev.default_trigger = "pattern";
> +		led->led_cdev.blink_set = st1202_blink_set;
>  		led->led_cdev.brightness_set = st1202_brightness_set;
>  		led->led_cdev.brightness_get = st1202_brightness_get;
>  	}
> -- 
> 2.55.0
> 

-- 
Lee Jones
