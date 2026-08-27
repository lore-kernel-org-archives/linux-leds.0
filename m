Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E574503EC;
	Thu, 27 Aug 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850189; cv=none; b=fmHvN8NNRSlbkJTYlyC//fTMDEgK6NrM/c4/xGv2JWuewoRYqxTEFwf/Ry1VO0xRn2z0HBZ+PRP6WNgKPell6fPRJqoXdwfwmrRh3vmRNtZxudiaf+lIlmN+JeP8E2/3vvdwpSD2I/dW9Y6sd96GxOKfnheeWxvrqgPI4irayz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850189; c=relaxed/simple;
	bh=YfVyNI9c9azuVieacpxUOb6yNvbNo1dV0E31hl56n/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFeZ86Ck56TSE9mitkXJq+SOElL0jGDEt2st6tsNfICdFMTJAm+D6an9mwnIAREfFwm5xUlqMR2l3vyi2Vsic3hKJ8tZ7y0ADrM2041SPzivWt7HiN1amLZnopil08rfDeKUUED+zY482pIdQOWONY8PgyjRccHid/IWLCziTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sxz6S1N4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxz6S1N4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1BF1F000E9;
	Thu, 27 Aug 2026 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787850185;
	bh=zKmwoEwzdTZwEdpvUj5AMclNii4LDqHyo+svB88BdpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sxz6S1N4JOc3d5vGHNPprv4A/0VWeWwYco1y4dh8YodMwPyZ3y/ESJnqHFUzuXpbt
	 Yrzr7SAbkhn/0+UQ8xLpU8LwNCYXMoUZujn7TNotc/x8kG/5VxVx8109QXZckfm1LP
	 39qf7EgYMi43CJEJEo1tMaJDQ07LClFNW6Wtswk0lDnyhgTaMT8rGlnHfHHYjUEFi1
	 QzlmdZFksZMp3wjDzibT6WrfNqkBHXVD//NoBX+jJqdjz4q1iN6JBhVtD4WFTHKNas
	 jELAX1y1JKOT8Y9gxVW/FbZjffKEBeRtOOE9eNt1x5B0Be4KEN4PyWfurgCiGit4g3
	 D+sr4VM60qr3g==
Date: Thu, 27 Aug 2026 18:03:01 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Jonas Rebmann <jre@pengutronix.de>
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260827170301.GI2943942@google.com>
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

I asked my little helper for you:

<gemini>

While mixing a GPIO LED (essentially binary) and a PWM LED in a single
multicolor group is technically possible, it is indeed highly unusual and
unlikely to produce a desirable colour-mixing effect in practice.

Regarding the Sashiko review, there is a valid point hidden in the noise.
The multicolor framework uses 'subled[i].intensity' as a relative ratio
against the overall group's 'max_brightness'. If a sub-LED's native
intensity scale differs from the group's scale, assigning the raw value
from the 'default-intensity' property directly without scaling it could
lead to unexpected dimness or brightness. Should we look into whether we
need to normalise this value against 'max_brightness' to maintain
consistency?

</gemini>

Hope it helps.

> > 
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
> 
> Should we verify if 'led_cdev->dev' is the correct device to query here?
> Normally, 'led_cdev->dev' is the class device and might not have the fwnode
> associated directly in the same way as the underlying platform or fwnode
> device. Would using 'led_cdev->dev->parent' or querying the fwnode directly
> be safer?
> 
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
