From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 22 Feb 2017 13:20:46 +0100
Message-ID: <035b56e6-b606-c632-35cf-00f880abcbf5@redhat.com>
References: <20170221141108.GG9795@pali>
 <d1639790-24a3-8c81-651b-c8c8940ceeb5@redhat.com>
 <20170221145043.GK9795@pali>
 <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
 <20170221151317.GN9795@pali>
 <af30d146-8eb3-fbf7-7041-e719d8f9a5ac@redhat.com>
 <20170221170838.GO9795@pali>
 <7bb7c48f-789e-8b4c-b76b-1389d7fbbfb7@redhat.com>
 <20170222084935.GA21558@pali>
 <cf1aceaf-9177-2223-6f36-afdb5c47ee31@redhat.com>
 <20170222120109.GC21558@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36084 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932294AbdBVMUu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Feb 2017 07:20:50 -0500
In-Reply-To: <20170222120109.GC21558@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 22-02-17 13:01, Pali Rohár wrote:
> On Wednesday 22 February 2017 11:24:13 Hans de Goede wrote:
>> HI,
>>
>> On 22-02-17 09:49, Pali Rohár wrote:
>>> On Wednesday 22 February 2017 09:36:08 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 21-02-17 18:08, Pali Rohár wrote:
>>>>> On Tuesday 21 February 2017 17:14:06 Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 21-02-17 16:13, Pali Rohár wrote:
>>>>>>> On Tuesday 21 February 2017 15:56:43 Hans de Goede wrote:
>>>>>>>>> So do we really need this code which prevents update?
>>>>>>>>
>>>>>>>> Yes, because the ABI specification for the new brightness_hw_changed says
>>>>>>>> that poll() listeners will only be woken up if the brightness is changed
>>>>>>>> outside of the kernel and not when the kernel changes it itself.
>>>>>>>
>>>>>>> So in case there are two applications in userspace which want to monitor
>>>>>>> brightness change and both of those application could change brightness
>>>>>>> (via sysfs) then these two applications would not know about every
>>>>>>> brightness change and would be out-of-sync of reality what is really
>>>>>>> configured by kernel.
>>>>>>
>>>>>> Yes, because with triggers and blinking etc. it is impossible for
>>>>>> userspace to continuously monitor brigthness in a way which does not
>>>>>> cause a high system load.
>>>>>
>>>>> Triggers and blinking features are out due to high cpu load. Fine.
>>>>>
>>>>> But why also manual writes to /sys/class/leds/... by userspace
>>>>> applications is filtered and not reported via poll()?
>>>>
>>>> I agree that having a way for interested userspace to detect those
>>>> would be good, but that would need to be another API, may poll()
>>>> on the brightness attribute itself while excluding triggers / blinking
>>>> changes from wakeup ?
>>>>
>>>> Anyways that is something to discuss in a thread specific to the
>>>> LED subsystem and somewhat orthogonal to this patch.
>>>
>>> Ok, lets start discussion about it in new separate thread. I was in
>>> impression that this was already part of discussion and in proposed ABI.
>>> Now I see that it was just in original cpu consuming ABI which was
>>> rejected.
>>>
>>>> One disadvantage of poll() is that it does not give the source of
>>>> the change, so in retrospect I actually like the new brightness_hw_changed
>>>> attribute as that does give the source, which is something which we need
>>>> to know in userspace.
>>>
>>> Do you really in userspace need to know source of change? And to
>>> distinguish between change from hardware and change from userspace done
>>> by echo > /sys/class/leds?
>>
>> Yes, a change done through hardware (through the firmware handled
>> hotkeys) will make the desktop environment show an osd overlay
>> with the new kbd backlight brightness, where as a change done
>> through e.g. the brightness slider in gnome-control-panel should
>> not show that same osd.
>>
>>> I though that this is for informing userspace application that led
>>> status was changed and application should update some bar or number
>>> which show current state of backlight level.
>>
>> That is only part of it, we also want the OSD but ONLY when changed
>> through the hotkeys (on other models the hotkeys are handled in
>> userspace software, which will then also show the OSD, we want this
>> to be consistent whether the keys are handled in firmware or in
>> userspace).
>
> Ok, so userspace application wants to distinguish between these types of
> events:
>
> 1) autonomous hardware decided to change brightness
> 2) application itself changed brightness
> 3) other application changed brightness
> 4) pressed keyboard hotkey changed brightness
>   4.1) managed by firmware
>   4.2) managed by some application
>
> And for 4) and 1) you want to show notification to user, right?

Yes.

>>>> In previous versions of the ABI I had to do
>>>> the same brightness comparison I'm doing in the dell-laptop driver
>>>> now in userspace, where it can never be done safely as userspace does
>>>> not know about other userspace.
>>>>
>>>> Since the Dell smbios events don't provide us with a source of the
>>>> change, we need to compare the brightness to the last set brightness
>>>> somewhere and IMHO the kernel is the best (least bad) place to do
>>>> that.
>>>
>>> Maybe kernel place is the least bad place, but still it is unreliable
>>> for Dell machines.
>>>
>>> You do not know latency and delay how long it will take Dell firmware to
>>> deliver event to kernel. It also implies that there is race condition
>>> between delivering event and reading new backlight level.
>>
>> A race condition which will always exists if userspace polls the backlight
>> periodically say once a minute then it can always end up polling just
>> before the hotkey press is done. Which is exactly why we need the event,
>> so we don't need to poll  and when the event is delivered we know the new
>> backlight level.
>
> So instead userspace polling you will ask for backlight level after
> receiving firmware event. This is same race as in userspace. Returned
> backlight level does not have to be one which caused firmware event.

1) These events do not happen 100s of times per second, they happen
almost never

2) This is the best we can do given the firmware interface we have

> If firmware delays that event (and due to ACPI slowness it can be really
> delayed) then another backlight change could happen... And you will just
> use incorrect level for comparison.

Again given the frequency of these events this is not really an issue.

> Basically on Dell machine you cannot distinguish between events done by
> 1), 2), 3) and 4). You are trying to hide this fact by bringing some
> logic which on first look can fix it...

Sure we can distuingish 2, 3 and 4.2 will always go through the kernel
and 1 and 4.1 will not, so we can just compare the last written value to
the value after the event, this works fine. There really is no problem here.

Granted using libsmbios to change things will cause the change to be
seen as an autonomous / firmware change rahter then done by userspace,
as you wrote yourself in a previous mail:

"Due to fundamental reasons we ignore all race condition between
libsmbios and kernel (they are basically not possible to solve). I'm
fine with this."

This is unsolvable, but the end result is that other userspace bits
(if present) may mistake the change for an autonomous change and
show the OSD, so the only bad side-effect is the OSD being shown
in that case. And I really doubt this will ever happen, either the
user uses something like GNOME and he will likely never use libsmbios
directly, or he runs some more DIY desktop environment and does
use smbiosctl in which case no one will be listening for the
autonomous changes.

> Also calling another SMBIOS call via SMM for every received event (even
> if userspace is not interested in it) does not look like good
> implementation. And another one is issued after userspace receive that
> event (via poll()) and try to know current value.

That is not true, the hw_brightness_changed attribute returns the last
brightness passed to led_classdev_notify_brightness_hw_changed(), this
is the whole reason why it has a brightness argument, this is actually
done to avoid races, so that we get the brightness asap after receiving
the event and then even if userspace takes it sweet time we actually
report the brightness resulting from the event and not some later
change (this is part of the ABI definition of brightness_hw_changed).

So no we do not end up doing 2 SMBIOS calls and even if we were
given the frequency of these events the performance impact would be
absolutely negligible.

You are really seeing a lot of problems where there are none,
remember Linus' motto: perfect is the enemy of good.

Now can we please move forward with this ?

Regards,

Hans
