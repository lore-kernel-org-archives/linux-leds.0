From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 1 Mar 2017 14:58:45 +0100
Message-ID: <e66822f3-b47c-e986-c819-87dfb56568ba@redhat.com>
References: <20170221151317.GN9795@pali>
 <af30d146-8eb3-fbf7-7041-e719d8f9a5ac@redhat.com>
 <20170221170838.GO9795@pali>
 <7bb7c48f-789e-8b4c-b76b-1389d7fbbfb7@redhat.com>
 <20170222084935.GA21558@pali>
 <cf1aceaf-9177-2223-6f36-afdb5c47ee31@redhat.com>
 <20170222120109.GC21558@pali>
 <035b56e6-b606-c632-35cf-00f880abcbf5@redhat.com>
 <20170301111558.GC3185@pali>
 <8c181bbc-e786-16c7-39f7-80d4be502066@redhat.com>
 <20170301125532.GF3185@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170301125532.GF3185@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 01-03-17 13:55, Pali Rohár wrote:
> On Wednesday 01 March 2017 13:02:58 Hans de Goede wrote:
>> Hi,
>>
>> On 01-03-17 12:15, Pali Rohár wrote:
>>> On Wednesday 22 February 2017 13:20:46 Hans de Goede wrote:
>>>> 1) These events do not happen 100s of times per second, they happen
>>>> almost never
>>>
>>> 100 events per second is probably not happening, but on my Latitude I
>>> see that sometimes more events are delayed and delivered at once.
>>>
>>>> 2) This is the best we can do given the firmware interface we have
>>>
>>> What about just dropping upcoming one event in interval of next 2-3
>>> second? Instead of trying to remember last state in kernel and then
>>> trying to mach if received event was that which was caused by change?
>>
>> That is way more racy then the solution with the kernel remembering
>> the brightness. With my proposed solution there is basically no race,
>
> Is is racy. When you change keyboard backlight via LED sysfs and also in
> that time kernel receive hardware event about changed backlight, kernel
> do not know if that event comes as reaction to change via LED sysfs or
> as autonomous firmware decision or as reaction to pressing key for
> changing keyboard backlight (managed by firmware).

In this case there are only a limited number of scenarios:

1. The hotkey event gets the mutex before the sysfs write
In this case there is no race as the event is processed before the
sysfs write can be proceed.

2. The sysfs write gets the mutex before the hotkey event:
There are 2 sub scenarios here:

2a) The sysfs writes the same value as the hotkey press just set:
In this case the cached brightness will get updated to this new
value before processing either event can be processed, when both
events get processed they will fail the new_brightness != brightness
check and no event will be generated. Arguably this is a bug but
I believe if the user just set the brightness to the same value,
making the hotkey change a nop that this behavior is fine. The sysfs
write won the race after all, so from a kernel pov it really was
first and the hotkey event really is a nop.

2b) The sysfs write writes a different value then the hotkey,
in this case a question becomes which of the 2 we actually get,
but this is up to the BIOS not up to the kernel, basically this
depends on who won the race from the BIOS pov. If the sysfs
write was seen last from the BIOS pov then our SMM call to get
the current value will report the already cached value for both
events and no events get generated. This make sense since the
hotkey change got cancelled by the sysfs write. If otoh the hotkey
gets handled last, then the first event will read back
a different value, after which an events gets send to userspace
and the cached value gets updated, changing the second event
into a NOP. So in this case things just work as if there was
a significant amount of time between the sysfs write and the
hotkey press.

TL;DR: the very worst then can happen is loosing a hotkey
event because the exact same value was written to sysfs after
the press was handled by the BIOS but before we get to process
the event.

> I'm not talking here about userspace libsmbios. All is just by
> autonomous firmware, keyboard usage and LED sysfs API.
>
> And how is my idea about dropping exactly one event for one request for
> changing backlight via LED sysfs API more racy as yours?

You wrote: "What about just dropping upcoming one event in interval
of next 2-3 second?"

The time window you added makes things more razy. If we just increment
an atomic_t on sysfs_write, and decrement_and_test on an event then
that would be fine and would fix your sysfs write vs hotkey press write
as we would get 2 events in that case.

> Received event from firmware has only the timestamp, no more information
> yet (*). Therefore state of events does is not ordered and any two
> events are basically same.
>
> In your provides patch you are adding additional information to event.
> It is currently read brightness level in time when was event delivered,

Correct, that is part of the ABI definition of the brightness_hw_changed
sysfs attribute, we must pass the brightness at the time of the hardware
initiated change.

> not state of time when event was created. Which means you cannot swap
> any two received events anymore as they are part of current driver
> state.
>
> In my idea I do not add any additional information to event. Which means
> all received events are same in current driver state and I can swap
> them. So I can decide to drop one event when driver is changing
> backlight level. And because I can swap received events it does not
> matter if I drop "correct" one (that which was really generated by my
> backlight level change) or any other before or after (as they are same).
> The only important is that kernel use correct number of firmware events.
>
> Idea for time interval of 2-3 seconds is that if event is delivered
> later as after 3 seconds it is probably useless as driver application
> code can be already out-of-sync. But this time interval is just another
> idea and we do not need to use it.

I really don't like the 2-3 seconds stuff, but I'm fine with going
with your idea of just swallowing one event after a sysfs-write
without the timeout stuff.

> (*) Looks like for some machines in dell-wmi.c we know also which
> brightness level was set by firmware, but it is not used now and we
> still have machines without this information.
>
>> the only downside is the driver seeing a brightness change caused by
>> libsmbios as one caused by the hotkeys, but it will do so 100%
>> reliably and that is something which I believe we can live with
>> just fine.
>>
>>> This would allow us to reduce doing one SMM call for each received
>>> event and I think it would be same reliable as your approach.
>>
>> As I explained *already* we already have only one SMM call for reach
>> received event, we pass the read-back brightness into
>> led_classdev_notify_brightness_hw_changed and when userspace
>> reads the new brightness_hw_changed event in response to the wakeup
>> the led-core will use the value passed through
>> led_classdev_notify_brightness_hw_changed so only 1 SMM call happens
>> per event.
>>
>> Also again this does not happen 100 times per second you're really
>> trying to optimize something which does not need any optimization
>> at all here.
>
> We have reports that on some Dell notebooks is issuing SMM call causing
> freezing kernel for about 1-3 seconds (as firmware stay in SMM mode for
> a longer time...).

I doubt those are notebooks with backlight keyboards, but anyways if
we swallow 1 event per sysfs write we are only doing SMM calls when
actually reporting a change to userspace at which point we need to
make that smm call sooner or later anyways...

Regards,

Hans
