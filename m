From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 1/4] leds: core: add generic support for color LED's
Date: Wed, 17 Feb 2016 13:33:21 +0100
Message-ID: <56C46891.3020301@samsung.com>
References: <56C37838.5030309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8359 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933517AbcBQMdZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Feb 2016 07:33:25 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2O00K6VYVMZ6A0@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 17 Feb 2016 12:33:22 +0000 (GMT)
In-reply-to: <56C37838.5030309@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Heiner,

Thanks for the update.

On 02/16/2016 08:27 PM, Heiner Kallweit wrote:
> Add generic support for color LED's.
>
> Basic idea is to use enum led_brightness also for the hue and saturation
> color components.This allows to implement the color extension w/o
> changes to struct led_classdev.
> A driver that wants to use this extension has to select LEDS_HSV
> in its Kconfig entry.

Let's make drivers depending on LEDS_HSV rather than selecting it.

>
> Flag LED_SET_HSV allows to specify that hue / saturation
> should be overridden even if the provided values are zero.
>
> Some examples for writing values to /sys/class/leds/<xx>/brightness:
> (now also hex notation can be used)
>
> 255 -> set full brightness and keep existing color if set
> 0 -> switch LED off but keep existing color so that it can be restored
>       if the LED is switched on again later
> 0x1000000 -> switch LED off and set also hue and saturation to 0
> 0x00ffff -> set full brightness, full saturation and set hue to 0 (red)

At first glance this description doesn't justify the need for
the flag. One could ask why caller can't decide about colour
similarly as they decide about brightness. It would be good to add
here some of reasoning from your replies to my review questions.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - move extension-specific code into a separate source file and
>    introduce config symbol LEDS_HSV for it
> - create separate patch for the extension to sysfs
> - use variable name led_cdev as in the rest if the core
> - rename to_hsv to led_validate_brightness
> - rename LED_BRIGHTNESS_SET_COLOR to LED_SET_HSV
> - introduce helper is_off for checking whether V part
>    of a HSV value is zero
> ---
>   drivers/leds/Kconfig        |  5 +++++
>   drivers/leds/Makefile       |  4 +++-
>   drivers/leds/led-core.c     | 17 ++++++++++-------
>   drivers/leds/led-hsv-core.c | 30 ++++++++++++++++++++++++++++++
>   drivers/leds/leds.h         | 17 +++++++++++++++++
>   include/linux/leds.h        |  9 +++++++++
>   6 files changed, 74 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/leds/led-hsv-core.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f940c2..01c0b35 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -29,6 +29,11 @@ config LEDS_CLASS_FLASH
>   	  for the flash related features of a LED device. It can be built
>   	  as a module.
>
> +config LEDS_HSV
> +	bool

Let's add help message too.

> +	depends on LEDS_CLASS
> +	default n
> +
>   comment "LED drivers"
>
>   config LEDS_88PM860X
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e9d5309..748d650 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -1,6 +1,8 @@
>
>   # LED Core
> -obj-$(CONFIG_NEW_LEDS)			+= led-core.o
> +obj-$(CONFIG_NEW_LEDS)			+= ledcore.o
> +ledcore-y				:= led-core.o
> +ledcore-$(CONFIG_LEDS_HSV)		+= led-hsv-core.o
>   obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
>   obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
>   obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 3495d5d..64b627a 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -62,7 +62,7 @@ static void led_timer_function(unsigned long data)
>   	}
>
>   	brightness = led_get_brightness(led_cdev);
> -	if (!brightness) {
> +	if (is_off(brightness)) {

s/is_off/led_is_off/

>   		/* Time to switch the LED on. */
>   		brightness = led_cdev->blink_brightness;
>   		delay = led_cdev->blink_delay_on;
> @@ -133,8 +133,8 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>   	if (current_brightness)
>   		led_cdev->blink_brightness = current_brightness;
>   	if (!led_cdev->blink_brightness)
> -		led_cdev->blink_brightness = led_cdev->max_brightness;
> -
> +		led_cdev->blink_brightness =
> +				led_validate_brightness(led_cdev, LED_FULL);

This function name doesn't fit here, since term "validation" usually
refers to validating user provided data.

led_confine_brightness() ?

And why LED_FULL and not led_cdev->max_brightness?


>   	led_cdev->blink_delay_on = delay_on;
>   	led_cdev->blink_delay_off = delay_off;
>
> @@ -225,6 +225,8 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>   void led_set_brightness(struct led_classdev *led_cdev,
>   			enum led_brightness brightness)
>   {
> +	if (!(led_cdev->flags & LED_DEV_CAP_HSV))
> +		brightness &= LED_BRIGHTNESS_MASK;

Why is this needed here?

>   	/*
>   	 * In case blinking is on delay brightness setting
>   	 * until the next timer tick.
> @@ -235,12 +237,13 @@ void led_set_brightness(struct led_classdev *led_cdev,
>   		 * work queue task to avoid problems in case we are called
>   		 * from hard irq context.
>   		 */
> -		if (brightness == LED_OFF) {
> +		if (is_off(brightness)) {
>   			led_cdev->flags |= LED_BLINK_DISABLE;
>   			schedule_work(&led_cdev->set_brightness_work);
>   		} else {
>   			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
> -			led_cdev->blink_brightness = brightness;
> +			led_cdev->blink_brightness =
> +				led_validate_brightness(led_cdev, brightness);
>   		}
>   		return;
>   	}
> @@ -265,7 +268,7 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>   				enum led_brightness value)
>   {
> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +	led_cdev->brightness = led_validate_brightness(led_cdev, value);
>
>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return;
> @@ -280,7 +283,7 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
>   	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>   		return -EBUSY;
>
> -	led_cdev->brightness = min(value, led_cdev->max_brightness);
> +	led_cdev->brightness = led_validate_brightness(led_cdev, value);
>
>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return 0;
> diff --git a/drivers/leds/led-hsv-core.c b/drivers/leds/led-hsv-core.c
> new file mode 100644
> index 0000000..3c31139
> --- /dev/null
> +++ b/drivers/leds/led-hsv-core.c
> @@ -0,0 +1,30 @@
> +/*
> + * LED Class Color Support
> + *
> + * Author: Heiner Kallweit <hkallweit1@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include "leds.h"
> +
> +#define LED_HUE_SAT_MASK	0x00ffff00
> +
> +enum led_brightness led_validate_brightness(struct led_classdev *led_cdev,
> +					    enum led_brightness value)
> +{
> +	enum led_brightness ret;

s/ret/brightness/

> +	/* Use LED_SET_HSV to set hue and saturation even if both are zero */
> +	if (value & LED_SET_HSV || value > LED_FULL)
> +		ret = value & LED_HUE_SAT_MASK;
> +	else
> +		ret = led_cdev->brightness & ~LED_BRIGHTNESS_MASK;
> +
> +	return ret | min(value & LED_BRIGHTNESS_MASK, led_cdev->max_brightness);
> +}
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index db3f20d..ac3f1be 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -16,17 +16,34 @@
>   #include <linux/rwsem.h>
>   #include <linux/leds.h>
>
> +#define LED_BRIGHTNESS_MASK	0x000000ff
> +
>   static inline int led_get_brightness(struct led_classdev *led_cdev)
>   {
>   	return led_cdev->brightness;
>   }
>
> +static inline bool is_off(enum led_brightness brightness)
> +{
> +	return (brightness & LED_BRIGHTNESS_MASK) == LED_OFF;
> +}
> +
>   void led_init_core(struct led_classdev *led_cdev);
>   void led_stop_software_blink(struct led_classdev *led_cdev);
>   void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   				enum led_brightness value);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>   				enum led_brightness value);
> +#if IS_ENABLED(CONFIG_LEDS_HSV)
> +enum led_brightness led_validate_brightness(struct led_classdev *led_cdev,
> +					    enum led_brightness value);
> +#else
> +static inline enum led_brightness led_validate_brightness(
> +		struct led_classdev *led_cdev, enum led_brightness value)
> +{
> +	return min(value, led_cdev->max_brightness);
> +}
> +#endif
 >
>   extern struct rw_semaphore leds_list_lock;
>   extern struct list_head leds_list;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index f203a8f..d72dfd9 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -29,8 +29,16 @@ enum led_brightness {
>   	LED_OFF		= 0,
>   	LED_HALF	= 127,
>   	LED_FULL	= 255,
> +	/*
> +	 * dummy enum value to make gcc use a 32 bit type for the enum
> +	 * even if compiled with -fshort-enums. This is needed for
> +	 * the enum to store hsv values.
> +	 */
> +	LED_SIZE_DUMMY	= 0xffffffff,
>   };

Don't refer to hsv here, since it also fixes generic LED class -
brightness values over 255 can be truncated after passing to
LED API when -fshort-enums is passed to gcc. I'd also change the
name to e.g. LED_FULL_32BIT.

Please split it to a separate patch. This fixes patch
d8082827d ("leds: make brightness type consistent across whole
subsystem"). You can also add "Fixes" tag, according to the
pattern presented in Documentation/SubmittingPatches. This way
it will make it able to be added to stable kernel versions.


> +#define LED_SET_HSV		BIT(24)
> +
>   struct led_classdev {
>   	const char		*name;
>   	enum led_brightness	 brightness;
> @@ -50,6 +58,7 @@ struct led_classdev {
>   #define LED_SYSFS_DISABLE	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
>   #define LED_HW_PLUGGABLE	(1 << 24)
> +#define LED_DEV_CAP_HSV		(1 << 25)
>
>   	/* Set LED brightness level
>   	 * Must not sleep. Use brightness_set_blocking for drivers
>


-- 
Best regards,
Jacek Anaszewski
