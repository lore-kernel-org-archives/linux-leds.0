From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 1/4] leds: class: Add new optional
 brightness_hw_changed attribute
Date: Wed, 25 Jan 2017 22:35:47 +0100
Message-ID: <2e3375d0-42fb-8123-06f9-df6877fb4264@gmail.com>
References: <20170125161130.5424-1-hdegoede@redhat.com>
 <20170125161130.5424-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170125161130.5424-2-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

H Hans,

Thanks for the patch. I have a few comments below.

On 01/25/2017 05:11 PM, Hans de Goede wrote:
> Some LEDs may have their brightness level changed autonomously
> (outside of kernel control) by hardware / firmware. This commit
> adds support for an optional brightness_hw_changed attribute to
> signal such changes to userspace (if a driver can detect them):
> 
> What:		/sys/class/leds/<led>/brightness_hw_changed
> Date:		January 2017
> KernelVersion:	4.11
> Description:
> 		Last hardware set brightness level for this LED. Some LEDs
> 		may be changed autonomously by hardware/firmware. Only LEDs
> 		where this happens and the driver can detect this, will
> 		have this file.
> 
> 		This file supports poll() to detect when the hardware
> 		changes the brightness.
> 
> 		Reading this file will return the last brightness level set
> 		by the hardware, this may be different from the current
> 		brightness.
> 
> Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
> their flags field and call led_classdev_notify_brightness_hw_changed()
> with the hardware set brightness when they detect a hardware / firmware
> triggered brightness change.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v6:
> -New patch in v6 of this set, replacing previous trigger based API
> ---
>  Documentation/ABI/testing/sysfs-class-led | 16 +++++++++
>  drivers/leds/led-class.c                  | 57 +++++++++++++++++++++++++++++++
>  include/linux/leds.h                      |  8 +++++
>  3 files changed, 81 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 491cdee..9f6e75d 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -23,6 +23,22 @@ Description:
>  		If the LED does not support different brightness levels, this
>  		should be 1.
>  
> +What:		/sys/class/leds/<led>/brightness_hw_changed
> +Date:		January 2017
> +KernelVersion:	4.11
> +Description:
> +		Last hardware set brightness level for this LED. Some LEDs
> +		may be changed autonomously by hardware/firmware. Only LEDs
> +		where this happens and the driver can detect this, will have
> +		this file.
> +
> +		This file supports poll() to detect when the hardware changes
> +		the brightness.
> +
> +		Reading this file will return the last brightness level set
> +		by the hardware, this may be different from the current
> +		brightness.

Let's return -ENODATA when no such an event occurred till the moment
of file reading.

> +
>  What:		/sys/class/leds/<led>/trigger
>  Date:		March 2006
>  KernelVersion:	2.6.17
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 326ee6e..27aa7b6 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -103,6 +103,52 @@ static const struct attribute_group *led_groups[] = {
>  	NULL,
>  };
>  
> +static ssize_t brightness_hw_changed_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
> +}
> +
> +static DEVICE_ATTR_RO(brightness_hw_changed);
> +
> +static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> +{
> +	struct device *dev = led_cdev->dev;
> +	int ret;
> +
> +	ret = device_create_file(dev, &dev_attr_brightness_hw_changed);
> +	if (ret) {
> +		dev_err(dev, "Error creating brightness_hw_changed\n");
> +		return ret;
> +	}
> +
> +	led_cdev->brightness_hw_changed_kn =
> +		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
> +	if (!led_cdev->brightness_hw_changed_kn) {
> +		dev_err(dev, "Error getting brightness_hw_changed kn\n");
> +		device_remove_file(dev, &dev_attr_brightness_hw_changed);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
> +{
> +	sysfs_put(led_cdev->brightness_hw_changed_kn);
> +	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
> +}
> +
> +void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
> +					       enum led_brightness brightness)
> +{
> +	led_cdev->brightness_hw_changed = brightness;
> +	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
> +}
> +EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
>
>  /**
>   * led_classdev_suspend - suspend an led_classdev.
>   * @led_cdev: the led_classdev to suspend.
> @@ -204,6 +250,14 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
>  				led_cdev->name, dev_name(led_cdev->dev));
>  
> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
> +		ret = led_add_brightness_hw_changed(led_cdev);
> +		if (ret) {
> +			device_unregister(led_cdev->dev);
> +			return ret;
> +		}
> +	}
> +
>  	led_cdev->work_flags = 0;
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	init_rwsem(&led_cdev->trigger_lock);
> @@ -256,6 +310,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>  
>  	flush_work(&led_cdev->set_brightness_work);
>  
> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
> +		led_remove_brightness_hw_changed(led_cdev);
> +
>  	device_unregister(led_cdev->dev);
>  
>  	down_write(&leds_list_lock);
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb53..aa452c8 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -13,6 +13,7 @@
>  #define __LINUX_LEDS_H_INCLUDED
>  
>  #include <linux/device.h>
> +#include <linux/kernfs.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
> @@ -35,6 +36,7 @@ struct led_classdev {
>  	const char		*name;
>  	enum led_brightness	 brightness;
>  	enum led_brightness	 max_brightness;
> +	enum led_brightness	 brightness_hw_changed;

Could we add Kconfig option for this feature and build the whole
infrastructure only if enabled?

>  	int			 flags;
>  
>  	/* Lower 16 bits reflect status */
> @@ -46,6 +48,7 @@ struct led_classdev {
>  #define LED_DEV_CAP_FLASH	(1 << 18)
>  #define LED_HW_PLUGGABLE	(1 << 19)
>  #define LED_PANIC_INDICATOR	(1 << 20)
> +#define LED_BRIGHT_HW_CHANGED	(1 << 21)
>  
>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>  	unsigned long		work_flags;
> @@ -99,6 +102,9 @@ struct led_classdev {
>  	struct work_struct	set_brightness_work;
>  	int			delayed_set_value;
>  
> +	/* For LEDs with brightness_hw_changed sysfs attribute */
> +	struct kernfs_node	*brightness_hw_changed_kn;
> +
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	/* Protects the trigger data below */
>  	struct rw_semaphore	 trigger_lock;
> @@ -123,6 +129,8 @@ extern void devm_led_classdev_unregister(struct device *parent,
>  					 struct led_classdev *led_cdev);
>  extern void led_classdev_suspend(struct led_classdev *led_cdev);
>  extern void led_classdev_resume(struct led_classdev *led_cdev);
> +extern void led_classdev_notify_brightness_hw_changed(
> +	struct led_classdev *led_cdev, enum led_brightness brightness);
>  
>  /**
>   * led_blink_set - set blinking with software fallback
> 

-- 
Best regards,
Jacek Anaszewski
