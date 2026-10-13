Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7317379EE7;
	Tue, 13 Oct 2026 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879886; cv=none; b=cDgCZe9P1GbqAJq5fSR0c/vDakHkYDcP6hl/zgCYB9ie25i0TrHXmP6Us996gTv+KzWsoJp9LOCQmBuYNp/LFOEMN/tzgF8gFzoMd/aZJoSwcOad0nF/pHFai9SVOB7+S89FIpdhkZsMj9v1ZAFb/E30SpX1HzwsxGm6koPaayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879886; c=relaxed/simple;
	bh=Vhsk+az7pLWe3uoK3zp/16ASEYEg4HGF+a3mQpKx9YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4sYBFmN3MJUUTMUz7uu8YkxRUU73Xt7cpLj7QiaS+QtVGPDNr6BKpaIhTiScMgWTMuMc4Jmqfpckl2vR4PC7HFOYeaOPCzd85teFrEULS2QgA8POsWKVNIx2+oNVg2veg8UkkowP1edWBamlNqC6CMYsgcIZ5vnj8tZZebCxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSGqx7rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSGqx7rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79701F000FF;
	Tue, 13 Oct 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791879885;
	bh=LruYlVld4rS6kylK4MX/2i9K5nPc2qp8o4UxcajCndg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSGqx7rk0zCrQ7E9rHZsPNQKC9F1NDW8T2aaA1I39jBFb/BdWI0L9Y3EPWCKcEJWz
	 nyzm4WlyIxLwO6+jWMM7gRGL/qv4uk5G/MdX9UHCotxerv/BzcZR6A0Ba5D29PyFcf
	 WNcy+D+mh6RGe+UETBBSKBjNax6CECeK5FLYg16FCYRnJ6wMSLuvNi0vmIvqfOV7Q+
	 fo2+NVwwKR7CCx7N1hy/B3fBZOUCrhZNeuZyuoU4Ok08uIefaWjJ1R2sFHtEa3rL7o
	 VeWqe01dZF113Y9e88fKEDcDJp+yeXQ+Eq1wwf0kA71nN1aO3fdR6dzxqWz5/fttS/
	 auSooqCguDR+g==
Date: Tue, 13 Oct 2026 09:24:41 +0100
From: Lee Jones <lee@kernel.org>
To: phucduc.bui@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] leds: lm3532: Propagate enable GPIO errors
Message-ID: <20261013082441.GC199624@google.com>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009091059.25729-1-phucduc.bui@gmail.com>

On Fri, 09 Oct 2026, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> devm_gpiod_get_optional() returns NULL when the optional GPIO is not
> present, but may return -EPROBE_DEFER or other errors.
> 
> lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
> were not present.
> 
> Check the return value and propagate errors from the enable GPIO lookup.
> 
> Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Changes in v2:
>  - Capitalize the first letter of the commit message subject 
> 
>  drivers/leds/leds-lm3532.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index b51496910b08..a3bc9680dc4c 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
>  						   "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(priv->enable_gpio))
> -		priv->enable_gpio = NULL;
> +		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
> +				     "failed to get enable GPIO\n");

This changes the semantics of the GPIO handling.

Currently we treat the GPIO as optional, regardless of what is returned.

Ideally we'd have the author review this - did you Cc them?

>  	if (priv->enable_gpio) {
>  		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
> -- 
> 2.43.0
> 

-- 
Lee Jones
