Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD472BE056;
	Thu,  6 Aug 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020542; cv=none; b=eCfFP+EPIgUw1yUUz0vhBFVfBAAk9VpYMV2siQCbS1gfkIixVNLqyjyAgaL+eycx0mEgztHe7LztYNNS/rV0z1Unra4cUWFVHSHuWOhggHScSadS4+ELj61WLQoFChL+wleo/nb1qFuT72R6rDuR4n46itZRt3TLzZggABdvMlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020542; c=relaxed/simple;
	bh=9Dabau0f9xHODBKSU23DBYxwfVv/mE3CpvFsCrqQ5EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujG5If6kuRbxdoUsfoaySNDEyEpbBKYiMXD2WH8L1IXLV2UUYrZycvBBdini6gRvis5NGjxPisqYkFVmJUiUwNPGXXvzLR4vTFDCa2K9lVa1MK+Py+n/HiJx95Ahhde2vu7tnO9NjS6tGJnx0Z1roWoWtLj+uC3N/yTLSDMBfvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV6K8Ei6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV6K8Ei6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3651F000E9;
	Thu,  6 Aug 2026 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020540;
	bh=UYQTVSuGK5qCmIwR4n8CH7+Yn8zit5/QtYtjfjDba8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DV6K8Ei60sSyvO9eozNVDuGSs0bSx1bPP3ex1eqnasRx7PEgBKpT9m+3XBhscU+SL
	 LBG0V9VConjajo4CwWnXtYWDI6SE/qbZ2S545s1CkAcijO0Ot+E+4QnKpR5zzcBbL4
	 xTAI0eBlvg0WrZG5Q42pis7AQjmxTQheA6bNlFRSnbIR9YRIi6Ri6lfBYbWk6Oifnq
	 EY2lQk1Qq76/nc0oYqfT0G0QEdPIkdF2nkAWkzebyqEXRHoCscz8Eaa5Qv7SkdU0m0
	 S2RsDbn4e6mfnkJ0jVAaMJIa5EAtTHXWrvwmByvcPjobHWINt95+czzWw4AUo6irjx
	 79k+sU63rTOcQ==
Date: Thu, 6 Aug 2026 13:48:57 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: kr494167@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: lp5860: fix init error-path locking
Message-ID: <20260806124857.GE2869284@google.com>
References: <20260720102525.86475-1-kr494167@gmail.com>
 <20260720103702.195E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720103702.195E61F000E9@smtp.kernel.org>

On Mon, 20 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [Medium] The commit message falsely claims a deadlock existed on the `regmap_update_bits()` error path.
> - [Low] The commit message prefix and description violate subsystem capitalization guidelines.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] The driver destroys its primary mutex in `.remove()` before executing hardware teardown and devres cleanup, causing multiple use-after-destroy locking violations.
> - [High] LEDs are unregistered via devres after the chip is manually disabled, risking invalid hardware accesses.
> --
> 
> --- Patch [1]: [PATCH] leds: lp5860: fix init error-path locking ---
> commit 2979577a641c15da3d90ccaf3a97200e7e476dbb
> Author: surendra <kr494167@gmail.com>
> 
> leds: lp5860: fix init error-path locking
> 
> This commit addresses a locking issue in the initialization error path for
> the lp5860 driver. It releases the lock immediately after the regmap update,
> avoiding potential lock mismanagement in the subsequent error paths.
> 
> > leds: lp5860: fix init error-path locking
> 
> [Severity: Low]
> According to the LED subsystem naming conventions, should the description
> after the subsystem prefix be capitalized? So "fix" would become "Fix".
> 
> > lp5860_device_init() jumps to err_disable with the mutex held when
> > regmap_update_bits() fails. The error handler calls lp5860_chip_enable(),
> > which tries to acquire the same mutex and deadlocks.
> >
> > Conversely, an lp5860_init_dt() failure reaches the same handler after the
> > mutex has been released, causing mutex_unlock() to operate on an unlocked
> > mutex.
> 
> [Severity: Medium]
> Is this description of a deadlock accurate?
> 
> Looking at the original code, the err_disable block explicitly executed 
> a mutex_unlock() before calling lp5860_chip_enable():
> 
> err_disable:
> 	mutex_unlock(&lp->lock);
> 	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
> 	return ret;
> 
> Since lp5860_chip_enable() uses guard(mutex)(&lp->lock), it safely 
> re-locks the just-released mutex. Could the commit message be updated to 
> clarify that this fixes a double-unlock bug when lp5860_init_dt() fails, 
> rather than a deadlock on the regmap_update_bits() path?
> 
> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> > index fd0e2f6e6e0f4..e21d5f2302be0 100644
> > --- a/drivers/leds/rgb/leds-lp5860-core.c
> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
> > @@ -204,9 +204,9 @@ int lp5860_device_init(struct device *dev)
> >  	mutex_lock(&lp->lock);
> >  	ret = regmap_update_bits(lp->regmap, LP5860_REG_DEV_INITIAL, LP5860_MODE_MASK,
> >  				 LP5860_MODE_1 << LP5860_MODE_SHIFT);
> > +	mutex_unlock(&lp->lock);
> >  	if (ret)
> >  		goto err_disable;
> > -	mutex_unlock(&lp->lock);
> >  
> >  	ret = lp5860_init_dt(lp);
> >  	if (ret)
> > @@ -215,7 +215,6 @@ int lp5860_device_init(struct device *dev)
> >  	return 0;
> >  
> >  err_disable:
> > -	mutex_unlock(&lp->lock);
> >  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
> 
> [Severity: High]
> This is a pre-existing issue, but does destroying the mutex in 
> lp5860_remove() before calling hardware teardown lead to a 
> use-after-destroy violation?
> 
> In the spi driver, we have:
> 
> lp5860_remove() {
> 	...
> 	mutex_destroy(&lp5860->lock);
> 	lp5860_device_remove(&spi->dev);
> }
> 
> But lp5860_device_remove() calls lp5860_chip_enable(), which acquires 
> the just-destroyed mutex:
> 
> lp5860_chip_enable() {
> 	guard(mutex)(&lp->lock);
> 	...
> }
> 
> Will this cause a kernel crash when lock debugging is enabled?
> 
> 
> [Severity: High]
> This is also a pre-existing issue, but does unregistering the LEDs via 
> devres after manually disabling the chip cause invalid hardware accesses?
> 
> The driver uses devm_led_classdev_multicolor_register_ext() to register 
> LEDs, which handles unregistration automatically via devres during device 
> removal. However, the manual lp5860_device_remove() call happens before 
> devres cleanup:
> 
> lp5860_remove() {
> 	...
> 	lp5860_device_remove(&spi->dev);
> }
> 
> The automatic devres cleanup will eventually set the brightness to 0, 
> invoking lp5860_set_mc_brightness(). Since the chip was already disabled 
> manually in lp5860_remove(), could this result in regmap I/O to disabled 
> hardware over SPI? Should the hardware teardown be synchronized via a 
> managed devres action instead?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720102525.86475-1-kr494167@gmail.com?part=1

-- 
Lee Jones
