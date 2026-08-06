Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A13FB042;
	Thu,  6 Aug 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013131; cv=none; b=iF+zIqMg475qLANXrlFTKiee+aZv3u4edTkKdpZ/JhrmX3Zkk7exOpMu8Nrcjm8jyd6L8Mmw9Rwgm+J1ETifXQLflQDbK98ODYq2GhQts32IR1ylrZ7TkF8mTKCx9SlMwnFm4MKeXUaTYOLK1O96AKwd86WbPwZ1FC8ua6W4pWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013131; c=relaxed/simple;
	bh=MtAjXb0GC9qtU8O6jN3mSAf62YIUZG+BsH47xlOo0kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQjHnRuG9sX8TMLIJpYQ9JK3KCqMfgHwCcCrTKOzgUKhzhzTX4w+Tyniyg+5ULOo136xJ349w/eAfJGLpt9WcnVZHEyrSkbaAiYi43yblCMKYfqA+EL0GLeXonCXRBbtyq4MpmtALZ1+NRbDG44DUR0lTa2XRyIIlMpD1camehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/aEsNsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/aEsNsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FBA1F000E9;
	Thu,  6 Aug 2026 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013129;
	bh=UvgW13cGx5sULFG3dOsr4BPa1hUA/eN36ycS3FZY3Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H/aEsNsUwoZ42Jy5S2els0kCmFIUc/WITVkbgO04hDjJ+QMthuOnSv2q4S8cDEbz2
	 DU2vQo6U8q+MmTTeGRLJBvnQeipWhX8CFUvl+SGk+y4OuyNZ/hFguxXwM/DhSGcLpg
	 E0dDF0oCbF85bVGCDlxVZPlnZovNydXCXiSqTMG2u2eBkVq5zfgv7K/eN6EWln/rYR
	 IkQeXM79M6v/OeBqnqk0BbLPFfVL0x2kqMDPrAbHvQOel610cJzCr5uLqTPzo9PA6F
	 QNMNkBmjgMSkXs2r3edf4s53aJGzat8qGkWy4AeMD5siKXDD59a6Gbo2cEMcUDqV04
	 SgZi6IhdAcvAQ==
Date: Thu, 6 Aug 2026 11:45:25 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-leds@vger.kernel.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260806104525.GC10716@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
 <20260804135515.5DBFC1F000E9@smtp.kernel.org>
 <20260804164101.43753f1b@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804164101.43753f1b@kemnade.info>

On Tue, 04 Aug 2026, Andreas Kemnade wrote:

> On Tue, 04 Aug 2026 13:55:14 +0000
> sashiko-bot@kernel.org wrote:
> 
> > > leds: is31fl319x: modernize registration  
> > 
> > [Severity: Low]
> > This isn't a bug, but should the description after the subsystem prefix be
> > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > as "leds: <Driver>: <Capitalized description>".
> 
> 
> ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> ~/linux$ ls Documentation/leds/
> index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> leds-class.rst             leds-mlxcpld.rst     uleds.rst
> leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> leds-lm3556.rst            leds-qcom-lpg.rst
> leds-lp3944.rst            leds-s2m-rgb.rst
> 
> nothing look like special guidelines for the system. I do not want to
> see such comments without a reference.
> Also MAINTAINERS does not show any additional policy for the LED subsystem.

`git log --oneline -- <subsystem>` is your friend.

 % git log --oneline -n10 -- drivers/leds
8d6b6c05b8e3 leds: pca9532:  Fix phantom device registration on missing hardware
98c5c7b0d426 leds: gpio:     Make legacy gpiolib interface optional
b6e08e0ad4cf leds: bcm63138: Use %pe to print pinctrl error instead of %ld
07e028d93a57 leds: ltc3220:  Add Support for LTC3220 18 channel LED Driver
cf197514bdfd leds: st1202:   Validate LED reg property against channel count
0767335233a8 leds: st1202:   Disable channel when brightness is set to zero
7cbe470366bd leds: st1202:   Fix brightness having no effect while pattern mode is active
dcc31246aaf0 leds: st1202:   Fix spurious pattern sequence start in setup
d2ca0e2b6d64 leds: st1202:   Set all pattern PWM slots to full after clearing pattern
d32f8bdc2b41 leds: st1202:   Fix pattern duration prescaler and pattern_clear skip marker

-- 
Lee Jones
