Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF44078DF;
	Thu, 27 Aug 2026 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838986; cv=none; b=UCAXDQtu2o0fyQ0N5nm73fbseNVQD8EmMdMbwEh4wizq/gh8UTDftJgtVDKMXiO9cXq9ASsqIYMpkVQG0V9bzrKSRG9uUmdF5/WM34CTyQc6uNuvMNAkh7PSAOd2r9kZ7zVpsUPhUlKn2vDjrXZG8hqaJ8BovHlqaJAth5w1vIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838986; c=relaxed/simple;
	bh=/b+aWL7ASttO4LoGImr7pimmlclsoRV5dyY1Lk9F7LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJPY1h52ieuFVt5m+4syPUjP00CjV5UTu8X/pxYZ9vaZtWW09rpyBc1uvaYnD8qtcVjBgAabeflsQ4aCApgzGM9RAM9cat+Q0OSyyRx/hkcGoJduj3EAM4iZ32p8QtvwCcPC1OX93/JYK4ewWYWdPODL3Y3/Q61ZMdg2UebBvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2grpNb+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2grpNb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBF01F00A3A;
	Thu, 27 Aug 2026 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787838984;
	bh=TsZEyFLUJAXiiwBH948qkb5SC4n5awjiQq+9Qs++JKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2grpNb++TjsXY0pU2amcEugeERBzIs1EAQfpiLLuNTX1t2xIeYi9xHVFCAGRGVnk
	 T/3sNt97jSfugjR9FVXK869S8+wZqUoivvj3TO+0dQj7opYLdY+/SNfRZcOPBywKsz
	 F/pGXtevP/v8Bf/vhEcbVf1yvujItTgowdDJV5KIVFnzUciX64BcLVRH/muSzdbv6b
	 hc3JBwL9FGj1AqKzFzqCj2giW+0bzx7uO6QYONDd+kWO0SfdW0YYgnnDNmMJp5HOk/
	 rsxbZcO12guovkkhNOXPrhI6w7Xf49cutP+tRDeWmTqfJ7WZwK7CK7npCXEuE+z22T
	 axiLFEiUM103w==
Date: Thu, 27 Aug 2026 14:56:21 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Rillian Grant <rillian.grant@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] leds: flash: Add support for the TI LM3643 dual
 LED flash driver
Message-ID: <20260827135621.GQ770273@google.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
 <20260821083620.68324-3-rillian.grant@gmail.com>
 <20260821084622.B77771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821084622.B77771F000E9@smtp.kernel.org>

On Fri, 21 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Turning off an LED fails to clear the chip mode bits, causing power drain and breaking flash strobe teardown.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [2]: [RFC PATCH 2/2] leds: flash: Add support for the TI LM3643 dual LED flash driver ---
> commit bdf1945ab184ca005c2f401ecd5408571ece1de3
> Author: Rillian Grant <rillian.grant@gmail.com>
> 
> leds: flash: Add support for the TI LM3643 dual LED flash driver
>     
> The LM3643 is an I2C dual LED flash driver. Its two high-side current
> sources share a synchronous boost converter and each supports torch and
> flash modes with programmable current and flash timeout alongside fault
> reporting.
> 
> > diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/leds/flash/leds-lm3643.c
> 
> [ ... ]
> 
> > +static int lm3643_torch_set_brightness(struct led_classdev *led_cdev,
> > +				       enum led_brightness brightness)
> > +{
> 
> [ ... ]
> 
> > +	if (brightness == 0)
> > +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> > +				chan->enable_bit, 0);
> 
> [Severity: High]
> When brightness is 0, this only clears the channel's enable bit but leaves
> the LM3643_MODE_MASK bits intact. If no other LEDs are active, does this
> leave the chip in an active power state (Torch or Flash mode) instead of
> transitioning to LM3643_MODE_STANDBY, potentially causing continuous battery
> drain?
> 
> [ ... ]
> 
> > +static int lm3643_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
> > +{
> 
> [ ... ]
> 
> > +	if (!state) {
> > +		if (mode != LM3643_MODE_FLASH || !(enable_reg & chan->enable_bit))
> > +			return 0;
> > +
> > +		return regmap_update_bits(led->regmap, LM3643_REG_ENABLE,
> > +			LM3643_MODE_MASK, LM3643_MODE_STANDBY);
> > +	}
> 
> [Severity: High]
> If the torch brightness was set to 0 during a flash, the channel's enable
> bit will have been cleared. During the subsequent teardown call to
> lm3643_flash_strobe_set() with state = false, does this early return trigger
> because the enable bit is no longer set?
> 
> This would fail to restore the mode to LM3643_MODE_STANDBY, permanently
> stranding the driver's state machine in Flash mode.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260821083620.68324-1-rillian.grant@gmail.com?part=2

-- 
Lee Jones
