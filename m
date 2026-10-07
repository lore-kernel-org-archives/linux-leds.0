Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354E4D2EC8
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399869; cv=none; b=Z0JiannOJv6quN/w1JHE5c4/XWain7WbYsP+yLNhlRQ7tOcUNM8DWWPeIIX5w06nyqS6iK4NX3tqUuPqc2roXP+x1i703FKgFuaC2BBS7OaJfED6yvZ/3ty6ObtmlnqOn0C8UGxeIkJqOvGoankoDNHrrVKDJ58l5EsOjwwWLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399869; c=relaxed/simple;
	bh=cZptUCkHL8vdaVMrux3BrGe96FoNmMFuicAdeg5aSsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NB0+WrIw3A28zK0TjkvoRpDFLYn8KKSBeX0FTKrtntUdS8szAsiwZ/e9d9ExVoRYJ6y2yDeupj3RDIRVROZ+Yls3t5oL9HmSOsUWdDnotHQ+OFCHBbrQt2GahQx8q7Go4qfmj3j5LSgDVE15AflkOWzR9HDOlH9+EDhghmQo9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk1u145D; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk1u145D"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso2451108e87.0
        for <linux-leds@vger.kernel.org>; Wed, 07 Oct 2026 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791399865; x=1792004665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9QVYI9oWKMGNOjg27TukxI9KxAe42Y0fsCI4ggTly0=;
        b=Wk1u145Dmwa/XllG0b0Vco8evbYjEQ88kaejv/2d6BKhQAvsJIYwezc07zeJ5OmdOV
         8rTdt5c+ZVdR5LVp8F/CQleEE1/rsz/pw4ExUj8LUmoEPDmOiOvnau+wesYF2I9mxvB7
         uXYccZkKNZr+yzcHTUz21mAYYkC/eZxBFMfjtxbJ3/GQvSMWtflcqiM3u1oklPPOGUXJ
         7LFhgQc4ntn/JLK8l1PMspxyq+Yk7JXHlfdxIPfUf01U+OVaq1LXAGXh+Ej9nCcr5Umx
         G6yTL3ToVVdm8TbqlkP9Yo0IdvtgZjU2cOHTO+VI95iLo+4ELW7JfVybtGAFiUrhFJYV
         0sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791399865; x=1792004665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9QVYI9oWKMGNOjg27TukxI9KxAe42Y0fsCI4ggTly0=;
        b=vcPWP9bhVrTPKHAEjEkcqcM0sHY022b+4v76KEXpkPPtAkoJUCoq09lrwx3myM9LOa
         ROPJP5CJXoigAP0bwMJRPJOyY6n9ibDt91KZy99IMZgZRdhKFoIyKceZGd4B/06kAwj+
         Y9WHmT4VuUfxe5hg9RNlPUDJcdus9P85WbNtJ38r4CiDSHHJfN7eaxuoem6HGkt97TwZ
         15bOJM3voCizmx+7RJLiJR4PrTrZ6dGKRFYfeOraiju6ZAX5v62+v5wMeVXjtoEfrYsL
         2jPudH8jBT3wTwht3ZKfq9ZcUFOGYNf/Pr0CBa2GgeTRQo67AwjDDT+raAFYSGKhvjAW
         uM2A==
X-Gm-Message-State: AFq9FYIOAkHB26UrDTflbZEMgc2gAPbIxxXCJIHXcX5UA7JF3fvCGUfe
	EepjXLljeMhb2daFS0WbHVzIXt2PSiH6A3dk59WA3YT0dwyzGF9najLP
X-Gm-Gg: AYBFou1odpaFRjvvU3YLUJjMSz3u1RjOwFbNF5tKMVD7MJnfLlTA971twoMWFvXOkTk
	KPv0qyjJxV7B/2bMOAX4LFwuuf6ZRKc2VzwnHEfL1N3cYhjDDVmt9pqdH6nyKCE5bhQymKqmsgr
	WAcDfj2bAIpuA/gjkHQ4eBymOoUfFC0bWq3hYzv+2yLE/5WTQP1yrgX8z6GuKMzyf86m6ndFeWN
	eQbLo7kMAWDnsE9svXh3pwK82mdDO2m0c0jNI2vNA1RoX6TI9v9Vg0NmevBSm7tWa1BgTDrmmke
	4wyUtNYW9zw3mPWQAt7X0a28RJeAMyC0H8Hl+lQuW/64L69tXeDTlu32VRxsiKaXTpqsaiMt1Te
	mRKvMFMqcWYKwA00WfzYLNpqfK09fCGUVLGo4/C8WU8wLVeCvyiZpXEe9wy5yEwP7xuRH6xeKMR
	Wq2RgF7AExXnssScZzdQFHlU0Q2+u55TUdO6eTSmz1x22mEcDT4FRpoB3aqJVhnfFhGQOO6mCZe
	6fq8WeACg==
X-Received: by 2002:a05:6512:4026:b0:5b8:b2f0:b5b0 with SMTP id 2adb3069b0e04-5bcd073b11emr1053396e87.46.1791399864436;
        Wed, 07 Oct 2026 12:04:24 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3074a22sm320080e87.16.2026.10.07.12.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 12:04:23 -0700 (PDT)
Message-ID: <e69041a4-c03e-46ae-b83a-3d8363070e80@gmail.com>
Date: Wed, 7 Oct 2026 21:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-4-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261007085457.98762-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> The AAT1270 is quite similar to the AAT1290, but it does not support the
> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
> address-sending capabilities.

It seems that it is not possible to set brightness level and flash
timeout. Those values are controlled by the values of RSET and CT
elements attached to the controller. Those values should be conveyed
via Device Tree, and the LED device API should reflect that accordingly.

The question is whether it is worth a hassle to add support for this
older chipset version. Could you let as know on which device it is
present.


> Differentiate the chips by using a description structure with a flag to
> indicate if AS2C is supported, placing all AS2C-only features under a
> conditional check.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/leds/flash/leds-aat1290.c | 66 ++++++++++++++++++++++---------
>   1 file changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
> index 49251cfd33509..773cdcc73a9e1 100644
> --- a/drivers/leds/flash/leds-aat1290.c
> +++ b/drivers/leds/flash/leds-aat1290.c
> @@ -43,9 +43,6 @@
>   #define AAT1290_FLASH_TM_NUM_LEVELS	16
>   #define AAT1290_MM_CURRENT_SCALE_SIZE	15
>   
> -#define AAT1290_NAME			"aat1290"
> -
> -
>   struct aat1290_led_config_data {
>   	/* maximum LED current in movie mode */
>   	u32 max_mm_current;
> @@ -59,6 +56,13 @@ struct aat1290_led_config_data {
>   	enum led_brightness max_brightness;
>   };
>   
> +struct aat1290_led_chip_info {
> +	/* led controller name */
> +	const char *name;
> +	/* Advanced Simple Serial Control support */
> +	bool as2c;
> +};
> +
>   struct aat1290_led {
>   	/* platform device data */
>   	struct platform_device *pdev;
> @@ -74,6 +78,10 @@ struct aat1290_led {
>   	struct gpio_desc *gpio_fl_en;
>   	/* EN|SET pin  */
>   	struct gpio_desc *gpio_en_set;
> +
> +	/* led controller description */
> +	const struct aat1290_led_chip_info *info;
> +
>   	/* movie mode current scale */
>   	int *mm_current_scale;
>   	/* device mode */
> @@ -101,15 +109,17 @@ static void aat1290_as2cwire_write(struct aat1290_led *led, int addr, int value)
>   
>   	udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);
>   
> -	/* write address */
> -	for (i = 0; i < addr; ++i) {
> -		udelay(AAT1290_EN_SET_TICK_TIME_US);
> -		gpiod_direction_output(led->gpio_en_set, 0);
> -		udelay(AAT1290_EN_SET_TICK_TIME_US);
> -		gpiod_direction_output(led->gpio_en_set, 1);
> -	}
> +	if (led->info->as2c) {
> +		/* write address */
> +		for (i = 0; i < addr; ++i) {
> +			udelay(AAT1290_EN_SET_TICK_TIME_US);
> +			gpiod_direction_output(led->gpio_en_set, 0);
> +			udelay(AAT1290_EN_SET_TICK_TIME_US);
> +			gpiod_direction_output(led->gpio_en_set, 1);
> +		}
>   
> -	usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US);
> +		usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US);
> +	}
>   
>   	/* write data */
>   	for (i = 0; i < value; ++i) {
> @@ -150,16 +160,18 @@ static int aat1290_led_brightness_set(struct led_classdev *led_cdev,
>   		led->movie_mode = false;
>   	} else {
>   		if (!led->movie_mode) {
> -			aat1290_as2cwire_write(led,
> -				AAT1290_MM_CURRENT_RATIO_ADDR,
> -				AAT1290_MM_TO_FL_1_92);
> +			if (led->info->as2c)
> +				aat1290_as2cwire_write(led,
> +					AAT1290_MM_CURRENT_RATIO_ADDR,
> +					AAT1290_MM_TO_FL_1_92);
>   			led->movie_mode = true;
>   		}
>   
>   		aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CURRENT_ADDR,
>   				AAT1290_MAX_MM_CURR_PERCENT_0 - brightness);
> -		aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADDR,
> -				AAT1290_MOVIE_MODE_ON);
> +		if (led->info->as2c)
> +			aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADDR,
> +					       AAT1290_MOVIE_MODE_ON);
>   	}
>   
>   	mutex_unlock(&led->lock);
> @@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
>   	mutex_lock(&led->lock);
>   
>   	if (state) {
> -		aat1290_set_flash_safety_timer(led, timeout->val);
> +		if (led->info->as2c)
> +			aat1290_set_flash_safety_timer(led, timeout->val);
>   		gpiod_direction_output(led->gpio_fl_en, 1);
>   	} else {
>   		gpiod_direction_output(led->gpio_fl_en, 0);
> @@ -475,6 +488,10 @@ static int aat1290_led_probe(struct platform_device *pdev)
>   	fled_cdev->ops = &flash_ops;
>   	led_cdev = &fled_cdev->led_cdev;
>   
> +	led->info = device_get_match_data(dev);
> +	if (!led->info)
> +		return -ENODEV;
> +
>   	ret = aat1290_led_get_configuration(led, &led_cfg, &sub_node);
>   	if (ret < 0)
>   		return ret;
> @@ -489,7 +506,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
>   	aat1290_init_flash_timeout(led, &led_cfg);
>   
>   	init_data.fwnode = of_fwnode_handle(sub_node);
> -	init_data.devicename = AAT1290_NAME;
> +	init_data.devicename = led->info->name;
>   
>   	/* Register LED Flash class device */
>   	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
> @@ -528,8 +545,19 @@ static void aat1290_led_remove(struct platform_device *pdev)
>   	mutex_destroy(&led->lock);
>   }
>   
> +static const struct aat1290_led_chip_info aat1290_info = {
> +	.name = "aat1290",
> +	.as2c = true,
> +};
> +
> +static const struct aat1290_led_chip_info aat1270_info = {
> +	.name = "aat1270",
> +	.as2c = false,
> +};
> +
>   static const struct of_device_id aat1290_led_dt_match[] = {
> -	{ .compatible = "skyworks,aat1290" },
> +	{ .compatible = "skyworks,aat1290", .data = &aat1290_info },
> +	{ .compatible = "skyworks,aat1270", .data = &aat1270_info },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);

-- 
Best regards,
Jacek Anaszewski

