From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 1/3] leds: triggers: add support for RGB triggers
Date: Tue, 22 Mar 2016 23:06:38 +0100
Message-ID: <56F1C1EE.4080409@gmail.com>
References: <56E59FFE.8040203@googlemail.com> <56EAB407.60904@samsung.com>
 <56EB0B4D.6040809@gmail.com> <56EBFE3D.4000308@samsung.com>
 <56EDA471.1060801@gmail.com> <56F014DC.7060405@samsung.com>
 <56F0309A.8020801@gmail.com> <56F0FCAD.7060709@samsung.com>
 <56F130C5.4000500@gmail.com> <56F16C22.7090702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:32815 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbcCVWGw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 22 Mar 2016 18:06:52 -0400
In-Reply-To: <56F16C22.7090702@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Am 22.03.2016 um 17:00 schrieb Jacek Anaszewski:
> On 03/22/2016 12:47 PM, Heiner Kallweit wrote:
>> Am 22.03.2016 um 09:05 schrieb Jacek Anaszewski:
>>> On 03/21/2016 06:34 PM, Heiner Kallweit wrote:
>>>> Am 21.03.2016 um 16:35 schrieb Jacek Anaszewski:
>>>>> On 03/19/2016 08:11 PM, Heiner Kallweit wrote:
>>>>>> Am 18.03.2016 um 14:10 schrieb Jacek Anaszewski:
>>>>>>> On 03/17/2016 08:53 PM, Heiner Kallweit wrote:
>>>>>>>> Am 17.03.2016 um 14:41 schrieb Jacek Anaszewski:
>>>>>>>>> Hi Heiner,
>>>>>>>>>
>>>>>>>>> On 03/13/2016 06:14 PM, Heiner Kallweit wrote:
>>>>>>>>>> Add basic support for RGB triggers. Triggers with flag LED_TRIG_CAP_RGB
>>>>>>>>>> set are available to RGB LED devices only.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/leds/led-triggers.c | 15 ++++++++++++---
>>>>>>>>>>       include/linux/leds.h        |  3 +++
>>>>>>>>>>       2 files changed, 15 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>>>>>>>>>> index 2181581..3ccf88b 100644
>>>>>>>>>> --- a/drivers/leds/led-triggers.c
>>>>>>>>>> +++ b/drivers/leds/led-triggers.c
>>>>>>>>>> @@ -30,6 +30,13 @@ static LIST_HEAD(trigger_list);
>>>>>>>>>>
>>>>>>>>>>        /* Used by LED Class */
>>>>>>>>>>
>>>>>>>>>> +static inline bool led_trig_check_rgb(struct led_trigger *trig,
>>>>>>>>>> +                      struct led_classdev *led_cdev)
>>>>>>>>>> +{
>>>>>>>>>> +    return !(trig->flags & LED_TRIG_CAP_RGB) ||
>>>>>>>>>> +           led_cdev->flags & LED_DEV_CAP_RGB;
>>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>> Could you explain what is the purpose of this function?
>>>>>>>>> What actually do we want to check here?
>>>>>>>>>
>>>>>>>> Triggers using RGB functionality can't be used with non-RGB LED's.
>>>>>>>> This check checks for such unsupported combinations:
>>>>>>>> It returns false if the trigger uses RGB functionality but LED doesn't
>>>>>>>> support the RGB extension.
>>>>>>>
>>>>>>> We need more meaningful name for it. Maybe led_trigger_is_supported() ?
>>>>>>> And let's make it no-op for !CONFIG_LEDS_CLASS_RGB case.
>>>>>>>
>>>>>> OK, led_trigger_is_supported() is better.
>>>>>>
>>>>>> Making the function a no-op in the non-RGB case would have some impact:
>>>>>> We'd have to make sure that all public trigger functions are a de-facto no-op
>>>>>> for RGB triggers (at least register / unregister). Means we would need
>>>>>> something like this in each public trigger function:
>>>>>>
>>>>>> #if !IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
>>>>>>       if (trig->flags & LED_TRIG_CAP_RGB))
>>>>>>           return;
>>>>>> #endif
>>>>>>
>>>>>> I think this would add a lot of overhead and therefore IMHO it's better to
>>>>>> not make the check function a no-op.
>>>>>
>>>>> Wouldn't it suffice to make the no-op returning true?
>>>>> Preventing RGB trigger registration for non-RGB LED class configuration
>>>>> seems to be different thing, also to be considered.
>>>>>
>>>> No, it's not sufficient. Let's say the RGB extension is disabled and we have a RGB trigger.
>>>> The check is a no-op now (returns always true), therefore the RGB trigger would be displayed
>>>> in the list of available triggers also for all non-RGB LED's.
>>>
>>> If RGB trigger was made dependent on LED RGB class, then the related
>>> Kconfig symbol would remain undefined in !CONFIG_LEDS_CLASS_RGB case.
>>>
>> Making a RGB trigger dependent on LED RGB class would mean to enclose all calls to trigger
>> functions in the RGB trigger like this:
>> #if IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
>>     trigger_function()
>> #endif
> 
> You probably think about the case when we have two triggers in
> single module, like in the planned {rgb-}heartbeat case?
> 
> If so this is an argument for having RGB triggers in separate files.
> 
I mean the case of triggers implemented outside drivers/leds. There the trigger code
often is not separated from other functionality (e.g. drivers/tty/vt/keyboard.c)
and it's not directly under our (LED core) control.

>> This would apply to led_trigger_(un)register, led_trigger_event, led_trigger_blink, etc.
>> And I think it wouldn't be too nice to force other kernel modules wanting to implement
>> a RGB trigger to add these conditional compile statements.
> 
> What other modules do you have on mind? LED triggers are implemented in
> their own files.
> 
That's true for the triggers under drivers/leds/trigger, but not necessarily for triggers
implemented in other parts of the kernel.

>> Alternatively, as mentioned before, we would have to add this to all public trigger functions:
>>
>> #if !IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
>>     if (trig->flags & LED_TRIG_CAP_RGB))
>>         return;
>> #endif
>> I think this would add significant overhead w/o gaining really something.
>>
>>>> We could maximum remove the "|| led_cdev->flags & LED_DEV_CAP_RGB" from the check if
>>>> the RGB extension is disabled. But it's open whether this minimal gain in a non-critical
>>>> code path justifies this.
>>>>
>>>>>>>>>>       ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>>>>>>>>>>               const char *buf, size_t count)
>>>>>>>>>>       {
>>>>>>>>>> @@ -52,12 +59,12 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>>>>>>>>>>           down_read(&triggers_list_lock);
>>>>>>>>>>           list_for_each_entry(trig, &trigger_list, next_trig) {
>>>>>>>>>>               if (sysfs_streq(buf, trig->name)) {
>>>>>>>>>> +            if (!led_trig_check_rgb(trig, led_cdev))
>>>>>>>>>> +                break;
>>>>>>>>
>>>>>>>> Check for the case that userspace wants to set a RGB trigger for a non-RGB LED via sysfs.
>>>>>>>>
>>>>>>>>>>                   down_write(&led_cdev->trigger_lock);
>>>>>>>>>>                   led_trigger_set(led_cdev, trig);
>>>>>>>>>>                   up_write(&led_cdev->trigger_lock);
>>>>>>>>>> -
>>>>>>>>>> -            up_read(&triggers_list_lock);
>>>>>>>>>> -            goto unlock;
>>>>>>>>>> +            break;
>>>>>>>
>>>>>>> This seems to be an unrelated cleanup. Please submit it separately.
>>>>>>>
>>>>>> OK
>>>>>>
>>>>>>>>>>               }
>>>>>>>>>>           }
>>>>>>>>>>           up_read(&triggers_list_lock);
>>>>>>>>>> @@ -84,6 +91,8 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
>>>>>>>>>>               len += sprintf(buf+len, "none ");
>>>>>>>>>>
>>>>>>>>>>           list_for_each_entry(trig, &trigger_list, next_trig) {
>>>>>>>>>> +        if (!led_trig_check_rgb(trig, led_cdev))
>>>>>>>>>> +            continue;
>>>>>>>>
>>>>>>>> Omit RGB triggers when listing the available triggers for a non-RGB LED via sysfs.
>>>>>>>>
>>>>>>>>>>               if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
>>>>>>>>>>                                   trig->name))
>>>>>>>>>>                   len += sprintf(buf+len, "[%s] ", trig->name);
>>>>>>>>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>>>>>>>> index 58e22e6..07eb074 100644
>>>>>>>>>> --- a/include/linux/leds.h
>>>>>>>>>> +++ b/include/linux/leds.h
>>>>>>>>>> @@ -248,6 +248,9 @@ enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
>>>>>>>>>>       struct led_trigger {
>>>>>>>>>>           /* Trigger Properties */
>>>>>>>>>>           const char     *name;
>>>>>>>>>> +    u8        flags;
>>>>>>>>>> +#define LED_TRIG_CAP_RGB    BIT(0)
>>>>>>>>>> +
>>>>>>>>>>           void        (*activate)(struct led_classdev *led_cdev);
>>>>>>>>>>           void        (*deactivate)(struct led_classdev *led_cdev);
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>>
> 
> 
