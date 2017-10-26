From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Convert timers to use timer_setup()
Date: Thu, 26 Oct 2017 20:38:48 +0200
Message-ID: <b4872e92-7a73-a86b-7ec2-ba7a79603dae@gmail.com>
References: <20171025103001.GA145942@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:46585 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932334AbdJZSjr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Oct 2017 14:39:47 -0400
In-Reply-To: <20171025103001.GA145942@beast>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Willy Tarreau <w@1wt.eu>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Kees,

Thanks for the patch.

On 10/25/2017 12:30 PM, Kees Cook wrote:
> In preparation for unconditionally passing the struct timer_list pointer to
> all timer callbacks, switch to using the new timer_setup() and from_timer()
> to pass the timer pointer explicitly.
> 
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Willy Tarreau <w@1wt.eu>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/leds/led-core.c                  |  7 +++----
>  drivers/leds/trigger/ledtrig-activity.c  | 14 ++++++++------
>  drivers/leds/trigger/ledtrig-transient.c | 12 +++++++-----
>  3 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ef1360445413..fd83c7f77a95 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -45,9 +45,9 @@ static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
>  	return led_cdev->brightness_set_blocking(led_cdev, value);
>  }
>  
> -static void led_timer_function(unsigned long data)
> +static void led_timer_function(struct timer_list *t)
>  {
> -	struct led_classdev *led_cdev = (void *)data;
> +	struct led_classdev *led_cdev = from_timer(led_cdev, t, blink_timer);
>  	unsigned long brightness;
>  	unsigned long delay;
>  
> @@ -178,8 +178,7 @@ void led_init_core(struct led_classdev *led_cdev)
>  {
>  	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
>  
> -	setup_timer(&led_cdev->blink_timer, led_timer_function,
> -		    (unsigned long)led_cdev);
> +	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
>  }
>  EXPORT_SYMBOL_GPL(led_init_core);
>  
> diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
> index c6635c5e227a..5081894082bd 100644
> --- a/drivers/leds/trigger/ledtrig-activity.c
> +++ b/drivers/leds/trigger/ledtrig-activity.c
> @@ -24,6 +24,7 @@ static int panic_detected;
>  
>  struct activity_data {
>  	struct timer_list timer;
> +	struct led_classdev *led_cdev;
>  	u64 last_used;
>  	u64 last_boot;
>  	int time_left;
> @@ -31,10 +32,11 @@ struct activity_data {
>  	int invert;
>  };
>  
> -static void led_activity_function(unsigned long data)
> +static void led_activity_function(struct timer_list *t)
>  {
> -	struct led_classdev *led_cdev = (struct led_classdev *)data;
> -	struct activity_data *activity_data = led_cdev->trigger_data;
> +	struct activity_data *activity_data = from_timer(activity_data, t,
> +							 timer);
> +	struct led_classdev *led_cdev = activity_data->led_cdev;
>  	struct timespec boot_time;
>  	unsigned int target;
>  	unsigned int usage;
> @@ -195,11 +197,11 @@ static void activity_activate(struct led_classdev *led_cdev)
>  		return;
>  	}
>  
> -	setup_timer(&activity_data->timer,
> -		    led_activity_function, (unsigned long)led_cdev);
> +	activity_data->led_cdev = led_cdev;
> +	timer_setup(&activity_data->timer, led_activity_function, 0);
>  	if (!led_cdev->blink_brightness)
>  		led_cdev->blink_brightness = led_cdev->max_brightness;
> -	led_activity_function(activity_data->timer.data);
> +	led_activity_function(&activity_data->timer);
>  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  	led_cdev->activated = true;
>  }
> diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
> index 7e6011bd3646..7acce64b692a 100644
> --- a/drivers/leds/trigger/ledtrig-transient.c
> +++ b/drivers/leds/trigger/ledtrig-transient.c
> @@ -33,12 +33,14 @@ struct transient_trig_data {
>  	int restore_state;
>  	unsigned long duration;
>  	struct timer_list timer;
> +	struct led_classdev *led_cdev;
>  };
>  
> -static void transient_timer_function(unsigned long data)
> +static void transient_timer_function(struct timer_list *t)
>  {
> -	struct led_classdev *led_cdev = (struct led_classdev *) data;
> -	struct transient_trig_data *transient_data = led_cdev->trigger_data;
> +	struct transient_trig_data *transient_data =
> +		from_timer(transient_data, t, timer);
> +	struct led_classdev *led_cdev = transient_data->led_cdev;
>  
>  	transient_data->activate = 0;
>  	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
> @@ -169,6 +171,7 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
>  		return;
>  	}
>  	led_cdev->trigger_data = tdata;
> +	tdata->led_cdev = led_cdev;
>  
>  	rc = device_create_file(led_cdev->dev, &dev_attr_activate);
>  	if (rc)
> @@ -182,8 +185,7 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
>  	if (rc)
>  		goto err_out_state;
>  
> -	setup_timer(&tdata->timer, transient_timer_function,
> -		    (unsigned long) led_cdev);
> +	timer_setup(&tdata->timer, transient_timer_function, 0);
>  	led_cdev->activated = true;
>  
>  	return;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
