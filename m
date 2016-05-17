From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Re: [PATCH] Let chip-driver set brightness if, software blink
 inactive.
Date: Tue, 17 May 2016 17:23:14 +0100
Message-ID: <573B4572.3010205@daqri.com>
References: <573B2114.50105@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37943 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754503AbcEQQXS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 May 2016 12:23:18 -0400
Received: by mail-wm0-f52.google.com with SMTP id g17so40140989wme.1
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2016 09:23:17 -0700 (PDT)
In-Reply-To: <573B2114.50105@daqri.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linux LED Subsystem <linux-leds@vger.kernel.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

Please ignore this patch. My email client have modified the alignment, sorry. Will send another one using git send-email.

On 17/05/16 14:48, Tony Makkiel wrote:
> From f10b62b694c4fc01ab7777d145e1acde6fffaded Mon Sep 17 00:00:00 2001
> From: Tony Makkiel <tony.makkiel@daqri.com>
> Date: Tue, 17 May 2016 14:01:42 +0100
> Subject: [PATCH] Let chip-driver set brightness if, software blink inactive.
> To: linux-leds@vger.kernel.org
> Cc: j.anaszewski@samsung.com
> 
> With this patch, chip drivers will be given option to
> set brightness while, driver specific blink is active.
> 
> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
> ---
>  drivers/leds/led-core.c |  7 +++++--
>  include/linux/leds.h    | 19 ++++++++++---------
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 3495d5d..b595eb9 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -53,11 +53,12 @@ static void led_timer_function(unsigned long data)
> 
>      if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
>          led_set_brightness_nosleep(led_cdev, LED_OFF);
> +        led_cdev->flags &= ~LED_BLINK_SW;
>          return;
>      }
> 
>      if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
> -        led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> +        led_cdev->flags &=  ~(LED_BLINK_ONESHOT_STOP | LED_BLINK_SW);
>          return;
>      }
> 
> @@ -151,6 +152,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>          return;
>      }
> 
> +    led_cdev->flags |= LED_BLINK_SW;
>      mod_timer(&led_cdev->blink_timer, jiffies + 1);
>  }
> 
> @@ -219,6 +221,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
>      del_timer_sync(&led_cdev->blink_timer);
>      led_cdev->blink_delay_on = 0;
>      led_cdev->blink_delay_off = 0;
> +    led_cdev->flags &= ~LED_BLINK_SW;
>  }
>  EXPORT_SYMBOL_GPL(led_stop_software_blink);
> 
> @@ -229,7 +232,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
>       * In case blinking is on delay brightness setting
>       * until the next timer tick.
>       */
> -    if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
> +    if (led_cdev->flags & LED_BLINK_SW) {
>          /*
>           * If we need to disable soft blinking delegate this to the
>           * work queue task to avoid problems in case we are called
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index d2b1306..99b1f0b 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -42,15 +42,16 @@ struct led_classdev {
>  #define LED_UNREGISTERING    (1 << 1)
>      /* Upper 16 bits reflect control information */
>  #define LED_CORE_SUSPENDRESUME    (1 << 16)
> -#define LED_BLINK_ONESHOT    (1 << 17)
> -#define LED_BLINK_ONESHOT_STOP    (1 << 18)
> -#define LED_BLINK_INVERT    (1 << 19)
> -#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 20)
> -#define LED_BLINK_DISABLE    (1 << 21)
> -#define LED_SYSFS_DISABLE    (1 << 22)
> -#define LED_DEV_CAP_FLASH    (1 << 23)
> -#define LED_HW_PLUGGABLE    (1 << 24)
> -#define LED_PANIC_INDICATOR    (1 << 25)
> +#define LED_BLINK_SW        (1 << 17)
> +#define LED_BLINK_ONESHOT    (1 << 18)
> +#define LED_BLINK_ONESHOT_STOP    (1 << 19)
> +#define LED_BLINK_INVERT    (1 << 20)
> +#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
> +#define LED_BLINK_DISABLE    (1 << 22)
> +#define LED_SYSFS_DISABLE    (1 << 23)
> +#define LED_DEV_CAP_FLASH    (1 << 24)
> +#define LED_HW_PLUGGABLE    (1 << 25)
> +#define LED_PANIC_INDICATOR    (1 << 26)
> 
>      /* Set LED brightness level
>       * Must not sleep. Use brightness_set_blocking for drivers
