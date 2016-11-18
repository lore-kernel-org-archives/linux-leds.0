From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 18 Nov 2016 19:47:32 +0100
Message-ID: <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <CGME20161117222450epcas2p28613abfdc50444385e6849315754f51c@epcas2p2.samsung.com>
 <20161117222441.31464-2-hdegoede@redhat.com>
 <af5a6b68-310d-85ec-16db-5c9036f38ba5@samsung.com>
 <39fdea9c-b2de-7fb6-3acf-0ea1de73ea75@redhat.com>
 <92a919a7-6849-60b6-d018-f9e983e7a2f5@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44524 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752088AbcKRSrh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Nov 2016 13:47:37 -0500
In-Reply-To: <92a919a7-6849-60b6-d018-f9e983e7a2f5@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

HI,

On 18-11-16 17:03, Jacek Anaszewski wrote:
> Hi,
>
> On 11/18/2016 10:07 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 18-11-16 09:55, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
>>> Thanks for the patch.
>>>
>>> I think we need less generic trigger name.
>>> With present name we pretend that all kbd-backlight controllers
>>> can change LED brightness autonomously.
>>>
>>> How about kbd-backlight-pollable ?
>>
>> This is a trigger to control kbd-backlights, in the
>> current use-case the brightness change is already done
>> by the firmware, hence the set_brightness argument to
>> ledtrig_kbd_backlight(), so that we can avoid setting
>> it again.
>>
>> But I can see future cases where we do want to have some
>> event (e.g. a wmi hotkey event on a laptop where the firmware
>> does not do the adjustment automatically) which does
>> lead to actually updating the brightness.
>>
>> So I decided to go with a generic kbd-backlight trigger,
>> which in the future can also be used to directly control
>> kbd-backlight brightness; and not just to make ot
>> poll-able.
>
> I thought that kbd-backlight stands for "keyboard backlight",

It does.

> that's why I assessed it is too generic.

The whole purpose of the trigger as implemented is to be
generic, as it seems senseless to implement a one off
trigger for just the dell / thinkpad case.

> It seems however to be
> the other way round - if kbd-backlight means that this is
> a trigger only for use with dell-laptop keyboard driver
> (I see kbd namespacing prefix in the driver functions) than it is
> not generic at all.

The trigger as implemented is generic, if you think
otherwise, please let me know which part is not generic
according to you.

>
> Current LED subsystem triggers are generic - e.g. disk, mtd,
> backlight (it registers on video fb notifications).

Right and I tried to follow that model, the trigger as
implemented is generic. Any event which wishes to trigger
a keyboard backlight brightness change can call the added
ledtrig_kbd_backlight() function, just like any mtd
event can call the mtd trigger, etc.

If you think anything about this trigger is not generic,
please explain which bits are not generic according to
you.

Regards,

Hans



> Driver specific trigger should be implemented inside the driver.
>
> Last but not least - generic keyboard backlight trigger can't assume
> that all devices of this type can adjust backlight brightness.


>
> Best Regards,
> Jacek Anaszewski
>
>>> On 11/17/2016 11:24 PM, Hans de Goede wrote:
>>>> Add a trigger to control keyboard backlight LED devices. Note that in
>>>> some cases the keyboard backlight control is hardwired (taken care of
>>>> in firmware outside of the kernels control), in that case this triggers
>>>> main purpose is to allow userspace to monitor these changes.
>>>>
>>>> The ledtrig_kbd_backlight function has a set_brightness parameter to
>>>> differentiate between full backlight control through the trigger
>>>> (set_brightness set to true) or change notification only (false).
>>>>
>>>> Note the Kconfig option for this is a bool because the code is so
>>>> small that it is not worth the overhead of being a module.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Changes in v5:
>>>> -This is a new patch in v5 of this patch-set (replacing earlier attempts
>>>>  at similar functionality)
>>>> ---
>>>>  drivers/leds/trigger/Kconfig                 | 10 ++++++++
>>>>  drivers/leds/trigger/Makefile                |  1 +
>>>>  drivers/leds/trigger/ledtrig-kbd-backlight.c | 38
>>>> ++++++++++++++++++++++++++++
>>>>  include/linux/leds.h                         |  8 ++++++
>>>>  4 files changed, 57 insertions(+)
>>>>  create mode 100644 drivers/leds/trigger/ledtrig-kbd-backlight.c
>>>>
>>>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
>>>> index 3f9ddb9..350e2c7 100644
>>>> --- a/drivers/leds/trigger/Kconfig
>>>> +++ b/drivers/leds/trigger/Kconfig
>>>> @@ -67,6 +67,16 @@ config LEDS_TRIGGER_BACKLIGHT
>>>>
>>>>        If unsure, say N.
>>>>
>>>> +config LEDS_TRIGGER_KBD_BACKLIGHT
>>>> +    bool "LED keyboard backlight Trigger"
>>>> +    depends on LEDS_TRIGGERS
>>>> +    help
>>>> +      This trigger can control keyboard backlight LED devices,
>>>> +      it also allows user-space to monitor keyboard backlight
>>>> brightness
>>>> +      changes done through e.g. hotkeys on some laptops.
>>>> +
>>>> +      If unsure, say Y.
>>>> +
>>>>  config LEDS_TRIGGER_CPU
>>>>      bool "LED CPU Trigger"
>>>>      depends on LEDS_TRIGGERS
>>>> diff --git a/drivers/leds/trigger/Makefile
>>>> b/drivers/leds/trigger/Makefile
>>>> index a72c43c..be6b249 100644
>>>> --- a/drivers/leds/trigger/Makefile
>>>> +++ b/drivers/leds/trigger/Makefile
>>>> @@ -4,6 +4,7 @@ obj-$(CONFIG_LEDS_TRIGGER_DISK)        += ledtrig-disk.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_MTD)        += ledtrig-mtd.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)    += ledtrig-heartbeat.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_BACKLIGHT)    += ledtrig-backlight.o
>>>> +obj-$(CONFIG_LEDS_TRIGGER_KBD_BACKLIGHT) += ledtrig-kbd-backlight.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_GPIO)        += ledtrig-gpio.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_CPU)        += ledtrig-cpu.o
>>>>  obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)    += ledtrig-default-on.o
>>>> diff --git a/drivers/leds/trigger/ledtrig-kbd-backlight.c
>>>> b/drivers/leds/trigger/ledtrig-kbd-backlight.c
>>>> new file mode 100644
>>>> index 0000000..353ee92
>>>> --- /dev/null
>>>> +++ b/drivers/leds/trigger/ledtrig-kbd-backlight.c
>>>> @@ -0,0 +1,38 @@
>>>> +/*
>>>> + * LED Trigger for keyboard backlight control
>>>> + *
>>>> + * Copyright 2016, Hans de Goede <hdegoede@redhat.com>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + *
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/leds.h>
>>>> +#include "../leds.h"
>>>> +
>>>> +static struct led_trigger kbd_backlight_trigger = {
>>>> +    .name     = "kbd-backlight",
>>>> +    .activate = led_trigger_add_current_brightness,
>>>> +    .deactivate = led_trigger_remove_current_brightness,
>>>> +};
>>>> +
>>>> +void ledtrig_kbd_backlight(bool set_brightness, enum led_brightness
>>>> brightness)
>>>> +{
>>>> +    if (set_brightness)
>>>> +        led_trigger_event(&kbd_backlight_trigger, brightness);
>>>> +
>>>> +
>>>> led_trigger_notify_current_brightness_change(&kbd_backlight_trigger);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ledtrig_kbd_backlight);
>>>> +
>>>> +static int __init kbd_backlight_trig_init(void)
>>>> +{
>>>> +    return led_trigger_register(&kbd_backlight_trigger);
>>>> +}
>>>> +device_initcall(kbd_backlight_trig_init);
>>>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>> index d3eb992..870b8c2 100644
>>>> --- a/include/linux/leds.h
>>>> +++ b/include/linux/leds.h
>>>> @@ -353,6 +353,14 @@ static inline void ledtrig_flash_ctrl(bool on) {}
>>>>  static inline void ledtrig_torch_ctrl(bool on) {}
>>>>  #endif
>>>>
>>>> +#ifdef CONFIG_LEDS_TRIGGER_KBD_BACKLIGHT
>>>> +extern void ledtrig_kbd_backlight(bool set_brightness,
>>>> +                  enum led_brightness brightness);
>>>> +#else
>>>> +static inline void ledtrig_kbd_backlight(bool set_brightness,
>>>> +                     enum led_brightness brightness) {}
>>>> +#endif
>>>> +
>>>>  /*
>>>>   * Generic LED platform data for describing LED names and default
>>>> triggers.
>>>>   */
>>>>
>>>
>>>
>>
>>
>>
>
