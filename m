From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 01 Dec 2016 15:08:56 +0100
Message-ID: <f57a35f7-85ec-7f90-44c9-2ae98e12ca46@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <201611241751.27696@pali> <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali> <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
 <20161125100140.GC4062@amd> <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-reply-to: <b159c2e1-dbf7-1ee3-707c-82891c7194db@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 11/25/2016 12:14 PM, Hans de Goede wrote:
> Hi,
>
> On 25-11-16 11:01, Pavel Machek wrote:
>> Hi!
>>
>>> In view of the above we could report hw brightness changes with POLLPRI
>>> on brightness file, but unfortunately we can't because it is impossible
>>> to guarantee that readout of brightness file will return the brightness
>>> the POLLPRI was meant to notify about.
>>
>> Agreed here.
>>
>>> That's why a separate read only file seems to be the only proper
>>> solution.
>>
>> Yes please. And lets make self-changing leds into a trigger, as
>> proposed, and as Hans' patch should be already doing.
>>
>>> Moreover, the file should return the brightness from the time
>>> of last POLLPRI.
>>
>> Not sure I agree here. Normally, kernel returns current state for
>> variables, does not track "old" state.
>
> Agreed, storing the last state just unnecessarily complicates things.

It is mandatory to secure a reliable readout of the brightness value
set by the hardware. Without it, we could end up reading brightness
set in the meantime either by trigger or by userspace. Knowing that
value can be useful in case hardware tries to lower the brightness
level set by the user for some reason (e.g. low battery voltage).

However, I'd tweak the file name a bit, to make it clear
what property the file represents - the brightness changed
by the hardware, effectively I'm proposing the property:

brightness_hw_changed

Best regards,
Jacek Anaszewski

>
> So do we have a consensus on implementing a new hw_brightness_change
> sysfs attribute now, which only some LEDs will have, can be polled
> to detect changed done autonomously by the hardware and returns
> the current / actual LED brightness when read ?
>
> As for the modeling how the hotkey controls the LED as a trigger,
> although I do like this from one pov, I can see Jacek's point that
> this is confusing as there really is nothing to configure here,
> where as normally a user could do "echo none > trigger" to break
> the link. So I think that is best (cleanest /minimal non confusing
> API) with just the hw_brightness_change sysfs-attribute and not
> model this as a trigger.
>
> That, or fall back to my latest patch-set as posted, I still like
> that one the most.
>
> Regards,
>
> Hans
>
>
>
>
