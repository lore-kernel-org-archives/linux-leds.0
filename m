From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 10:57:13 +0100
Message-ID: <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com> <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213233806.GA11867@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 14-02-19 00:38, Pavel Machek wrote:
> Hi!
> 
> 
>>> Agreed.
>>>
>>>> I believe it would be best to add a custom "mode" attribute
>>>> to the led classdev, with "manual" and "on-when-charging"
>>>> modes, this would then control bits 0-1 of reg 0x5e1f and
>>>> by default these bits should be left as is when the driver
>>>> loads.
>>>
>>> No. This is not first hardware when we have something like this, and
>>> we need something generic here.
>>>
>>> One possibility would be magic "hardware drives this led"
>>> trigger. Hmm? (Jacek disliked this idea before, but maybe we can
>>> convince him).
>>>
>>> Generic "is this driven by hardware or not" attribute might be
>>> possible, too... but its interaction with triggers/brightness/etc
>>> would be confusing.
>>
>> In this case the interaction is not that tricky, but it will
>> likely be different per led controller, so I do not think that
>> we can ever come up with a truely generic solution.
>>
>> Basically the charge led has 3 states:
>>
>> 1) Off
>> 2) On
>> 3) On when charging
>>
>> And then when on it has 4 patterns:
>>
>> 1) Permanently off (so still not really on)
>> 2) Permanently on
>> 3) Blinking
>> 4) Breathing
> 
> Ok, so you don't really need to support _both_ off methods.
> 
> Still sounds like a normal LED, with special "yoga-charging" and
> "yoga-breathing" triggers. (All the normal triggers should still work,
> too.)

Except that when in yoga-charging mode, the user should
still be able to select if the LED is simply on when charging,
blinking when charging, or breathing when charging.

Given that there are 2 independent settings model-ing this
as a trigger does not work well. Also the trigger names should
not contain yoga as the PMIC in question is used in other
devices too.

I really think we should not try to shoe-horn special cases
like this into the generic API and just use custom sysfs
attributes for this. Like for example how the kbd-backlight
led classdev from the dell-laptop has custom attributes to
select if the timeout for going off on keyboard/mouse activity
and another custom attribute to select if only the keyboard or
both the keyboard and mouse count as relevant activity.

Triggers are great for when we actually want to add a link
between an event coming from some part of code in the kernel,
to a LED classdevice, so that that event can control the LED.

Trying to shoe-horn all sort of other stuff into this API
just does not work well IMHO and is abuse of the original
LED trigger API.

>> These 4 patterns can be selected when on, independent
>> of being perma-on or ondemand-on
> 
> Yeah, but we don't really want to expose that to userspace.

I disagree I see no reason if we are adding a driver for
this why the user should not be able to select if the
LED is on, blinking or glowing when charging.

>>>> As for the 0x5e20 settings, I believe another custom
>>>> sysfs attribute, called "breathing" would be a good idea to
>>>> export the breathing functionality.
>>>
>>> We have "pattern" trigger that can do this kind of stuff in
>>> software. But I'm not sure if this is worth supporting.
>>
>> The problem is that any changes made are permanent, they
>> survice reboots and the default is Breathing, so we need
>> a way to restore that which does not involve removing
>> the internal battery of these devices.
> 
> Wow. Now that's a broken hardware.

The PMIC is attached to the battery and retaining the state
of the logic controlling the charging LED when off seems sane
to me.

Arguably the firmware should set some sane defaults on boot,
but at least on the 2 devices with this PMIC I have it does
not do this.

> Anyway, in such case I'd propose having rmmod/reboot/poweroff hook
> that just sets it to breathing. No need to expose it to userspace.

That assumes that breathing is the default setting on all hardware
and again I don't see why not to export this functionality to
userspace. Just because something does not fit in the existing
API is IMHO not a good reason to not expose it to userspace.

I suggest that we deal with this special case by adding 3 custom
sysfs attributes:

1) "mode" which when read, prints, e.g. :
manual [on-when-charging]

With the [] indicating the current mode, and writes accepting
all 3 values and updating the hw accordingly.

This format is used in more places in the kernel and allows
for the user to easily discover the possible values.

2) "pattern" which when read, prints, e.g. :
on blinking [breathing]

3) "frequency", when read prints, e.g. :
0.25hz [0.5hz] 1hz 2hz
Note this controls both the blinking and breathing freq.

Note I've not listed off anywhere, this can be achieved by
setting the brightness to 0 as we do with normal leds.

For interactions with other APIs we can do the standard
thing where writing 0 to brightness resets things, in this
case this would reset mode to manual and pattern to on.

And if the blinking API gets used, then too the mode should
be switched to manual, and the pattern obviously becomes
blinking.

I believe this will work well with this hardware and
nicely allow the user to control all settings.

Regards,

Hans
