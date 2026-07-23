Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB847ECCB;
	Thu, 23 Jul 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808157; cv=none; b=HxEzF5w7Oy2x7OQoD+rFO4eqWTjTLB0SaV7haBTALqbkaYF3HLU9dRCMp8sEr9m169Ms53H7lmzrShjmZoC8DOcMR25BYOIEHgTz9ofFYhIlpMDx5BUs7VlvNZQcb8XRAt517tk/zeT++Zfn0QtYmZYha8vI3mwDo+AO4Vr/uPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808157; c=relaxed/simple;
	bh=D97POoTjUhrgSur29RAIp4djCDgjb7+myJEXpXFbpBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OifXF/OrB1vTGX1l77hrDaA+w6wv40gTJ9iC40T7fvpDGyvFhLXqrBnBxbkgOIhkJPfX4nynPB4mCTjKegBsQAbYf0veDTE+gNmnYRxuNtSBxqzvMEwuAIBG2JiLqfDYf1KkZ9IqsvPWQEVrNpmu3uXB1P9c1Ln5pgrE2D0jD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFD81F000E9;
	Thu, 23 Jul 2026 12:02:22 +0000 (UTC)
Date: Thu, 23 Jul 2026 13:01:50 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] leds: rgb: leds-group-multicolor: Implement
 default-intensity
Message-ID: <20260723120150.GF3363113@google.com>
References: <20260708224652.106632-1-wahrenst@gmx.net>
 <20260708224652.106632-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708224652.106632-3-wahrenst@gmx.net>

On Thu, 09 Jul 2026, Stefan Wahren wrote:

> Until now the driver initialized all LEDs with maximum intensity.
> This isn't useful for LEDs, which needs to be initialized via DT.
> So introduce a new DT property to define the default intensity of all
> indiviual LEDs. In case the property is missing, the old behavior
> is kept.
> 
> Additionally this also works with triggers. So it should be possible
> to blink with a specific RGB color.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1..19913a43b8a1 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -17,6 +17,7 @@
>  #include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  
> @@ -106,11 +107,27 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < count; i++) {
>  		struct led_classdev *led_cdev = priv->monochromatics[i];
> +		u32 intensity;
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		ret = of_property_read_u32_index(pdev->dev.of_node, "default-intensity",
> +						 i, &intensity);

What about using the firmware agnostic 'device_property_read_u32_array()'
before the loop to save some cycles?

> +		if (ret) {
> +			if (ret != -EINVAL && ret != -ENOSYS) {
> +				return dev_err_probe(dev, ret,
> +						     "Unable to get default-intensity[%d]\n", i);
> +			}

Deserves a comment I think.

> +			subled[i].intensity = max_brightness;
> +		} else if (intensity > max_brightness) {
> +			return dev_err_probe(dev, -EINVAL, "default-intensity[%d] is invalid\n",
> +					     i);

Nit: This is an ugly place to wrap.

> +		} else {
> +			subled[i].intensity = intensity;
> +		}
> +
> +		dev_dbg(dev, "subled[%d]: color_index: %u, intensity: %u\n",
> +			i, subled[i].color_index, subled[i].intensity);

How helpful is this outside of development?

-- 
Lee Jones
