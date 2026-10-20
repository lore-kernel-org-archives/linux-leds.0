Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491418;
	b=HxX8eaW+esypm1N1uRTWOfPhhZOhEuv2+ZF7WVPkQvTmzD+MNNOHzuZt9Qudtl1dVnTQ
	 Izerhv8B655CYU6PqsmF800jyyyyxaRE5Ywgo2U/CdpfEvayyJUiVwKThgy5FwgjIWtOy
	 TXKi+mNTAYzhkzQChLjz2xP/m6xxhS56UxuwyJIWhB05qwO2YX9tpBT0a0KQgWvXMRKyh
	 62nB6jGaV8hThDe6bOqiuHY0271jHi9VDAiF2oWsH9vdUnWolWkh7imBQg++CqnsSwcBz
	 /+x6hn6Kx6VlamcfSMNkmdtIhR9+9zj8pk+B7G+6GsLdJsMX2ZKgCMLR6vi3lSVwDZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491418;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=09K6r0+QJsvMzdEvhwkaqcT1aybjPaAJC7DGVA0azvI=;
	b=j36e+Bu8JLpRFILx5URpql+isZGheZ0hbGYLl9Wp4BLZVaZzCO/u3iXTGs0yioFgQpzf
	 J+P2tgp44Gj9ftLtqgKpnKOsXcoZ+/1MiZ/mRLpXiB6JXYhoL52STJIE2Mi6Mcq10BZ/x
	 4dtrWFJjfGeTi2TWLFObhJMjatHsThFZOtgciLXDCC40S/pVCRwLQVSVOhuWJnR/YXasI
	 XCcrafvb+e95mnokepMjIUqWCGM79HFzD54yVN15eFrHyb+64q0vggwXw0tuC38E8P1Qs
	 OvRo0ZOPTH4u9VILOGNdOHEEgpJJPwwQ3mqVXqswj31muIuuodd9LXGcRwQ+B8qSqgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lc/Hc0Pm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449E606A31C;
	Tue, 20 Oct 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lc/Hc0Pm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA831F000C4;
	Tue, 20 Oct 2026 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491417;
	bh=09K6r0+QJsvMzdEvhwkaqcT1aybjPaAJC7DGVA0azvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lc/Hc0PmYBGsSyV38q/VVJ5UePkhodxsVc8EpumxpdBippTSASKb0mN8Q5AQ6UwB9
	 vkwgt4MBO5/sPN1Q973xDTFZKLSduWkCxvwrUyVIQMtd5SrL2+wL8G/lVyjxheBgzV
	 L8wGgjUiBqT+hJTP0jZsQ8oZQsToW2uw/BdIwtXDf/GVM+to+Y9KpSzcOCzCcK0bWj
	 qwqHb152ojRUxvodlDdLMjsyUGmCuktm1e8ZhrQElXuZhgQiMdhORsHM0Nk0q9PT9c
	 QFcu7RP8CMWGyl8K1uSIb3D5Y846VUGbVF8Gy/72pMb5e1DCkgZzaIJ/8G8D+tbgQt
	 1tF8oSPNuRPoA==
Date: Tue, 20 Oct 2026 11:16:54 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Paul Sajna <sajattack@postmarketos.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
Message-ID: <20261020101654.GF1206986@google.com>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
 <sashiko-outbox-169017@kernel.org>
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
In-Reply-To: <sashiko-outbox-169017@kernel.org>

On Tue, 13 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] leds: aw2013: Unconditional chip poweroff on I2C error breaks active LEDs
> - [Medium] leds: aw2013: lockless early return skips PWM clearing on shared regulators
> - [Medium] leds: aw2013: state desync if regulator_bulk_disable() fails
> - [Low] leds: aw2013: writes to unpowered chip in aw2013_blink_set()
> --

No more reviews until Sashko is clean or everything has been reasoned about.

[...]

> commit 6dcd66138416065d07df9a5558a059f701861e00
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
>     leds: aw2013: Prevent writes to unpowered chip
> 
>     This patch replaces the chip_in_use check with a chip->enabled boolean in
>     aw2013_brightness_set to prevent writing to the chip when it is unpowered.
>     It also adds aw2013_chip_poweroff() to avoid sending I2C commands when
>     powering on the chip fails.
> 
> >     Because aw2013_chip_enable() is skipped, the driver then unconditionally
> >     calls regmap_write() and regmap_update_bits(), which perform I2C
> >     transactions to the unpowered chip.
> 
> [Severity: Low]
> Does this same issue still occur in aw2013_blink_set()?
> 
> If a prior aw2013_brightness_set() call fails (e.g., regulator enable fails),
> cdev->brightness can remain > 0 while led->chip->enabled is false.
> 
> A subsequent sysfs write to blink delays invokes aw2013_blink_set(), which
> sees brightness > 0, bypasses aw2013_brightness_set(), and unconditionally
> writes to the unpowered chip's registers:
> 
> 	/* Never off - brightness is already set, disable blinking */
> 	if (!*delay_off) {
> 		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
> 					 AW2013_LCFG_MD, 0);
> 		goto out;
> 	}
> 
> [ ... ]
> 
> > diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> > index 3b2be960c04d5..6e661afd77755 100644
> > --- a/drivers/leds/leds-aw2013.c
> > +++ b/drivers/leds/leds-aw2013.c
> > @@ -193,15 +193,13 @@ static int aw2013_chip_init(struct aw2013 *chip)
> >  	return ret;
> >  }
> >  
> > -static void aw2013_chip_disable(struct aw2013 *chip)
> > +static void aw2013_chip_poweroff(struct aw2013 *chip)
> >  {
> >  	int ret;
> >  
> >  	if (!chip->enabled)
> >  		return;
> >  
> > -	regmap_write(chip->regmap, AW2013_GCR, 0);
> > -
> >  	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
> >  				     chip->regulators);
> >  	if (ret) {
> >  		dev_err(&chip->client->dev,
> >  			"Failed to disable regulators: %d\n", ret);
> >  		return;
> >  	}
> >  
> >  	chip->enabled = false;
> >  }
> 
> [Severity: Medium]
> Could this early return cause a hardware state desynchronization if
> regulator_bulk_disable() fails?
> 
> During aw2013_chip_disable(), the driver first writes 0 to AW2013_GCR to
> enter software standby, then calls aw2013_chip_poweroff(). If the regulator
> disable fails here, it returns early leaving chip->enabled = true.
> 
> On subsequent brightness changes, aw2013_chip_enable() will see
> chip->enabled == true and skip aw2013_chip_init(). This skips restoring
> AW2013_GCR to 1, leaving the chip stuck in standby but completely
> unresponsive to brightness changes.
> 
> [ ... ]
> 
> > @@ -253,9 +261,12 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
> >  	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
> >  	int ret, num;
> >  
> > +	if (!led->chip->enabled && brightness == 0)
> > +		return 0;
> > +
> 
> [Severity: Medium]
> Can this lockless check introduce a TOCTOU race that skips clearing the
> LED's hardware registers?
> 
> If two LEDs are on and both are set to 0 concurrently, the LED core updates
> cdev->brightness = 0 for both before scheduling their asynchronous works.
> 
> The first worker executes aw2013_brightness_set(), acquires the mutex,
> clears its own PWM, and evaluates aw2013_chip_in_use(). Because both
> cdev->brightness values are now 0, aw2013_chip_in_use() returns false,
> causing the first worker to disable the chip (chip->enabled = false) and
> unlock the mutex.
> 
> The second worker then evaluates this new lockless check, which is now
> true, and returns early without ever taking the lock or clearing its PWM
> register over I2C.
> 
> When the regulators are shared with other devices, power is not physically
> cut, and the chip retains its register states in software standby. The next
> time the chip is enabled, will the second LED erroneously turn on because
> its registers were never cleared?
> 
> >  	mutex_lock(&led->chip->mutex);
> >  
> > -	if (aw2013_chip_in_use(led->chip)) {
> > +	if (!led->chip->enabled) {
> >  		ret = aw2013_chip_enable(led->chip);
> >  		if (ret)
> >  			goto error;
> 
> [ ... ]
> 
> > @@ -284,7 +295,12 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
> >  	if (!aw2013_chip_in_use(led->chip))
> >  		aw2013_chip_disable(led->chip);
> >  
> > +	mutex_unlock(&led->chip->mutex);
> > +
> > +	return ret;
> > +
> >  error:
> > +	aw2013_chip_poweroff(led->chip);
> >  	mutex_unlock(&led->chip->mutex);
> >  
> >  	return ret;
> 
> [Severity: High]
> Will this unconditional poweroff disrupt the hardware state of all other
> active LEDs on the same chip?
> 
> If multiple LEDs are ON (so chip->enabled = true) and a transient I2C error
> occurs while changing the brightness of one LED, the code jumps to this
> error label.
> 
> The new aw2013_chip_poweroff() call unconditionally drops power to the
> entire chip. This shuts down all other physically active LEDs without
> updating their cdev->brightness in the LED core.
> 
> Should this error path only roll back aw2013_chip_enable() if it was the
> call that successfully enabled the chip on this specific invocation?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=5

-- 
Lee Jones
