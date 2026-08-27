Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C337B3FE;
	Thu, 27 Aug 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849804; cv=none; b=Ro9pF583WNZhqBQJK8muT+w3CV5XVVz8RoFnucIWH0s89nlnvoJ7OJjAXp7EDBnARpgBorS3QGRg0MWtxvQEal1flZHdX+Z3buuh5TSycf9Gk5UA3NPFmBPyEqLTAnHji3br1oQZ9SST2s/6mLPs5svW+V6b+TbE6hXzICPmdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849804; c=relaxed/simple;
	bh=vzBZhdaIgl31+yOBeaR3Ppwf1WX/+Vm/3QwrSZCJW1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC9FpktThH2Cx813p7b2267G9U16U0Y5p3pZ/4KyY+aCIb4CmiFRCGIv4h8pZNC5t9P3uH/R/tSVp5UJRuTu+6dzwb2W4fDSU8a8DgWDgQtIvxOvGpgf/oy0UQyAszf5bl3rAEoHqMev4qYIR/S6lnGSJ9dC4kt16BocBuaeoTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZsPpygA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZsPpygA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADC81F000E9;
	Thu, 27 Aug 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849802;
	bh=Z3MUP6Bwv+cqPINMRPGl0CTTrm0ni+uUUE/06XCeKXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZsPpygAdsQrJ7wjPofRHT90cZfGcXchVOs/uitKLQa594tzi/x2vLXmrlI4Jjz8z
	 YBBpogntFb+Z+L6via882L5FIB1Kl1ZjXBnPm5XVGPCkavSimOMEMuKFb+hqzWmML4
	 2zCy6bIV0Y/Y1gLlE03yCC6xZMD1PIXnIS8iUqIgxNzATbB1Ly1qspQJ6WzLc7Y8qE
	 cxsGacuk1UECz3o+rMySGerUs6/SPVs+/yx+z/R7Qqqv27vl7jQEc5LXbvO6MEWNEs
	 9i+UGUw2CJIM1AkzqAlL9CEmlp7XjphmnUwzBHk03VjF+adEXHgEUx5WCPnChZ1sdn
	 EuFIv9zLUYLqA==
Date: Thu, 27 Aug 2026 17:56:38 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Jonas Rebmann <jre@pengutronix.de>
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260827165638.GH2943942@google.com>
References: <20260813091428.9072-1-wahrenst@gmx.net>
 <20260813092522.0228D1F00A3A@smtp.kernel.org>
 <20260813095330.GZ1072730@google.com>
 <aaeb87f7-5a04-4592-ab59-b4114b005aab@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaeb87f7-5a04-4592-ab59-b4114b005aab@gmx.net>

On Thu, 13 Aug 2026, Stefan Wahren wrote:

> Hi,
> 
> Am 13.08.26 um 11:53 schrieb Lee Jones:
> > On Thu, 13 Aug 2026, sashiko-bot@kernel.org wrote:
> > 
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] The `default-intensity` property read from individual monochromatic LED nodes is applied to the multicolor group without rescaling, causing incorrect brightness calculations.
> > Please review, explain or fix the Sashiko review(s).
> > 
> > If this is a set, this request includes the other patches too.
> Sorry, I don't get the problem with "incorrect brightness calculation", I
> tought the intensity setting is independent from the brightness. Btw the
> intensity is applied to the monochromatic LED not to the group itself.
> hallucination?
> 
> Does mixing PWM and GPIO LED in a RGB multicolor group make sense at all?

Couldn't honestly tell you without digging in myself.

I did just provide some concerns from Gemini though.  PGTAL.

> > > --
> > > 
> > > --- Patch [1]: [PATCH V4] leds: rgb: leds-group-multicolor: Implement default-intensity ---
> > > commit 13399f1aaceaf09afa7e252e35000d7d61ab1925
> > > Author: Stefan Wahren <wahrenst@gmx.net>
> > > 
> > > leds: rgb: leds-group-multicolor: Implement default-intensity
> > > 
> > > This commit introduces support for the default-intensity property during
> > > boot for LED multicolor groups. If the property is missing, the code falls
> > > back to the previous behavior of configuring the sub-LED intensity to its
> > > maximum.
> > > 
> > > > diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> > > > --- a/drivers/leds/rgb/leds-group-multicolor.c
> > > > +++ b/drivers/leds/rgb/leds-group-multicolor.c
> > > > @@ -108,8 +108,10 @@ static int leds_gmc_probe(struct platform_device *pdev)
> > > >   		subled[i].color_index = led_cdev->color;
> > > > -		/* Configure the LED intensity to its maximum */
> > > > -		subled[i].intensity = max_brightness;
> > > > +		ret = device_property_read_u32(led_cdev->dev, "default-intensity",
> > > > +					       &subled[i].intensity);
> > > > +		if (ret || subled[i].intensity > max_brightness)
> > > > +			subled[i].intensity = max_brightness;
> > > [Severity: Medium]
> > > Does this logic properly scale the intensity when the individual LEDs in the
> > > group have different maximum brightness values?
> > > 
> > > If a multicolor group consists of LEDs with vastly different maximum brightness
> > > capabilities (like a GPIO LED maxing at 1 and a PWM LED maxing at 255), the
> > > overall group max_brightness will evaluate to 255.
> > > 
> > > When reading the default-intensity from the device tree, the value is typically
> > > specified on the scale of the individual sub-LED's max brightness. If this
> > > value is assigned directly to subled[i].intensity without being scaled up to
> > > the group's max_brightness, the sub-LED might be initialized with only a tiny
> > > fraction of its intended intensity, often resulting in the LED being completely
> > > unlit instead of at the requested intensity.
> > > 
> > > >   	}
> > > >   	/* Initialise the multicolor's LED class device */
> > > -- 
> > > Sashiko AI review · https://sashiko.dev/#/patchset/20260813091428.9072-1-wahrenst@gmx.net?part=1
> 
> 

-- 
Lee Jones
