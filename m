Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33F44E027;
	Thu, 23 Jul 2026 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808826; cv=none; b=Y+jf+ygf6RNgUvUbYE2mRTZYs5e80ZCTMtcNQSRPfFgjzifU+Ajvp5DxMdwgDDdVAAjppd7a3UGKoorg9xe6B3HlnpnK8sWf+77EOs+/4FP4nf8/88ryDZbjxp2R3qDMiP8ce+Hf01bHn2APgyUZavW5wawpM6+Abxzr1F8eknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808826; c=relaxed/simple;
	bh=NUDkPZ5vIIbFeln/ik84jdfPNCGZCqzNWApln/ZOcmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5PAIXuS6/gv/9Kd5sKAR6UZk0+PD5fDGOXpXlgHczB81V84oX4ZHjm60YkrHqZAPNzXY/NKXCqdbOKE+eCYgbr1YCwaB/x2mjiocLXVGQCRSLbBouRRURQQd/k6e9S/V3QxULOip9Y06JWWy08C8lEb3UZdMte+5cgjR32fo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXmRYKzF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXmRYKzF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AD21F000E9;
	Thu, 23 Jul 2026 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784808823;
	bh=9Iz4Aa+oZTLt7KW/+QzwFFp6BmT0D9YfLlJNI+sf6QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KXmRYKzFPXlUSLrjKlfppXEdNF3ofRc2NaOQ5OaFIjlrhtt/cW1/dX2leRUHUAPNk
	 tUhs64L0woRDDNSUq9nJkAC8oFqcTpQFpv+5oIX1KIlUwAxCJeXbm66khwrjek4lww
	 F75pZ1OcOl83uhvgOtQkHMkThVcxEwtiV2R8C5zs50R1PaTrTUDJT7qiGCLnou7J45
	 S/pgJbwymcIMWGqKHXjwiNpb//OkzhgT2kLCubWTzuJqztmIv/9qZzRWR4eMXeiPC9
	 b2XRvKc2SZxoWipg26oPMrQZ2U3ed+bEztwjawUK370wP5F7zpjLCavFwrMcWk3Eel
	 nPMXvj0+nKd8Q==
Date: Thu, 23 Jul 2026 13:13:39 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink support
Message-ID: <20260723121339.GG3363113@google.com>
References: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Mon, 13 Jul 2026, Manuel Fombuena wrote:

> Implement blink_set() to enable hardware-accelerated blinking via the
> timer trigger. The LED1202 pattern engine is used to produce a two-step
> sequence: full brightness for delay_on, off for delay_off, repeating
> indefinitely.
> 
> Requested delays are clamped to the hardware range [22ms, 5610ms] and
> rounded up to the nearest 22ms step. A zero delay is replaced with the
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
> Assisted-by: Claude:claude-sonnet-4-6

Should we avoid using non-standard metadata tags such as 'Assisted-by' in the
commit message to adhere to standard upstream practices?

> ---
>  drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 168df5ecf27b..fc784a854a33 100644
> --- .../leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> +#define ST1202_BLINK_DEFAULT_DELAY         500
>  #define ST1202_CHAN_DISABLE_ALL            0x00
>  #define ST1202_CHAN_ENABLE_HIGH            0x03
>  #define ST1202_CHAN_ENABLE_LOW             0x02
> @@ -275,6 +276,86 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
> +	on = *delay_on ? *delay_on : ST1202_BLINK_DEFAULT_DELAY;
> +	off = *delay_off ? *delay_off : ST1202_BLINK_DEFAULT_DELAY;

Use the short form here:

on = *delay_on: ST1202_BLINK_DEFAULT_DELAY;

> +	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> +	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> +	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);

Should we perform the 'roundup' before 'clamp_val' to ensure that rounding the
value up does not push it beyond 'ST1202_MILLIS_PATTERN_DUR_MAX'?

> +
> +	guard(mutex)(&chip->lock);
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);

SHFT is weird - why save that very short char and harm readability?

> +	if (ret)
> +		return ret;
> +
> +	/* Zero out PWM for all other active channels to prevent them from blinking */
> +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {

Does zeroing out the pattern PWM slots for other active channels permanently
overwrite their configurations or is there a mechanism to restore their state
once blinking is disabled?

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

Should this function be named 'st1202_milliseconds_to_prescaler' instead,
since we are converting a millisecond value into a register value? Also,
could we correct the spelling of 'prescaler' and 'milliseconds' to ensure the
code is clean and passes spell checks?

> +	if (ret)
> +		return ret;
> +	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
> +				st1202_prescalar_to_miliseconds(off));
> +	if (ret)
> +		return ret;
> +
> +	for (int patt = 2; patt < ST1202_MAX_PATTERNS; patt++) {
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
> @@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
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
