From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: fix brightness changing when software blinking is
 active
Date: Thu, 14 May 2015 10:44:52 +0200
Message-ID: <55546084.9050704@samsung.com>
References: <55535DA4.2010509@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39148 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751226AbbENIo5 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 May 2015 04:44:57 -0400
In-reply-to: <55535DA4.2010509@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

On 05/13/2015 04:20 PM, Stas Sergeev wrote:
>
> The following sequence:
> echo timer >/sys/class/leds/<name>/trigger
> echo 1 >/sys/class/leds/<name>/brightness
> should change the ON brightness for blinking.
> The function led_set_brightness() was mistakenly initiating the
> delayed blink stop procedure, which resulted in no blinking with
> the timer trigger still active.
>
> This patch fixes the problem by changing led_set_brightness()
> to not initiate the delayed blink stop. The callers that need
> a blink stop, were updated to explicitly call led_stop_software_blink().
>
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
> CC: Kyungmin Park <kyungmin.park@samsung.com>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>   drivers/leds/led-class.c               |    5 +++++
>   drivers/leds/led-core.c                |    3 +--
>   drivers/leds/trigger/ledtrig-oneshot.c |    1 +
>   drivers/leds/trigger/ledtrig-timer.c   |    2 ++
>   4 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 795ec99..65c2c80 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -121,6 +121,11 @@ static void led_timer_function(unsigned long data)
>   	brightness = led_get_brightness(led_cdev);
>   	if (!brightness) {
>   		/* Time to switch the LED on. */
> +		if (led_cdev->delayed_set_value) {
> +			led_cdev->blink_brightness =
> +					led_cdev->delayed_set_value;
> +			led_cdev->delayed_set_value = 0;
> +		}
>   		brightness = led_cdev->blink_brightness;
>   		delay = led_cdev->blink_delay_on;
>   	} else {
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 9886dac..3210020 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -119,10 +119,9 @@ void led_set_brightness(struct led_classdev *led_cdev,
>   {
>   	int ret = 0;
>
> -	/* delay brightness setting if need to stop soft-blink timer */
> +	/* delay brightness setting to next soft-blink */

How about:

	/* delay brightness setting if soft-blink is activated */

>   	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>   		led_cdev->delayed_set_value = brightness;
> -		schedule_work(&led_cdev->set_brightness_work);

This line is still required. Please refer to the patch d23a22a74.
The author however mistakenly assumes that setting brightness while
soft blink is activated should result in disabling the trigger. This is
contrary to the documentation, which says:

"You can change the brightness value of a LED independently of the timer
trigger. However, if you set the brightness value to LED_OFF it will
also disable the timer trigger."

What needs tweaking here is set_brightness_delayed function, which
should call led_stop_software_blink only if delayed_set_value is 0.

Please fix the patch accordingly.

>   		return;
>   	}
>
> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
> index fbd02cd..c1bff10 100644
> --- a/drivers/leds/trigger/ledtrig-oneshot.c
> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
> @@ -177,6 +177,7 @@ static void oneshot_trig_deactivate(struct led_classdev *led_cdev)
>   	}
>
>   	/* Stop blinking */
> +	led_stop_software_blink(led_cdev);

This won't be needed.

>   	led_set_brightness(led_cdev, LED_OFF);
>   }
>
> diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
> index 8d09327..3577c23 100644
> --- a/drivers/leds/trigger/ledtrig-timer.c
> +++ b/drivers/leds/trigger/ledtrig-timer.c
> @@ -17,6 +17,7 @@
>   #include <linux/device.h>
>   #include <linux/ctype.h>
>   #include <linux/leds.h>
> +#include "../leds.h"
>
>   static ssize_t led_delay_on_show(struct device *dev,
>   		struct device_attribute *attr, char *buf)
> @@ -103,6 +104,7 @@ static void timer_trig_deactivate(struct led_classdev *led_cdev)
>   	}
>
>   	/* Stop blinking */
> +	led_stop_software_blink(led_cdev);

This won't be needed.

>   	led_set_brightness(led_cdev, LED_OFF);
>   }
>


-- 
Best Regards,
Jacek Anaszewski
