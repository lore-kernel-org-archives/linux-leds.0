Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51D414418;
	Tue, 15 Sep 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470445; cv=none; b=bq6YLIiIriNIA/lSDY+N3ho2cfvhDZZBOgmKtel/tKoBK5mBs2xEwDOG7rmlSFghIh3UV4jwbVemYrlhPyGSWFb6MEZEgvjesvdUW8CODDCQHPg7pPfuUXcBXrJK7se9oDrfFqrIJLGCjVpKiTfP5/Kp1JbO0noP0igRRg7sAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470445; c=relaxed/simple;
	bh=eBp4h+7cPYV3PyJ8Rj8aNlGD2veZAlr4aNSUXmJE1Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnZS83E5G0WEVe17zGTY3yi2Ajhk+lxsGyobCk74AfrLLzmsGplz3C5pbMwqu3Ftnjn+miEbmR0ja0ETmayd5rxjB2dv7JSoEyjZr1L0LpiEoCQst56loJFEXSx+mbNnwOA4cGgD/1oMAtV56uzQi0Xlslc+aFp+OeyAeF6TCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUyWPS9O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUyWPS9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755921F000FF;
	Tue, 15 Sep 2026 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470443;
	bh=Ouzbh7dZPn9Yw6vd2rYWvCSztsBHlYK0YoEuzqInt+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUyWPS9OT0207Wl27AbILw3brqIkjAerQk/08dT4Yq6n2LflVDZF7YcFNuS1GVaaX
	 jLIzv8UrmdNmFYZhP+fpOJ63EuuvrS3LJvCaiRzE2+iOUZV58tg1aIOeRA58Gb7dmQ
	 RfAE5WuFW3aoStjNdpcOsK+2GH1vFclfHAOhrhCE0Sl8KkNDtGNBHq5BxgkyesfM7/
	 JCDiYqr355d1dHUnVvmMikcgv5aRWNMpHNIFNdUXre7b2ISH0NlbPdhwc3KSzVV0f6
	 HVfolcxEwqqi9Qo0bub3FUfwuBFjiY/fjT4STZIYJbz+ffzHMJQKzYdU03V6kXA1g/
	 dJbBVn5xnjSZQ==
Date: Tue, 15 Sep 2026 12:07:19 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Rudraksha Gupta <guptarud@gmail.com>, devicetree@vger.kernel.org,
	robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 2/3] leds: flash: rt8515: Support single-GPIO flash
 ICs with vin supply
Message-ID: <20260915110719.GB11487@google.com>
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-2-e1fd2edc8d84@gmail.com>
 <20260913025029.34B121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913025029.34B121F000FF@smtp.kernel.org>

On Sun, 13 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Regulator is not enabled when requesting maximum torch brightness, preventing the LED from turning on.
> - [High] Replacing mod_timer with schedule_delayed_work silently drops updates to the strobe timeout and causes premature LED power down.
> - [Medium] Unbalanced regulator disable due to reliance on the global/physical regulator state instead of the driver's consumer enable count.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [Critical] Premature destruction of mutex and cancellation of workqueue during device removal while the LED class device is still registered, leading to a Use-After-Free.
> --
> 
> commit 6a964f82a818f57f5a1a31366f614609bc9c5008
> Author: Rudraksha Gupta <guptarud@gmail.com>
> 
> leds: flash: rt8515: Support single-GPIO flash ICs with vin supply
> 
> This commit extends the RT8515 driver to support flash ICs that use
> only a single GPIO for both flash and torch modes, alongside an
> optional vin regulator that gates power to the flash IC.
> 
> > diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
> > index 00904cc90ed6e..541f61e13f018 100644
> > --- a/drivers/leds/flash/leds-rt8515.c
> > +++ b/drivers/leds/flash/leds-rt8515.c
> [ ... ]
> > @@ -62,27 +66,50 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
> >  	return container_of(fled, struct rt8515, fled);
> >  }
> >  
> > -static void rt8515_gpio_led_off(struct rt8515 *rt)
> > +static int rt8515_gpio_led_off(struct rt8515 *rt)
> >  {
> > -	gpiod_set_value(rt->enable_flash, 0);
> > -	gpiod_set_value(rt->enable_torch, 0);
> > +	gpiod_set_value(rt->enable_flash, RT8515_OFF);
> > +	gpiod_set_value(rt->enable_torch, RT8515_OFF);
> > +
> > +	if (!rt->reg)
> > +		return 0;
> > +
> > +	return regulator_is_enabled(rt->reg) > 0 ? regulator_disable(rt->reg) : 0;
> 
> [Severity: Medium]
> Since regulator_is_enabled() returns the global physical state rather than
> the per-consumer enable count, could this lead to an unbalanced disable if
> the regulator is marked always-on or shared with another consumer?
> 
> Because rt8515_gpio_led_off() is reachable from user-controllable sysfs
> attributes via rt8515_led_brightness_set(), repeated calls when the driver
> has not enabled the regulator might cause the regulator core to throw a
> warning and return -EIO. Should the driver maintain its own boolean state
> to track whether it has enabled the regulator?
> 
> >  }
> [ ... ]
> > @@ -91,23 +118,37 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
> >  {
> >  	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
> >  	struct rt8515 *rt = to_rt8515(fled);
> > +	int ret = 0;
> >  
> >  	mutex_lock(&rt->lock);
> >  
> >  	if (brightness == LED_OFF) {
> > -		/* Off */
> > -		rt8515_gpio_led_off(rt);
> > +		ret = rt8515_gpio_led_off(rt);
> > +		if (ret)
> > +			goto out;
> >  	} else if (brightness < RT8515_TORCH_MAX) {
> > -		/* Step it up to movie mode brightness using the flash pin */
> > -		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
> > +		/*
> > +		 * Step it up to movie mode brightness.
> > +		 * If there is no separate torch pin, use the flash pin
> > +		 * for torch as well.
> > +		 */
> > +		ret = rt8515_gpio_brightness_commit(rt,
> > +				rt->enable_torch ?: rt->enable_flash, brightness);
> > +		if (ret)
> > +			goto out;
> >  	} else {
> > -		/* Max torch brightness requested */
> > -		gpiod_set_value(rt->enable_torch, 1);
> > +		/*
> > +		 * Max torch brightness requested.
> > +		 * If there is no separate torch pin, use the flash pin
> > +		 * for torch as well.
> > +		 */
> > +		gpiod_set_value(rt->enable_torch ?: rt->enable_flash, RT8515_ON);
> 
> [Severity: High]
> If a transition is made from LED_OFF directly to max torch brightness, the
> optional vin regulator remains disabled because
> rt8515_gpio_brightness_commit() is completely bypassed here. Does this mean
> the max torch state might silently fail to power the IC?
> 
> >  	}
> >  
> > +out:
> >  	mutex_unlock(&rt->lock);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> > @@ -116,27 +157,35 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> [ ... ]
> > -	if (state) {
> > -		/* Enable LED flash mode and set brightness */
> > -		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
> > -		/* Set timeout */
> > -		mod_timer(&rt->powerdown_timer,
> > -			  jiffies + usecs_to_jiffies(timeout->val));
> > -	} else {
> > -		timer_delete_sync(&rt->powerdown_timer);
> > -		/* Turn the LED off */
> > -		rt8515_gpio_led_off(rt);
> > -	}
> > +	/* Enable LED flash mode and set brightness */
> > +	ret = rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
> > +	if (ret)
> > +		goto out;
> > +
> > +	/* Set timeout */
> > +	schedule_delayed_work(&rt->powerdown_work, usecs_to_jiffies(timeout->val));
> 
> [Severity: High]
> Does schedule_delayed_work() correctly handle consecutive flash strobe
> commands? Unlike mod_timer(), schedule_delayed_work() silently ignores
> updates if the work is already pending. This could cause consecutive V4L2
> flash strobes to fail to extend the timeout, shutting down the flash
> prematurely.
> 
> Additionally, if the delayed work is actively executing and blocked waiting
> on rt->lock, its pending bit is cleared. In that scenario, could
> schedule_delayed_work() queue a duplicate instance of the work that
> immediately shuts down the LED as soon as the lock is released? Would using
> mod_delayed_work() resolve these state management issues?
> 
> >  
> >  	fled->led_cdev.brightness = LED_OFF;
> >  	/* After this the torch LED will be disabled */
> >  
> > +out:
> >  	mutex_unlock(&rt->lock);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> [ ... ]
> > @@ -327,12 +389,17 @@ static int rt8515_probe(struct platform_device *pdev)
> [ ... ]
> >  	platform_set_drvdata(pdev, rt);
> >  
> >  	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
> 
> [Severity: Critical]
> This is a pre-existing issue, but registering the LED class device via the
> devm API schedules its sysfs interfaces to be unregistered after
> rt8515_remove() returns.
> 
> [ ... ]
> > @@ -371,7 +438,7 @@ static void rt8515_remove(struct platform_device *pdev)
> >  	struct rt8515 *rt = platform_get_drvdata(pdev);
> >  
> >  	rt8515_v4l2_flash_release(rt);
> > -	timer_delete_sync(&rt->powerdown_timer);
> > +	cancel_delayed_work_sync(&rt->powerdown_work);
> >  	mutex_destroy(&rt->lock);
> 
> Because devres destroys the sysfs interfaces after this function returns,
> could a concurrent user-space write to sysfs (like triggering a flash
> strobe) occur during this window? This would cause the sysfs handler to
> attempt to lock the destroyed mutex and queue work on the freed device
> structure, leading to a use-after-free. Should devm_add_action_or_reset()
> be used here instead to ensure the work and mutex are only destroyed after
> the devm-managed LED registration is cleanly torn down?
> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com?part=2

-- 
Lee Jones
