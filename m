Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC141D12C;
	Wed, 12 Aug 2026 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535883; cv=none; b=VEbJKc3fP8R3YF9aQWeHYjWmwu//4JmGQArunfZkb+ul8er/FPMzTTiiR++Lf8ksjzixyDiOJcXMeQh0LK6fMJHqW1Dt0xIOaSbL58W8AVA4eDGuGBOYU0NODE9m5qTQTAjG9OdvCG510u4OsQYGwAo61+xO9yMjhw6yUCF+de4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535883; c=relaxed/simple;
	bh=dpSXZxnuZRcj6q53v3s/OXLqfwguVrdIY5jpbnZojmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Srcow0ZIb4KE3YmcRjVYbM48LsyqB7OLipvHaatzb20Edkq/lLAM/AkHBGMBMR77dKgwvtjJj2TSmtIPkVoj624wa83MOgVsHa1nPLlJvzcxx7jJ3RdojYWLws/ITlPxpV72Nw2ACxqkqu25jqdtMqKIDWMpiBiDQA3B2fxuIOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idrxrX16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idrxrX16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F951F000E9;
	Wed, 12 Aug 2026 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535882;
	bh=M8pJX8hla0ypQAX7c+5+Zy+8E9SmO2ddbuSLniU6aLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=idrxrX16EHJ4q8opOjw66de+ozdyvUIlG19KyWB5tSzFCqm0U4BugjMBeKGkdcbkH
	 n8WhlzoWHXFpIz5BZVeAhf4s1pyn8yWHTWWtr7YWLda860g4NsSY7l4p/tDGMR8CJ1
	 jNZ++bG5jcCtGX4LMF+vtBXX6js4eNx8ej/QdukZNR/X2HM8yFm50FHc3G/tqNC+N/
	 AXSxl6xvSepAwfnV23ix/duzsaROROynpIvTr7AxGBfm7/ymSrvBNegw7x3LPbyZId
	 IqYe09jPZxYidixmesUecKsoT2jS5JYGIfHm1bdeMZsiD06KLIxCEwqGbtktmDK805
	 QKb7xKDnH1/KQ==
Date: Wed, 12 Aug 2026 12:57:58 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Manuel Fombuena <fombuena@outlook.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink
 support
Message-ID: <20260812115758.GN1072730@google.com>
References: <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <20260806174250.1771E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806174250.1771E1F000E9@smtp.kernel.org>

On Thu, 06 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Hardware blinking destructively overwrites the PWM state of all other active LEDs, forcing them permanently off.
> - [Medium] Hardware blink forces maximum brightness, ignoring user-configured brightness.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] The driver improperly assigns a sleeping function to the led_cdev->brightness_set callback, causing a 'sleeping in atomic' bug.
> - [High] A dangling fwnode pointer is stored in `led->fwnode` due to a dropped reference count, leading to a UAF upon dereference.
> --
> 
> --- Patch [1]: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink support ---
> commit d3cba330dd18edf23569d762b5d09a2ae91bdf35
> Author: Manuel Fombuena <fombuena@outlook.com>
> 
> leds: st1202: Add hardware-accelerated blink support
> 
> This commit implements blink_set() to enable hardware-accelerated blinking
> via the timer trigger on the ST1202 LED driver. The pattern engine is used
> to produce a two-step sequence with delays clamped to hardware limits.
> 
> > diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> > index 168df5ecf27b7..ea019d03ad907 100644
> > --- a/drivers/leds/leds-st1202.c
> > +++ b/drivers/leds/leds-st1202.c
> [ ... ]
> > @@ -275,6 +276,89 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
> [ ... ]
> > +	/* Zero out PWM for all other active channels to prevent them from blinking */
> > +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
> > +		if (!chip->leds[i].is_active || i == led->led_num)
> > +			continue;
> > +		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
> 
> [Severity: High]
> Does this loop permanently overwrite the PWM configuration for other active
> LEDs?
> 
> If another LED was previously configured to be statically on, it looks like
> this forces it to be permanently dark. When the hardware blink is stopped,
> the original PWM configurations for these LEDs are never restored, which
> would leave them completely desynchronized from their software
> led_cdev->brightness state.
> 
> > +		if (ret)
> > +			return ret;
> > +		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
> > +		if (ret)
> > +			return ret;
> > +	}
> [ ... ]
> > +	for (int pattern = 2; pattern < ST1202_MAX_PATTERNS; pattern++) {
> > +		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
> 
> [Severity: Medium]
> Does this force the LED to maximum brightness during a blink, ignoring the
> currently configured led_cdev->brightness or led_cdev->blink_brightness?
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __st1202_channel_set(chip, led->led_num, true);
> [ ... ]
> > @@ -301,6 +385,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
> >  		led->led_cdev.pattern_set = st1202_led_pattern_set;
> >  		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
> >  		led->led_cdev.default_trigger = "pattern";
> > +		led->led_cdev.blink_set = st1202_blink_set;
> >  		led->led_cdev.brightness_set = st1202_brightness_set;
> 
> [Severity: High]
> This is a pre-existing issue, but does assigning st1202_brightness_set() to
> the non-blocking brightness_set callback cause a "sleeping in atomic" panic?
> 
> The LED subsystem requires that brightness_set not sleep, as it is called
> from atomic contexts like software timers. Looking at
> st1202_brightness_set(), it takes a mutex and performs I2C operations which
> can sleep:
> 
> st1202_brightness_set()
>     guard(mutex)(&chip->lock);
>     ...
>     st1202_write_reg() -> i2c_smbus_write_byte_data()
> 
> Should this be assigned to brightness_set_blocking instead?
> 
> >  		led->led_cdev.brightness_get = st1202_brightness_get;
> >  	}
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential use-after-free
> relating to how led->fwnode is stored earlier in st1202_dt_init().
> 
> The driver iterates over child nodes using
> for_each_available_child_of_node_scoped(), which automatically decrements
> the child node's reference count at the end of each iteration.
> 
> Inside this loop, the fwnode is stored without incrementing its refcount:
> 
>     led->fwnode = of_fwnode_handle(child);
> 
> Since fwnode_handle_get() is not called, does led->fwnode become a dangling
> pointer when the loop finishes? This pointer is later passed to the LED
> core during registration in st1202_probe(), which could cause a UAF if the
> memory is reclaimed.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com?part=1

-- 
Lee Jones
