Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40F3E558C;
	Wed, 12 Aug 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523636; cv=none; b=UQZlj1/zALK62aBWXg1KRf5HAb9WSnG3dS8TrNFoaJDQV5WWHoXORwshQK/IZP3i/1WbruPf4YDju+KYTS64HYkP0nZRG5Atiyll6uIJ+yO6gIbLtuJbCRSUKpywXSzaAPYbiVRnKFsxb4gLSfEaxBoFlOdJz2OTOb5ZNhoZfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523636; c=relaxed/simple;
	bh=QBgBSYSR9Mz3iR9y4baT7jx6mf2DiLGpMiqp3NzTRSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orPEj74R1tRtqtfokucCtZZ8n9O92buvJR2tttCRN2O7LbZ3H9N8hXCY3jzyPeukn9xiqGpmgIy5AVwrg3VWq43b+2F7xxHUFAnxpHZxcbZBjV4haUbBLN4HBaPzpA/L5KXoXTXumi7kKovAraJG5JxfMFxtrPp2KCCAXs7nePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2eS9cLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2eS9cLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739321F000E9;
	Wed, 12 Aug 2026 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786523634;
	bh=Jre8+EOJ1ElGLbye7xci+kPlg71hcb2Ryc34gLKX1uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2eS9cLxGhVa0UZIHKVRe0qJ150VuTdN6N8uAeEgchvqVxZVlJUNtjO1ujWjZNNgL
	 ScFqKxWQK+tCi7arTbMZxg1VT8FfcfzUUfH4hNmTeQ0awp1rF0+sF+AyiaVRyZoviZ
	 /8UFR0KAxJN0xpHl4myOuZ2K4A9WNmbV44ZNE87d9Y0YSTzYWLpN9qMUYaSjsGX6jH
	 Ra8aa44xndrrscdBwkKOabBoLqiFTXS/lNADZxu6g3R4rd90OAagO2v2P+HmVkB62R
	 g+BaNdLxeysxwC9yuUOhx9YMjKZizF6SC6dqGk8UwE0tLFUt5ehQzbg9wzeB4Ji7Y7
	 N2vUbcucDfaog==
Date: Wed, 12 Aug 2026 09:33:49 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jonas Rebmann <jre@pengutronix.de>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260812083349.GG1072730@google.com>
References: <20260804191158.41976-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804191158.41976-1-wahrenst@gmx.net>

On Tue, 04 Aug 2026, Stefan Wahren wrote:

> Currently it's not possible to specify the initial color of a LED
> multicolor group during boot. So implement the default-intensity property
> similar to the leds-pwm-multicolor driver. In case the property is
> missing, the old behavior is kept.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> 
> Changes in V3:
> - drop unnecessary patch for leds-group-multicolor.yaml
> - add Jonas' RB
> 
> Changes in V2:
> - adapt to approach (incl. error behavior) by Jonas Rebmann [2]
> - address comments by Lee which still apply
> 
>  drivers/leds/rgb/leds-group-multicolor.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git "a/drivers/leds/rgb/leds-group-multicolor.c" "b/drivers/leds/rgb/leds-group-multicolor.c"
> index 548c7dd63ba1..69b203ec89fa 100644
> --- "a/drivers/leds/rgb/leds-group-multicolor.c"
> +++ "b/drivers/leds/rgb/leds-group-multicolor.c"
> @@ -109,8 +109,14 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		ret = fwnode_property_read_u32(led_cdev->dev->fwnode, "default-intensity",

Did you consider using dev_fwnode() or device_property_read_u32()
here instead of accessing 'led_cdev->dev->fwnode' directly?

> +					       &subled[i].intensity);
> +
> +		/* In case default-intensity is missing, fallback to maximum */

Probably stating the obvious here.

> +		if (ret)
> +			subled[i].intensity = max_brightness;
> +		else if (subled[i].intensity > max_brightness)
> +			subled[i].intensity = max_brightness;

if (ret || subled[i].intensity > max_brightness)
	subled[i].intensity = max_brightness;

>  	}
>  
>  	/* Initialise the multicolor's LED class device */
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones
