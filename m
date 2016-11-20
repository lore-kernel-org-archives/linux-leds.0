From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger
 parameter
Date: Sun, 20 Nov 2016 19:45:40 +0100
Message-ID: <fc7f4360-a9ae-5ec8-46f0-b078a5901d8f@redhat.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <201611201559.24614@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <201611201559.24614@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 20-11-16 15:59, Pali Rohár wrote:
> On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
>> In some cases it may be desirable for userspace to be notified when
>> a trigger event happens. This commit adds support for a poll-able
>> current_brightness trigger specific sysfs attribute which triggers
>> may register:
>>
>> What:		/sys/class/leds/<led>/current_brightness
>> Date:		November 2016
>> KernelVersion:	4.10
>> Description:
>> 	Triggers which support it may register a current_brightness
>> 	file. This file supports poll() to detect when the trigger
>> 	modifies the brightness of the LED.
>> 	Reading this file will always return the current brightness
>> 	of the LED.
>> 	Writing this file sets the current brightness of the LED,
>> 	without influencing the trigger.
>
> Personally I do not like this new sysfs attribute...
>
> Now when somebody look at /sys/class/leds/<something>/, the first thing
> which say would be:
>
> "What the hell, why there are two files (brightness and
> current_brightness) for changing LED level? And which should I use?"
>
> If I understood correctly we need to handle two things:
>
> 1) Provide poll() for userspace when LED level is changed (either by HW
>    or other user call)
 >
> 2) Deal with fact that on _some_ hardware, special key is hardwired to
>    change LED level
>
> So why for 1) we cannot use existing sysfs file "brightness"? I do not
> see any problem with it.

That was our first attempt at this, but because the brightness may also
be changed by triggers / blink-timers, we need to wakeup poll() in those
cases too (anything else would be inconsistent) and doing such a wakeup
in that case has turned out to cause too much overhead in some cases
(even if userspace is not listening), specifically the idle power uses
on some systems got multiplied by a factor of 5 or more.

So this approach was rejected.

> And for 2) we even do not know on which machines is such hardwired
> feature enabled. Yes, on _some_ (not *all*) Dell machines there is Fn
> key combination which changes level of one LED device. But kernel does
> not know if hardware on which is running is doing such thing or not.
> Some machines do not have to have key for such action and we do not know
> it.
>
> And what about situation when somebody wants to configure e.g. mouse
> movement (or keypress) trigger to enable/disable LED device (which
> belongs to keyboard brightness)? In this case user explicitly know that
> his Fn+Space change level of LED device, so can be careful to not press
> it. With your read-only trigger you basically disable such (I think
> useful) feature.

This has already been discussed and the third patch in the set, which is
the one making the trigger read-only has been dropped.

Regards,

Hans
