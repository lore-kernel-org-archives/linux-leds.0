Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790534;
	b=rK3kvqPvJfogm7EBU5XOj9zyhpsGfa8PAnvuJBPBQ2jUSq+QOnB+KH0XscbuiRFW7YWD
	 BXhcoIrRCzKI/YQIZv8sN8XlvHvEzsFfKTx1n6uBHv4ngNWSWsR1ShoTPAKUZcecd6fud
	 cWVX6d8AVyHzBXUXMqKMJv274wsUXM8tsWXuxJ81Dz72IpEJTNPUcr2BaRKLJa/UWfyWg
	 m7SvIaqUURRKh1vHvDIDFgHAE88N3mf9tdUFAkmv4+h4j4Q25dhWuqpwRfmZA7Czu1IU5
	 xqGvR22ZxpDM7Ua2vEC8ewH9n83Sk2H2fxkERNv7tjQVpqyRw92L+5U0Zgo1OIWY9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790534;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=TYE6CrUU05VzJT2OvbyvbZtdDwgxWflUs6iHXhIq+1c=;
	b=D5JR4gSmflYTrDs3YVDboKVoO7Rv7j66MkOpjLcxlJuQJXziikdvDm6sPYaEP9NUlWdT
	 PAlPfD6f0gzj6+oTQWmhB9JaZtLwZkniT1lz6PyKGZWi7r5C+e4VB47ubU/RPgJgxNvo/
	 eAl7ZuUgk+CydKAQAjeB+5Gh91zTxFtaMzU2QsylzJg6v3vTztu2CIAD+Vvdg7wFzXDce
	 YzAsJONvxF07IQ+0ddtl+QPHP+fAbmN0oYFU5N+B9wmqmkdForCXBh9p4uBI6+M5St0l6
	 kQfnAh/WowdYL1/InDjr/ZNtvsslxVvYzAah3TkTf659A/kcO5VOdpvOAOn1Qi7Iyqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOYJZTfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC1C606A31E;
	Fri, 27 Nov 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOYJZTfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5951C1F00923;
	Fri, 27 Nov 2026 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790533;
	bh=TYE6CrUU05VzJT2OvbyvbZtdDwgxWflUs6iHXhIq+1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FOYJZTfbeslGiZJtKKJ4TzZQjobXmk8hjxMjIV5Bsf7dyu6+CQ/Q4iBpFgcdre00D
	 +0M61e0NyrzjL6U7yN5kkJSaFakYeV5mV/bzLO5zw/v4wSWtABYwh0jR44Bo+7on8c
	 7/C9BbVCqVRd27uZ8Eskvj/EQ71IHjIMTNsk+RVZROf/weXvo14ix2eHQ8A6lmonQ8
	 SLxu1ove5qEYJP62mQB8p2I6Nc2yWzt6CobR58f6wMdhbWM/wXPPzaPmNTiXMSuBhU
	 1wlzbVwDJsc+dqtBe0k7XypKBqKyI49UVOEriTDxTHl9Ri1L7ooPcwpwMWAqKpe9Lo
	 ztyjTecdK9inA==
Date: Fri, 27 Nov 2026 14:42:09 +0000
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, i@rong.moe
Subject: Re: [PATCH v3 08/11] leds: class: Split led_classdev_register_ext()
Message-ID: <179568576204.32537.4412828047245874349@kernel.org>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-9-W_Armin@gmx.de>
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
In-Reply-To: <20261120212431.152081-9-W_Armin@gmx.de>
X-AI-Review-Draft: <20261120212431.152081-9-W_Armin@gmx.de>

--- checkpatch.pl (4 issues) ---
Line 149: ERROR: code indent should use tabs where possible
Line 149: WARNING: please, no spaces at the start of a line
Line 150: ERROR: code indent should use tabs where possible
Line 150: WARNING: please, no spaces at the start of a line
----------------------------------

???

> Split led_classdev_register_ext() into two separate internal functions
> to prepare for future changes around LED class device initialization.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/leds/led-class.c | 102 ++++++++++++++++++++++++++++++++-------
>  drivers/leds/leds.h      |   3 ++
>  2 files changed, 87 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 8494a1ca0353..2f62141268ab 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -253,9 +253,15 @@ static struct led_classdev *led_module_get(struct device *led_dev)
>  	return led_cdev;
>  }
>
> +static void led_classdev_release(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
>  static const struct class leds_class = {
>  	.name = "leds",
>  	.dev_groups = led_groups,
> +	.dev_release = led_classdev_release,
>  	.pm = &leds_class_dev_pm_ops,
>  };
>
> @@ -490,16 +496,19 @@ static int led_classdev_next_name(const char *init_name, char *name,
>  }
>
>  /**
> - * led_classdev_register_ext - register a new object of led_classdev class
> - *			       with init data.
> - *
> - * @parent: parent of LED device
> + * led_classdev_init - Initialize a new LED class device.
> + * @parent: parent of LED device.
>   * @led_cdev: the led_classdev structure for this device.
> - * @init_data: LED class device initialization data
> + * @init_data: LED class device initialization data.
> + *
> + * Initializes a new LED class device, but does not register with the
> + * subsystem yet. Useful for performing additional initialization before
> + * adding the LED class device to the subsystem using led_classdev_add().
> + *
> + * Return: Zero on success or a negative error code on failure.
>   */
> -int led_classdev_register_ext(struct device *parent,
> -			      struct led_classdev *led_cdev,
> -			      struct led_init_data *init_data)
> +int led_classdev_init(struct device *parent, struct led_classdev *led_cdev,
> +		      struct led_init_data *init_data)
>  {
>  	char composed_name[LED_MAX_NAME_SIZE];
>  	char final_name[LED_MAX_NAME_SIZE];
> @@ -564,12 +573,52 @@ int led_classdev_register_ext(struct device *parent,
>  	if (!led_cdev->max_brightness)
>  		led_cdev->max_brightness = LED_FULL;
>
> +	led_cdev->dev = kzalloc_obj(*led_cdev->dev);
> +	if (!led_cdev->dev)
> +		return -ENOMEM;
> +
> +	device_initialize(led_cdev->dev);
> +	led_cdev->dev->class = &leds_class;
> +	led_cdev->dev->parent = parent;
> +	led_cdev->dev->groups = led_cdev->groups;
> +	dev_set_drvdata(led_cdev->dev, led_cdev);
> +	ret = kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
> +	if (ret) {
> +		put_device(led_cdev->dev);
> +		led_cdev->dev = NULL;
> +		return ret;
> +	}
> +
> +	led_cdev->wq = leds_wq;
> +
> +	led_init_core(led_cdev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_init);
> +
> +/**
> + * led_classdev_add - Add a new LED class device to the subsystem.
> + * @led_cdev: the led_classdev structure for this device.
> + * @init_data: LED class device initialization data.
> + *
> + * Adds a new LED class device to the subsystem, allowing userspace applications
> + * and/or kernel consumers to access it.
> + *
> + * Returns: Zero on success or a negative error code on failure.
> + */
> +int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data *init_data)
> +{
> +	int ret;
> +
>  	mutex_lock(&led_cdev->led_access);
> -	led_cdev->dev = device_create_with_groups(&leds_class, parent, 0,
> -						  led_cdev, led_cdev->groups, "%s", final_name);
> -	if (IS_ERR(led_cdev->dev)) {
> +
> +	ret = device_add(led_cdev->dev);
> +	if (ret < 0) {

Does (ret) work for this?

>  		mutex_unlock(&led_cdev->led_access);
> -		return PTR_ERR(led_cdev->dev);
> +		put_device(led_cdev->dev);
> +		led_cdev->dev = NULL;
> +		return ret;
>  	}
>
>  	if (init_data && init_data->fwnode)
> @@ -588,10 +637,6 @@ int led_classdev_register_ext(struct device *parent,
>
>  	led_update_brightness(led_cdev);
>
> -	led_cdev->wq = leds_wq;
> -
> -	led_init_core(led_cdev);
> -
>  	/* add to the list of leds */
>  	down_write(&leds_list_lock);
>  	list_add_tail(&led_cdev->node, &leds_list);
> @@ -603,11 +648,32 @@ int led_classdev_register_ext(struct device *parent,
>
>  	mutex_unlock(&led_cdev->led_access);
>
> -	dev_dbg(parent, "Registered led device: %s\n",
> -			led_cdev->name);
> +	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev->name);
>
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(led_classdev_add);
> +
> +/**
> + * led_classdev_register_ext - register a new object of led_classdev class
> + *                             with init data.
> + *
> + * @parent: parent of LED device.
> + * @led_cdev: the led_classdev structure for this device.
> + * @init_data: LED class device initialization data.
> + */
> +int led_classdev_register_ext(struct device *parent,
> +                              struct led_classdev *led_cdev,
> +                              struct led_init_data *init_data)
> +{
> +	int ret;
> +
> +	ret = led_classdev_init(parent, led_cdev, init_data);
> +	if (ret < 0)

if (ret)

?

> +		return ret;
> +
> +	return led_classdev_add(led_cdev, init_data);
> +}
>  EXPORT_SYMBOL_GPL(led_classdev_register_ext);
>
>  /**
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 6d00e6f44126..def7166f062a 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
>  }
>
>  void led_init_core(struct led_classdev *led_cdev);
> +int led_classdev_init(struct device *parent, struct led_classdev *led_cdev,
> +		      struct led_init_data *init_data);
> +int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data *init_data);
>  void led_stop_software_blink(struct led_classdev *led_cdev);
>  void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
>  void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
> -- 
> 2.56.1
>

-- 
Lee Jones
