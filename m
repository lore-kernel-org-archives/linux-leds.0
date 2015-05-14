From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: remove redundant SET_BRIGHTNESS_SYNC flag
Date: Thu, 14 May 2015 11:11:37 +0200
Message-ID: <555466C9.7080702@samsung.com>
References: <55537091.7040306@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40833 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412AbbENJLm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 May 2015 05:11:42 -0400
In-reply-to: <55537091.7040306@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>

I personally can't find any strong argument against this optimization.
I added both flags on Bryan's request while implementing LED Flash class
extension. I can see a few occurrences in the include/linux directory
where both SYNC and ASYNC flags are implemented. The argument in favour
could be the fact that the flags influence the core functionality of
the subsystem.

Bryan, could you express your opinion, please?

On 05/13/2015 05:41 PM, Stas Sergeev wrote:
>
> There is a complimentary flag called SET_BRIGHTNESS_ASYNC.
> Having both is redundant. This patch removes the unneeded flag
> without any functionality change.
>
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
>
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
> ---
>   drivers/leds/led-class-flash.c |    1 -
>   drivers/leds/led-core.c        |    4 +---
>   include/linux/leds.h           |    2 +-
>   3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 3b25734..bb67364 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -318,7 +318,6 @@ int led_classdev_flash_register(struct device *parent,
>
>   	/* Setting a torch brightness needs to have immediate effect */
>   	led_cdev->flags &= ~SET_BRIGHTNESS_ASYNC;
> -	led_cdev->flags |= SET_BRIGHTNESS_SYNC;
>
>   	return 0;
>   }
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 9886dac..356e851 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -129,10 +129,8 @@ void led_set_brightness(struct led_classdev *led_cdev,
>   	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>   		led_set_brightness_async(led_cdev, brightness);
>   		return;
> -	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
> +	} else
>   		ret = led_set_brightness_sync(led_cdev, brightness);
> -	else
> -		ret = -EINVAL;
>
>   	if (ret < 0)
>   		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 9a2b000..c9e6e5d 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -45,7 +45,7 @@ struct led_classdev {
>   #define LED_BLINK_INVERT	(1 << 19)
>   #define LED_SYSFS_DISABLE	(1 << 20)
>   #define SET_BRIGHTNESS_ASYNC	(1 << 21)
> -#define SET_BRIGHTNESS_SYNC	(1 << 22)
> +/* bit 22 unused, take it */
>   #define LED_DEV_CAP_FLASH	(1 << 23)
>
>   	/* Set LED brightness level */
>


-- 
Best Regards,
Jacek Anaszewski
