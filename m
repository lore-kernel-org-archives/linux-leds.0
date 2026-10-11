Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54D381E86
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725207; cv=none; b=Y3P7gVgMAjDRgvI/EgwDXkLKbKzPGXX4DZzye9trF/GqMObyHYA6yLyL3IE0vcyRh49JdFqVkRBgcVpX1/Jcg+fA/TJQEMZx95jHKH/1Vi/b9+WXRr9mq7r9vJaLaV7QlfPcqO8LAd8aAj9LrdQpcV4Ja4lwqeV0ktWXAfb/cko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725207; c=relaxed/simple;
	bh=LekSBkMyp1NKME9mT37Qep2+fVAjUZWCUrLVs0DcLw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsKucblsYZ1VB4Ben/cEWltchJXhU1AsL31ekR+eKG1DKqHJaZ32fSXf80Zo2JlzxGBhGcKWYDp/G7iYsR8eo2Roa3t/RWK9UBdSpva0Y64FYkz5mpSIXVXFBO9iwJsLQH8dpqrulwsG0fUs30bBV7nact7l0CkWFUoZqru1Dao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oace8+8X; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oace8+8X"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so686060a12.3
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725203; x=1792330003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJJPn9UyV831uYdNfIkGYdx+OB6dNWB2tEtVbP6gR7Y=;
        b=Oace8+8Xd3ax5Ltp4syRPXIZ7bOBKmenMj1bv5ASKAY1nPA3xks1HYRdWpA4k39z9N
         I4DdSsUVfN7Vx/J3/DmWLShrYPfuRIcqlUXiSwedzL8+zwM17QwgG/ifWp4vErNE6T5K
         DrM+BJPSSNffRwmX4Iqk7D4uupnHo0y66lD80yFXLSmK8CX7O/V6ijCKJ/LY/j6J60yL
         +rGM6d5P4EmMQj6W/IiLRcQzA8mJCsTjit/3vIZd1CWcMIYlXHuL99/VRjh++lfzLUYl
         oM98b6hIJm8qm8ZF9h7TEvnwMWJRzmjRC8xw3dcmHxbSyGPXQEjfI9wm2dLdlinmHjsu
         mTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725203; x=1792330003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJJPn9UyV831uYdNfIkGYdx+OB6dNWB2tEtVbP6gR7Y=;
        b=x8vMjPvjUiEq3bMocWdF65nqJjKdSG1gBS3f0TjMB7OZYlhjalMRkQ9X04uoVlDbRf
         dc4y6n27wVaR58+u1qzEzmmv+/ojLHOxm64yKfCMOjwf+GKM+VNItTwQGYhJg6AoibH6
         NaNyNEEwbstpcEbEy3LjP21IW9lHCCkn0RfgUcIFc5Ldfmr6uc6GI5S7xjRXfGiQQ0f8
         swV9cc5M0L2EyE0slkgEQC+1Yuh//gfw0R0gM/Bq0QW2UYNr4rYMBIwkMqo8phubjfyk
         Ga3lvUr6M2uh7wpl4xVkAfTGR0IHAaiDQ+PQHJsIXA67t62l7zsmSL7E/DIKlnfPPtqg
         gE0Q==
X-Gm-Message-State: AFq9FYI513sMz8YIb5tWeBSFL4vFJH7gnUm/dlMOP9vkrveiAsVJTbjV
	GpKhqYPK/EKicq5TiSXhxX54Pgl4USinCYcE1GAiTdSMYPL6i6l/hof9
X-Gm-Gg: AYBFou39TZpdP11O6/F28bE6F6i4CHgnXkiJtjTpcJWkjplNau58l/bdPJMrick5zn/
	WWVrMLOvqgY37v4NttH+nBbDZDxgh7Vx98XpgK0VJcCtbtqad5pQoAUdRjmE8CrI8bPfs7M6ZXB
	9yBAo2LIpmcW271cJ8ZYddxvfYGSUxavdhigUkgF0pOst/VSIeBA/xc1uGGdQouvlDIYTYeIEuk
	ZakOf6AMozwICJu3yi2ISBudLTX26g1zbbk219jXmGz2vVlgw164Ohq5gGi2sgm7QVt1ZtbCKBO
	j31iSM7fec2RXtivb6PNPj5vHwIAbLBnWPCX3pfhyXmyc0Fqun1qpgWkt3xZIu/9hZLlVPvlbvN
	Z7R04IRmi4AYzYsqUU+gbP9YwXfrPL3lFfdDNGVIoAz0HecXnRUvekvxkghls8S1CFytasZwmBA
	tHUPtv4h7e6G3C9aXotAhN71xsyFhQuDgoR75Opy40qTuEdO5oE5v38/8VpP71JkROsRszK9vCJ
	r8nZY1PqQ==
X-Received: by 2002:a05:6402:46d9:b0:6ac:bd7d:39d3 with SMTP id 4fb4d7f45d1cf-6b17c23f4c8mr5246670a12.7.1791725203101;
        Sun, 11 Oct 2026 06:26:43 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd5979sm3986556a12.16.2026.10.11.06.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:26:41 -0700 (PDT)
Message-ID: <5af976ef-6c6d-451f-891f-bc70dd2e8c00@gmail.com>
Date: Sun, 11 Oct 2026 15:26:39 +0200
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
Content-Transfer-Encoding: 8bit

Hi Svyatoslav,

On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> The AAT1270 is quite similar to the AAT1290, but it does not support the
> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
> address-sending capabilities.
> 
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

In AAT1270 the Maximum Movie to Flash Mode Current Ratio is constant
and set to 1/7.3, whereas for AAT1290 we alter it to 1/1.92 here.

This is taken into account while calculating max_mm_current in
init_mm_current_scale(), where AAT1290_MAX_MM_CURRENT definition is
used, which is based on AAT1290_MM_TO_FL_RATIO (1000 / 1920).

Obviously it would have to be changed to 1000 / 7300 for AAT1270,
for the calculations between brightness levels and microamperes for
V4L2 Flash interface to work properly for this controller.

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

AAT1290 has the capability of setting flash safety timer timeout, not
like AAT1270, for which this is controlled solely by the discrete
elements, basing on the formula T = 21.5s/µF · CT. This needs to be
reflected both in the DT bindings and in the
aat1290_init_flash_timeout(), where the minimum value should be also
fixed for AAT1270.


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

