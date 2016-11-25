From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 16:55:32 +0100
Message-ID: <9844f7b3-c3e8-99d8-61b6-1550b1b8ab7e@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <201611241751.27696@pali> <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali> <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
 <20161125100140.GC4062@amd> <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
 <20161125110557.GA13204@amd>
 <2367b9a7-68f7-2038-0d3a-a9561055b4f6@samsung.com> <20161125144859.GA20139@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-reply-to: <20161125144859.GA20139@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 11/25/2016 03:49 PM, Pavel Machek wrote:
> Hi!
>
>>> Lets keep it simple. Yes, monitoring backlight state while hardware
>>> updates it is useful. But doing the monitor when some kind of blinking
>> >from the kernel is active is just a unneccessary complexity...
>>
>> Triggers are not limited to periodic blinking or reporting cpu
>> activity. There is also oneshot trigger that can be used e.g. when
>> user touches the screen, as Pali mentioned.
>
> Using oneshot trigger for this would be pretty strange.

It was only an example to mention other than periodic triggers.
You could have a trigger that just turns the LED permanently on
after user touches the screen.

> Notice that in
> some cases (thinkpad battery led, for example) we either have firmware
> controls the LED (but then software can't control it) or we have
> software controlling the LED (but then we don't know what firmware
> would put there). Maybe keyboard backlight can be controlled
> "simultaneously" by both software and firmware, but there are
> certainly LEDs that can't handle that, and IMO it would be nice to
> have same interface.
>
>>> Well.. actually... I think this is a little bit over complex and
>>> probably unneccessary. I'd let Hans implement whatever he thinks is
>>> easiest.
>>
>> I'd say this is the trigger approach which is a bit convoluted.
>
> In my eyes trigger approach is neccessary at least for some hardware,
> and things it pretty clear: trigger on == LED changes without
> userspace involvement. trigger off == userspace controls the LED.

It is likely that it would break many existing users.

> So I'd do the trigger here. It is same way we can handle LEDs on
> thinkpad. Yes, it means you won't be able to do oneshot trigger on
> backlight. I don't think that's a huge problem.

There have been voices in this discussion claiming the opposite. :-)

-- 
Best regards,
Jacek Anaszewski
