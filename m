Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083047;
	b=AOT4eikkRk3jP697TDcYZAWQz1avENb4caK85Az0aPH1pGZiSP/kOE5wNa99JybeClyJ
	 47TAH4fu88K0D53uxhsCTCUaRAzBmPMPmXgeYffH8jELsaZN/Mg+a2xI4X+TGoZH8EKHe
	 ImoDAmQ97nRLIOch8m4d6Qi4L8ebLLRsrg9P6fW9I0FzAGWiq/LXivmYnW20FDZQjT5xm
	 CQJ23f+Khrb8C7skWkmDtbIcYIvOXDe4pjTJNSbd8LsVwP1PB+SksiZssYvoGltSthH6r
	 Ot17g56q29LxGairVfBN+e5IP6elF3+rTSLFXrOLbbf0fm90ykCbvnTMdQ38oCMJ7rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083047;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1Bab24GiMlEA+xnbK0D9Px3eBXQ0f26JZ1gkJ7x1+Wc=;
	b=sVqyxdj6NADGzDmbeUe1qgMZjgA4RBPW4MUUrCt70vElvznBts20spg1s6YQJSeopa+i
	 1p/B0TASwzrxy0OrCKKAROWIG3MfVaRYLw/raP3Sj4+ViYU+BJS3TOV/tt0GBEHiUu1/e
	 gd2nPam1YX0SSAbs90qhird4a98Qx16SetyQ7xOhODb+s0oX8DOX1Ne00QXrMz25BAdLY
	 NhZFGhMmp3ysHVcEcaAEMJIO7ZW3gzgFIr53itPS0Je28ySEN9v6c7VhBnDUvPbHKHsSn
	 DpSKkvfE4t0Vg2iBCEo2+iGC9+6cTFhcuR3R7v9j704vy2OE18vAtHI3sj/H6ReiZ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9fom4q+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA43606A324;
	Thu, 19 Nov 2026 10:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9fom4q+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBBF1F000C5;
	Thu, 19 Nov 2026 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083046;
	bh=1Bab24GiMlEA+xnbK0D9Px3eBXQ0f26JZ1gkJ7x1+Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9fom4q+mWASByt4Hz8E+s2oKPqxDiMmIMZfYLwuWAImnMgTMd26loxYs0CXoNiYp
	 JWJnxCRbv2JTW/o9BddyNbaXvp/kjOsT/Lh2KOehY2SIJxlSRXiSO+wWFvyo0ew6kr
	 sXC75jHkPQ+luwRF6LOJizbBcPwYq/s8bhwZSz9QZXBwnGVZxsMCQhXZ0V6sBUfGCJ
	 M/2qbea2XIW9DEPzCw+TWqx4Ti+vBO5Gg9Ua2AHsv55oGSloP+muUOGE1L+A4FuIsN
	 5BzGG5C8KTM0ankP2VqnPs/YCMiDXaPfLZSKGl6IYy7cylRZAwkykEGK7dVI8/7IRO
	 iy0bwtd0D1tKg==
Date: Thu, 19 Nov 2026 10:10:42 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Joseph Telaak <joseph@telaak.dev>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
Message-ID: <20261119101042.GN98456@joneslee-macbookpro.roam.internal>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-11-56e97c226658@telaak.dev>
 <sashiko-outbox-205493@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-205493@kernel.org>

On Mon, 09 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] leds: rgb: ktd202x: on_timer cleared in
>   ktd202x_brightness_set() when dimmed
> - [Medium] leds: rgb: ktd202x: unlocked cdev->brightness race in
>   ktd202x_blink_*_set()
> --

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> commit 2bb78bf782d05191c786ef675dcadd7bc9160236
> Author: Joseph Telaak <joseph@telaak.dev>
> 
> leds: rgb: ktd202x: Don't let a blinking LED retime another one
> 
> This commit tracks which LEDs use the shared PWM1 flash timer so that
> starting a blink or hardware pattern on another LED with different timings
> returns -EBUSY instead of retiming the active LEDs.
> 
> > diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
> > index 0cc2ec3f6a7f6..e2f389d8888c9 100644
> > --- a/drivers/leds/rgb/leds-ktd202x.c
> > +++ b/drivers/leds/rgb/leds-ktd202x.c
> [ ... ]
> > @@ -212,24 +227,13 @@ static int ktd202x_brightness_set(struct ktd202x_led *led,
> >  			return ret;
> >  	}
> >  
> > -	ret = regmap_read(led->chip->regmap, KTD202X_REG_CHANNEL_CTRL, &state);
> > -	if (ret)
> > -		return ret;
> > -
> > -	/*
> > -	 * In multicolor case, assume blink mode if PWM is set for at least one
> > -	 * channel because another channel cannot be in state ON at the same time
> > -	 */
> > +	/* A LED that is turned off stops blinking and leaves the timer */
> >  	for (i = 0; i < num_channels; i++) {
> > -		int channel_state;
> > -
> > -		channel = subleds[i].channel;
> > -		channel_state = (state >> 2 * channel) & KTD202X_CHANNEL_CTRL_MASK(0);
> > -		if (channel_state == KTD202X_CHANNEL_CTRL_OFF)
> > -			continue;
> > -		mode_blink = channel_state == KTD202X_CHANNEL_CTRL_PWM1(0);
> > -		break;
> > +		if (subleds[i].brightness)
> > +			lit = true;
> >  	}
> > +	if (!lit)
> > +		led->on_timer = false;
> 
> [Severity: Medium]
> Can this clear led->on_timer while a multicolor LED's overall brightness is
> still non-zero?
> 
> In __ktd202x_brightness_mc_set(), led_mc_calc_color_components() scales
> each subled[i].brightness with DIV_ROUND_CLOSEST(value * intensity,
> max_brightness).  When a blinking or breathing multicolor LED is dimmed to
> a small non-zero brightness where every channel rounds down to 0, or when
> multi_intensity is set to 0 0 0, the LED core keeps the trigger active
> because brightness is not LED_OFF, yet !lit clears led->on_timer.  A later
> brightness or multi_intensity increase then programs
> KTD202X_CHANNEL_CTRL_ON instead of KTD202X_CHANNEL_CTRL_PWM1, leaving the
> LED steadily on and letting another LED overwrite the shared timer.
> 
> Conversely, ktd202x_timer_set() sets led->on_timer = true even when all
> subleds[i].brightness are 0.
> 
> [ ... ]
> 
> > @@ -424,10 +522,26 @@ static int ktd202x_blink_single_set(struct led_classdev *cdev,
> >  	if (!*delay_on)
> >  		return ktd202x_brightness_single_set(cdev, LED_OFF);
> >  
> > +	mutex_lock(&led->chip->mutex);
> > +
> > +	/*
> > +	 * An unlit LED blinks at the brightness of a software blink, which may
> > +	 * be in its off phase, or else at full brightness.
> > +	 */
> > +	if (!cdev->brightness) {
> > +		ret = __ktd202x_brightness_single_set(led, cdev->blink_brightness ?:
> > +						      cdev->max_brightness);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> >  	info.brightness = cdev->brightness;
> >  	info.channel = led->index;
> >  
> > -	return ktd202x_blink_set(led, delay_on, delay_off, &info, 1);
> > +	ret = ktd202x_blink_set(led, delay_on, delay_off, &info, 1);
> > +out:
> > +	mutex_unlock(&led->chip->mutex);
> > +	return ret;
> >  }
> >  
> >  static int ktd202x_blink_mc_set(struct led_classdev *cdev,
> > @@ -438,12 +552,6 @@ static int ktd202x_blink_mc_set(struct led_classdev *cdev,
> >  	struct ktd202x_led *led = container_of(mc, struct ktd202x_led, mcdev);
> >  	int ret;
> >  
> > -	if (!cdev->brightness) {
> > -		ret = ktd202x_brightness_mc_set(cdev, KTD202X_MAX_BRIGHTNESS);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> >  	/* If no blink specified, default to 1 Hz. */
> >  	if (!*delay_off && !*delay_on) {
> >  		*delay_off = 500;
> > @@ -454,8 +562,24 @@ static int ktd202x_blink_mc_set(struct led_classdev *cdev,
> >  	if (!*delay_on)
> >  		return ktd202x_brightness_mc_set(cdev, LED_OFF);
> >  
> > -	return ktd202x_blink_set(led, delay_on, delay_off, mc->subled_info,
> > -				 mc->num_colors);
> > +	mutex_lock(&led->chip->mutex);
> > +
> > +	/*
> > +	 * An unlit LED blinks at the brightness of a software blink, which may
> > +	 * be in its off phase, or else at full brightness.
> > +	 */
> > +	if (!cdev->brightness) {
> > +		ret = __ktd202x_brightness_mc_set(led, cdev->blink_brightness ?:
> > +						  KTD202X_MAX_BRIGHTNESS);
> > +		if (ret)
> > +			goto out;
> > +	}
> > +
> > +	ret = ktd202x_blink_set(led, delay_on, delay_off, mc->subled_info,
> > +				mc->num_colors);
> > +out:
> > +	mutex_unlock(&led->chip->mutex);
> > +	return ret;
> >  }
> 
> [Severity: Medium]
> Can reading cdev->brightness in ktd202x_blink_single_set() and
> ktd202x_blink_mc_set() still race with led_set_brightness_nosleep()?
> 
> Because this driver uses brightness_set_blocking,
> led_set_brightness_nosleep() updates cdev->brightness without holding
> chip->mutex and defers the hardware update to set_brightness_work:
> 
> CPU0 (<softirq> / sysfs)          CPU1
> led_set_brightness_nosleep()
>   cdev->brightness = val
>   queue_work(set_brightness_work)
>                                   ktd202x_blink_mc_set()
>                                     mutex_lock(&led->chip->mutex)
>                                     if (!cdev->brightness) -> false
>                                     ktd202x_blink_set()
>                                       ktd202x_timer_set()  <-- chip disabled
> 
> When the LED was off in hardware (such as after the off phase of software
> blinking), skipping __ktd202x_brightness_mc_set() or
> __ktd202x_brightness_single_set() leaves the chip disabled when no other
> LED is lit and leaves mc->subled_info[i].brightness at 0, so
> ktd202x_timer_set() writes registers to a powered-down chip and leaves the
> channels off while setting led->on_timer = true.
> 
> In ktd202x_blink_single_set(), cdev->brightness is also read a second time
> for info.brightness, so a concurrent led_set_brightness_nosleep(cdev,
> LED_OFF) can set cdev->brightness = 0 in between and pass info.brightness =
> 0 to ktd202x_blink_set().
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev?part=11

-- 
Lee Jones
