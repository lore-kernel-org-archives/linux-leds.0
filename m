From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: leds: avoid flush_work in atomic context
Date: Sun, 26 May 2019 18:57:40 +0200
Message-ID: <5a741b3c-cf45-3577-9b6c-653f083ca96b@gmail.com>
References: <20190526073854.GA13681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526073854.GA13681@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, hughd@google.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for the patch.

I've applied it however I'm not sure if it is an official
submission, since it doesn't look like (no [PATCH] tag
in the subject).

Beside that 'Fixes' tag is somewhat incomplete - it should be
generated using following git command:

git log -1 0db37915d912 --format='Fixes: %h ("%s")'

Fixed that and applied to the for-next branch and will push
it upstream after a bit of testing for rc3 or rc4.

Best regards,
Jacek Anaszewski

On 5/26/19 9:38 AM, Pavel Machek wrote:
> 
> It turns out that various triggers use led_blink_setup() from atomic
> context, so we can't do a flush_work there. Flush is still needed for
> slow LEDs, but we can move it to sysfs code where it is safe.
>      
>      WARNING: inconsistent lock state
>      5.2.0-rc1 #1 Tainted: G        W
>      --------------------------------
>      inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
>      swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
>      000000006e30541b
>      ((work_completion)(&led_cdev->set_brightness_work)){+.?.}, at:
>      +__flush_work+0x3b/0x38a
>      {SOFTIRQ-ON-W} state was registered at:
>        lock_acquire+0x146/0x1a1
>       __flush_work+0x5b/0x38a
>       flush_work+0xb/0xd
>       led_blink_setup+0x1e/0xd3
>       led_blink_set+0x3f/0x44
>       tpt_trig_timer+0xdb/0x106
>       ieee80211_mod_tpt_led_trig+0xed/0x112
>      
> Fixes: 0db37915d912
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Tested-by: Hugh Dickins <hughd@google.com>
>      
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index aefac4d..9f8da39 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -166,11 +166,6 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>   		     unsigned long *delay_on,
>   		     unsigned long *delay_off)
>   {
> -	/*
> -	 * If "set brightness to 0" is pending in workqueue, we don't
> -	 * want that to be reordered after blink_set()
> -	 */
> -	flush_work(&led_cdev->set_brightness_work);
>   	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>   	    led_cdev->blink_set &&
>   	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index ca898c1..427fc3c 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -113,6 +113,11 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
>   		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
>   	}
>   
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>   	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
>   		      &led_cdev->blink_delay_off);
>   
> 
