From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] led: core: Fix blink_brightness setting race
Date: Wed, 09 Nov 2016 12:48:31 +0100
Message-ID: <7d25f269-99e3-2936-8155-d725dd800c0f@samsung.com>
References: <20161023194726.24388-1-hdegoede@redhat.com>
 <CGME20161023194735eucas1p1b5e2abb7994c3c13c8fcb6553e70623c@eucas1p1.samsung.com>
 <20161023194726.24388-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58707 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751652AbcKILsg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2016 06:48:36 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGD0027WI4XZA00@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 09 Nov 2016 11:48:33 +0000 (GMT)
In-reply-to: <20161023194726.24388-2-hdegoede@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org

Hi Hans,

On 10/23/2016 09:47 PM, Hans de Goede wrote:
> All 3 of led_timer_func, led_set_brightness and led_set_software_blink
> set blink_brightness. If led_timer_func or led_set_software_blink race
> with led_set_brightness they may end up overwriting the new
> blink_brightness. The new atomic work_flags does not protect against
> this as it just protects the flags and not blink_brightness.
>
> This commit introduces a new new_blink_brightness value which gets
> set by led_set_brightness and read by led_timer_func on LED on, fixing
> this.
>
> Dealing with the new brightness at LED on time, makes the new
> brightness apply sooner, which also fixes a led_set_brightness which
> happens while a oneshot blink which ends in LED on is running not
> getting applied.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-core.c | 14 +++++++-------
>  include/linux/leds.h    |  1 +
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 17a0964..d474f97 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -81,17 +81,17 @@ static void led_timer_function(unsigned long data)
>  	brightness = led_get_brightness(led_cdev);
>  	if (!brightness) {
>  		/* Time to switch the LED on. */
> -		brightness = led_cdev->blink_brightness;
> +		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> +					&led_cdev->work_flags))
> +			brightness = led_cdev->new_blink_brightness;
> +		else
> +			brightness = led_cdev->blink_brightness;
>  		delay = led_cdev->blink_delay_on;
>  	} else {
>  		/* Store the current brightness value to be able
>  		 * to restore it when the delay_off period is over.
> -		 * Do it only if there is no pending blink brightness
> -		 * change, to avoid overwriting the new value.
>  		 */
> -		if (!test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> -					&led_cdev->work_flags))
> -			led_cdev->blink_brightness = brightness;
> +		led_cdev->blink_brightness = brightness;
>  		brightness = LED_OFF;
>  		delay = led_cdev->blink_delay_off;
>  	}
> @@ -260,7 +260,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
>  		} else {
>  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
>  				&led_cdev->work_flags);
> -			led_cdev->blink_brightness = brightness;
> +			led_cdev->new_blink_brightness = brightness;
>  		}
>  		return;
>  	}
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index cff9df7..6669404 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -87,6 +87,7 @@ struct led_classdev {
>  	unsigned long		 blink_delay_on, blink_delay_off;
>  	struct timer_list	 blink_timer;
>  	int			 blink_brightness;
> +	int			 new_blink_brightness;
>  	void			(*flash_resume)(struct led_classdev *led_cdev);
>
>  	struct work_struct	set_brightness_work;
>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
