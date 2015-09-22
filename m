From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/5] leds: core: Move LED core callbacks out of
 led-class.c
Date: Tue, 22 Sep 2015 21:06:20 +0200
Message-ID: <20150922190620.GE20029@lunn.ch>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442400464-27367-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com
List-Id: linux-leds@vger.kernel.org

On Wed, Sep 16, 2015 at 12:47:40PM +0200, Jacek Anaszewski wrote:
> Since the API for controlling LED brightness and blinking is defined in
> the LED core, move the related timer and work callbacks to the led-core.c,
> and initialize them through a new led_core_init API.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: Andrew Lunn <andrew@lunn.ch>

Andrew

> ---
>  drivers/leds/led-class.c |   69 +------------------------------------------
>  drivers/leds/led-core.c  |   73 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/leds/leds.h      |    1 +
>  3 files changed, 75 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index ca51d58..7385f98 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -102,70 +102,6 @@ static const struct attribute_group *led_groups[] = {
>  	NULL,
>  };
>  
> -static void led_timer_function(unsigned long data)
> -{
> -	struct led_classdev *led_cdev = (void *)data;
> -	unsigned long brightness;
> -	unsigned long delay;
> -
> -	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
> -		led_set_brightness_async(led_cdev, LED_OFF);
> -		return;
> -	}
> -
> -	if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
> -		led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> -		return;
> -	}
> -
> -	brightness = led_get_brightness(led_cdev);
> -	if (!brightness) {
> -		/* Time to switch the LED on. */
> -		if (led_cdev->delayed_set_value) {
> -			led_cdev->blink_brightness =
> -					led_cdev->delayed_set_value;
> -			led_cdev->delayed_set_value = 0;
> -		}
> -		brightness = led_cdev->blink_brightness;
> -		delay = led_cdev->blink_delay_on;
> -	} else {
> -		/* Store the current brightness value to be able
> -		 * to restore it when the delay_off period is over.
> -		 */
> -		led_cdev->blink_brightness = brightness;
> -		brightness = LED_OFF;
> -		delay = led_cdev->blink_delay_off;
> -	}
> -
> -	led_set_brightness_async(led_cdev, brightness);
> -
> -	/* Return in next iteration if led is in one-shot mode and we are in
> -	 * the final blink state so that the led is toggled each delay_on +
> -	 * delay_off milliseconds in worst case.
> -	 */
> -	if (led_cdev->flags & LED_BLINK_ONESHOT) {
> -		if (led_cdev->flags & LED_BLINK_INVERT) {
> -			if (brightness)
> -				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> -		} else {
> -			if (!brightness)
> -				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> -		}
> -	}
> -
> -	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
> -}
> -
> -static void set_brightness_delayed(struct work_struct *ws)
> -{
> -	struct led_classdev *led_cdev =
> -		container_of(ws, struct led_classdev, set_brightness_work);
> -
> -	led_stop_software_blink(led_cdev);
> -
> -	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
> -}
> -
>  /**
>   * led_classdev_suspend - suspend an led_classdev.
>   * @led_cdev: the led_classdev to suspend.
> @@ -283,10 +219,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  
>  	led_update_brightness(led_cdev);
>  
> -	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
> -
> -	setup_timer(&led_cdev->blink_timer, led_timer_function,
> -		    (unsigned long)led_cdev);
> +	led_init_core(led_cdev);
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	led_trigger_set_default(led_cdev);
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 549de7e..2cb4e37 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,6 +25,70 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>  LIST_HEAD(leds_list);
>  EXPORT_SYMBOL_GPL(leds_list);
>  
> +static void led_timer_function(unsigned long data)
> +{
> +	struct led_classdev *led_cdev = (void *)data;
> +	unsigned long brightness;
> +	unsigned long delay;
> +
> +	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
> +		led_set_brightness_async(led_cdev, LED_OFF);
> +		return;
> +	}
> +
> +	if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
> +		led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> +		return;
> +	}
> +
> +	brightness = led_get_brightness(led_cdev);
> +	if (!brightness) {
> +		/* Time to switch the LED on. */
> +		if (led_cdev->delayed_set_value) {
> +			led_cdev->blink_brightness =
> +					led_cdev->delayed_set_value;
> +			led_cdev->delayed_set_value = 0;
> +		}
> +		brightness = led_cdev->blink_brightness;
> +		delay = led_cdev->blink_delay_on;
> +	} else {
> +		/* Store the current brightness value to be able
> +		 * to restore it when the delay_off period is over.
> +		 */
> +		led_cdev->blink_brightness = brightness;
> +		brightness = LED_OFF;
> +		delay = led_cdev->blink_delay_off;
> +	}
> +
> +	led_set_brightness_async(led_cdev, brightness);
> +
> +	/* Return in next iteration if led is in one-shot mode and we are in
> +	 * the final blink state so that the led is toggled each delay_on +
> +	 * delay_off milliseconds in worst case.
> +	 */
> +	if (led_cdev->flags & LED_BLINK_ONESHOT) {
> +		if (led_cdev->flags & LED_BLINK_INVERT) {
> +			if (brightness)
> +				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> +		} else {
> +			if (!brightness)
> +				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> +		}
> +	}
> +
> +	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
> +}
> +
> +static void set_brightness_delayed(struct work_struct *ws)
> +{
> +	struct led_classdev *led_cdev =
> +		container_of(ws, struct led_classdev, set_brightness_work);
> +
> +	led_stop_software_blink(led_cdev);
> +
> +	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
> +}
> +
>  static void led_set_software_blink(struct led_classdev *led_cdev,
>  				   unsigned long delay_on,
>  				   unsigned long delay_off)
> @@ -72,6 +136,15 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>  	led_set_software_blink(led_cdev, *delay_on, *delay_off);
>  }
>  
> +void led_init_core(struct led_classdev *led_cdev)
> +{
> +	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
> +
> +	setup_timer(&led_cdev->blink_timer, led_timer_function,
> +		    (unsigned long)led_cdev);
> +}
> +EXPORT_SYMBOL(led_init_core);
> +
>  void led_blink_set(struct led_classdev *led_cdev,
>  		   unsigned long *delay_on,
>  		   unsigned long *delay_off)
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index bc89d7a..4238fbc 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -44,6 +44,7 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
>  	return led_cdev->brightness;
>  }
>  
> +void led_init_core(struct led_classdev *led_cdev);
>  void led_stop_software_blink(struct led_classdev *led_cdev);
>  
>  extern struct rw_semaphore leds_list_lock;
> -- 
> 1.7.9.5
> 
