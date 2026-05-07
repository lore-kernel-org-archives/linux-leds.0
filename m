Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DF391E4B;
	Thu,  7 May 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154362; cv=none; b=RpgZJYnxvq/aWRlk5aTa+ruCB8DOEcBhA4TEEGhKmUjIoEf+WtWFmhES8WHUgBMmQP5vhCdF6eAlqxem8Ho+M+59dkNRdPzuAYAj3CSmB5cAP5msWZ/ymC5uNFQSQHPGBfKxjXArYxx8mqNJ9hRsfk8ZuhAzg6s+B7TcEXwN26k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154362; c=relaxed/simple;
	bh=LpCRq+tkyDSG88xZdWGkj0pm53r6iQgcZv1jcLqdU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJt889f/sEg3E+CngJ6CLdUnAZhgEaltoo2PboYBU/kk1xYxqDERBh5lxnN7hg19THlXrw2k2e7wvhYyg6qwUhu4xX7muo+evtQUFcjLh6GvpvkdeQ10eGlTmLlkqz4dQ+fa1IYYTq66E/AD5NBAFvMljcWhYWRlEZi4dPgDKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uafKWfbE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uafKWfbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A6C2BCB2;
	Thu,  7 May 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154362;
	bh=LpCRq+tkyDSG88xZdWGkj0pm53r6iQgcZv1jcLqdU2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uafKWfbETZ2RGhBQSqZa21ov0RrELMqQHTJ2QmzAjpuDBQuEpsWmH6eZbJeyHYAaL
	 xqwpQaIpr1TN91GBi/dBVyFTP8Ll0bVuc6qGFTWh+g0WJEp7tR2WT64Vy8i/1uUydc
	 iDUmvQ7BrNLleOotN3EOaFVM4SW93d63r2DituXCpnBADSCxUxubmMGkCczztmOwkW
	 S44lYxPzbNPxXmhSq/4twFQNiVKFRekJkRIUNaClTqTEcwxyIjOqljfb8SwrgL9Pf4
	 puRp5KzfE4f5G0hGSHJhjn1sNy+V3hdmTw8Thgz9WH4NoY+y76WGi0dGcJLpr2Oo7H
	 CXVrUkcXq+brQ==
Date: Thu, 7 May 2026 12:45:58 +0100
From: Lee Jones <lee@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: class: Use firmware nodes for device lookup
Message-ID: <20260507114558.GE305027@google.com>
References: <20260422142324.1079185-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422142324.1079185-1-alban.bedel@lht.dlh.de>

On Wed, 22 Apr 2026, Alban Bedel wrote:

> Replace the OF based lookup with the fwnode equivalent to get support
> for ACPI and software nodes.
> 
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
>  drivers/leds/led-class.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 9e14ae588f780..d578cc0abb7c7 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -248,33 +248,25 @@ static const struct class leds_class = {
>  	.pm = &leds_class_dev_pm_ops,
>  };
>  
> -/**
> - * of_led_get() - request a LED device via the LED framework
> - * @np: device node to get the LED device from
> - * @index: the index of the LED
> - * @name: the name of the LED used to map it to its function, if present
> - *
> - * Returns the LED device parsed from the phandle specified in the "leds"
> - * property of a device tree node or a negative error-code on failure.
> - */

You're removing the function header here without any mention of why.

> -static struct led_classdev *of_led_get(struct device_node *np, int index,
> -				       const char *name)
> +static struct led_classdev *fwnode_led_get(struct fwnode_handle *fwnode,
> +					   int index, const char *name)
>  {
> +	struct fwnode_handle *led_node;
>  	struct device *led_dev;
> -	struct device_node *led_node;
>  
>  	/*
>  	 * For named LEDs, first look up the name in the "led-names" property.
>  	 * If it cannot be found, then of_parse_phandle() will propagate the error.
>  	 */

Comment needs an update.

>  	if (name)
> -		index = of_property_match_string(np, "led-names", name);
> -	led_node = of_parse_phandle(np, "leds", index);
> -	if (!led_node)
> -		return ERR_PTR(-ENOENT);
> +		index = fwnode_property_match_string(fwnode, "led-names",
> +						     name);
> +	led_node = fwnode_find_reference(fwnode, "leds", index);
> +	if (IS_ERR(led_node))
> +		return ERR_CAST(led_node);
>  
> -	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
> -	of_node_put(led_node);
> +	led_dev = class_find_device_by_fwnode(&leds_class, led_node);
> +	fwnode_handle_put(led_node);
>  
>  	return led_module_get(led_dev);
>  }
> @@ -332,7 +324,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> -	led = of_led_get(dev->of_node, index, NULL);
> +	led = fwnode_led_get(dev_fwnode(dev), index, NULL);
>  	if (IS_ERR(led))
>  		return led;
>  
> @@ -354,7 +346,7 @@ struct led_classdev *led_get(struct device *dev, char *con_id)
>  	const char *provider = NULL;
>  	struct device *led_dev;
>  
> -	led_cdev = of_led_get(dev->of_node, -1, con_id);
> +	led_cdev = fwnode_led_get(dev_fwnode(dev), -1, con_id);
>  	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
>  		return led_cdev;
>  
> -- 
> 2.39.5

-- 
Lee Jones
