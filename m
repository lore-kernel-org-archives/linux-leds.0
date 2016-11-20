From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sun, 20 Nov 2016 19:48:02 +0100
Message-ID: <acd1691b-56be-c902-feff-7ecf38ea102a@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com> <201611201605.17631@pali>
 <20161120162116.GA15737@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60800 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752891AbcKTSsI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Nov 2016 13:48:08 -0500
In-Reply-To: <20161120162116.GA15737@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

HI,

On 20-11-16 17:21, Pavel Machek wrote:
> Hi!
>
>>>>>>> Thanks for the patch.
>>>>>>>
>>>>>>> I think we need less generic trigger name.
>>>>>>> With present name we pretend that all kbd-backlight controllers
>>>>>>> can change LED brightness autonomously.
>>>>>>>
>>>>>>> How about kbd-backlight-pollable ?
>>>>>>
>>>>>> This is a trigger to control kbd-backlights, in the
>>>>>> current use-case the brightness change is already done
>>>>>> by the firmware, hence the set_brightness argument to
>>>>>> ledtrig_kbd_backlight(), so that we can avoid setting
>>>>>> it again.
>>>>>>
>>>>>> But I can see future cases where we do want to have some
>>>>>> event (e.g. a wmi hotkey event on a laptop where the firmware
>>>>>> does not do the adjustment automatically) which does
>>>>>> lead to actually updating the brightness.
>>>>>>
>>>>>> So I decided to go with a generic kbd-backlight trigger,
>>>>>> which in the future can also be used to directly control
>>>>>> kbd-backlight brightness; and not just to make ot
>>>>>> poll-able.
>>>>>
>>>>> I thought that kbd-backlight stands for "keyboard backlight",
>>>>
>>>> It does.
>>>>
>>>>> that's why I assessed it is too generic.
>>>>
>>>> The whole purpose of the trigger as implemented is to be
>>>> generic, as it seems senseless to implement a one off
>>>> trigger for just the dell / thinkpad case.
>>>>
>>>>> It seems however to be
>>>>> the other way round - if kbd-backlight means that this is
>>>>> a trigger only for use with dell-laptop keyboard driver
>>>>> (I see kbd namespacing prefix in the driver functions) than it is
>>>>> not generic at all.
>>>>
>>>> The trigger as implemented is generic, if you think
>>>> otherwise, please let me know which part is not generic
>>>> according to you.
>>>
>>> I think I was too meticulous here. In the end of the previous
>>> message I mentioned that we cannot guarantee that all keyboard
>>> backlight controllers can adjust brightness autonomously.
>>> Nonetheless, for the ones that cannot do that it would make no sense
>>> to have a trigger. In view of that this trigger is generic enough.
>>>
>>> I'll wait for Pavel's opinion before merging the patch set
>>> as he was also involved in this whole thread.
>
> If we have a keyboard backlight that may be changed automatically, I'd
> go for trigger. If we know for sure that hardware will not change
> brightnes "on its own", I'd not put a trigger there (and polling makes
> no sense). If we don't know... I guess I'd go for trigger.
>
> We can do various white/blacklists if we really want to..
>
>> As pointed in other email, we do not know if HW really controls keyboard backlight,
>> so adding "fake" trigger on machines without HW control is not a good idea.
>
> Well, if we know that hardware will not change the brightness on its
> own, yes, I'd avoid the trigger. If we don't know (as is common on
> ACPI machines, I'd keep the trigger).

Right, this is taken care of by the default_trigger field of the
led_classdev, we only set the "kbd-backlight" default_trigger on
(kbd-backlight) LED devices where we know we have a hotkey directly
controlling the brightness.

Regards,

Hans
