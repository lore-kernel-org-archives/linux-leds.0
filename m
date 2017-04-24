From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Mon, 24 Apr 2017 21:59:11 +0200
Message-ID: <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20170424044254.145192-1-dtwlin@google.com>
Sender: stable-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi David,

Thanks for the patch.

Unfortunately we cannot switch to using hr timers just like that
without introducing side effects for many devices. We had similar
attempt of increasing timer tirgger accuracy two years ago [0].

In short words, for drivers that can sleep while setting brightness
and/or are using a bus like I2C you will not be able to enforce
1ms delay period.

I recommend you to go through the thread [0] so that we had
a well defined ground for the discussion on how to address this
issue properly.

Alternatively, in order to avoid all quirks related to LED subsystem,
I'd propose to implement this feature in the GPIO subsystem, which
seems to be more suitable place for it.

[0] https://lkml.org/lkml/2015/4/28/260

Best regards,
Jacek Anaszewski

On 04/24/2017 06:42 AM, David Lin wrote:
> This patch replaces the kernel timer used by led transient trigger as an
> one-shot timer with an hrtimer. As Android is moving away from the
> obsoleted timed_output to ledtrig-transient for the vibrator HAL,
> ledtrig-transient needs to be able to handle the "duration" property to
> millisecond precision as modern haptic actuators can be driven in
> precisely one cycle (~1 ms) in order to provide a crisp and subtle
> feedback.
> 
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rom Lemarchand <romlem@google.com>
> Cc: Joel Fernandes <joelaf@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: David Lin <dtwlin@google.com>
> ---
>  drivers/leds/trigger/ledtrig-transient.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
> index 7e6011bd3646..94bb3bfc46e9 100644
> --- a/drivers/leds/trigger/ledtrig-transient.c
> +++ b/drivers/leds/trigger/ledtrig-transient.c
> @@ -23,25 +23,28 @@
>  #include <linux/init.h>
>  #include <linux/device.h>
>  #include <linux/slab.h>
> -#include <linux/timer.h>
> +#include <linux/hrtimer.h>
>  #include <linux/leds.h>
>  #include "../leds.h"
>  
>  struct transient_trig_data {
> +	struct led_classdev *led_cdev;
>  	int activate;
>  	int state;
>  	int restore_state;
>  	unsigned long duration;
> -	struct timer_list timer;
> +	struct hrtimer timer;
>  };
>  
> -static void transient_timer_function(unsigned long data)
> +static enum hrtimer_restart transient_timer_function(struct hrtimer *timer)
>  {
> -	struct led_classdev *led_cdev = (struct led_classdev *) data;
> -	struct transient_trig_data *transient_data = led_cdev->trigger_data;
> +	struct transient_trig_data *transient_data =
> +		container_of(timer, struct transient_trig_data, timer);
>  
>  	transient_data->activate = 0;
> -	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
> +	led_set_brightness_nosleep(transient_data->led_cdev,
> +				   transient_data->restore_state);
> +	return HRTIMER_NORESTART;
>  }
>  
>  static ssize_t transient_activate_show(struct device *dev,
> @@ -70,7 +73,7 @@ static ssize_t transient_activate_store(struct device *dev,
>  
>  	/* cancel the running timer */
>  	if (state == 0 && transient_data->activate == 1) {
> -		del_timer(&transient_data->timer);
> +		hrtimer_cancel(&transient_data->timer);
>  		transient_data->activate = state;
>  		led_set_brightness_nosleep(led_cdev,
>  					transient_data->restore_state);
> @@ -84,8 +87,9 @@ static ssize_t transient_activate_store(struct device *dev,
>  		led_set_brightness_nosleep(led_cdev, transient_data->state);
>  		transient_data->restore_state =
>  		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
> -		mod_timer(&transient_data->timer,
> -			  jiffies + msecs_to_jiffies(transient_data->duration));
> +		hrtimer_start(&transient_data->timer,
> +			      ms_to_ktime(transient_data->duration),
> +			      HRTIMER_MODE_REL);
>  	}
>  
>  	/* state == 0 && transient_data->activate == 0
> @@ -168,6 +172,7 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
>  			"unable to allocate transient trigger\n");
>  		return;
>  	}
> +	tdata->led_cdev = led_cdev;
>  	led_cdev->trigger_data = tdata;
>  
>  	rc = device_create_file(led_cdev->dev, &dev_attr_activate);
> @@ -182,8 +187,8 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
>  	if (rc)
>  		goto err_out_state;
>  
> -	setup_timer(&tdata->timer, transient_timer_function,
> -		    (unsigned long) led_cdev);
> +	hrtimer_init(&tdata->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	tdata->timer.function = transient_timer_function;
>  	led_cdev->activated = true;
>  
>  	return;
> @@ -203,7 +208,7 @@ static void transient_trig_deactivate(struct led_classdev *led_cdev)
>  	struct transient_trig_data *transient_data = led_cdev->trigger_data;
>  
>  	if (led_cdev->activated) {
> -		del_timer_sync(&transient_data->timer);
> +		hrtimer_cancel(&transient_data->timer);
>  		led_set_brightness_nosleep(led_cdev,
>  					transient_data->restore_state);
>  		device_remove_file(led_cdev->dev, &dev_attr_activate);
> 
