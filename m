From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Tue, 24 Jan 2017 23:56:34 +0100
Message-ID: <c2ef272a-8bfb-2911-5b8a-73635252fbc1@gmail.com>
References: <20161125100140.GC4062@amd>
 <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
 <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com>
 <20161125144859.GA20139@amd>
 <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
 <20161125204045.GA28036@amd> <b35b19a0-5abd-154a-cf3b-d4a7f7e76f00@gmail.com>
 <20161221184948.GB21636@amd> <eb246ac1-bed1-a1c7-8d69-e5529c774322@gmail.com>
 <20170124123243.GA8688@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170124123243.GA8688@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 01/24/2017 01:32 PM, Pavel Machek wrote:
> Hi!
> 
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
>> application of different trigger when hw brightness change
>> notifications
> 
> Actually sometimes we'll get negative feedback for anything we do. I
> still believe exposing the backlight case as a trigger is a right thing.
> 
>> are enabled. One solution to that is making the notifications
>> orthogonal to the trigger mechanism. The other possibility is to allow
>> for having more than one active trigger for a LED.
>>
>> We could think of defining a special type of persistent trigger that
>> would be always enabled.
> 
> Yes, that could be done. I'd not call it persistent trigger, but
> with right name...
> 
> #1:
> 
> Apparently some LEDs change themselves, and we can't find how or
> when. That's thinkpad battery LED, for example.
> 
> #2:
> 
> Then there are some LEDs that change themselves, and we can get
> notifications. We should make it very clear that we'll not send
> notifications kernel did itself.
> 
> So... for #1 and #2 something like
> 
> led/hardware_changes_brightness 
> 
> and for #2
> 
> led/poll_for_hardware_brightness_change
> 
> where poll() wakes the userspace up when the brightness changes, and
> read() can get new brightness...?

Well, it is almost the same as hw_brightness_change I proposed
earlier. Persistent triggers OTOH would be more generic and it would
fit for the trigger approach Hans already implemented.


-- 
Best regards,
Jacek Anaszewski
