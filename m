Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772829;
	b=vWLGTBOgVvMLqrcpQt1265le0mOE78SnkAN6vVpWz13Sln1ze91wjsaaycKebMdRjD7j
	 p1FFxUCdzeP5EaEZVyyfzgxBs6AAuAZ6c0m4Rkcc5OGJRgXcUea8QHUW4RHlW1sRlglyS
	 EGygbKAoi3q+0jEKimmokoM6E0brO695hY8nkpURar50LeswTu2SeHHVeyxrSIUWUf10F
	 q27Q1GfVpuZCJ80QWc6dlI3Mbf6Q9QE51aLyG+d8RqWBYE6tIvjaIOFe4PlZmZfwoy42n
	 tmpEDcz+lek3bJChUVuy9OHpkdcNBZEhwuw9bHoRH8kAdski3VjDudfO+jO5tWYB5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772829;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=It0PZFp5EqsfQFyEhc09x9/4Luaycw3Ub55R7eYpTXU=;
	b=asYXNxsDNM+TuZoL8/qY4JVM6Wtv1sqUQ4pho51+wwZnNNvVtYCaSm4MXH/Gk4NFtuw2
	 DdoJyEB1ZeSgww17JSrT1cVYkekh4znMNMb8WtM8Km7CFmrWbYw9ciR/qTj3AIICgIyBy
	 AS2VnKgrXzaxIk+cVYllEU4UCYAxiFNbCwlM0PKJFB1bzJNSTOmYOxcclRduc2T3ZiqiT
	 OAg07vaVKUqoDZzhJxVoXDzfOmQEDa25j0guuVGHGyX3R7bSlEgHnXiGCMxp4LhtXd9rz
	 rW52YKSihWnMvTCCKJZGAaRrGsjBwK7MMxBXBPvECzJ5+Sd8erKb3blFob1kgKSsWPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5s0MsQW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4AE606A332;
	Fri, 27 Nov 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5s0MsQW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB61F0089C;
	Fri, 27 Nov 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772828;
	bh=It0PZFp5EqsfQFyEhc09x9/4Luaycw3Ub55R7eYpTXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B5s0MsQWFO3DKNoTCofBSn3sjAkru/aOXikOo2sdAiRlZ67W18h9efvhDR1AtTrMr
	 NdRxVXKtaNp03vSr0s+ff0XgAbcRuEkaDX8cDHRMd1fBXBeeLp6kzX5PhAkpGQnETC
	 kcVK5e3O5z+N+EavXfDIkyoE6t7jMbmPbKUPZJ/Ks/CGZ9DBfLM5waPLHpIr+CFshU
	 i2eDZ7/Ecc1IMHUBmCZ25vS2BTmQGfgF8imTQjJsRnic6Y46iNWmXFXtxJ7yHnClqR
	 48IJU815yINJ5vcWTHQm/iVoyL2rMBW4WeXJhXq3pkIll8IU38X0bW/GBCWY6bh/+J
	 E5YHRJN+ycK0Q==
Date: Fri, 27 Nov 2026 09:47:04 +0000
From: Lee Jones <lee@kernel.org>
To: Jie Gu <jie.gu@leica-geosystems.com>
Cc: Matthias Fend <matthias.fend@emfend.at>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Gu <jie.gu@leica-geosystems.com.cn>
Subject: Re: [PATCH v2 2/2] leds: tps6131x: Clear torch brightness cache on
 flash takeover
Message-ID: <20261127094704.GR38590@joneslee-macbookpro.roam.internal>
References: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
 <20261120075859.731257-3-jie.gu@leica-geosystems.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120075859.731257-3-jie.gu@leica-geosystems.com>

On Fri, 20 Nov 2026, Jie Gu wrote:

> From: Jie Gu <jie.gu@leica-geosystems.com.cn>
> 
> When the device switches from torch mode to flash or external strobe
> mode, the hardware torch output is disabled, but the LED class
> brightness cache may still keep the previous non-zero torch value.
> 
> This leaves sysfs brightness reporting an enabled torch state even
> though the light is already off.
> 
> Update the cached LED brightness to LED_OFF when flash control takes
> over so userspace state matches the actual hardware state.
> 
> Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")
> 

Nit: The trailers should not have blank lines.

> Reviewed-by: Matthias Fend <matthias.fend@emfend.at>
> Tested-by: Matthias Fend <matthias.fend@emfend.at>
> Signed-off-by: Jie Gu <jie.gu@leica-geosystems.com.cn>
> ---
>  drivers/leds/flash/leds-tps6131x.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
> index 823e0462939c..21957e4e3db4 100644
> --- a/drivers/leds/flash/leds-tps6131x.c
> +++ b/drivers/leds/flash/leds-tps6131x.c
> @@ -398,6 +398,8 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
>  	if (ret)
>  		return ret;
>  
> +	fled_cdev->led_cdev.brightness = LED_OFF;
> +
>  	return 0;
>  }
>  
> @@ -697,12 +699,19 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
>  {
>  	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>  	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	int ret;
>  
>  	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>  	guard(mutex)(&tps6131x->lock);
>  
> -	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> -				 false);
> +	ret = tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> +			       false);
> +	if (ret)
> +		return ret;
> +
> +	fled_cdev->led_cdev.brightness = LED_OFF;
> +
> +	return 0;
>  }
>  
>  static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
> -- 
> 2.43.0
> 

-- 
Lee Jones
