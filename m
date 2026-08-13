Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F1328B77;
	Thu, 13 Aug 2026 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611088; cv=none; b=OOPsFdMeV4grgozYZK9xBxbFtbqvZz+LNfg9OitVuq6GKPE+pQTvuvAKJI9uLkkYzUa7+JMmLWm33xYadvb4UEukSG8WhmhqvF55GLOxqHABJ4mQId+zqPJjZKdZ9ZNg+56Rn9jv1c7hjALVawwYFGF+NnD6+iRhYHFza3VUbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611088; c=relaxed/simple;
	bh=x2eBV4XIREUnQFEIB88CIYmoDYiL3CZmSc0Rg586ZWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkobBBJNnlsL1CMRqV2fW0iwCDcCjJszdwL3cXFoZS6UXn17uNXzW8DuIuSnr5hN7udmeSQCkSwFo9NgEN8mwyU2BGcEmycthHKSQWp+V5DwfgO2nqFUn+jFTNYKfG39ZuHNJ1sE6ReuRvnWF+4l0Egcns57XMA4t8sq3qiJ+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azFvj9aP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azFvj9aP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FC81F000E9;
	Thu, 13 Aug 2026 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786611087;
	bh=N97VbqYGYhM1zXnCVURJSHscsFZp67kJw/oDKYbgeK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=azFvj9aPt81I2i2486ftmdz8VVow/kXVa7GEjDwdtHPqMhdJHzCLngIem5CmbIn9n
	 nzz0m08BYqIPlKPjbjAuxSohcq3wGCxvvmAucRmoREP5Lr6lSAS4nALh+m4MOMMlNx
	 L9/C5ips18Vx/H54WbMtYPkB7GCYrQEvyhdYZ+LbAIj5gA8KS6mWNTr832DWioikCO
	 XJ0Dt/90/U2fzll5vGyZOi/Zqs5CPLgIlyn0AesVdwS8n0s+H1U4MTvDCtI1Qh/nnE
	 NTkCRhoront1KSQAar1wHxQCIvKY5mVkNhqVx/b8WHOF1brl3x78YVCX7aIqNMLze+
	 A+cn9R83E2E8w==
Date: Thu, 13 Aug 2026 09:51:22 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jonas Rebmann <jre@pengutronix.de>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260813085122.GW1072730@google.com>
References: <20260802115727.50411-1-wahrenst@gmx.net>
 <20260802115727.50411-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802115727.50411-3-wahrenst@gmx.net>

On Sun, 02 Aug 2026, Stefan Wahren wrote:

> Currently it's not possible to specify the initial color of a LED
> multicolor group during boot. So implement the default-intensity property
> similar to the leds-pwm-multicolor driver. In case the property is
> missing, the old behavior is kept.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1..69b203ec89fa 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -109,8 +109,14 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		ret = fwnode_property_read_u32(led_cdev->dev->fwnode, "default-intensity",
> +					       &subled[i].intensity);
> +
> +		/* In case default-intensity is missing, fallback to maximum */
> +		if (ret)
> +			subled[i].intensity = max_brightness;
> +		else if (subled[i].intensity > max_brightness)
> +			subled[i].intensity = max_brightness;

I think I already reviewed an earlier version of this.

Same comments apply.

-- 
Lee Jones
