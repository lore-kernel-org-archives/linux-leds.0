From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/4] leds: core: Add support for
 poll()ing the sysfs brightness attr for changes.
Date: Tue, 8 Nov 2016 13:31:23 +0100
Message-ID: <d6b88f5d-8458-9361-4800-d99c03bf72c0@redhat.com>
References: <CGME20161101133800eucas1p19df1b7f85ad751fcf98e60277b207296@eucas1p1.samsung.com>
	<20161101133748.7168-1-hdegoede@redhat.com>
	<5021470c-705b-6920-708e-dd5fca13951f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <5021470c-705b-6920-708e-dd5fca13951f-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 08-11-16 12:52, Jacek Anaszewski wrote:
> Hi Hans,
>
> I've tested it with userspace test application and it seems to work
> well both with hardware leds-aat1290 driver and drivers/leds/uleds.c.
>
> Applied to the for-next branch of linux-leds.git.

Great, thank you. Can you also add a stable branch / tag with this
commit which the platform/x86 maintainer can merge into his tree,
so that he can merge the platform/x86 driver changes which depend
up on the new led_notify_brightness_change() function ?

Regards,

Hans



>
> Thanks,
> Jacek Anaszewski
>
> On 11/01/2016 02:37 PM, Hans de Goede wrote:
>> Add support for userspace using poll() for POLL_PRI on the sysfs brightness
>> attr to watch for brightness changes.
>>
>> This commit adds a led_notify_brightness_change helper function for
>> waking up any poll() waiters; and calls this after any brightness changes
>> (after any led_classdev->brightness_set[_blocking] calls have completed).
>>
>> In some use-cases led hardware may autonomously change its brightness,
>> e.g. the keyboard backlight used on some laptops is controlled by a
>> hardwired (firmware handled) hotkey. led_notify_brightness_change is
>> exported for use by drivers which can detect such autonomous changes.
>>
>> This commit also updates the Documentation/ABI/testing/sysfs-class-led
>> documentation to document that userspace may now poll on the brightness
>> attribute.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>> Changes in v2:
>> -Wakeup / notify userspace on any brightness changes, not just on
>>  autonomous changes done by the hw
>> Changes in v3:
>> -Rebase on linux-leds/for-next
>> Changes in v4:
>> -No Changes
>> ---
>>  Documentation/ABI/testing/sysfs-class-led |  8 ++++++--
>>  drivers/leds/led-class.c                  |  9 +++++++++
>>  drivers/leds/led-core.c                   | 16 +++++++++++++++-
>>  include/linux/leds.h                      | 12 ++++++++++++
>>  4 files changed, 42 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
>> index 491cdee..0af5191 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led
>> +++ b/Documentation/ABI/testing/sysfs-class-led
>> @@ -1,12 +1,16 @@
>>  What:        /sys/class/leds/<led>/brightness
>> -Date:        March 2006
>> -KernelVersion:    2.6.17
>> +Date:        March 2006 (poll October 2016)
>> +KernelVersion:    2.6.17 (poll since 4.10)
>>  Contact:    Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
>>  Description:
>>          Set the brightness of the LED. Most LEDs don't
>>          have hardware brightness support, so will just be turned on for
>>          non-zero brightness settings. The value is between 0 and
>>          /sys/class/leds/<led>/max_brightness.
>> +        The file supports poll() to detect brightness changes, in
>> +        some cases the hardware / firmware may change the brightness
>> +        autonomously, poll() should be woken up in this case too,
>> +        but not all drivers may support this.
>>
>>          Writing 0 to this file clears active trigger.
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 731e4eb..c8d2d67 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -204,6 +204,14 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>>          dev_warn(parent, "Led %s renamed to %s due to name collision",
>>                  led_cdev->name, dev_name(led_cdev->dev));
>>
>> +    led_cdev->brightness_kn = sysfs_get_dirent(led_cdev->dev->kobj.sd,
>> +                           "brightness");
>> +    if (!led_cdev->brightness_kn) {
>> +        dev_err(led_cdev->dev, "Error getting brightness kernfs_node\n");
>> +        device_unregister(led_cdev->dev);
>> +        return -ENODEV;
>> +    }
>> +
>>  #ifdef CONFIG_LEDS_TRIGGERS
>>      init_rwsem(&led_cdev->trigger_lock);
>>  #endif
>> @@ -255,6 +263,7 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>>
>>      flush_work(&led_cdev->set_brightness_work);
>>
>> +    sysfs_put(led_cdev->brightness_kn);
>>      device_unregister(led_cdev->dev);
>>
>>      down_write(&leds_list_lock);
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 2d0c75a..af78279 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -33,16 +33,24 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
>>
>>      led_cdev->brightness_set(led_cdev, value);
>>
>> +    led_notify_brightness_change(led_cdev);
>> +
>>      return 0;
>>  }
>>
>>  static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
>>                       enum led_brightness value)
>>  {
>> +    int ret;
>> +
>>      if (!led_cdev->brightness_set_blocking)
>>          return -ENOTSUPP;
>>
>> -    return led_cdev->brightness_set_blocking(led_cdev, value);
>> +    ret = led_cdev->brightness_set_blocking(led_cdev, value);
>> +    if (ret >= 0)
>> +        led_notify_brightness_change(led_cdev);
>> +
>> +    return ret;
>>  }
>>
>>  static void led_timer_function(unsigned long data)
>> @@ -308,6 +316,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
>>  }
>>  EXPORT_SYMBOL_GPL(led_update_brightness);
>>
>> +void led_notify_brightness_change(struct led_classdev *led_cdev)
>> +{
>> +    sysfs_notify_dirent(led_cdev->brightness_kn);
>> +}
>> +EXPORT_SYMBOL_GPL(led_notify_brightness_change);
>> +
>>  /* Caller must ensure led_cdev->led_access held */
>>  void led_sysfs_disable(struct led_classdev *led_cdev)
>>  {
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index 52993de..f034c2d 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -13,6 +13,7 @@
>>  #define __LINUX_LEDS_H_INCLUDED
>>
>>  #include <linux/device.h>
>> +#include <linux/kernfs.h>
>>  #include <linux/list.h>
>>  #include <linux/mutex.h>
>>  #include <linux/rwsem.h>
>> @@ -93,6 +94,8 @@ struct led_classdev {
>>
>>      struct work_struct    set_brightness_work;
>>
>> +    struct kernfs_node    *brightness_kn;
>> +
>>  #ifdef CONFIG_LEDS_TRIGGERS
>>      /* Protects the trigger data below */
>>      struct rw_semaphore     trigger_lock;
>> @@ -192,6 +195,15 @@ extern int led_set_brightness_sync(struct led_classdev *led_cdev,
>>  extern int led_update_brightness(struct led_classdev *led_cdev);
>>
>>  /**
>> + * led_notify_brightness_change - Notify userspace of brightness changes
>> + * @led_cdev: the LED to do the notify on
>> + *
>> + * Let any users waiting for POLL_PRI on the led's brightness sysfs
>> + * atrribute know that the brightness has been changed.
>> + */
>> +extern void led_notify_brightness_change(struct led_classdev *led_cdev);
>> +
>> +/**
>>   * led_sysfs_disable - disable LED sysfs interface
>>   * @led_cdev: the LED to set
>>   *
>>
>

------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
