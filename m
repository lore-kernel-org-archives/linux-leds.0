From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 5/5] leds: core: Use set_brightness_work for the blocking
 op
Date: Tue, 22 Sep 2015 11:03:50 +0300
Message-ID: <56010B66.6070700@linux.intel.com>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:6705 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757019AbbIVIDz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 04:03:55 -0400
In-Reply-To: <1442400464-27367-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com

Hi Jacek,

Jacek Anaszewski wrote:
> This patch makes LED core capable of setting brightness for drivers
> that implement brightness_set_blocking op. It removes from LED class
> drivers responsibility for using work queues on their own.
> 
> In order to achieve this set_brightness_delayed callback is being
> modified to call newly added __led_set_brightness helper instead of
> led_set_brightness_async.
> 
> led_set_brightness_async function didn't set brightness in an
> asynchronous way in all cases. It was mistakenly assuming that all
> LED subsystem drivers used work queue in their brightness_set op,
> whereas only half of them did that. Since it has no users now,
> it is being removed.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  drivers/leds/led-core.c |   22 +++++++++++++++++++++-
>  drivers/leds/leds.h     |   10 ----------
>  include/linux/leds.h    |    2 +-
>  3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index fe6c2df..d8649f1 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,6 +25,22 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>  LIST_HEAD(leds_list);
>  EXPORT_SYMBOL_GPL(leds_list);
>  
> +static int __led_set_brightness(struct led_classdev *led_cdev,
> +				enum led_brightness brightness)
> +{
> +	int ret = 0;
> +
> +	if (led_cdev->brightness_set)
> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
> +	else if (led_cdev->brightness_set_blocking)
> +		ret = led_cdev->brightness_set_blocking(led_cdev,

You can return here, and drop ret.

> +							led_cdev->brightness);
> +	else
> +		return -EINVAL;
> +
> +	return ret;
> +}
> +
>  static void led_timer_function(unsigned long data)
>  {
>  	struct led_classdev *led_cdev = (void *)data;
> @@ -83,6 +99,7 @@ static void set_brightness_delayed(struct work_struct *ws)
>  {
>  	struct led_classdev *led_cdev =
>  		container_of(ws, struct led_classdev, set_brightness_work);
> +	int ret;
>  
>  	if (led_cdev->flags & LED_BLINK_DISABLE) {
>  		led_cdev->delayed_set_value = LED_OFF;
> @@ -90,7 +107,10 @@ static void set_brightness_delayed(struct work_struct *ws)
>  		led_cdev->flags &= ~LED_BLINK_DISABLE;
>  	}
>  
> -	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
> +	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);

As __led_set_brightness() isn't used elsewhere and both are rather
simple functions, I'd just move the contents of that function here.

> +	if (ret < 0)
> +		dev_err(led_cdev->dev,
> +			"Setting an LED's brightness failed (%d)\n", ret);
>  }
>  
>  static void led_set_software_blink(struct led_classdev *led_cdev,
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index 11520eb..04b8e41 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -16,16 +16,6 @@
>  #include <linux/rwsem.h>
>  #include <linux/leds.h>
>  
> -static inline void led_set_brightness_async(struct led_classdev *led_cdev,
> -					enum led_brightness value)
> -{
> -	value = min(value, led_cdev->max_brightness);
> -	led_cdev->brightness = value;
> -
> -	if (!(led_cdev->flags & LED_SUSPENDED))
> -		led_cdev->brightness_set(led_cdev, value);
> -}
> -
>  static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
>  					enum led_brightness value)
>  {
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 9f850e6..ae3c178 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -155,7 +155,7 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
>   *
>   * Set an LED's brightness, and, if necessary, cancel the
>   * software blink timer that implements blinking when the
> - * hardware doesn't.
> + * hardware doesn't. This function is guaranteed not to sleep.
>   */
>  extern void led_set_brightness(struct led_classdev *led_cdev,
>  			       enum led_brightness brightness);
> 

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
