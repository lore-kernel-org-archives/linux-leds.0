Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567869;
	b=ZZTKIkvZLffoq3Nopmr6LhPkA8WLvlCIvPem30DvV4NxxQ33E6xi4/Y/9WQ+jfXG6kEz
	 WDc5O0CIzlz1fCHbDNkPi5iC7GzrmnQA4L7J8+vgMISYAyF+rTeNKbCQLbyx1T/9VW+nq
	 wVMl0LtfC/kijNek29bI29J0wxfseila3Ccbwc9Ew6glnI7NdgTMUfChaaTj1VgMjeCQr
	 hYEl4CAyuQYCGoCdg2PzkwPuVq1xTFlC4GW6DN0HgI9VCnxww/32PlfceLNMimoF1yXYM
	 y/7Viju/ZisxU0ShLNoUnuUTGvct4oSHSTlQWDKFdLxLOpjQT0vrQ3/ErhR58jxOr7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567869;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=Tzsq2n8RplKbUlpe/9h0GwJcShGQgY/jvlUwuF0uX6s=;
	b=A9w6WHGIw5ewyc4K5/qF3tLFzvJA8aueeKLwMSYfPWJR0FI21yoQZ2ukwaOm/lU5dTdg
	 8K2HAlKDNcZuRuw29swvQkZNcpkQLBN+iUqDwtRCaiNUsLJ3da5fax06Fe/F0h9l7o+0o
	 I3LoUGoyUzl+IwEKPyn27EcHdDYM6GxUaJxyRZO7xxzDDt6YIIidb9Yr2eCaLZLGT6R07
	 o+BelQxgyjQzhMDPYc0AElrN+4YOXOTVMVF+n+7GRZPGdeV185in0DABRwlL/85eRddRo
	 mX84infGt/XZLsakwak5Eyrgaog11N1XK0U92kOxJJncSkyJxlWAjd3AsCYrSTIHPMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPHBaQJE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B09606A31C;
	Fri, 13 Nov 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPHBaQJE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E2E1F000C4;
	Fri, 13 Nov 2026 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794567868;
	bh=Tzsq2n8RplKbUlpe/9h0GwJcShGQgY/jvlUwuF0uX6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPHBaQJEmcqHzQV5aGGYqsCn7EasKTdDWPt0FJ7YLe7rHP5mNqwS3E7BKLV088ZR5
	 BgX/yb9z5KuxrvtcLhZF2swjPNDtHMqpnujAxFhxG2tGdMVz8Fr/YFWPB2NPpKn/I2
	 5kce2Vmh6VYKh+ppy8ECVO+0SIKrARvomn+1L4kVuCnEsqKPmqb6LxWm3eDqlwbqd0
	 3G+6IrWV5AXk6ppwRF79F6/+v0cMHHMrYhx9RsFtkTys0OFXbS8bPsurcE6b5MUz11
	 KlBIG1Ikp/IefrQ3TVFmgp2OeWd2UNVKy0paJZshx5nHdOZaEaPmmde8OpmJy435oK
	 JCq0T2I99xolg==
Date: Fri, 13 Nov 2026 11:04:24 +0000
From: Lee Jones <lee@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: pwm-multicolor: Manage the multi-led node
 reference
Message-ID: <179370050695.793788.4199070054904484695@kernel.org>
References: <20261030020521.9399-1-yigejiang86@gmail.com>
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
In-Reply-To: <20261030020521.9399-1-yigejiang86@gmail.com>
X-AI-Review-Draft: <20261030020521.9399-1-yigejiang86@gmail.com>

On Fri, 30 Oct 2026, Yige Jiang wrote:

> led_pwm_mc_probe() leaks the multi-led node reference on successful
> probe and if the final PWM update fails. LED registration borrows
> the node, so it must remain valid until the LED is unregistered.
>
> Register a managed put action before LED registration. Reverse devres
> order then unregisters the LED before releasing the node on unbind
> or probe failure. Drop the manual error-path put and return directly
> on probe errors, leaving the reference cleanup to devres.
>
> Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
> Assisted-by: LLM

I thought we dropped these now?

> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Changes in v2:
> - Capitalize the subject description to follow the LED subsystem style.
> - Remove the redundant release_mcnode label and return directly from
>   the probe error paths.
>
> v1: https://lore.kernel.org/r/rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com
>
> Based on linux-next next-20261016 (2efb7a11f1aa).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
> COMPILE_TEST=y.
> The object was rebuilt from this exact base with v2 applied.
> No full kernel or module-link, hardware or runtime test was performed.
>
>  drivers/leds/rgb/leds-pwm-multicolor.c | 31 +++++++++++++-------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
> index 6365459ec27f17187804153cde6cb1805eca33e9..10527a64d1982733a43b76bd8bc123aba95b6f72 100644
> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
> @@ -106,6 +106,11 @@ release_fwnode:
>  	return ret;
>  }
>
> +static void led_pwm_mc_put_node(void *data)
> +{
> +	fwnode_handle_put(data);
> +}

What about?

    struct fwnode_handle *mcnode __free(fwnode_handle) =
        device_get_named_child_node(&pdev->dev, "multi-led");

> +
>  static int led_pwm_mc_probe(struct platform_device *pdev)
>  {
>  	struct fwnode_handle *mcnode;
> @@ -121,22 +126,22 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, -ENODEV,
>  				     "expected multi-led node\n");
>
> +	ret = devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnode);
> +	if (ret)
> +		return ret;
> +
>  	/* count the nodes inside the multi-led node */
>  	count = fwnode_get_child_node_count(mcnode);
>
>  	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
>  			    GFP_KERNEL);
> -	if (!priv) {
> -		ret = -ENOMEM;
> -		goto release_mcnode;
> -	}
> +	if (!priv)
> +		return -ENOMEM;
>  	mutex_init(&priv->lock);
>
>  	subled = devm_kcalloc(&pdev->dev, count, sizeof(*subled), GFP_KERNEL);
> -	if (!subled) {
> -		ret = -ENOMEM;
> -		goto release_mcnode;
> -	}
> +	if (!subled)
> +		return -ENOMEM;
>  	priv->mc_cdev.subled_info = subled;
>
>  	/* init the multicolor's LED class device */
> @@ -144,14 +149,14 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
>  	ret = fwnode_property_read_u32(mcnode, "max-brightness",
>  				 &cdev->max_brightness);
>  	if (ret)
> -		goto release_mcnode;
> +		return ret;
>
>  	cdev->flags = LED_CORE_SUSPENDRESUME;
>  	cdev->brightness_set_blocking = led_pwm_mc_set;
>
>  	ret = iterate_subleds(&pdev->dev, priv, mcnode);
>  	if (ret)
> -		goto release_mcnode;
> +		return ret;
>
>  	init_data.fwnode = mcnode;
>  	ret = devm_led_classdev_multicolor_register_ext(&pdev->dev,
> @@ -161,7 +166,7 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev,
>  			"failed to register multicolor PWM led for %s: %d\n",
>  			cdev->name, ret);
> -		goto release_mcnode;
> +		return ret;
>  	}
>
>  	ret = led_pwm_mc_set(cdev, cdev->brightness);
> @@ -172,10 +177,6 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, priv);
>  	return 0;
> -
> -release_mcnode:
> -	fwnode_handle_put(mcnode);
> -	return ret;
>  }
>
>  static const struct of_device_id of_pwm_leds_mc_match[] = {
>
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>

-- 
Lee Jones
