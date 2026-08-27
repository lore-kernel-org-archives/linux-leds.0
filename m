Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAB38BF62;
	Thu, 27 Aug 2026 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849731; cv=none; b=j7IOyTipSeWboB3p38EcxiDNZzdFo5aWWMvDpgIVYafnl37mc51PvuG07vQjWmbQ8gqrPMxNa2Zw6UV3QZVJDcsuKFL5lg2Xi1WKzom0jilcmNgJNHPviN0sVH4CduxMSCTLlY40J+U/hFLOLYY/JeYMAB4AD+KtLdge0CStiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849731; c=relaxed/simple;
	bh=sWvbfe0faEMkG9UmLj6jsM++XJvszYcmtzVM0Y6s1m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFchI9zL2yHG8+lW1bVXZiNe1cvblOYisIAQI54bnwM0CQgkLGnBsXTNDQbyqlIfh3ruMSNhwaw7TqEkXZGZrrJNTkp44hfx9wXJNIe5ucuKP2TyW9qe0PrGvlt9PATD3igAgvfxExLdsccGjqaNkcxVVPMlyF+czlNE3rZslNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S41PkZi6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S41PkZi6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562611F000E9;
	Thu, 27 Aug 2026 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849730;
	bh=4Wi6KK4ZkyQrCkSyS1rWL6XigxS3LuABb8+3XjFD0S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S41PkZi648Se7z824nWEyoiRov+muspswIBFssXVKayIDP5CnEKdVu4D2VO5ZQJkM
	 AeDIO8RdeMraqKrmd+c/m8Y0XR+WyTgPWyHYrTLtthSb3+3EIlMe2CdPy17SP9OdCb
	 vyPxvW5yOdpqzvEsf2hRczeQxZHKF7q2cPvXLmao7AOstXNvWIAh/r5eHkl5mwTU0F
	 mDh+cfuNuKQeCT54FsdgwwNYa7G5sqVAaEMTmtxoiBLC7CAPmU0o/GP+OdT8O3c8EE
	 p2Ncaa0ulHE+meoGN4jPgAGe5YGasrziQjPWa5IouOxGmushNAaYd8esRskXALg6Sb
	 moveHz18q0G5A==
Date: Thu, 27 Aug 2026 17:55:25 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jonas Rebmann <jre@pengutronix.de>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260827165525.GG2943942@google.com>
References: <20260813091428.9072-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813091428.9072-1-wahrenst@gmx.net>

On Thu, 13 Aug 2026, Stefan Wahren wrote:

> Currently it's not possible to specify the initial color of a LED
> multicolor group during boot. So implement the default-intensity property
> similar to the leds-pwm-multicolor driver. In case the property is
> missing, the old behavior is kept.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> 
> Changes in V4:
> - use device_property_read_u32 instead of fwnode_property_read_u32
> - simplify if statement as suggested by Lee
> - drop obvious comment
> 
> Changes in V3:
> - drop unnecessary patch for leds-group-multicolor.yaml
> - add Jonas' RB
> 
> Changes in V2:
> - adapt to approach (incl. error behavior) by Jonas Rebmann [2]
> - address comments by Lee which still apply
> 
>  drivers/leds/rgb/leds-group-multicolor.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1..f278d2a2bf5c 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -109,8 +109,10 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		ret = device_property_read_u32(led_cdev->dev, "default-intensity",
> +					       &subled[i].intensity);

<gemini>

Should we avoid clobbering the function-wide 'ret' variable with an ignored
error from 'device_property_read_u32()'? It might be safer to use a local
variable inside the loop to prevent any future bugs if 'ret' is assumed to
be zero later in the function.

Also, should we use a local 'u32' variable to read the property instead of
passing the address of 'subled[i].intensity' directly? Since 'intensity' is
defined as 'unsigned int', using a temporary 'u32' variable would be
type-safe and avoid potential compiler warnings. If we do this, we should
declare the 'u32' variable at the start of the block and assign it with
the function call on a separate line.

</gemini>

> +		if (ret || subled[i].intensity > max_brightness)
> +			subled[i].intensity = max_brightness;
>  	}
>  
>  	/* Initialise the multicolor's LED class device */
> -- 
> 2.43.0
> 

-- 
Lee Jones
