Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB875471CF6;
	Thu,  6 Aug 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026141; cv=none; b=kFd997cKyjOBYczmTtjHyCcyhP1fbxKD4JWbpek1kQMcqfQk/+zVgz9ffrqWYlObxegsnne3bksp5vLV4/JUKRGXHfhZDYeDJuVB+cckuzXewxCoyIbk+7E7BZ0RDVsJD5LIEjeVXuAyIe+JajqEraznyQFGacdwSEjSE+x4R3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026141; c=relaxed/simple;
	bh=VtwXo/4jykWskCeND8aQaiXNOGlU9qLDADrqxWbAcao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj4YXTGPTBzREAvTK0Vmr4NuNCPxsHiQ/HZ6pYUYuiG43QMu3CvjLBXcYnTeE+6paXUz7CGL04qS+6RTEYj5zZR2bKho/uzgcvGt352t2R1SJnOJyIup4lP0AIvhlvjJV8YMBQgCFBWBJiBaTlgyzffjs5PifwDbPwJPmiQe21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnH9h9+2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnH9h9+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB511F000E9;
	Thu,  6 Aug 2026 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786026138;
	bh=o9A3pTqy2pBxJsSk3e/WeoOh58o291VyYGT5YJ08/yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnH9h9+2iTT02qS5vA45NzChTyzl5X3/vGxJU3PgrvTm1imMCary8nyhVhrlNoG4T
	 NsJVSwDLVq2LgLvKwI6ePYEr828bvFymrCQ7UMBKZO+q8mptKBZ6qdsmpoqF8sEwCm
	 EW8txahh3dcIZ5+F+k4okVv/GA1wY2Ua/a4rrdLRN2Ib4wtp0GaPWN73SMSlu+weK6
	 bI1hpkrPvxKgHl8q/giAQQ/xbveCNWwIh4B5AtD48Ai4iGdPvz3d2ijXDjf4U/lC46
	 +gIs+rqJDVttSV0E6gaOfLwLxDiRddJW1mZIJJjIFlT26bFPVT1+GVVR6FOsXY2c8P
	 FjXxcNiicjDEA==
Date: Thu, 6 Aug 2026 15:22:14 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: haibo.chen@oss.nxp.com, linux-leds@vger.kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/4] leds: pca9532: check return value in
 pca9532_setled()
Message-ID: <20260806142214.GM2869284@google.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-2-09ad218457bd@nxp.com>
 <20260729075535.53DE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729075535.53DE11F000E9@smtp.kernel.org>

On Wed, 29 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] The newly added error return values from `pca9532_setled()` and `pca9532_gpio_set_value()` are ignored in the configuration and GPIO direction paths.
> - [Low] The commit message violates the LED subsystem capitalization rule.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] Incorrect teardown ordering of a devm-managed input device and a custom workqueue leads to a Use-After-Free during device removal.
> --
> 
> --- Patch [2]: [PATCH v2 2/4] leds: pca9532: check return value in pca9532_setled() ---
> commit 3e826891d5b6286d8b08ddc7c668e35465352554
> Author: Haibo Chen <haibo.chen@nxp.com>
> 
> leds: pca9532: check return value in pca9532_setled()
> 
> This commit updates pca9532_setled() to check the return value of
> i2c_smbus_read_byte_data(). By checking for read failures, it prevents
> writing bogus bitwise-modified negative error codes back to the device.
> 
> > leds: pca9532: check return value in pca9532_setled()
> 
> [Severity: Low]
> This isn't a bug, but the commit description after the subsystem prefix isn't 
> capitalized. It should probably be "Check return value in pca9532_setled()".
> 
> > diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> > index e8ee17b8bd547..adfb5aa50e8e1 100644
> > --- a/drivers/leds/leds-pca9532.c
> > +++ b/drivers/leds/leds-pca9532.c
> [ ... ]
> > @@ -159,21 +159,29 @@ static int pca9532_setpwm(struct i2c_client *client, int pwm)
> >  }
> >  
> >  /* Set LED routing */
> > -static void pca9532_setled(struct pca9532_led *led)
> > +static int pca9532_setled(struct pca9532_led *led)
> 
> [Severity: Medium]
> Since this function now returns an error code, do we also need to update
> other callers that still ignore it? 
> 
> For example, pca9532_gpio_direction_input() calls pca9532_gpio_set_value()
> (which returns the error from pca9532_setled()), but the error is discarded:
> 
> drivers/leds/leds-pca9532.c:pca9532_gpio_direction_input() {
>     ...
>     pca9532_gpio_set_value(gc, offset, 1);
>     return 0;
> }
> 
> Similarly, pca9532_configure() invokes pca9532_setled() during initialization
> without checking the result, which might leave the hardware in an undefined
> state if the I2C bus fails.
> 
> [ ... ]
> > @@ -257,9 +264,7 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
> >  	if (err)
> >  		return err;
> >  
> > -	pca9532_setled(led);
> > -
> > -	return 0;
> > +	return pca9532_setled(led);
> >  }
> >  
> >  static int pca9532_event(struct input_dev *dev, unsigned int type,
> 
> [Severity: High]
> This is a pre-existing issue, but can this event callback fire after the
> workqueue is cancelled during device removal, causing a use-after-free?
> 
> During driver unbind, pca9532_remove() calls pca9532_destroy_devices()
> which manually cancels the work:
> 
> drivers/leds/leds-pca9532.c:pca9532_destroy_devices() {
>     ...
>     cancel_work_sync(&data->work);
>     data->idev = NULL;
>     ...
> }
> 
> However, because the input device is allocated with
> devm_input_allocate_device(), it remains active and registered until
> devres cleanup runs after .remove() finishes. 
> 
> If userspace injects an EV_SND event concurrently, the input core could
> invoke pca9532_event(), rescheduling the work item via
> schedule_work(&data->work). When the scheduled work executes later, the data
> structure will have already been freed by devres.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-led-fix-v2-0-09ad218457bd@nxp.com?part=2

-- 
Lee Jones
