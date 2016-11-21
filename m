From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Mon, 21 Nov 2016 10:31:33 +0100
Message-ID: <2e1ddcc3-489d-bab1-ebb9-dad02db7b37c@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
 <CGME20161120150524epcas2p1f634a13bf220f21e7dd95b272b28594c@epcas2p1.samsung.com>
 <201611201605.17631@pali> <d6b177fc-313f-6597-4c8c-fc3c6f48778a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47776 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752266AbcKUJbj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 21 Nov 2016 04:31:39 -0500
In-Reply-To: <d6b177fc-313f-6597-4c8c-fc3c6f48778a@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>

Hi,

On 21-11-16 09:35, Jacek Anaszewski wrote:
> On 11/20/2016 04:05 PM, Pali Rohár wrote:
>> On Saturday 19 November 2016 16:44:09 Jacek Anaszewski wrote:
>>> Hi,
>>>
>>> On 11/18/2016 07:47 PM, Hans de Goede wrote:
>>>> HI,
>>>>
>>>> On 18-11-16 17:03, Jacek Anaszewski wrote:
>>>>> Hi,
>>>>>
>>>>> On 11/18/2016 10:07 AM, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 18-11-16 09:55, Jacek Anaszewski wrote:
>>>>>>> Hi Hans,
>>>>>>>
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
>>
>> Do you mean me? Or Pavel Machek (CCed) who was involved in LEDs for input devices?
>
> I meant Pavel Machek, I haven't known that Pali is an equivalent of
> Pavel :-)
> Your opinion is very much appreciated though, thanks.
>
>> As pointed in other email, we do not know if HW really controls keyboard backlight,
>> so adding "fake" trigger on machines without HW control is not a good idea.
>>
>
> Yes, I had also similar doubts, but got almost convinced due to
> no objections. Now it becomes clear that we need to improve this
> feature.

But we are not adding such a fake trigger. We are only setting up the
kbd-backlight trigger on systems where there actually is hw-control.

Sure someone can do echo "kbd-backlight" > trigger to enable it,
but the same is true for e.g. "mtd" or "nand-disk" on systems
without an mtd-device / a nand-disk, and the result is the same,
the LED gets coupled to the trigger, but nothing ever triggers
the trigger.

I really believe that we have the right design now (I was skeptical
about the trigger approach at first, but it has turned out really
well) and unless Pavel Machek has any objections I would really like
patches 1-2 of this series merged.

Regards,

Hans


p.s.

Pali, I'm sorry that you don't like the LED side design, but there
has been a long discussion about this (which you apparently missed)
and this really is the best way forward.

Have you looked at what the new design means for the platform/x86
patches ? Gone is the ugly dell_laptop_notifier as the event
forwarding between dell-wmi and dell-laptop is now handles by
the led-trigger subsys.
