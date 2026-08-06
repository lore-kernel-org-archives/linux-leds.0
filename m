Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323D47A89C;
	Thu,  6 Aug 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786019297; cv=none; b=s3InDPWzL9dUIbUhnz8zdbUU6IlC6kMRwu09I0i4AeNifblNnexg5w+Nvg71MvN4F5sCCY5qBmEuByBlx3jua9dKuitf5IngMJuRCCZQ1rpdVDbHrSh4ZS3jMDZBKSCmsOOEBgDrcmp5iRmXpFwm8Do3j71X7+ToJaJREinV8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786019297; c=relaxed/simple;
	bh=E+z/4dYz0vFKAWJSFFg+V7NNtOVKwT5CJc26L6iGEP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAOIUBrCe+FirB1jgwRvBb43ZVgnX8K09No0OuzJEq7n64CNIG5CK03zukd1D5RwzBUfwT58vdE7m0nysZP4Xkeh0k1DLYsnNGgiwRN66Z+lqTE3vXwoytFCV1HjFy/RjUvqHLtgmUHnCOeehoHuy1uYohVahqxH/iLCEYA+scg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgiutThd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgiutThd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0991F000E9;
	Thu,  6 Aug 2026 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786019296;
	bh=qfnKkMOVXsZphshtz3nicQUGK8lPhGGs1+nN/8iR4Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgiutThdK6JuS539bkC7TxHPX4SE0GITsdu5H8JlKFlaPpz+wKstQ2P90zvhm5RDm
	 VENYBlayzkrWG2KzYi1zdfwkMyDMO84LMcTsfffy6itsMDQ25W7SfrvgEsng5t7yMw
	 lZXySPn4dMWZw24Df/Cn8KBKiNZhz1mB5WtHLDIVL79h1yV71e0vGTRSo2BodQVN9t
	 uJ9wsEXc6v6R9eXabHpiYLyj7PuYE/BPQkhaoM+263cwYnWZSwLFiqS5MlvLeXGgGo
	 /igu5D93jpgBq0CnPuVQvFoRqe+RyiYGSjcbUpCPz4qIw6wSYK9D1jggV/5nzdM0FA
	 dQL5UCb96Sa8Q==
Date: Thu, 6 Aug 2026 13:28:12 +0100
From: Lee Jones <lee@kernel.org>
To: kr494167@gmail.com
Cc: pavel@kernel.org, s.trumtrar@pengutronix.de, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lp5860: fix LED teardown ordering
Message-ID: <20260806122812.GC2869284@google.com>
References: <20260720104855.98186-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720104855.98186-1-kr494167@gmail.com>

On Mon, 20 Jul 2026, kr494167@gmail.com wrote:

> From: surendra <kr494167@gmail.com>
> 
> The driver disables the chip from its remove callback before devres
> unregisters the LEDs. LED unregistration turns the LEDs off through the
> driver brightness callback, which can then access disabled hardware.
> 
> Unregister the LEDs before disabling the chip, including when probe fails
> after some LEDs have been registered. Keep track of registered LEDs so the
> devres actions can be released explicitly.
> 
> Also remove the early mutex destruction from the SPI remove callback:
> hardware teardown takes the same mutex.
> 
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> Signed-off-by: surendra <kr494167@gmail.com>

Submissions should include your full name.

> ---
>  drivers/leds/rgb/leds-lp5860-core.c | 13 ++++++++++---
>  drivers/leds/rgb/leds-lp5860-spi.c  |  4 ----
>  drivers/leds/rgb/leds-lp5860.h      |  1 +
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> index 75498311b080..9646d3985239 100644
> --- a/drivers/leds/rgb/leds-lp5860-core.c
> +++ b/drivers/leds/rgb/leds-lp5860-core.c
> @@ -149,12 +149,11 @@ static int lp5860_init_dt(struct lp5860 *lp)
>  	struct led_classdev *led_cdev;
>  	struct mc_subled *mc_led_info;
>  	struct lp5860_led *led;
> -	int led_index = 0;
>  	int chan;
>  	int ret;
>  
>  	device_for_each_child_node_scoped(lp->dev, multi_led) {
> -		led = &lp->leds[led_index];
> +		led = &lp->leds[lp->num_leds];
>  
>  		init_data.fwnode = multi_led;
>  
> @@ -188,12 +187,18 @@ static int lp5860_init_dt(struct lp5860 *lp)
>  		if (ret)
>  			return dev_err_probe(lp->dev, ret, "%pfwP: Failed to register Multi-Color LEDs\n",
>  					     multi_led);
> -		led_index++;
> +		lp->num_leds++;
>  	}
>  
>  	return 0;
>  }
>  
> +static void lp5860_unregister_leds(struct lp5860 *lp)
> +{
> +	while (lp->num_leds)
> +		devm_led_classdev_multicolor_unregister(lp->dev, &lp->leds[--lp->num_leds].mc_cdev);
> +}

Please look into using 'devm_add_action_or_reset()' to handle the chip
disable sequence.  Doing so might allow the managed resource framework
to handle the teardown order naturally, potentially letting us avoid
manual unregistration and even remove the '.remove' callback entirely.

>  int lp5860_device_init(struct device *dev)
>  {
>  	struct lp5860 *lp = dev_get_drvdata(dev);
> @@ -221,6 +226,7 @@ int lp5860_device_init(struct device *dev)
>  	return 0;
>  
>  err_disable:
> +	lp5860_unregister_leds(lp);
>  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
>  	return ret;
>  }
> @@ -230,6 +236,7 @@ void lp5860_device_remove(struct device *dev)
>  {
>  	struct lp5860 *lp = dev_get_drvdata(dev);
>  
> +	lp5860_unregister_leds(lp);
>  	lp5860_chip_enable(lp, LP5860_CHIP_DISABLE);
>  }
>  EXPORT_SYMBOL_GPL(lp5860_device_remove);
> diff --git a/drivers/leds/rgb/leds-lp5860-spi.c b/drivers/leds/rgb/leds-lp5860-spi.c
> index 5e0c44854a68..e1565eac90f9 100644
> --- a/drivers/leds/rgb/leds-lp5860-spi.c
> +++ b/drivers/leds/rgb/leds-lp5860-spi.c
> @@ -70,10 +70,6 @@ static int lp5860_probe(struct spi_device *spi)
>  
>  static void lp5860_remove(struct spi_device *spi)
>  {
> -	struct lp5860 *lp5860 = spi_get_drvdata(spi);
> -
> -	mutex_destroy(&lp5860->lock);
> -
>  	lp5860_device_remove(&spi->dev);
>  }
>  
> diff --git a/drivers/leds/rgb/leds-lp5860.h b/drivers/leds/rgb/leds-lp5860.h
> index 940be0c6e8da..ce30fb5596c0 100644
> --- a/drivers/leds/rgb/leds-lp5860.h
> +++ b/drivers/leds/rgb/leds-lp5860.h
> @@ -258,6 +258,7 @@ struct lp5860 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	struct mutex lock;
> +	unsigned int num_leds;
>  
>  	DECLARE_FLEX_ARRAY(struct lp5860_led, leds);
>  };
> -- 
> 2.55.0
> 

-- 
Lee Jones
