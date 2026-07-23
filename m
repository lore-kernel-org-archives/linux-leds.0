Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDB43382F4;
	Thu, 23 Jul 2026 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806538; cv=none; b=QOGvCfyjKQRLDdTCTM2Y6iGoGPOM+SBFPubR2PA72mhNNfrAqWr/t+txK5j9STsIYXzdPzjH2K+ZDyIa7A3NVXDCNCOd8dYDWqEs+1tY/UHUMd9+Io9/88EYlNljUF9shI4e8/DYLq5JhAeSFwKZNnWIE9F7L8x59hHESRkLWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806538; c=relaxed/simple;
	bh=u7/lt7BLLMY7RAvMcHJnp7U86ZLPFLGdpZtxiUTS75w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQhfS688YoKbzakcBYe8Y/Do5JvHph36rz5j5l7V+LDC8Vgn8j9M+zLAMpyW36ct6IQfAj+tnxxdeR71MqFu9OxHn2pyRKUuyOkAhl1zOTIfimlSfQMTdYhVqYeEoZcnCHklfGx3J+jiVs+aIfoPGkC6xLIaOXO8yoFywQq5Uhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhuyQ3dU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhuyQ3dU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2F1F000E9;
	Thu, 23 Jul 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806537;
	bh=Qci4GN03cxEtjpp4eYf8DHQLILpcm42ePY3JJidLmoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JhuyQ3dUi2HHvSpD/KnLl7r1ttyS+HyB/NMuiudICcHK3iqyk2tgUGpTBkH8WTDfL
	 8SCTH8xPDwzz7G8RRyK2zOYUba5MM06xW4/LdqH6wza9AZXakrxOJBgKmljU/PRc9G
	 DYZeHI91TXHKCmQH6oUF6ZPI+fn5yqrKZrJCsH8AhhipzRuFFv7gSZf9EYclIkoL9S
	 AA1w/Gg604WXzU+GjfJsuQybbiRpno+BFewAoKIu7t7ym0rdut268nme/ipilZQ0HJ
	 Ymj869PnFeU0t5EoLhx3THOmmaw/lE2miFT38cNW38xxEzoFh/R0nA67GQDdrHQoVT
	 R4+0a3JTqpt5A==
Date: Thu, 23 Jul 2026 12:35:32 +0100
From: Lee Jones <lee@kernel.org>
To: Steve Dunnagan <sdunnaga@redhat.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Walleij <linusw@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: gpio: Skip unavailable LEDs during shutdown
Message-ID: <20260723113532.GD3363113@google.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710150841.19669-1-sdunnaga@redhat.com>

On Fri, 10 Jul 2026, Steve Dunnagan wrote:

> gpio_led_probe() leaves an error-valued GPIO descriptor in the LED
> data when an unavailable platform-data LED is skipped.

So why not nip that in the bud and fix that instead?

> The entry remains included in priv->num_leds, so gpio_led_shutdown()
> later passes the error pointer to gpio_led_set(), producing:
> 
> gpiod_set_value: invalid GPIO (errorpointer: -ENOENT)
> 
> Skip entries with error-valued GPIO descriptors during shutdown.
> 
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Assisted-by: ChatGPT:GPT-5.5-Thinking
> Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>
> ---
>  drivers/leds/leds-gpio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 8ae71c2e91e0..63cb517ef385 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -304,6 +304,9 @@ static void gpio_led_shutdown(struct platform_device *pdev)
>  	for (i = 0; i < priv->num_leds; i++) {
>  		struct gpio_led_data *led = &priv->leds[i];
>  
> +		if (IS_ERR(led->gpiod))
> +			continue;
> +
>  		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
>  			gpio_led_set(&led->cdev, LED_OFF);
>  	}
> -- 
> 2.49.0
> 

-- 
Lee Jones
