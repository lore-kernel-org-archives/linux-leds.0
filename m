From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 3/6] leds: triggers: Add support for read-only triggers
Date: Fri, 18 Nov 2016 11:49:07 +0100
Message-ID: <b7b4a51a-1d7f-3de8-8611-b1e54f8bccdc@samsung.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <CGME20161117222452epcas4p43b390da988281f298b01c5dae1425469@epcas4p4.samsung.com>
 <20161117222441.31464-3-hdegoede@redhat.com>
 <b44e1e67-d609-5876-b79b-c28d2093c50e@samsung.com>
 <d70ddd38-2994-c403-114f-ef05f0ddb8c4@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44999 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751180AbcKRKtO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Nov 2016 05:49:14 -0500
In-reply-to: <d70ddd38-2994-c403-114f-ef05f0ddb8c4@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 11/18/2016 10:04 AM, Hans de Goede wrote:
> Hi,
>
> On 18-11-16 09:52, Jacek Anaszewski wrote:
>> Hi Hans,
>>
>> Thanks for the new patch set.
>>
>> On 11/17/2016 11:24 PM, Hans de Goede wrote:
>>> In some cases an LED is controlled through a hardwired (taken care of
>>> in firmware outside of the kernels control) trigger.
>>>
>>> Add an LED_TRIGGER_READ_ONLY flag for this and disallow user-space
>>> changing the trigger when this flag is set.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v5:
>>> -This is a new patch in v5 of this patch-set
>>> ---
>>>  drivers/leds/led-class.c    | 2 +-
>>>  drivers/leds/led-triggers.c | 5 +++++
>>>  include/linux/leds.h        | 1 +
>>>  3 files changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 326ee6e..56f32cc 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -54,7 +54,7 @@ static ssize_t brightness_store(struct device *dev,
>>>      if (ret)
>>>          goto unlock;
>>>
>>> -    if (state == LED_OFF)
>>> +    if (state == LED_OFF && !(led_cdev->flags & LED_TRIGGER_READ_ONLY))
>>>          led_trigger_remove(led_cdev);
>>>      led_set_brightness(led_cdev, state);
>>>
>>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>>> index d2ed9c2..9669104 100644
>>> --- a/drivers/leds/led-triggers.c
>>> +++ b/drivers/leds/led-triggers.c
>>> @@ -37,6 +37,11 @@ ssize_t led_trigger_store(struct device *dev,
>>> struct device_attribute *attr,
>>>      struct led_trigger *trig;
>>>      int ret = count;
>>>
>>> +    if (led_cdev->flags & LED_TRIGGER_READ_ONLY) {
>>> +        dev_err(led_cdev->dev, "Error this led triggers is hardwired
>>> and cannot be changed\n");
>>> +        return -EINVAL;
>>
>> It means that after a trigger is once assigned to a LED class device
>> it will be impossible to deactivate it.
>
> No this flag is not set by the trigger code, it is set by the LED
> driver itself, to indicate there is a hardwired trigger.
>
>> Why not leaving it to the
>> user's decision whether they want to have hw brightness changes
>> notifications?
>
> The user cannot disable the hotkey -> keyboard-backlight-led link
> and the trigger represents this link.
>
> More over, if we allow changing the trigger, then writing 0
> to the brightness attribute will remove the trigger and make
> the device no longer poll-able, and writing 0 is exactly what
> the systemd-backlight service does when restoring backlight
> settings on boot and the kbd-backlight was off at the last
> shutdown.
>
> This again shows how poorly thought out the old "brightness"
> file API is, all systemd-backlight want to do is set the
> brightness to 0, but as a side effect it will also unlink the
> trigger, because writing 0 has 2 effects for one system call.
> Anyways this is not something we can fix.

So we will need to fix that. Maybe we should make it configurable.
E.g. a sysfs file could define whether writing 0 to brightness file
clears a trigger.

Trigger can already be disabled by writing "none" to triggers file.

>> This way we disable the possibility to set different
>> trigger like e.g. timer, after this one is set, which is not
>> a non-realistic scenario.
>
> Then we would have 2 triggers active, as the hotkey trigger
> is part of the firmware of the laptop and is never going away.

Having this type of hardware trigger reflected in the LED class
device configuration all the time is not something critical I think.
More important is leaving a possibility of applying other existing
sources of kernel events to the LED controller.

>> Generally it is quite odd to add a functionality that once
>> set is latched. If one will set such a trigger by mistake, then
>> system restart will be required to reset this (unless the driver
>> is built as a module).
>
> This is not under user-control, the is controlled by the
> LED driver by setting the flag before registering the LED and
> this is on purpose, because the trigger is hardwired.
>
> TL;DR:
>
> 1) We've decided to model the hotkey -> kbd-backlight control link as a
> trigger
> 2) This is hardwired in the laptop's firmware therefor the trigger cannot
>    be changed
> 3) Thus we need support for read-only triggers
>
> Regards,
>
> Hans
>
>
>
>>
>>> +    }
>>> +
>>>      mutex_lock(&led_cdev->led_access);
>>>
>>>      if (led_sysfs_is_disabled(led_cdev)) {
>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>> index 870b8c2..e076b74 100644
>>> --- a/include/linux/leds.h
>>> +++ b/include/linux/leds.h
>>> @@ -47,6 +47,7 @@ struct led_classdev {
>>>  #define LED_DEV_CAP_FLASH    (1 << 18)
>>>  #define LED_HW_PLUGGABLE    (1 << 19)
>>>  #define LED_PANIC_INDICATOR    (1 << 20)
>>> +#define LED_TRIGGER_READ_ONLY   (1 << 21)
>>>
>>>      /* set_brightness_work / blink_timer flags, atomic, private. */
>>>      unsigned long        work_flags;
>>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>


-- 
Best regards,
Jacek Anaszewski
