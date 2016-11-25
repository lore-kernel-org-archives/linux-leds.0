From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 16:46:17 +0100
Message-ID: <05f63782-10a4-c1c4-1838-4c86c4542bf5@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <20161125100140.GC4062@amd> <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
 <CGME20161125112622epcas2p1c7e7402109b9e54155a25fdeff6aba35@epcas2p1.samsung.com>
 <201611251226.13615@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-reply-to: <201611251226.13615@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 11/25/2016 12:26 PM, Pali Rohár wrote:
> On Friday 25 November 2016 12:14:56 Hans de Goede wrote:
>> Hi,
>>
>> On 25-11-16 11:01, Pavel Machek wrote:
>>> Hi!
>>>
>>>> In view of the above we could report hw brightness changes with
>>>> POLLPRI on brightness file, but unfortunately we can't because it
>>>> is impossible to guarantee that readout of brightness file will
>>>> return the brightness the POLLPRI was meant to notify about.
>>>
>>> Agreed here.
>>>
>>>> That's why a separate read only file seems to be the only proper
>>>> solution.
>>>
>>> Yes please. And lets make self-changing leds into a trigger, as
>>> proposed, and as Hans' patch should be already doing.
>>>
>>>> Moreover, the file should return the brightness from the time
>>>> of last POLLPRI.
>>>
>>> Not sure I agree here. Normally, kernel returns current state for
>>> variables, does not track "old" state.
>>
>> Agreed, storing the last state just unnecessarily complicates things.
>>
>> So do we have a consensus on implementing a new hw_brightness_change
>> sysfs attribute now, which only some LEDs will have, can be polled
>> to detect changed done autonomously by the hardware and returns
>> the current / actual LED brightness when read ?
>>
>> As for the modeling how the hotkey controls the LED as a trigger,
>> although I do like this from one pov, I can see Jacek's point that
>> this is confusing as there really is nothing to configure here,
>> where as normally a user could do "echo none > trigger" to break
>> the link. So I think that is best (cleanest /minimal non confusing
>> API) with just the hw_brightness_change sysfs-attribute and not
>> model this as a trigger.
>
> I can accept with this solution (no trigger, event on new sysfs file
> which returns current/actual brightness state, new sysfs file only for
> devices which can report brightness state).
>
> But I'm not sure if it is really fixing that original problem with high
> power usage...

High power consumption occurred because in that solution every call
to __led_set_brightness{_blocking} triggered the POLLPRI.
In the discussed approach it will not be the case.

> As wrote in some previous emails, consider "actual_brightness" sysfs
> name which is already used for this purpose by backlight subsystem --
> because for consistency. backlight devices have: actual_brightness,
> brightness, max_brightness.

I don't like it very much but I could accept it eventually if
other people deem it accurate.

-- 
Best regards,
Jacek Anaszewski
