Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE1E3B8412;
	Thu, 13 Aug 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614816; cv=none; b=CDA8jneSGql8Zd/htqtv0yOWqJAYCAmkueoCtciTqqGKctOV8DLs3R/wtxOA/4XK6oi/mgvxb9c7zLqzTK0nH35Bt3AIK2h3sJkdTDmv+Q69R6mjAyTlqy/pRrSkzO3l/7xiKim5MCZDFSR17anQpXBQuA8nWJayG3L9UI75GEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614816; c=relaxed/simple;
	bh=/OTNhh05kPBBLKFjqB5BbbQrxvsPtgpU6hd4Jcs6UCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+NlrOtLIW1cOTh+kS1qXoGFwuckXJHgZGiNQMrdwH5yZDbadR4u9lVkKfZle3ZzFPD8rz9pz10t/JyjJNWjKE7AjdnufcBAs6+C3q73d83tAxcT8v9FMy3cTZ30rviyzGY6/l/7urqXVY7CeaAY1iNWmd7x4nZBT6vX4/w9Rvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHkt5NAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHkt5NAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F188F1F00A3D;
	Thu, 13 Aug 2026 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614814;
	bh=fatAP2tKSo+FPkloTSGYPkH4ZOT18ygTPlW9hozx2oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IHkt5NAXG0sVXnCkEYfv7TxtHIt5suaqQuSYmUOrvuINRps4Ph8LuK7yZiTJHBom+
	 sWbqstrcUN01lsXd2CiMCAKyRGfHo2IviLlDSkdD4vV8chDGZ5DhLDFgOLgmNAtThL
	 uu4878GNPdQaeC/qaIWTGBSgGEtNKJVEcrdvjEhyNbiZalTKK6nZeZyzrxUts95vqg
	 g0HszbZWw5h37qYco4QSL4ttlVHU6CRWmfG3hbK9PSSPvvTd42JRgASO7G+wdDANRZ
	 VU6cQJglJKOzij6KmLnvEeAzlU3wGhVsM7ChbJSXaRzB4VlKu9GFxv3aBvRCenozSq
	 9VhKhJMpqUb+A==
Date: Thu, 13 Aug 2026 10:53:30 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260813095330.GZ1072730@google.com>
References: <20260813091428.9072-1-wahrenst@gmx.net>
 <20260813092522.0228D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813092522.0228D1F00A3A@smtp.kernel.org>

On Thu, 13 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `default-intensity` property read from individual monochromatic LED nodes is applied to the multicolor group without rescaling, causing incorrect brightness calculations.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [1]: [PATCH V4] leds: rgb: leds-group-multicolor: Implement default-intensity ---
> commit 13399f1aaceaf09afa7e252e35000d7d61ab1925
> Author: Stefan Wahren <wahrenst@gmx.net>
> 
> leds: rgb: leds-group-multicolor: Implement default-intensity
> 
> This commit introduces support for the default-intensity property during
> boot for LED multicolor groups. If the property is missing, the code falls
> back to the previous behavior of configuring the sub-LED intensity to its
> maximum.
> 
> > diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> > --- a/drivers/leds/rgb/leds-group-multicolor.c
> > +++ b/drivers/leds/rgb/leds-group-multicolor.c
> > @@ -108,8 +108,10 @@ static int leds_gmc_probe(struct platform_device *pdev)
> >  
> >  		subled[i].color_index = led_cdev->color;
> >  
> > -		/* Configure the LED intensity to its maximum */
> > -		subled[i].intensity = max_brightness;
> > +		ret = device_property_read_u32(led_cdev->dev, "default-intensity",
> > +					       &subled[i].intensity);
> > +		if (ret || subled[i].intensity > max_brightness)
> > +			subled[i].intensity = max_brightness;
> 
> [Severity: Medium]
> Does this logic properly scale the intensity when the individual LEDs in the
> group have different maximum brightness values?
> 
> If a multicolor group consists of LEDs with vastly different maximum brightness
> capabilities (like a GPIO LED maxing at 1 and a PWM LED maxing at 255), the
> overall group max_brightness will evaluate to 255.
> 
> When reading the default-intensity from the device tree, the value is typically
> specified on the scale of the individual sub-LED's max brightness. If this
> value is assigned directly to subled[i].intensity without being scaled up to
> the group's max_brightness, the sub-LED might be initialized with only a tiny
> fraction of its intended intensity, often resulting in the LED being completely
> unlit instead of at the requested intensity.
> 
> >  	}
> >  
> >  	/* Initialise the multicolor's LED class device */
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813091428.9072-1-wahrenst@gmx.net?part=1

-- 
Lee Jones
