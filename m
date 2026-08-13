Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911B47278D;
	Thu, 13 Aug 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623367; cv=none; b=IYinXFi5ckIeV+Hl3EM/JOgQwWx6zocYcfBK+GghTGGUYEL5Iu0ddtCgd3NLoTKRmh/9d6BKeaC2RZXxw1MgPri2wbsTD+te2WcJKpfbE8qOeOTARrRNlruqlJMtCkCNKmODLJdiChx/PvB73CblMIUU1j4R9N5eoXtNRk5pg0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623367; c=relaxed/simple;
	bh=HwQteRzYH9UhR8kTBGWhGIDq8PW9OPRKfo11QR5plJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUEYy9uhOeySeCyYY25b3HztnnEWizzBmALrRKlJsdccmjqfB0flP5SjlNFiXOdYX5tKlQgbVkL4DcufMC9gkT9Ka1FmmrHgJ0+mrjp8GoMgqeeDAOBaQH4CLR6FWQlpQTt2odkJW69qfw+faf0HdlEQ/kmMO8jvmJnPRjFNyfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIx144Ag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIx144Ag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816661F000E9;
	Thu, 13 Aug 2026 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623365;
	bh=tU9VHAe+kwjA67DrIHd1vm5RyEZWIQJ4iqDjh/4F8+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jIx144AgXC/qMP7qnxCtOG5i2ybCs7WXq0w5mkgdbjARuNvFjFg81pNCsvKU5rGmS
	 /+QoLBhLtScUnX4748QaZ5sxpU70pTcjS0/nw/UDYjyWl5Ktbbrkvf4AwAI2GVaxFr
	 xD8Te+c+h4q2a5TZDDXYcnyvf3pmN7zfmVHAfH1w3APBMJe5Rbk7Id7Q7qpyc+gH4A
	 56422G4HxgXr3ts40DQObLDzKS+mqlBp9o2RtNsv7qHC4QbHW+Wf9x6c2VrEnXHRtG
	 UDhuSXG1AdX/F+YVdavWLPWnPp9LETAYBOHFeNZItsWiAaEUsQ3FMSCUrnYNWzeTrL
	 ymKCHm0NkzgLQ==
Date: Thu, 13 Aug 2026 13:16:01 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink
 support
Message-ID: <20260813121601.GB1820248@google.com>
References: <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Thu, 06 Aug 2026, Manuel Fombuena wrote:

> Implement blink_set() to enable hardware-accelerated blinking via the
> timer trigger. The LED1202 pattern engine is used to produce a two-step
> sequence: full brightness for delay_on, off for delay_off, repeating
> indefinitely.
> 
> Requested delays are clamped to the hardware range [22ms, 5610ms] then
> rounded up to the nearest 22ms step. Clamping before rounding prevents
> integer overflow in roundup() for extreme input values; since
> ST1202_MILLIS_PATTERN_DUR_MAX is an exact multiple of
> ST1202_MILLIS_PATTERN_DUR_MIN, rounding a clamped value cannot exceed
> the maximum. A zero delay is replaced with the default of 500ms
> independently for each of delay_on and delay_off.
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
>  drivers/leds/leds-st1202.c | 85 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b..ea019d03ad90 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> #define ST1202_BLINK_DEFAULT_DELAY         500
>  #define ST1202_CHAN_DISABLE_ALL            0x00
>  #define ST1202_CHAN_ENABLE_HIGH            0x03
>  #define ST1202_CHAN_ENABLE_LOW             0x02
> @@ -275,6 +276,89 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
> +	if (!*delay_on)
> +		*delay_on = ST1202_BLINK_DEFAULT_DELAY;
> +	if (!*delay_off)
> +		*delay_off = ST1202_BLINK_DEFAULT_DELAY;
> +
> +	on = *delay_on;
> +	off = *delay_off;
> +
> +	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> +	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
> +
> +	guard(mutex)(&chip->lock);
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
> +	if (ret)
> +		return ret;
> +
> +	/* Zero out PWM for all other active channels to prevent them from blinking */
> +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {

Nit: Would it be nicer to use a better named variable, like 'led' or 'chan'?

> +		if (!chip->leds[i].is_active || i == led->led_num)
> +			continue;

Nit: It's kinder on the eye if you separate these blocks.

> +		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
> +		if (ret)
> +			return ret;

'\n'

> +		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
> +	if (ret)
> +		return ret;

'\n'

> +	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret = st1202_duration_pattern_write(chip, 0, on);
> +	if (ret)
> +		return ret;

'\n'

> +	ret = st1202_duration_pattern_write(chip, 1, off);
> +	if (ret)
> +		return ret;
> +
> +	for (int pattern = 2; pattern < ST1202_MAX_PATTERNS; pattern++) {

That's better.

> +		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
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

I'm assuming that this alignment is a patch artefact?

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
> @@ -301,6 +385,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
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
