From: Hugh Dickins <hughd@google.com>
Subject: Re: Revert "leds: avoid races with workqueue"?
Date: Sat, 25 May 2019 10:32:31 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1905251025300.1112@eggly.anvils>
References: <alpine.LSU.2.11.1905241540080.1674@eggly.anvils> <20190525093759.GA17767@amd>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190525093759.GA17767@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Hugh Dickins <hughd@google.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat, 25 May 2019, Pavel Machek wrote:

> Hi!
> 
> > I'm having to revert 0db37915d912 ("leds: avoid races with workqueue")
> > from my 5.2-rc testing tree, because lockdep and other debug options
> > don't like it: net/mac80211/led.c arranges for led_blink_setup() to be
> > called at softirq time, and flush_work() is not good for calling
> > then.
> 
> This should keep X60 working (as well as it is now; X60 will still
> have problems with lost events in setup like yours).
> 
> Can you test this instead of the revert?

Thanks, Pavel: yes, that works fine for me on the T420s, no debug
complaints, good and silent; and the wifi LED is blinking as before.

Hugh

> 
> Thanks,
> 								Pavel
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index aefac4d..ebaac4d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -158,19 +159,14 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>  	}
>  
>  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
> -	mod_timer(&led_cdev->blink_timer, jiffies + 1);
> +	mod_timer(&led_cdev->blink_timer, jiffies + 1); /* Why oh why? Just call it directly? */
>  }
>  
> -
> +/* May not block */
>  static void led_blink_setup(struct led_classdev *led_cdev,
>  		     unsigned long *delay_on,
>  		     unsigned long *delay_off)
>  {
> -	/*
> -	 * If "set brightness to 0" is pending in workqueue, we don't
> -	 * want that to be reordered after blink_set()
> -	 */
> -	flush_work(&led_cdev->set_brightness_work);
>  	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>  	    led_cdev->blink_set &&
>  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index ca898c1..427fc3c 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
>  		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
>  	}
>  
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>  	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>  		      &led_cdev->blink_delay_off);
>  
> 
> 
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
