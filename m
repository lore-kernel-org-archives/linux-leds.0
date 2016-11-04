From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] leds: Add mutex protection in brightness_show()
Date: Fri, 4 Nov 2016 17:46:07 +0100
Message-ID: <9367cc2f-5ce9-0443-bb87-66198d437061@redhat.com>
References: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
 <CGME20161104115324epcas3p32bee0b0f57ae8d1141ded4fa1d1f2ae2@epcas3p3.samsung.com>
 <fb98c74d-137d-cffb-6d56-2f3aeed1a3d6@redhat.com>
 <9d28f3d3-1d3d-c670-a102-3e2698764fdd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49028 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932541AbcKDQqM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 4 Nov 2016 12:46:12 -0400
In-Reply-To: <9d28f3d3-1d3d-c670-a102-3e2698764fdd@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>

Hi,

On 04-11-16 17:06, Jacek Anaszewski wrote:
> Hi Hans,
>
> On 11/04/2016 12:53 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 04-11-16 08:52, Jacek Anaszewski wrote:
>>> Initially the claim about no need for lock in brightness_show()
>>> was valid as the function was just returning unchanged
>>> LED brightness. After the addition of led_update_brightness() this
>>> is no longer true, as the function can change the brightness if
>>> a LED class driver implements brightness_get op. It can lead to
>>> races between led_update_brightness() and led_set_brightness(),
>>> resulting in overwriting new brightness with the old one before
>>> the former is written to the device.
>>>
>>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Cc: Pavel Machek <pavel@ucw.cz>
>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>> ---
>>>  drivers/leds/led-class.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 731e4eb..0c2307b 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -30,8 +30,9 @@ static ssize_t brightness_show(struct device *dev,
>>>  {
>>>      struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>>
>>> -    /* no lock needed for this */
>>> +    mutex_lock(&led_cdev->led_access);
>>>      led_update_brightness(led_cdev);
>>> +    mutex_unlock(&led_cdev->led_access);
>>>
>>>      return sprintf(buf, "%u\n", led_cdev->brightness);
>>>  }
>>>
>>
>> I'm afraid that this fix is not enough, the led_access lock is only
>> held when the brightness is being updated through sysfs, not for
>> trigger / sw-blinking updates (which cannot take a mutex as they
>> may be called from non blocking contexts).
>>
>> We may need to consider to add a spinlock to the led_classdev and
>> always lock that when calling into the driver, except for when
>> the driver has a brightness_set_blocking callback. Which will need
>> special handling.
>
> led_update_brightness() currently has two users besides LED subsystem
> (at least grep reports those places):
>
> 1. v4l2-flash-led-class wrapper, for which led_access mutex was
>    introduced. Its purpose was to disable LED sysfs interface while
>    v4l2-flash wrapper takes over control of LED class device
>    (not saying that the mutex wasn't missing even without this
>     use case). Now I've realized that the call to
>     led_sysfs_is_disabled() is missing in this patch.
> 2. /drivers/platform/x86/thinkpad_acpi.c - it calls
>    led_update_brightness() on suspend
>
> I think that the best we can now do is to add
> lockdep_assert_held(&led_cdev->led_access) in led_update_brightness()
> and a description saying that the caller has to acquire led_access
> lock before calling it. Similarly as in case of
> led_sysfs_disable()/led_sysfs_disable().

The problem is not only callers of led_update_brightness() not holding
led_cdev->led_access, the problem is also callers of led_set_brightness
not holding led_cdev->led_access and they cannot take this lock because
they may be called from a non-blocking context.

Regards,

Hans
