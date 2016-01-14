From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] led: core: RfC - add RGB LED handling to the core
Date: Thu, 14 Jan 2016 13:08:16 +0100
Message-ID: <56978FB0.4080700@samsung.com>
References: <5692BEB6.6040807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25278 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753719AbcANMIT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jan 2016 07:08:19 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0X00F7XZ1T8R60@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 14 Jan 2016 12:08:17 +0000 (GMT)
In-reply-to: <5692BEB6.6040807@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 01/10/2016 09:27 PM, Heiner Kallweit wrote:
> When playing with a ThingM Blink(1) USB RGB LED device I found that there
> are few drivers for RGB LED's spread across the kernel and each one
> implements the RGB functionality in its own way.
> Some examples:
> - drivers/hid/hid-thingm.c
> - drivers/usb/misc/usbled.c
> - drivers/leds/leds-bd2802.c
> - drivers/leds/leds-blinkm.c
> ...
> IMHO it would make sense to add generic RGB functionality to the LED core.
>
> Things I didn't like too much in other driver implementations:
> - one led_classdev per color or at least
> - one sysfs attribute per color
> Colors are not really independent therefore I'd prefer one led_classdev
> per RGB LED. Also userspace should be able to change the color with one
> call -> therefore only one sysfs attribute for the RGB values.
>
> Also the current brightness-related functionality should not be effected
> by the RGB extension.
>
> This patch is intended to demonstrate the idea of the extension. Most likely
> it's not ready yet for submission.
>
> Main idea is to base the effective RGB value on a combination of brightness
> and a scaled-to-max RGB value.
> The RGB-related callbacks are basically the same as for brightness.
> RGB functionally can be switched on with a new flag in the led_classdev.flags
> bitmap.
>
> Experimentally I changed the thingm driver to use this extension and it works
> quite well. As one result the driver could be very much simplified.
>
> Any feedback is appreciated.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/leds/led-class.c |  62 +++++++++++++++++++++++++++
>   drivers/leds/led-core.c  | 106 +++++++++++++++++++++++++++++++++++++++++++++++
>   drivers/leds/leds.h      |  12 ++++++
>   include/linux/leds.h     |  13 ++++++
>   4 files changed, 193 insertions(+)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 14139c3..5e4c2f2 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -64,6 +64,47 @@ unlock:
>   }
>   static DEVICE_ATTR_RW(brightness);
>
> +static ssize_t rgb_show(struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	u32 rgb_val;
> +
> +	mutex_lock(&led_cdev->led_access);
> +	led_update_rgb_val(led_cdev);
> +	rgb_val = led_get_rgb_val(led_cdev);
> +	mutex_unlock(&led_cdev->led_access);
> +
> +	return sprintf(buf, "0x%06x\n", rgb_val);
> +}
> +
> +static ssize_t rgb_store(struct device *dev, struct device_attribute *attr,
> +			 const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	unsigned long state;
> +	ssize_t ret;
> +
> +	mutex_lock(&led_cdev->led_access);
> +
> +	if (led_sysfs_is_disabled(led_cdev)) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	ret = kstrtoul(buf, 0, &state);
> +	if (ret)
> +		goto unlock;
> +
> +	led_set_rgb_val(led_cdev, state);

Please adhere to the current LED API naming style: led_rgb_set.

> +
> +	ret = size;
> +unlock:
> +	mutex_unlock(&led_cdev->led_access);
> +	return ret;
> +}
> +static DEVICE_ATTR_RW(rgb);
> +
>   static ssize_t max_brightness_show(struct device *dev,
>   		struct device_attribute *attr, char *buf)
>   {
> @@ -190,6 +231,16 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>   	char name[64];
>   	int ret;
>
> +	/* FLASH is not supported for RGB LEDs so far
> +	 * and RGB enforces max_brightness = LED_FULL.
> +	 * Initialize the color as white.
> +	 */
> +	if (led_isRGB(led_cdev)) {

Don't use camel case. Change it to led_is_rgb or check the flag
directly.

> +		led_cdev->flags &= ~LED_DEV_CAP_FLASH;

I'd rather check whether both FLASH and RGB flag are set and return
error in this case.

> +		led_cdev->max_brightness = LED_FULL;
> +		led_cdev->rgb_val = 0xffffff;
> +	}
> +
>   	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
>   	if (ret < 0)
>   		return ret;
> @@ -203,6 +254,14 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>   		dev_warn(parent, "Led %s renamed to %s due to name collision",
>   				led_cdev->name, dev_name(led_cdev->dev));
>
> +	if (led_isRGB(led_cdev)) {
> +		ret = device_create_file(led_cdev->dev, &dev_attr_rgb);

Please use led_cdev->groups for this. You can refer to 
drivers/leds/led-class-flash.c.

> +		if (ret) {
> +			device_unregister(led_cdev->dev);
> +			return ret;
> +		}
> +	}
> +
>   #ifdef CONFIG_LEDS_TRIGGERS
>   	init_rwsem(&led_cdev->trigger_lock);
>   #endif
> @@ -252,6 +311,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>
>   	flush_work(&led_cdev->set_brightness_work);
>
> +	if (led_isRGB(led_cdev))
> +		device_remove_file(led_cdev->dev, &dev_attr_rgb);
> +
>   	device_unregister(led_cdev->dev);
>
>   	down_write(&leds_list_lock);
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 19e1e60..6563bd3 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -25,6 +25,48 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>   LIST_HEAD(leds_list);
>   EXPORT_SYMBOL_GPL(leds_list);
>
> +static void led_set_rgb_raw(struct led_classdev *cdev, u32 rgb)
> +{
> +	u32 red_raw = (rgb >> 16) & 0xff;
> +	u32 green_raw = (rgb >> 8) & 0xff;
> +	u32 blue_raw = rgb & 0xff;
> +	u32 max_raw, red, green, blue;
> +
> +	max_raw = max(red_raw, green_raw);
> +	if (blue_raw > max_raw)
> +		max_raw = blue_raw;
> +
> +	if (!max_raw) {
> +		cdev->brightness = 0;
> +		cdev->rgb_val = 0;
> +		return;
> +	}
> +
> +	red = DIV_ROUND_CLOSEST(red_raw * LED_FULL, max_raw);
> +	green = DIV_ROUND_CLOSEST(green_raw * LED_FULL, max_raw);
> +	blue = DIV_ROUND_CLOSEST(blue_raw * LED_FULL, max_raw);
> +
> +	cdev->brightness = max_raw;
> +	cdev->rgb_val = (red << 16) + (green << 8) + blue;
> +}

I think that we shouldn't impose specific way of calculating brightness
depending on the rgb value set. We should just pass value from userspace
to the driver.

> +static u32 led_get_rgb_raw(struct led_classdev *cdev, bool delayed)
> +{
> +	u32 rgb = delayed ? cdev->delayed_rgb_value : cdev->rgb_val;
> +	u32 brightness = delayed ? cdev->delayed_set_value :
> +			 cdev->brightness;
> +	u32 red = (rgb >> 16) & 0xff;
> +	u32 green = (rgb >> 8) & 0xff;
> +	u32 blue = rgb & 0xff;
> +	u32 red_raw, green_raw, blue_raw;
> +
> +	red_raw = DIV_ROUND_CLOSEST(red * brightness, LED_FULL);
> +	green_raw = DIV_ROUND_CLOSEST(green * brightness, LED_FULL);
> +	blue_raw = DIV_ROUND_CLOSEST(blue * brightness, LED_FULL);
> +
> +	return (red_raw << 16) + (green_raw << 8) + blue_raw;
> +}
> +
>   static void led_timer_function(unsigned long data)
>   {
>   	struct led_classdev *led_cdev = (void *)data;
> @@ -91,6 +133,21 @@ static void set_brightness_delayed(struct work_struct *ws)
>   		led_cdev->flags &= ~LED_BLINK_DISABLE;
>   	}
>
> +	if (led_isRGB(led_cdev)) {
> +		u32 rgb = led_get_rgb_raw(led_cdev, true);
> +
> +		if (led_cdev->rgb_set)
> +			led_cdev->rgb_set(led_cdev, rgb);
> +		else if (led_cdev->rgb_set_blocking)
> +			ret = led_cdev->rgb_set_blocking(led_cdev, rgb);
> +		else
> +			ret = -EOPNOTSUPP;
> +		if (ret < 0)
> +			dev_err(led_cdev->dev,
> +				"Setting LED RGB value failed (%d)\n", ret);
> +		return;
> +	}
> +

Why this is needed? Could you share a use case?

>   	if (led_cdev->brightness_set)
>   		led_cdev->brightness_set(led_cdev, led_cdev->delayed_set_value);
>   	else if (led_cdev->brightness_set_blocking)
> @@ -229,9 +286,35 @@ void led_set_brightness(struct led_classdev *led_cdev,
>   }
>   EXPORT_SYMBOL_GPL(led_set_brightness);
>
> +void led_set_rgb_val(struct led_classdev *led_cdev, u32 rgb_val)
> +{
> +	if (!led_isRGB(led_cdev) || (led_cdev->flags & LED_SUSPENDED))
> +		return;
> +
> +	led_set_rgb_raw(led_cdev, rgb_val);
> +
> +	if (led_cdev->rgb_set) {
> +		led_cdev->rgb_set(led_cdev, rgb_val);
> +		return;
> +	}
> +
> +	/* If RGB setting can sleep, delegate it to a work queue task */
> +	led_cdev->delayed_set_value = led_cdev->brightness;
> +	led_cdev->delayed_rgb_value = led_cdev->rgb_val;
> +	schedule_work(&led_cdev->set_brightness_work);

I think that settings should be written to the device only in
the brightness_set op. We wouldn't need additional rgb op then.

> +}
> +EXPORT_SYMBOL_GPL(led_set_rgb_val);
> +
>   void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   			      enum led_brightness value)
>   {
> +	if (led_isRGB(led_cdev) && led_cdev->rgb_set) {
> +		u32 rgb = led_get_rgb_raw(led_cdev, false);
> +
> +		led_cdev->rgb_set(led_cdev, rgb);
> +		return;
> +	}
> +
>   	/* Use brightness_set op if available, it is guaranteed not to sleep */
>   	if (led_cdev->brightness_set) {
>   		led_cdev->brightness_set(led_cdev, value);
> @@ -240,6 +323,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
>
>   	/* If brightness setting can sleep, delegate it to a work queue task */
>   	led_cdev->delayed_set_value = value;
> +	led_cdev->delayed_rgb_value = led_cdev->rgb_val;
>   	schedule_work(&led_cdev->set_brightness_work);
>   }
>   EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
> @@ -267,6 +351,12 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
>   	if (led_cdev->flags & LED_SUSPENDED)
>   		return 0;
>
> +	if (led_isRGB(led_cdev) && led_cdev->rgb_set_blocking) {
> +		u32 rgb = led_get_rgb_raw(led_cdev, false);
> +
> +		return led_cdev->rgb_set_blocking(led_cdev, rgb);
> +	}
> +
>   	if (led_cdev->brightness_set_blocking)
>   		return led_cdev->brightness_set_blocking(led_cdev,
>   							 led_cdev->brightness);
> @@ -290,6 +380,22 @@ int led_update_brightness(struct led_classdev *led_cdev)
>   }
>   EXPORT_SYMBOL_GPL(led_update_brightness);
>
> +int led_update_rgb_val(struct led_classdev *led_cdev)
> +{
> +	s32 ret = 0;
> +
> +	if (led_isRGB(led_cdev) && led_cdev->rgb_get) {
> +		ret = led_cdev->rgb_get(led_cdev);
> +		if (ret >= 0) {
> +			led_set_rgb_raw(led_cdev, ret);
> +			return 0;
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(led_update_rgb_val);
> +
>   /* Caller must ensure led_cdev->led_access held */
>   void led_sysfs_disable(struct led_classdev *led_cdev)
>   {
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index db3f20d..c733777 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -16,17 +16,29 @@
>   #include <linux/rwsem.h>
>   #include <linux/leds.h>
>
> +static inline bool led_isRGB(struct led_classdev *led_cdev)
> +{
> +	return (led_cdev->flags & LED_RGB) != 0;
> +}
> +
>   static inline int led_get_brightness(struct led_classdev *led_cdev)
>   {
>   	return led_cdev->brightness;
>   }
>
> +static inline u32 led_get_rgb_val(struct led_classdev *led_cdev)
> +{
> +	return led_cdev->rgb_val;
> +}
> +
>   void led_init_core(struct led_classdev *led_cdev);
>   void led_stop_software_blink(struct led_classdev *led_cdev);
>   void led_set_brightness_nopm(struct led_classdev *led_cdev,
>   				enum led_brightness value);
>   void led_set_brightness_nosleep(struct led_classdev *led_cdev,
>   				enum led_brightness value);
> +void led_set_rgb_val(struct led_classdev *led_cdev, u32 rgb_val);
> +int led_update_rgb_val(struct led_classdev *led_cdev);
>
>   extern struct rw_semaphore leds_list_lock;
>   extern struct list_head leds_list;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 4429887..83d2912 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -35,6 +35,7 @@ struct led_classdev {
>   	const char		*name;
>   	enum led_brightness	 brightness;
>   	enum led_brightness	 max_brightness;
> +	u32			 rgb_val;
>   	int			 flags;
>
>   	/* Lower 16 bits reflect status */
> @@ -48,6 +49,7 @@ struct led_classdev {
>   #define LED_BLINK_DISABLE	(1 << 21)
>   #define LED_SYSFS_DISABLE	(1 << 22)
>   #define LED_DEV_CAP_FLASH	(1 << 23)
> +#define LED_RGB			(1 << 24)

Please rename it to LED_DEV_CAP_RGB.

>
>   	/* Set LED brightness level */
>   	/* Must not sleep. If no non-blocking version can be provided
> @@ -56,15 +58,25 @@ struct led_classdev {
>   	 */
>   	void		(*brightness_set)(struct led_classdev *led_cdev,
>   					  enum led_brightness brightness);
> +
> +	void		(*rgb_set)(struct led_classdev *led_cdev,
> +				   u32 rgb_val);

Without this everything would be much simpler.

If we wanted to change the color and intensity we would need to:
1. Set rgb (value only cached in the LED core)
2. Set brightness (write both brightness and rgb settings to the hw)

Current brightness can always be obtained with led_get_brightness in
case only rgb is to be set.

>   	/*
>   	 * Set LED brightness level immediately - it can block the caller for
>   	 * the time required for accessing a LED device register.
>   	 */
>   	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
>   				       enum led_brightness brightness);
> +
> +	int (*rgb_set_blocking)(struct led_classdev *led_cdev,
> +				u32 rgb_val);
> +

This is also not needed.

>   	/* Get LED brightness level */
>   	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
>
> +	/* Get LED RGB val */
> +	s32 (*rgb_get)(struct led_classdev *led_cdev);
> +

Ditto.

>   	/*
>   	 * Activate hardware accelerated blink, delays are in milliseconds
>   	 * and if both are zero then a sensible default should be chosen.
> @@ -90,6 +102,7 @@ struct led_classdev {
>
>   	struct work_struct	set_brightness_work;
>   	int			delayed_set_value;
> +	u32			delayed_rgb_value;

Ditto.

>
>   #ifdef CONFIG_LEDS_TRIGGERS
>   	/* Protects the trigger data below */
>


-- 
Best Regards,
Jacek Anaszewski
