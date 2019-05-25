From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Disk activity trigger: keeps blinking under full load
Date: Sat, 25 May 2019 19:02:47 +0200
Message-ID: <67fee5a8-cba1-79aa-104c-84bbe0e168e9@gmail.com>
References: <20190523214301.GA14788@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523214301.GA14788@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, linz@li-pro.net, rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

Hi,

On 5/23/19 11:43 PM, Pavel Machek wrote:
> Hi!
> 
> I'm trying to use disk activity trigger on a scrollock LED... but it
> significantly differs from "usual" disk LED: even under "full" disk
> activity (linear read) where it should be solidly "on", it keeps
> blinking.
> 
> I guess that's what led_trigger_blink_oneshot() does. I tried to
> change the parameters... off_delay == 0 breaks it completely, and even
> with delay of 1 it behaves very weirdly.
> 
> Is there better helper I should use?

It seems this is the way how led_blink_set_oneshot() works.
It initially checks whether timer is pending and doesn't
reset the timer in this case:

         if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
              timer_pending(&led_cdev->blink_timer))
                 return;

In effect you get gaps between timer expiration and setting of a new
blink shot.

Best regards,
Jacek Anaszewski

> 
> 								Pavel
> 
> diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
> index 9816b0d..cf40ef2 100644
> --- a/drivers/leds/trigger/ledtrig-disk.c
> +++ b/drivers/leds/trigger/ledtrig-disk.c
> @@ -15,7 +15,7 @@
>   #include <linux/init.h>
>   #include <linux/leds.h>
>   
> -#define BLINK_DELAY 30
> +#define BLINK_DELAY 10
>   
>   DEFINE_LED_TRIGGER(ledtrig_disk);
>   DEFINE_LED_TRIGGER(ledtrig_disk_read);
> @@ -25,17 +25,18 @@ DEFINE_LED_TRIGGER(ledtrig_ide);
>   void ledtrig_disk_activity(bool write)
>   {
>   	unsigned long blink_delay = BLINK_DELAY;
> +	unsigned long off_delay = 1;
>   
>   	led_trigger_blink_oneshot(ledtrig_disk,
> -				  &blink_delay, &blink_delay, 0);
> +				  &blink_delay, &off_delay, 0);
>   	led_trigger_blink_oneshot(ledtrig_ide,
> -				  &blink_delay, &blink_delay, 0);
> +				  &blink_delay, &off_delay, 0);
>   	if (write)
>   		led_trigger_blink_oneshot(ledtrig_disk_write,
> -					  &blink_delay, &blink_delay, 0);
> +					  &blink_delay, &off_delay, 0);
>   	else
>   		led_trigger_blink_oneshot(ledtrig_disk_read,
> -					  &blink_delay, &blink_delay, 0);
> +					  &blink_delay, &off_delay, 0);
>   }
>   EXPORT_SYMBOL(ledtrig_disk_activity);
>   
> @@ -44,6 +45,7 @@ static int __init ledtrig_disk_init(void)
>   	led_trigger_register_simple("disk-activity", &ledtrig_disk);
>   	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
>   	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
> +	/* deprecate? */
>   	led_trigger_register_simple("ide-disk", &ledtrig_ide);
>   
>   	return 0;
> 
> 
> 
> 
