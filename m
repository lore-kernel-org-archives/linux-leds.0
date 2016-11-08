From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] led: core: Use atomic bit-field for the blink-flags
Date: Tue, 08 Nov 2016 15:01:16 +0100
Message-ID: <1e53743d-6cf8-4ddf-baea-5e86b5866345@samsung.com>
References: <CGME20161108135903epcas5p376d72ae6d2f6cc518afe7219474d607e@epcas5p3.samsung.com>
 <1478613535-32564-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13529 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752511AbcKHOBW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Nov 2016 09:01:22 -0500
In-reply-to: <1478613535-32564-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

On 11/08/2016 02:58 PM, Jacek Anaszewski wrote:
> From: Hans de Goede <hdegoede@redhat.com>
>
> All the LED_BLINK* flags are accessed read-modify-write from e.g.
> led_set_brightness and led_blink_set_oneshot while both
> set_brightness_work and the blink_timer may be running.
>
> If these race then the modify step done by one of them may be lost,
> switch the LED_BLINK* flags to a new atomic work_flags bit-field
> to avoid this race.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
> Changes since v1:
> - keep set_brightness_work in linux/leds.h

Should be:
- keep set_brightness_work flags in linux/leds.h

>
>  drivers/leds/led-class.c |  1 +
>  drivers/leds/led-core.c  | 52 +++++++++++++++++++++++++-----------------------
>  include/linux/leds.h     | 24 ++++++++++++----------
>  3 files changed, 42 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index c8d2d67..b12f861 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -212,6 +212,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  		return -ENODEV;
>  	}
>
> +	led_cdev->work_flags = 0;
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	init_rwsem(&led_cdev->trigger_lock);
>  #endif
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index e2e5cc7..620257a 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -61,12 +61,13 @@ static void led_timer_function(unsigned long data)
>
>  	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
>  		led_set_brightness_nosleep(led_cdev, LED_OFF);
> -		led_cdev->flags &= ~LED_BLINK_SW;
> +		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  		return;
>  	}
>
> -	if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
> -		led_cdev->flags &=  ~(LED_BLINK_ONESHOT_STOP | LED_BLINK_SW);
> +	if (test_and_clear_bit(LED_BLINK_ONESHOT_STOP,
> +			       &led_cdev->work_flags)) {
> +		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  		return;
>  	}
>
> @@ -81,10 +82,9 @@ static void led_timer_function(unsigned long data)
>  		 * Do it only if there is no pending blink brightness
>  		 * change, to avoid overwriting the new value.
>  		 */
> -		if (!(led_cdev->flags & LED_BLINK_BRIGHTNESS_CHANGE))
> +		if (!test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> +					&led_cdev->work_flags))
>  			led_cdev->blink_brightness = brightness;
> -		else
> -			led_cdev->flags &= ~LED_BLINK_BRIGHTNESS_CHANGE;
>  		brightness = LED_OFF;
>  		delay = led_cdev->blink_delay_off;
>  	}
> @@ -95,13 +95,15 @@ static void led_timer_function(unsigned long data)
>  	 * the final blink state so that the led is toggled each delay_on +
>  	 * delay_off milliseconds in worst case.
>  	 */
> -	if (led_cdev->flags & LED_BLINK_ONESHOT) {
> -		if (led_cdev->flags & LED_BLINK_INVERT) {
> +	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags)) {
> +		if (test_bit(LED_BLINK_INVERT, &led_cdev->work_flags)) {
>  			if (brightness)
> -				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> +				set_bit(LED_BLINK_ONESHOT_STOP,
> +					&led_cdev->work_flags);
>  		} else {
>  			if (!brightness)
> -				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
> +				set_bit(LED_BLINK_ONESHOT_STOP,
> +					&led_cdev->work_flags);
>  		}
>  	}
>
> @@ -114,10 +116,9 @@ static void set_brightness_delayed(struct work_struct *ws)
>  		container_of(ws, struct led_classdev, set_brightness_work);
>  	int ret = 0;
>
> -	if (led_cdev->flags & LED_BLINK_DISABLE) {
> +	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
>  		led_cdev->delayed_set_value = LED_OFF;
>  		led_stop_software_blink(led_cdev);
> -		led_cdev->flags &= ~LED_BLINK_DISABLE;
>  	}
>
>  	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
> @@ -160,7 +161,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>  		return;
>  	}
>
> -	led_cdev->flags |= LED_BLINK_SW;
> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  	mod_timer(&led_cdev->blink_timer, jiffies + 1);
>  }
>
> @@ -169,7 +170,7 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>  		     unsigned long *delay_on,
>  		     unsigned long *delay_off)
>  {
> -	if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
> +	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>  	    led_cdev->blink_set &&
>  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
>  		return;
> @@ -196,8 +197,8 @@ void led_blink_set(struct led_classdev *led_cdev,
>  {
>  	del_timer_sync(&led_cdev->blink_timer);
>
> -	led_cdev->flags &= ~LED_BLINK_ONESHOT;
> -	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> +	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
> +	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
>
>  	led_blink_setup(led_cdev, delay_on, delay_off);
>  }
> @@ -208,17 +209,17 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
>  			   unsigned long *delay_off,
>  			   int invert)
>  {
> -	if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
> +	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>  	     timer_pending(&led_cdev->blink_timer))
>  		return;
>
> -	led_cdev->flags |= LED_BLINK_ONESHOT;
> -	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> +	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
> +	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
>
>  	if (invert)
> -		led_cdev->flags |= LED_BLINK_INVERT;
> +		set_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
>  	else
> -		led_cdev->flags &= ~LED_BLINK_INVERT;
> +		clear_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
>
>  	led_blink_setup(led_cdev, delay_on, delay_off);
>  }
> @@ -229,7 +230,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
>  	del_timer_sync(&led_cdev->blink_timer);
>  	led_cdev->blink_delay_on = 0;
>  	led_cdev->blink_delay_off = 0;
> -	led_cdev->flags &= ~LED_BLINK_SW;
> +	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  }
>  EXPORT_SYMBOL_GPL(led_stop_software_blink);
>
> @@ -240,17 +241,18 @@ void led_set_brightness(struct led_classdev *led_cdev,
>  	 * If software blink is active, delay brightness setting
>  	 * until the next timer tick.
>  	 */
> -	if (led_cdev->flags & LED_BLINK_SW) {
> +	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
>  		/*
>  		 * If we need to disable soft blinking delegate this to the
>  		 * work queue task to avoid problems in case we are called
>  		 * from hard irq context.
>  		 */
>  		if (brightness == LED_OFF) {
> -			led_cdev->flags |= LED_BLINK_DISABLE;
> +			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
>  			schedule_work(&led_cdev->set_brightness_work);
>  		} else {
> -			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
> +			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> +				&led_cdev->work_flags);
>  			led_cdev->blink_brightness = brightness;
>  		}
>  		return;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index eebcd8c..1dc69df 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -43,16 +43,20 @@ struct led_classdev {
>  #define LED_UNREGISTERING	(1 << 1)
>  	/* Upper 16 bits reflect control information */
>  #define LED_CORE_SUSPENDRESUME	(1 << 16)
> -#define LED_BLINK_SW		(1 << 17)
> -#define LED_BLINK_ONESHOT	(1 << 18)
> -#define LED_BLINK_ONESHOT_STOP	(1 << 19)
> -#define LED_BLINK_INVERT	(1 << 20)
> -#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
> -#define LED_BLINK_DISABLE	(1 << 22)
> -#define LED_SYSFS_DISABLE	(1 << 23)
> -#define LED_DEV_CAP_FLASH	(1 << 24)
> -#define LED_HW_PLUGGABLE	(1 << 25)
> -#define LED_PANIC_INDICATOR	(1 << 26)
> +#define LED_SYSFS_DISABLE	(1 << 17)
> +#define LED_DEV_CAP_FLASH	(1 << 18)
> +#define LED_HW_PLUGGABLE	(1 << 19)
> +#define LED_PANIC_INDICATOR	(1 << 20)
> +
> +	/* set_brightness_work / blink_timer flags, atomic, private. */
> +	unsigned long		work_flags;
> +
> +#define LED_BLINK_SW			0
> +#define LED_BLINK_ONESHOT		1
> +#define LED_BLINK_ONESHOT_STOP		2
> +#define LED_BLINK_INVERT		3
> +#define LED_BLINK_BRIGHTNESS_CHANGE 	4
> +#define LED_BLINK_DISABLE		5
>
>  	/* Set LED brightness level
>  	 * Must not sleep. Use brightness_set_blocking for drivers
>


-- 
Best regards,
Jacek Anaszewski
