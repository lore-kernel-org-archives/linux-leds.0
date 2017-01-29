From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7] leds: class: Add new optional brightness_hw_changed
 attribute
Date: Sun, 29 Jan 2017 14:21:25 +0100
Message-ID: <410b20ee-a867-a21c-2d7d-3ab0a43a6957@redhat.com>
References: <20170127074135.3748-1-hdegoede@redhat.com>
 <20170127115840.GA8512@amd> <9573330a-5037-388f-be03-dfd421c5cba5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <9573330a-5037-388f-be03-dfd421c5cba5@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 01/29/2017 12:48 PM, Jacek Anaszewski wrote:
> Hi Hans,
>
> Thanks for addressing my remarks.
> While testing the feature I came across one issue, please refer below.
>
> On 01/27/2017 12:58 PM, Pavel Machek wrote:
>> On Fri 2017-01-27 08:41:35, Hans de Goede wrote:
>>> Some LEDs may have their brightness level changed autonomously
>>> (outside of kernel control) by hardware / firmware. This commit
>>> adds support for an optional brightness_hw_changed attribute to
>>> signal such changes to userspace (if a driver can detect them):
>>>
>>> What:		/sys/class/leds/<led>/brightness_hw_changed
>>> Date:		January 2017
>>> KernelVersion:	4.11
>>> Description:
>>> 		Last hardware set brightness level for this LED. Some LEDs
>>> 		may be changed autonomously by hardware/firmware. Only LEDs
>>> 		where this happens and the driver can detect this, will
>>> 		have this file.
>>>
>>> 		This file supports poll() to detect when the hardware
>>> 		changes the brightness.
>>>
>>> 		Reading this file will return the last brightness level set
>>> 		by the hardware, this may be different from the current
>>> 		brightness.
>>>
>>> Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
>>> their flags field and call led_classdev_notify_brightness_hw_changed()
>>> with the hardware set brightness when they detect a hardware / firmware
>>> triggered brightness change.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>>> ---
>>> Changes in v6:
>>> -New patch in v6 of this set, replacing previous trigger based API
>>> Changes in v7
>>> -Return -ENODATA when brightness_hw_changed gets read before any
>>>  hw brightness change event as happened
>>> -Make the hw_brightness_changed attr presence configurable through Kconfig
>>> ---
>>>  Documentation/ABI/testing/sysfs-class-led | 17 +++++++
>>>  drivers/leds/Kconfig                      |  9 ++++
>>>  drivers/leds/led-class.c                  | 73 +++++++++++++++++++++++++++++++
>>>  include/linux/leds.h                      | 15 +++++++
>>>  4 files changed, 114 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
>>> index 491cdee..5f67f7a 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-led
>>> +++ b/Documentation/ABI/testing/sysfs-class-led
>>> @@ -23,6 +23,23 @@ Description:
>>>  		If the LED does not support different brightness levels, this
>>>  		should be 1.
>>>
>>> +What:		/sys/class/leds/<led>/brightness_hw_changed
>>> +Date:		January 2017
>>> +KernelVersion:	4.11
>>> +Description:
>>> +		Last hardware set brightness level for this LED. Some LEDs
>>> +		may be changed autonomously by hardware/firmware. Only LEDs
>>> +		where this happens and the driver can detect this, will have
>>> +		this file.
>>> +
>>> +		This file supports poll() to detect when the hardware changes
>>> +		the brightness.
>>> +
>>> +		Reading this file will return the last brightness level set
>>> +		by the hardware, this may be different from the current
>>> +		brightness. Reading this file when no hw brightness change
>>> +		event has happened will return an ENODATA error.
>>> +
>>>  What:		/sys/class/leds/<led>/trigger
>>>  Date:		March 2006
>>>  KernelVersion:	2.6.17
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index c621cbb..275f467 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -29,6 +29,15 @@ config LEDS_CLASS_FLASH
>>>  	  for the flash related features of a LED device. It can be built
>>>  	  as a module.
>>>
>>> +config LEDS_BRIGHTNESS_HW_CHANGED
>>> +	bool "LED Class brightness_hw_changed attribute support"
>>> +	depends on LEDS_CLASS
>>> +	help
>>> +	  This option enables support for the brightness_hw_changed attribute
>>> +	  for led sysfs class devices under /sys/class/leds.
>>> +
>>> +	  See Documentation/ABI/testing/sysfs-class-led for details.
>>> +
>>>  comment "LED drivers"
>>>
>>>  config LEDS_88PM860X
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 326ee6e..2f8c843 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -103,6 +103,65 @@ static const struct attribute_group *led_groups[] = {
>>>  	NULL,
>>>  };
>>>
>>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>> +static ssize_t brightness_hw_changed_show(struct device *dev,
>>> +		struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>> +
>>> +	if (led_cdev->brightness_hw_changed == -1)
>>> +		return -ENODATA;
>>> +
>>> +	return sprintf(buf, "%u\n", led_cdev->brightness_hw_changed);
>>> +}
>>> +
>>> +static DEVICE_ATTR_RO(brightness_hw_changed);
>>> +
>>> +static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
>>> +{
>>> +	struct device *dev = led_cdev->dev;
>>> +	int ret;
>>> +
>>> +	ret = device_create_file(dev, &dev_attr_brightness_hw_changed);
>>> +	if (ret) {
>>> +		dev_err(dev, "Error creating brightness_hw_changed\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	led_cdev->brightness_hw_changed_kn =
>>> +		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
>>> +	if (!led_cdev->brightness_hw_changed_kn) {
>>> +		dev_err(dev, "Error getting brightness_hw_changed kn\n");
>>> +		device_remove_file(dev, &dev_attr_brightness_hw_changed);
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
>>> +{
>>> +	sysfs_put(led_cdev->brightness_hw_changed_kn);
>>> +	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
>>> +}
>>> +void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
>>> +					       enum led_brightness brightness)
>>> +{
>>> +	led_cdev->brightness_hw_changed = brightness;
>>> +	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
>
> If you forget to set LED_BRIGHT_HW_CHANGED in the driver calling this
> API, then you get NULL pointer dereference here due to uninitialized
> led_cdev->brightness_hw_changed_kn.
>
> In order to avoid that let's make the
> led_classdev_notify_brightness_hw_changed() return int and return
> -EINVAL from it if LED_BRIGHT_HW_CHANGED flag is not set.

That requires adding error checking to all callers, since this
error will only happen if there is a bug in the kernel / driver
code I've instead done this:

void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_cdev,
                                                enum led_brightness brightness)
{
         if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
                 return;

         led_cdev->brightness_hw_changed = brightness;
         sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
}

With avoids the need for error checks in all callers, while still catching
the error.

> Moreover, Documentation/leds/leds-class.txt should provide
> information that the flag should be set to make the
> brightness_hw_changed available. Currently only the commit message
> seems to mention that.

Ok, I will update Documentation/leds/leds-class.txt for v8.

Regards,

Hans


>
>>> +#else
>>> +static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
>>> +{
>>> +	return 0;
>>> +}
>>> +static void led_remove_brightness_hw_changed(struct led_classdev *led_cdev)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>  /**
>>>   * led_classdev_suspend - suspend an led_classdev.
>>>   * @led_cdev: the led_classdev to suspend.
>>> @@ -204,10 +263,21 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>>  		dev_warn(parent, "Led %s renamed to %s due to name collision",
>>>  				led_cdev->name, dev_name(led_cdev->dev));
>>>
>>> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>>> +		ret = led_add_brightness_hw_changed(led_cdev);
>>> +		if (ret) {
>>> +			device_unregister(led_cdev->dev);
>>> +			return ret;
>>> +		}
>>> +	}
>>> +
>>>  	led_cdev->work_flags = 0;
>>>  #ifdef CONFIG_LEDS_TRIGGERS
>>>  	init_rwsem(&led_cdev->trigger_lock);
>>>  #endif
>>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>> +	led_cdev->brightness_hw_changed = -1;
>>> +#endif
>>>  	mutex_init(&led_cdev->led_access);
>>>  	/* add to the list of leds */
>>>  	down_write(&leds_list_lock);
>>> @@ -256,6 +326,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>>>
>>>  	flush_work(&led_cdev->set_brightness_work);
>>>
>>> +	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
>>> +		led_remove_brightness_hw_changed(led_cdev);
>>> +
>>>  	device_unregister(led_cdev->dev);
>>>
>>>  	down_write(&leds_list_lock);
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index 569cb53..c771153 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -13,6 +13,7 @@
>>>  #define __LINUX_LEDS_H_INCLUDED
>>>
>>>  #include <linux/device.h>
>>> +#include <linux/kernfs.h>
>>>  #include <linux/list.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/rwsem.h>
>>> @@ -46,6 +47,7 @@ struct led_classdev {
>>>  #define LED_DEV_CAP_FLASH	(1 << 18)
>>>  #define LED_HW_PLUGGABLE	(1 << 19)
>>>  #define LED_PANIC_INDICATOR	(1 << 20)
>>> +#define LED_BRIGHT_HW_CHANGED	(1 << 21)
>>>
>>>  	/* set_brightness_work / blink_timer flags, atomic, private. */
>>>  	unsigned long		work_flags;
>>> @@ -110,6 +112,11 @@ struct led_classdev {
>>>  	bool			activated;
>>>  #endif
>>>
>>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>> +	int			 brightness_hw_changed;
>>> +	struct kernfs_node	*brightness_hw_changed_kn;
>>> +#endif
>>> +
>>>  	/* Ensures consistent access to the LED Flash Class device */
>>>  	struct mutex		led_access;
>>>  };
>>> @@ -422,4 +429,12 @@ static inline void ledtrig_cpu(enum cpu_led_event evt)
>>>  }
>>>  #endif
>>>
>>> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>>> +extern void led_classdev_notify_brightness_hw_changed(
>>> +	struct led_classdev *led_cdev, enum led_brightness brightness);
>>> +#else
>>> +static inline void led_classdev_notify_brightness_hw_changed(
>>> +	struct led_classdev *led_cdev, enum led_brightness brightness) { }
>>> +#endif
>>> +
>>>  #endif		/* __LINUX_LEDS_H_INCLUDED */
>>
>
