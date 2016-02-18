From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: core: add helpers for calling
 brightness_set(_blocking)
Date: Thu, 18 Feb 2016 12:01:31 +0100
Message-ID: <56C5A48B.5070503@samsung.com>
References: <56C376D4.4080808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41431 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425249AbcBRLBe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2016 06:01:34 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2Q00KU4PAKTE50@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 18 Feb 2016 11:01:32 +0000 (GMT)
In-reply-to: <56C376D4.4080808@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

On 02/16/2016 08:21 PM, Heiner Kallweit wrote:
> Add helpers for calling brightness_set(_blocking) allowing to
> simplify the code and make it better readable.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - changed helper names
> ---
>   drivers/leds/led-core.c | 40 ++++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ad684b6..3495d5d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,6 +25,26 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>
> +static int __led_set_brightness(struct led_classdev *led_cdev,
> +				enum led_brightness value)
> +{
> +	if (!led_cdev->brightness_set)
> +		return -ENOTSUPP;
> +
> +	led_cdev->brightness_set(led_cdev, value);
> +
> +	return 0;
> +}
> +
> +static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
> +					 enum led_brightness value)
> +{
> +	if (!led_cdev->brightness_set_blocking)
> +		return -ENOTSUPP;
> +
> +	return led_cdev->brightness_set_blocking(led_cdev, value);
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
> +	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
> +	if (ret == -ENOTSUPP)
> +		ret = __led_set_brightness_blocking(led_cdev,
> +					led_cdev->delayed_set_value);
>   	if (ret < 0 &&
>   	    /* LED HW might have been unplugged, therefore don't warn */
>   	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
> @@ -236,10 +253,8 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   			      enum led_brightness value)
>   {
>   	/* Use brightness_set op if available, it is guaranteed not to sleep */
> -	if (led_cdev->brightness_set) {
> -		led_cdev->brightness_set(led_cdev, value);
> +	if (!__led_set_brightness(led_cdev, value))
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
> +	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
>   }
>   EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>
>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
