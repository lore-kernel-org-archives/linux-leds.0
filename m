From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sun, 15 Jan 2017 11:54:20 +0100
Message-ID: <eae37524-50bf-5601-3137-663d707ffa5e@redhat.com>
References: <20161125100140.GC4062@amd>
 <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
 <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
 <20161125144859.GA20139@amd>
 <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
 <20161125204045.GA28036@amd> <b35b19a0-5abd-154a-cf3b-d4a7f7e76f00@gmail.com>
 <20161221184948.GB21636@amd> <eb246ac1-bed1-a1c7-8d69-e5529c774322@gmail.com>
 <20170113191734.GB17467@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42138 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750812AbdAOKyZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 15 Jan 2017 05:54:25 -0500
In-Reply-To: <20170113191734.GB17467@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, gdg@zplane.com, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 13-01-17 20:17, Darren Hart wrote:
> On Fri, Dec 23, 2016 at 10:55:34PM +0100, Jacek Anaszewski wrote:
>> Hi,
>>
>> On 12/21/2016 07:49 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>>> In my eyes trigger approach is neccessary at least for some hardware,
>>>>>>> and things it pretty clear: trigger on == LED changes without
>>>>>>> userspace involvement. trigger off == userspace controls the LED.
>>>>>>
>>>>>> It is likely that it would break many existing users.
>>>>>
>>>>> Can you elaborate on that?
>>>>
>>>> There might exist users that adjust LED brightness while having
>>>> active trigger. The best example is default-on trigger - it sets
>>>> brightness only on init, but remains active all the time. Whereas
>>>> this could be fixed, there is another case: think of changing blinking
>>>> brightness - it would be impossible.
>>>
>>> I don't see the breakage. For existing blinking and default-on
>>> triggers, existing behaviour would be kept. Difference would be that
>>> for hardware that changes triggers itself (like the keyboard light) we
>>> would present it as a trigger. And you are right -- there would be
>>> user visible changes there. You could not assign blinking, because
>>> .. it already has a trigger. But I believe it is reasonable.
>>
>> We've already received negative feedback regarding blocking
>> application of different trigger when hw brightness change notifications
>> are enabled. One solution to that is making the notifications
>> orthogonal to the trigger mechanism. The other possibility is to allow
>> for having more than one active trigger for a LED.
>>
>> We could think of defining a special type of persistent trigger that
>> would be always enabled.
>>
>> Best regards,
>> Jacek Anaszewski
>>
>>
>>>>> I just tried with leds on thinkpad
>>>>>
>>>>> root@duo:/sys/class/leds/tpacpi::power# echo 1 > brightness
>>>>> root@duo:/sys/class/leds/tpacpi::power# echo 0 > brightness
>>>>> root@duo:/sys/class/leds/tpacpi::power# cat trigger
>>>>> [none] bluetooth-power kbd-scrollock kbd-numlock kbd-capslock
>>>>> kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock kbd-altlock
>>>>> kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock AC-online
>>>>> BAT0-charging-or-full BAT0-charging BAT0-full
>>>>> BAT0-charging-blink-full-solid rfkill0 phy0rx phy0tx phy0assoc
>>>>> phy0radio phy0tpt mmc0 timer pattern rfkill1 hci0-power rfkill74
>>>>> heartbeat
>>>>> root@duo:/sys/class/leds/tpacpi::power#
>>>>>
>>>>> I can control the LED from userspace, but then there's no way to put
>>>>> the LED back to firmware control. That's just broken.
>>>>>
>>>>> Do you have a proposal how to handle that?
>>>>
>>>> Isn't it under firmware control all the time?
>>>
>>> I'm not 100% sure in the thinkpad case. In the N900 case, we have LED
>>> that displays (user_brightness || (user_enabled_indicator && cpu_activity)).
>>>
>>> I believe clean way to do that would be a trigger.
>>>
>>>>>>> So I'd do the trigger here. It is same way we can handle LEDs on
>>>>>>> thinkpad. Yes, it means you won't be able to do oneshot trigger on
>>>>>>> backlight. I don't think that's a huge problem.
>>>>>>
>>>>>> There have been voices in this discussion claiming the opposite. :-)
>>>>>
>>>>> Well, lets ignore those voices until the voices understand the current
>>>>> design :-).
>>>>
>>>> Sheer user is not interested in design, but in usability.
>>>
>>> Well, end user is not expected to touch /sys files directly -- we
>>> should create a script for that. /sys should be logical and map well
>>> to what we do in kernel. Being "nice to use from shell" is
>>> secondary...
>>>
>>> 								Pavel
>>>
>
> This seems to have stalled out. From the driver/platform/x86 perspective, I
> believe we're still waiting on the leds subsystem mechanism to be decided on.

Correct.

> Hans, you said you'd send a v6 once that was squared away I believe.

Yes, I need to brush these patches of and send a new version.

Do you want me to also send out a new version of the platform patches when
I send the next shot at the LED side of things, or shall I keep those
in my personal tree until the LED api is finalized ?

> For now, I'm marking these as "changes requested" and archiving the patches.
> Will revisit once the LEDs bits are sorted and v6 lands on the list.

Ack.

Regards,

Hans
