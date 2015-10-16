From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 01/10] leds: core: Add two new LED_BLINK_ flags
Date: Fri, 16 Oct 2015 18:32:56 +0300
Message-ID: <20151016153255.GK26916@valkosipuli.retiisi.org.uk>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
 <1444209048-29415-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:39981 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753061AbbJPPd3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Fri, 16 Oct 2015 11:33:29 -0400
Content-Disposition: inline
In-Reply-To: <1444209048-29415-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch

Hi Jacek,

On Wed, Oct 07, 2015 at 11:10:39AM +0200, Jacek Anaszewski wrote:
> This patch adds LED_BLINK_BRIGHTNESS_CHANGE flag to indicate that blink
> brightness has changed, and LED_BLINK_DISABLE flag to indicate that
> blinking deactivation has been requested. In order to use the flags
> led_timer_function and set_brightness_delayed callbacks as well as
> led_set_brightness() function are being modified. The main goal of these
> modifications is to prepare set_brightness_work for extension of the
> scope of its responsibilities.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-core.c |   36 ++++++++++++++++++++++++++----------
>  include/linux/leds.h    |   10 ++++++----
>  2 files changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index c1c3af0..1ba7fac 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -44,18 +44,18 @@ static void led_timer_function(unsigned long data)
>  	brightness = led_get_brightness(led_cdev);
>  	if (!brightness) {
>  		/* Time to switch the LED on. */
> -		if (led_cdev->delayed_set_value) {
> -			led_cdev->blink_brightness =
> -					led_cdev->delayed_set_value;
> -			led_cdev->delayed_set_value = 0;
> -		}
>  		brightness = led_cdev->blink_brightness;
>  		delay = led_cdev->blink_delay_on;
>  	} else {
>  		/* Store the current brightness value to be able
>  		 * to restore it when the delay_off period is over.
> +		 * Do it only if there is no pending blink brightness
> +		 * change, to avoid overwriting the new value.
>  		 */
> -		led_cdev->blink_brightness = brightness;
> +		if (!(led_cdev->flags & LED_BLINK_BRIGHTNESS_CHANGE))
> +			led_cdev->blink_brightness = brightness;
> +		else
> +			led_cdev->flags &= ~LED_BLINK_BRIGHTNESS_CHANGE;
>  		brightness = LED_OFF;
>  		delay = led_cdev->blink_delay_off;
>  	}
> @@ -84,7 +84,11 @@ static void set_brightness_delayed(struct work_struct *ws)
>  	struct led_classdev *led_cdev =
>  		container_of(ws, struct led_classdev, set_brightness_work);
>  
> -	led_stop_software_blink(led_cdev);
> +	if (led_cdev->flags & LED_BLINK_DISABLE) {
> +		led_cdev->delayed_set_value = LED_OFF;

LED_OFF is the only value assigned to led_cdev->delayed_set_value. You could
remove the field and use LED_OFF below instead.

The field is being used in later patches as well but I don't think its use
makes any difference from functionality point of view. It doesn't seem to be
a bug but quite confusing nonetheless when you try to figure out how the
different fields are being used. :-)

> +		led_stop_software_blink(led_cdev);
> +		led_cdev->flags &= ~LED_BLINK_DISABLE;
> +	}
>  
>  	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
>  }
> @@ -192,11 +196,23 @@ void led_set_brightness(struct led_classdev *led_cdev,
>  {
>  	int ret = 0;
>  
> -	/* delay brightness if soft-blink is active */
> +	/*
> +	 * In case blinking is on delay brightness setting
> +	 * until the next timer tick.
> +	 */
>  	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
> -		led_cdev->delayed_set_value = brightness;
> -		if (brightness == LED_OFF)
> +		/*
> +		 * If we need to disable soft blinking delegate this to the
> +		 * work queue task to avoid problems in case we are called
> +		 * from hard irq context.
> +		 */
> +		if (brightness == LED_OFF) {
> +			led_cdev->flags |= LED_BLINK_DISABLE;
>  			schedule_work(&led_cdev->set_brightness_work);
> +		} else {
> +			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
> +			led_cdev->blink_brightness = brightness;
> +		}
>  		return;
>  	}
>  
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b122eea..84521e5 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -44,10 +44,12 @@ struct led_classdev {
>  #define LED_BLINK_ONESHOT	(1 << 17)
>  #define LED_BLINK_ONESHOT_STOP	(1 << 18)
>  #define LED_BLINK_INVERT	(1 << 19)
> -#define LED_SYSFS_DISABLE	(1 << 20)
> -#define SET_BRIGHTNESS_ASYNC	(1 << 21)
> -#define SET_BRIGHTNESS_SYNC	(1 << 22)
> -#define LED_DEV_CAP_FLASH	(1 << 23)
> +#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 20)
> +#define LED_BLINK_DISABLE	(1 << 21)
> +#define LED_SYSFS_DISABLE	(1 << 22)
> +#define SET_BRIGHTNESS_ASYNC	(1 << 23)
> +#define SET_BRIGHTNESS_SYNC	(1 << 24)
> +#define LED_DEV_CAP_FLASH	(1 << 25)
>  
>  	/* Set LED brightness level */
>  	/* Must not sleep, use a workqueue if needed */

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
