From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Tue, 22 Sep 2015 09:42:04 +0300
Message-ID: <5600F83C.4070302@linux.intel.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:17508 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752566AbbIVGmI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 02:42:08 -0400
In-Reply-To: <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch

Hi Jacek,

Thanks for the patchset. A few comments below.

Jacek Anaszewski wrote:
> This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS flags.
> led_set_brightness now calls led_set_brightness_nosleep instead of
> choosing between sync and async op basing on the flags defined by the
> driver.
> 
> From now on, if a user wants to make sure that brightness will be set
> synchronously, they have to use led_set_brightness_sync API. It is now
> being made publicly available since it has become apparent that it is
> a caller who should decide whether brightness is to be set in
> a synchronous or an asynchronous way.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  drivers/leds/led-class-flash.c |    4 ----
>  drivers/leds/led-class.c       |    2 --
>  drivers/leds/led-core.c        |   33 +++++++++++++++++++--------------
>  drivers/leds/leds.h            |   13 -------------
>  include/linux/leds.h           |   19 ++++++++++++++++---
>  5 files changed, 35 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 300a2c9..f53783b 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -316,10 +316,6 @@ int led_classdev_flash_register(struct device *parent,
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Setting a torch brightness needs to have immediate effect */
> -	led_cdev->flags &= ~SET_BRIGHTNESS_ASYNC;
> -	led_cdev->flags |= SET_BRIGHTNESS_SYNC;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_flash_register);
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 7385f98..37eec1a 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -215,8 +215,6 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  	if (!led_cdev->max_brightness)
>  		led_cdev->max_brightness = LED_FULL;
>  
> -	led_cdev->flags |= SET_BRIGHTNESS_ASYNC;
> -
>  	led_update_brightness(led_cdev);
>  
>  	led_init_core(led_cdev);
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index d8649f1..d0eb838 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -215,8 +215,6 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>  void led_set_brightness(struct led_classdev *led_cdev,
>  			enum led_brightness brightness)
>  {
> -	int ret = 0;
> -
>  	/*
>  	 * In case blinking is on delay brightness setting
>  	 * until the next timer tick.
> @@ -235,19 +233,9 @@ void led_set_brightness(struct led_classdev *led_cdev,
>  			led_cdev->blink_brightness = brightness;
>  		}
>  		return;
> -	}
> -
> -	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
> +	} else {

Useless use of else.

>  		led_set_brightness_nosleep(led_cdev, brightness);
> -		return;
> -	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
> -		ret = led_set_brightness_sync(led_cdev, brightness);
> -	else
> -		ret = -EINVAL;
> -
> -	if (ret < 0)
> -		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
> -			ret);
> +	}
>  }
>  EXPORT_SYMBOL(led_set_brightness);
>  
> @@ -269,6 +257,23 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>  }
>  EXPORT_SYMBOL(led_set_brightness_nosleep);
>  
> +int led_set_brightness_sync(struct led_classdev *led_cdev,
> +			    enum led_brightness value)
> +{
> +	WARN_ON(led_cdev->blink_delay_on || led_cdev->blink_delay_off);

How about simply returning an error instead?

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
> +}
> +EXPORT_SYMBOL(led_set_brightness_sync);
> +
>  int led_update_brightness(struct led_classdev *led_cdev)
>  {
>  	int ret = 0;
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 04b8e41..62d9eba 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -16,19 +16,6 @@
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
>  
> -static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
> -					enum led_brightness value)
> -{
> -	int ret = 0;
> -
> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
> -
> -	if (!(led_cdev->flags & LED_SUSPENDED))
> -		ret = led_cdev->brightness_set_blocking(led_cdev,
> -						led_cdev->brightness);
> -	return ret;
> -}
> -
>  static inline int led_get_brightness(struct led_classdev *led_cdev)
>  {
>  	return led_cdev->brightness;
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
> + * and it can sleep.
> + *
> + * Returns: 0 on success or negative error value on failure
> + */
> +extern int led_set_brightness_sync(struct led_classdev *led_cdev,
> +				   enum led_brightness value);
> +
>  /**
>   * led_update_brightness - update LED brightness
>   * @led_cdev: the LED to query
> 

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
