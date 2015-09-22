From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Tue, 22 Sep 2015 21:16:50 +0200
Message-ID: <20150922191650.GF20029@lunn.ch>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:41648 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758211AbbIVTY6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 15:24:58 -0400
Content-Disposition: inline
In-Reply-To: <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com

> +int led_set_brightness_sync(struct led_classdev *led_cdev,
> +			    enum led_brightness value)
> +{
> +	WARN_ON(led_cdev->blink_delay_on || led_cdev->blink_delay_off);
> +
> +	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +
> +	if (led_cdev->flags & LED_SUSPENDED)
> +		return 0;
> +
> +	if (led_cdev->brightness_set_blocking)
> +		return led_cdev->brightness_set_blocking(led_cdev,
> +							 led_cdev->brightness);
> +	return -EINVAL;

Maybe -ENOTSUP would be better. It is not an invalid argument, the
driver does not support it.


> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index ae3c178..2019929 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -47,9 +47,7 @@ struct led_classdev {
>  #define LED_BLINK_CHANGE	(1 << 20)
>  #define LED_BLINK_DISABLE	(1 << 21)
>  #define LED_SYSFS_DISABLE	(1 << 22)
> -#define SET_BRIGHTNESS_ASYNC	(1 << 23)
> -#define SET_BRIGHTNESS_SYNC	(1 << 24)
> -#define LED_DEV_CAP_FLASH	(1 << 25)
> +#define LED_DEV_CAP_FLASH	(1 << 23)
>  
>  	/* Set LED brightness level */
>  	/* Must not sleep, use a workqueue if needed */
> @@ -159,6 +157,21 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
>   */
>  extern void led_set_brightness(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness);
> +
> +/**
> + * led_set_brightness_sync - set LED brightness synchronously
> + * @led_cdev: the LED to set
> + * @brightness: the brightness to set it to
> + *
> + * Set an LED's brightness immediately. This function will block
> + * the caller for the time required for accessing device register,

registers - plural.

	  Andrew
