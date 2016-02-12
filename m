From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] leds: core: add generic support for color LED's
Date: Fri, 12 Feb 2016 17:12:16 +0100
Message-ID: <56BE0460.4090909@samsung.com>
References: <56B71C6D.7080703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61492 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822AbcBLQMS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 12 Feb 2016 11:12:18 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2F00H6NZOHNS50@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 12 Feb 2016 16:12:17 +0000 (GMT)
In-reply-to: <56B71C6D.7080703@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

Thanks for the patches. Generally, I'd like these changes had
minimum impact on LED core. This code is not required by existing
LED class devices, so we should make it disabled by default and turn
it on only for drivers that will use it.

Creating a wrapper would be too much, as you're not adding any new
sysfs attributes, but I think that we could add led-hsv-core.c.

Please also create a patch adding a description of RGB LEDs handling
to the Documentation/leds/leds-class.txt. It will serve as a
set of requirements that we could refer to during review.

Please find my other comments in the code.

On 02/07/2016 11:29 AM, Heiner Kallweit wrote:
> Add generic support for color LED's.
>
> Basic idea is to use enum led_brightness also for the hue and saturation
> color components.This allows to implement the color extension w/o
> changes to struct led_classdev.
>
> Flag LED_BRIGHTNESS_SET_COLOR BIT(24) allows to specify that hue /
> saturation should be overridden even if the provided values are zero.
>
> Some examples for writing values to /sys/class/leds/<xx>/brightness:
> (now also hex notation can be used)
>
> 255 -> set full brightness and keep existing color if set
> 0 -> switch LED off but keep existing color so that it can be restored
>       if the LED is switched on again later
> 0x1000000 -> switch LED off and set also hue and saturation to 0
>
> 0x00ffff -> set full brightness, full saturation and set hue to 0 (red)
>
> Setting delayed_set_value in case of LED_BLINK_DISABLE was moved
> to allow using the color information if provided by the caller
> of led_set_brightness.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-class.c |  7 +++++--
>   drivers/leds/led-core.c  | 41 ++++++++++++++++++++++++++++++++++-------
>   include/linux/leds.h     |  4 ++++
>   3 files changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index aa84e5b..18a4558 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -32,7 +32,10 @@ static ssize_t brightness_show(struct device *dev,
>   	/* no lock needed for this */
>   	led_update_brightness(led_cdev);
>
> -	return sprintf(buf, "%u\n", led_cdev->brightness);
> +	if (led_cdev->brightness > LED_FULL)
> +		return sprintf(buf, "%#06x\n", led_cdev->brightness);
> +	else
> +		return sprintf(buf, "%u\n", led_cdev->brightness);
>   }
>
>   static ssize_t brightness_store(struct device *dev,
> @@ -49,7 +52,7 @@ static ssize_t brightness_store(struct device *dev,
>   		goto unlock;
>   	}
>
> -	ret = kstrtoul(buf, 10, &state);
> +	ret = kstrtoul(buf, 0, &state);

Please split this change to the separate patch.

>   	if (ret)
>   		goto unlock;
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index c29e4c9..798e31e 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -19,12 +19,32 @@
>   #include <linux/rwsem.h>
>   #include "leds.h"
>
> +#define LED_HUE_SAT_MASK	0x00ffff00
> +#define LED_BRIGHTNESS_MASK	0x000000ff
> +
>   DECLARE_RWSEM(leds_list_lock);
>   EXPORT_SYMBOL_GPL(leds_list_lock);
>
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>
> +static inline enum led_brightness to_hsv(struct led_classdev *cdev,


s/cdev/led_cdev/

Please adhere to the existing naming convention.

> +					 enum led_brightness value)
> +{
> +	enum led_brightness ret;
> +
> +	/*
> +	 * if LED_BRIGHTNESS_SET_COLOR is set set hue and
> +	 * saturation even if both are zero
> +	 */
> +	if (value & LED_BRIGHTNESS_SET_COLOR || value > LED_FULL)
> +		ret = value & LED_HUE_SAT_MASK;
> +	else
> +		ret = cdev->brightness & ~LED_BRIGHTNESS_MASK;
> +
> +	return ret | min(value & LED_BRIGHTNESS_MASK, cdev->max_brightness);
> +}
> +

This could be placed in led-hsv-core.c.

>   static int led_set_output(struct led_classdev *cdev,
>   			  enum led_brightness value)
>   {
> @@ -62,7 +82,7 @@ static void led_timer_function(unsigned long data)
>   	}
>
>   	brightness = led_get_brightness(led_cdev);
> -	if (!brightness) {
> +	if (!(brightness & LED_BRIGHTNESS_MASK)) {
>   		/* Time to switch the LED on. */
>   		brightness = led_cdev->blink_brightness;
>   		delay = led_cdev->blink_delay_on;
> @@ -106,7 +126,6 @@ static void set_brightness_delayed(struct work_struct *ws)
>   	int ret = 0;
>
>   	if (led_cdev->flags & LED_BLINK_DISABLE) {
> -		led_cdev->delayed_set_value = LED_OFF;
>   		led_stop_software_blink(led_cdev);
>   		led_cdev->flags &= ~LED_BLINK_DISABLE;
>   	}
> @@ -133,7 +152,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>   	if (current_brightness)
>   		led_cdev->blink_brightness = current_brightness;
>   	if (!led_cdev->blink_brightness)
> -		led_cdev->blink_brightness = led_cdev->max_brightness;
> +		led_cdev->blink_brightness = to_hsv(led_cdev, LED_FULL);
>
>   	led_cdev->blink_delay_on = delay_on;
>   	led_cdev->blink_delay_off = delay_off;
> @@ -225,6 +244,8 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>   void led_set_brightness(struct led_classdev *led_cdev,
>   			enum led_brightness brightness)
>   {
> +	if (!(led_cdev->flags & LED_DEV_CAP_COLOR))
> +		brightness &= LED_BRIGHTNESS_MASK;
>   	/*
>   	 * In case blinking is on delay brightness setting
>   	 * until the next timer tick.
> @@ -235,12 +256,15 @@ void led_set_brightness(struct led_classdev *led_cdev,
>   		 * work queue task to avoid problems in case we are called
>   		 * from hard irq context.
>   		 */
> -		if (brightness == LED_OFF) {
> +		if ((brightness & LED_BRIGHTNESS_MASK) == LED_OFF) {
>   			led_cdev->flags |= LED_BLINK_DISABLE;
> +			led_cdev->delayed_set_value =
> +					to_hsv(led_cdev, brightness);
>   			schedule_work(&led_cdev->set_brightness_work);
>   		} else {
>   			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
> -			led_cdev->blink_brightness = brightness;
> +			led_cdev->blink_brightness =
> +					to_hsv(led_cdev, brightness);
>   		}
>   		return;
>   	}

It would be cleaner if we provided a separate blink_timer callback
in led-hsv-core.c. Relevant version could be chosen in led_init_core()
basing on the LED_DEV_CAP_COLOR flag state.

> @@ -265,7 +289,7 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>   				enum led_brightness value)
>   {
> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +	led_cdev->brightness = to_hsv(led_cdev, value);

This is misleading. One could wonder what hsv has in common
with their monochromatic LED. I propose to add a helper that
will choose suitable method of constraining brightness value
depending on whether LED_DEV_CAP_COLOR flag is set.

>
>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return;
> @@ -280,7 +304,10 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
>   	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>   		return -EBUSY;
>
> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +	if (!(led_cdev->flags & LED_DEV_CAP_COLOR))
> +		value &= LED_BRIGHTNESS_MASK;
> +
> +	led_cdev->brightness = to_hsv(led_cdev, value);

Ditto.

>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return 0;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index f203a8f..8e7db72 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -50,6 +50,7 @@ struct led_classdev {
>   #define LED_SYSFS_DISABLE	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
>   #define LED_HW_PLUGGABLE	(1 << 24)
> +#define LED_DEV_CAP_COLOR	(1 << 25)
>
>   	/* Set LED brightness level
>   	 * Must not sleep. Use brightness_set_blocking for drivers
> @@ -153,6 +154,9 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
>   				  unsigned long *delay_on,
>   				  unsigned long *delay_off,
>   				  int invert);
> +
> +#define LED_BRIGHTNESS_SET_COLOR	BIT(24)
> +

Please drop BRIGHTNESS segment.

>   /**
>    * led_set_brightness - set LED brightness
>    * @led_cdev: the LED to set
>


-- 
Best regards,
Jacek Anaszewski
