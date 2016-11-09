From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] leds: ledtrig-heartbeat: Make top brightness
 adjustable
Date: Wed, 9 Nov 2016 12:51:56 +0100
Message-ID: <df67bec3-177c-b7e2-573d-a2728896a4e2@redhat.com>
References: <1478688226-4158-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478688226-4158-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

Hi,

On 09-11-16 11:43, Jacek Anaszewski wrote:
> LED class heartbeat trigger allowed only for blinking with max_brightness
> value. This patch adds more flexibility by exploiting part of LED core
> software blink infrastructure.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes since v1:
> - after introduction of work_flags and new_blink_brightness properties
>   this patch needs to be updated

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

>
>  drivers/leds/trigger/ledtrig-heartbeat.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
> index c9f3862..e6f2f8b 100644
> --- a/drivers/leds/trigger/ledtrig-heartbeat.c
> +++ b/drivers/leds/trigger/ledtrig-heartbeat.c
> @@ -43,6 +43,9 @@ static void led_heartbeat_function(unsigned long data)
>  		return;
>  	}
>
> +	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
> +		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
> +
>  	/* acts like an actual heart beat -- ie thump-thump-pause... */
>  	switch (heartbeat_data->phase) {
>  	case 0:
> @@ -59,26 +62,26 @@ static void led_heartbeat_function(unsigned long data)
>  		delay = msecs_to_jiffies(70);
>  		heartbeat_data->phase++;
>  		if (!heartbeat_data->invert)
> -			brightness = led_cdev->max_brightness;
> +			brightness = led_cdev->blink_brightness;
>  		break;
>  	case 1:
>  		delay = heartbeat_data->period / 4 - msecs_to_jiffies(70);
>  		heartbeat_data->phase++;
>  		if (heartbeat_data->invert)
> -			brightness = led_cdev->max_brightness;
> +			brightness = led_cdev->blink_brightness;
>  		break;
>  	case 2:
>  		delay = msecs_to_jiffies(70);
>  		heartbeat_data->phase++;
>  		if (!heartbeat_data->invert)
> -			brightness = led_cdev->max_brightness;
> +			brightness = led_cdev->blink_brightness;
>  		break;
>  	default:
>  		delay = heartbeat_data->period - heartbeat_data->period / 4 -
>  			msecs_to_jiffies(70);
>  		heartbeat_data->phase = 0;
>  		if (heartbeat_data->invert)
> -			brightness = led_cdev->max_brightness;
> +			brightness = led_cdev->blink_brightness;
>  		break;
>  	}
>
> @@ -133,7 +136,10 @@ static void heartbeat_trig_activate(struct led_classdev *led_cdev)
>  	setup_timer(&heartbeat_data->timer,
>  		    led_heartbeat_function, (unsigned long) led_cdev);
>  	heartbeat_data->phase = 0;
> +	if (!led_cdev->blink_brightness)
> +		led_cdev->blink_brightness = led_cdev->max_brightness;
>  	led_heartbeat_function(heartbeat_data->timer.data);
> +	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  	led_cdev->activated = true;
>  }
>
> @@ -145,6 +151,7 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
>  		del_timer_sync(&heartbeat_data->timer);
>  		device_remove_file(led_cdev->dev, &dev_attr_invert);
>  		kfree(heartbeat_data);
> +		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
>  		led_cdev->activated = false;
>  	}
>  }
>
