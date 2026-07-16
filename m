Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136A41DECC;
	Thu, 16 Jul 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207246; cv=none; b=QblXVM5eMjeUosTY4uVpxhnyhQMXtKQWTsYmFyab94835gCN7pna7YSKF2nTLppbHf6UNsrjE9a2bUefCo5QxPespesNrSgy+Qh8CQARWBjO71sT1/YMmVzijL+5fwqVMxOlrCy1cSlnGBuYKk8WogHMDgG3mEc5gnD66aHstVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207246; c=relaxed/simple;
	bh=+VwpfWPh8WuxLAYUi/9vnqqMVohnsQH1pZ3XfYnMzAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9OmUWymvQTej6lNzCgOxNSinuyTbBUSgUQJCv+BBWOSgRnGttPYt+VCwkfNSUy9nBcPg0ZEVaWbsuB+QcjnrXwjZvBQ2IXgQKfIlE2gah4CG1cKIpefldpqti8ClSLAgi1/FHOCa5PEP/LsL9jJyQo7PYuE5EEfwscvI64Gkxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoxVIjty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoxVIjty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DC31F000E9;
	Thu, 16 Jul 2026 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784207244;
	bh=huic573uZp8Zkp6TG0u7AeCXk85yAXd7BXKjXEwsfW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZoxVIjty9kfMfCoTTI6gMPz0OnIj1nscKQ/IJayQ50xZSpt6ds+/YgSXKIUvIGroC
	 nkmVlj5CRxW6j/OUNHZR2pogOh7PQf7bDTyaltljlpsZP4JOi7OuGYVOW6zztYgik8
	 NO4pc2mUZc9uQLNrFdPirxR8kZYuB7ts0l5EJIHkX/cYDkNEy1VL0nfVe2wwD79BH6
	 dLzCeYa/6KtbIDtBVY0yGyYpjc2vtnBzidP7MBVw8oeZD2zduwDWHRi7QiUmyHelPp
	 zRQWbOAfSWp/1M8jrTUZUKXXaeZtcI22vjLbSU9V7YCYyiOrFhIXuy0Ace0TwltHO0
	 61Uo4qcUV+JKw==
Date: Thu, 16 Jul 2026 14:07:21 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
Message-ID: <20260716130721.GJ1260374@google.com>
References: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
 <20260708051716.3C4241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708051716.3C4241F000E9@smtp.kernel.org>

On Wed, 08 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Mixing goto-based error handling with scope-based cleanup (__free and guard) in the same function.

Either provide a good explanation or fix please.

> Pre-existing issues:
> - [High] `lpg_lut_free()` fails to clear LUT slots for valid patterns of length 1, permanently leaking hardware LUT capacity.
> --
> 
> --- Patch [1]: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode ---
> commit d02ed2e49b5e3fa47ddff854cf6f3e5653dde705
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
> 
> This commit scales the pattern data according to the sub-led intensity 
> and programs the HW pattern separately for each LPG channel. This ensures 
> the LED device respects intensity settings instead of always operating in 
> a white-balanced mode.
> 
> Link: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com
> 
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > index d7d6518de30f2..7ba4765e7cfc2 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> 
> [ ... ]
> 
> > @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
> >  	 * duration of all steps.
> >  	 */
> >  	if (lpg->lut_base || lpg->lut_sdam) {
> > -		lo_pause = pattern[0].delta_t;
> > -		hi_pause = pattern[actual_len - 1].delta_t;
> > +		prep->lo_pause = pattern[0].delta_t;
> > +		prep->hi_pause = pattern[actual_len - 1].delta_t;
> >  	} else {
> >  		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
> > -			goto out_free_pattern;
> > +			return -EINVAL;
> > +		prep->lo_pause = 0;
> > +		prep->hi_pause = 0;
> >  	}
> >  
> > +	prep->data = no_free_ptr(pattern);
> > +	prep->len = actual_len;
> > +	prep->delta_t = delta_t;
> > +	prep->ping_pong = ping_pong;
> 
> [Severity: High]
> This is a pre-existing issue, but does lpg_lut_free() fail to clear LUT
> slots for valid patterns of length 1?
> 
> When a user writes a 4-element palindrome pattern (which translates to 
> len == 2 internal steps), lpg_prepare_pattern() calculates:
> 
>     if (ping_pong)
>         actual_len = (len + 1) / 2;
> 
> making actual_len = 1.
> 
> Later, when this pattern is cleared or an error path triggers, lpg_lut_free()
> checks:
> 
>     len = hi_idx - lo_idx + 1;
>     if (len == 1)
>         return;
> 
> This early return seems to silently skip clearing the allocated bitmap slot, 
> permanently leaking hardware LUT capacity over time.
> 
> > +	return 0;
> > +}
> > +
> > +static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
> > +			   u32 len, int repeat)
> > +{
> > +	struct lpg_channel *chan;
> > +	struct lpg *lpg = led->lpg;
> > +	struct lpg_pattern pattern;
> > +	unsigned int lo_idx;
> > +	unsigned int hi_idx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	guard(mutex)(&lpg->lock);
> >  
> >  	if (lpg->lut_base)
> > -		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> > +		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
> >  	else
> > -		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
> > +		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
> >  
> >  	if (ret < 0)
> > -		goto out_unlock;
> > +		goto free_pattern;
> >  
> >  	for (i = 0; i < led->num_channels; i++) {
> >  		chan = led->channels[i];
> >  
> > -		chan->ramp_tick_ms = delta_t;
> > -		chan->ramp_ping_pong = ping_pong;
> > +		chan->ramp_tick_ms = pattern.delta_t;
> > +		chan->ramp_ping_pong = pattern.ping_pong;
> >  		chan->ramp_oneshot = repeat != -1;
> >  
> > -		chan->ramp_lo_pause_ms = lo_pause;
> > -		chan->ramp_hi_pause_ms = hi_pause;
> > +		chan->ramp_lo_pause_ms = pattern.lo_pause;
> > +		chan->ramp_hi_pause_ms = pattern.hi_pause;
> >  
> >  		chan->pattern_lo_idx = lo_idx;
> >  		chan->pattern_hi_idx = hi_idx;
> >  	}
> >  
> > -out_unlock:
> > -	mutex_unlock(&lpg->lock);
> > -out_free_pattern:
> > -	kfree(pattern);
> > -
> > +free_pattern:
> > +	kfree(pattern.data);
> >  	return ret;
> >  }
> 
> [Severity: Medium]
> Does this code mix goto-based error handling with scope-based cleanup?
> 
> The cleanup subsystem guidelines suggest avoiding mixing goto labels 
> (like free_pattern) and guard() declarations within the same function. 
> Since pattern.data is manually managed here alongside the guarded mutex,
> this might make the code more prone to LIFO ordering mistakes or resource 
> leaks during future refactoring.
> 
> [ ... ]
> 
> > @@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
> >  }
> >  
> >  static int lpg_pattern_mc_set(struct led_classdev *cdev,
> > -			      struct led_pattern *pattern, u32 len,
> > +			      struct led_pattern *led_pattern, u32 len,
> >  			      int repeat)
> >  {
> >  	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> >  	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
> > +	struct lpg *lpg = led->lpg;
> > +	struct lpg_channel *chan;
> > +	struct lpg_pattern pattern;
> >  	unsigned int triled_mask = 0;
> > -	int ret, i;
> > +	unsigned int lo_idx;
> > +	unsigned int hi_idx;
> > +	unsigned int scale;
> > +	unsigned int i, j;
> > +	int ret;
> > +
> > +	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Allocate buffer for the per-channel scaled pattern copy */
> > +	struct led_pattern *scaled __free(kfree) =
> > +			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
> > +	if (!scaled) {
> > +		kfree(pattern.data);
> > +		return -ENOMEM;
> > +	}
> >  
> >  	for (i = 0; i < led->num_channels; i++)
> >  		triled_mask |= led->channels[i]->triled_mask;
> > -	triled_set(led->lpg, triled_mask, 0);
> > +	triled_set(lpg, triled_mask, 0);
> >  
> > -	ret = lpg_pattern_set(led, pattern, len, repeat);
> > +	led_mc_calc_color_components(mc, LED_FULL);
> > +
> > +	/*
> > +	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
> > +	 * so the pattern respects the configured colour balance.
> > +	 */
> > +	guard(mutex)(&lpg->lock);
> > +
> > +	for (i = 0; i < led->num_channels; i++) {
> > +		chan = led->channels[i];
> > +		scale = mc->subled_info[i].brightness;
> > +
> > +		for (j = 0; j < pattern.len; j++) {
> > +			scaled[j].brightness = DIV_ROUND_CLOSEST(
> > +				(u32)pattern.data[j].brightness * scale, LED_FULL);
> > +			scaled[j].delta_t = pattern.data[j].delta_t;
> > +		}
> > +
> > +		if (lpg->lut_base)
> > +			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
> > +		else
> > +			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
> > +
> > +		if (ret < 0) {
> > +			/* Free LUT slots already allocated for previous channels */
> > +			while (i-- > 0) {
> > +				chan = led->channels[i];
> > +				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> > +				chan->pattern_lo_idx = 0;
> > +				chan->pattern_hi_idx = 0;
> > +			}
> > +
> > +			goto free_pattern;
> > +		}
> > +
> > +		chan->ramp_tick_ms = pattern.delta_t;
> > +		chan->ramp_ping_pong = pattern.ping_pong;
> > +		chan->ramp_oneshot = repeat != -1;
> > +		chan->ramp_lo_pause_ms = pattern.lo_pause;
> > +		chan->ramp_hi_pause_ms = pattern.hi_pause;
> > +		chan->pattern_lo_idx = lo_idx;
> > +		chan->pattern_hi_idx = hi_idx;
> > +	}
> > +
> > +free_pattern:
> > +	kfree(pattern.data);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	led_mc_calc_color_components(mc, LED_FULL);
> >  	lpg_brightness_set(led, cdev, mc->subled_info);
> >  
> >  	return 0;
> 
> [Severity: Medium]
> Similarly here, does this function mix __free(), guard(), and a goto label?
> 
> The __free(kfree) and guard(mutex) helpers are used alongside the 
> free_pattern goto label to manually kfree pattern.data. The guidelines
> recommend converting all resources in a function to scope-based cleanup 
> or none of them, to ensure consistent ownership semantics.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com?part=1

-- 
Lee Jones
