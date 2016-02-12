From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: core: add helpers for calling
 brightness_set(_blocking)
Date: Fri, 12 Feb 2016 17:10:34 +0100
Message-ID: <56BE03FA.4090301@samsung.com>
References: <56B68DC3.3090604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61413 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbcBLQKl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Feb 2016 11:10:41 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2F00H3VZLRYW50@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 12 Feb 2016 16:10:39 +0000 (GMT)
In-reply-to: <56B68DC3.3090604@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/07/2016 01:20 AM, Heiner Kallweit wrote:
> Add helpers for calling brightness_set(_blocking) allowing to
> simplify the code and make it better readable.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-core.c | 40 ++++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ad684b6..c29e4c9 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,6 +25,26 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>
> +static int led_set_output(struct led_classdev *cdev,

s/cdev/led_cdev/

Please adhere to the existing naming convention.

led_set_output isn't too informative name, and can be misleading.
We already have a number of different internal functions for setting LED 
brightness, so we have to be careful when adding new ones.

At the moment I don't have any good candidate.

__led_set_brightness() and __led_set_brightness_blocking() as a last
resort. We had the former at some point.

Nonetheless it would be great if you came up with some better
names:)

> +			  enum led_brightness value)
> +{
> +	if (!cdev->brightness_set)
> +		return -ENOTSUPP;
> +
> +	cdev->brightness_set(cdev, value);
> +
> +	return 0;
> +}
> +
> +static int led_set_output_blocking(struct led_classdev *cdev,
> +				   enum led_brightness value)
> +{
> +	if (!cdev->brightness_set_blocking)
> +		return -ENOTSUPP;
> +
> +	return cdev->brightness_set_blocking(cdev, value);
> +}
> +
>   static void led_timer_function(unsigned long data)
>   {
>   	struct led_classdev *led_cdev = (void *)data;
> @@ -91,13 +111,10 @@ static void set_brightness_delayed(struct work_struct *ws)
>   		led_cdev->flags &= ~LED_BLINK_DISABLE;
>   	}
>
> -	if (led_cdev->brightness_set)
> -		led_cdev->brightness_set(led_cdev, led_cdev->delayed_set_value);
> -	else if (led_cdev->brightness_set_blocking)
> -		ret = led_cdev->brightness_set_blocking(led_cdev,
> -						led_cdev->delayed_set_value);
> -	else
> -		ret = -ENOTSUPP;
> +	ret = led_set_output(led_cdev, led_cdev->delayed_set_value);
> +	if (ret == -ENOTSUPP)
> +		ret = led_set_output_blocking(led_cdev,
> +					      led_cdev->delayed_set_value);
>   	if (ret < 0 &&
>   	    /* LED HW might have been unplugged, therefore don't warn */
>   	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> @@ -236,10 +253,8 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   			      enum led_brightness value)
>   {
>   	/* Use brightness_set op if available, it is guaranteed not to sleep */
> -	if (led_cdev->brightness_set) {
> -		led_cdev->brightness_set(led_cdev, value);
> +	if (!led_set_output(led_cdev, value))
>   		return;
> -	}
>
>   	/* If brightness setting can sleep, delegate it to a work queue task */
>   	led_cdev->delayed_set_value = value;
> @@ -270,10 +285,7 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return 0;
>
> -	if (led_cdev->brightness_set_blocking)
> -		return led_cdev->brightness_set_blocking(led_cdev,
> -							 led_cdev->brightness);
> -	return -ENOTSUPP;
> +	return led_set_output_blocking(led_cdev, led_cdev->brightness);
>   }
>   EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>
>


-- 
Best regards,
Jacek Anaszewski
