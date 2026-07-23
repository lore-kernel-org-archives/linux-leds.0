Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46F3BB678;
	Thu, 23 Jul 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806098; cv=none; b=qNYooLaqckyn6R6mSfSeBh2F5ceHzjJgQNNCYtXs0D+/p+3aoi6lY6giRZBsjX/GJ9l4LVufVOqJNTM+J5MybHPCRxP1QzCq4nOU4lV6ru2Anqn0lGlIWfwZ+XrBjtipYkU0Zhe5Mb4Fhbm/bHeaRqMFYq+tIK+ce+xcDaAF834=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806098; c=relaxed/simple;
	bh=IRD96qgSS82fn0StmkakVBsLQ1U+EoQ2QZnwh0dcczU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwbLrCFIS8CP8kdjXFiluYb22pkAeKwMkszlaw6PCYAu4XPMYNkjT4Ao02jPRqi/kUKkjf94Aoz5+qnFMYDLRrHLiA9thPMxekTaCckPJlrmjt+lhWD7FDxWU6oWd1cqm3EInaVnsH2gMwXxT7ipP/DSoIDsa4Jjek2kaVB6Jns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff2ZZj6B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff2ZZj6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7B61F000E9;
	Thu, 23 Jul 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806097;
	bh=H0SJdquTNhKDqZsMUaH/CV0jttTXsXqwF581PO9P/y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ff2ZZj6B30ZjCL+U3n5Nksum4yOAZY5vn0Xoc7kmkpPC+qg+KlnHpN1zxBma2WEJd
	 HQEBfQ/upukUh130yr928BWNwTb/zqN23cExIg6Pm7NMW6ijJQgqdos3qEbBq8IGVc
	 0PjsVVQ3QGsl9jeo8+F0nnO13MNabHsK2cwZxP38XEnSvx/2Xb8zlT6/c3l7J1cIAA
	 m7WpHFjyH0rAtEOkuk7JzOkYASvopqemzXjOMaw6hVatDY6fOQtcZAKK9Uwv6ejrk5
	 rk04B7IwoQrzKNqmC4jnMXawi1Ha8yIxaMBiSm63JT3qyRnS6sqik13j/bzZgTZBmm
	 fc/bTFh+GOtOw==
Date: Thu, 23 Jul 2026 12:28:13 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: David Lee <david.lee@trailofbits.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: class: disable sysfs before unregistering LED
 devices
Message-ID: <20260723112813.GA3363113@google.com>
References: <20260709101210.104975-1-david.lee@trailofbits.com>
 <20260709103011.60FE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709103011.60FE51F000E9@smtp.kernel.org>

On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Reusing `LED_SYSFS_DISABLE` for unregistration teardown conflicts with V4L2 flash, which can clear the flag during unregistration and bypass the patch's protection.

I need to see that you at least considered this.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but missing the `led_sysfs_is_disabled()` check in `multi_intensity_store()` bypasses the patch's newly introduced teardown protection, allowing the use-after-free to still occur for multicolor LEDs.
> - [High] This problem wasn't introduced by this patch, but concurrent `led_trigger_register` can attach a trigger to an unregistering LED device whose embedded `dev` structure has already been freed, leading to a Use-After-Free.
> - [High] This problem wasn't introduced by this patch, but LED triggers have a Use-After-Free race condition where their sysfs attributes can execute concurrently with or after trigger deactivation.
> --
> 
> --- Patch [1]: [PATCH] leds: class: disable sysfs before unregistering LED devices ---
> commit a26d864d321effb464ac1db24d6210a72a4d07d3
> Author: David Lee <david.lee@trailofbits.com>
> Subject: leds: class: disable sysfs before unregistering LED devices
> 
> This commit attempts to fix a lifetime race during LED unregistration
> by locking led_access and setting LED_SYSFS_DISABLE early in
> led_classdev_unregister(). This blocks sysfs writers from accessing the
> embedded struct led_classdev while it is being torn down.
> 
> > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > index 6a8ea94834fa3..a6c2468c0da1e 100644
> > --- a/drivers/leds/led-class.c
> > +++ b/drivers/leds/led-class.c
> > @@ -435,6 +435,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
> >  	if (IS_ERR_OR_NULL(led_cdev->dev))
> >  		return;
> >  
> > +	mutex_lock(&led_cdev->led_access);
> > +	led_sysfs_disable(led_cdev);
> > +
> 
> [Severity: High]
> Does overloading LED_SYSFS_DISABLE for unregistration conflict with V4L2
> flash devices?
> 
> If a user closes the V4L2 subdevice file concurrently during driver removal,
> v4l2_flash_close() actively clears this flag:
> 
> drivers/media/v4l2-core/v4l2-flash-led-class.c:v4l2_flash_close() {
>     ...
>     led_sysfs_enable(led_cdev);
>     mutex_unlock(&led_cdev->led_access);
> }
> 
> Could this allow a blocked sysfs writer to acquire led_access after
> unregister unlocks it, incorrectly see sysfs as enabled, and schedule work
> on an unregistering or freed device?
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the lack of a
> led_sysfs_is_disabled() check in multi_intensity_store() bypass this newly
> added teardown protection?
> 
> If a concurrent sysfs write to multi_intensity blocks on led_access, and
> acquires it after unregister unlocks it:
> 
> drivers/leds/led-class-multicolor.c:multi_intensity_store() {
>     ...
>     mutex_lock(&led_cdev->led_access);
> 
>     for (i = 0; i < mcled_cdev->num_colors; i++) {
>     ...
> }
> 
> Because it immediately proceeds without checking if sysfs is disabled,
> could it call led_set_brightness() and schedule new work after unregister
> has already flushed work queues, leading to a use-after-free?
> 
> >  #ifdef CONFIG_LEDS_TRIGGERS
> >  	down_write(&led_cdev->trigger_lock);
> >  	if (led_cdev->trigger)
> >  		led_trigger_set(led_cdev, NULL);
> >  	up_write(&led_cdev->trigger_lock);
> >  #endif
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-free
> race condition when clearing the trigger here?
> 
> In led_trigger_set(), the deactivate callback is executed before the sysfs
> groups are removed:
> 
> drivers/leds/led-triggers.c:led_trigger_set() {
>     ...
>     if (led_cdev->trigger->deactivate)
>         led_cdev->trigger->deactivate(led_cdev);
>     device_remove_groups(led_cdev->dev, led_cdev->trigger->groups);
>     ...
> }
> 
> Since sysfs operations for triggers (like transient_activate_store()) do not
> acquire led_access, could a sysfs write that is preempted resume after
> deactivate() frees the private data, modifying freed memory before
> device_remove_groups() can prevent it?
> 
> [ ... ]
> 
> > @@ -455,6 +458,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
> >  	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
> >  		led_remove_brightness_hw_changed(led_cdev);
> >  
> > +	mutex_unlock(&led_cdev->led_access);
> > +
> >  	device_unregister(led_cdev->dev);
> >  
> >  	down_write(&leds_list_lock);
> >  	list_del(&led_cdev->node);
> >  	up_write(&leds_list_lock);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does unregistering the
> device before removing the LED from the global leds_list leave a dangling
> pointer?
> 
> If device_unregister() drops the final reference and frees the device
> structure, could a concurrent led_trigger_register() iterating over
> leds_list match this unregistering LED?
> 
> drivers/leds/led-triggers.c:led_trigger_set() {
>     ...
>     ret = device_add_groups(led_cdev->dev, trig->groups);
>     if (ret) {
>     ...
> }
> 
> Could this lead to led_trigger_set() dereferencing the already-freed
> led_cdev->dev when attempting to attach the trigger's sysfs groups?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709101210.104975-1-david.lee@trailofbits.com?part=1

-- 
Lee Jones
