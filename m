From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Sun, 17 Feb 2019 15:10:48 +0100
Message-ID: <81cc42f5-1f3d-c7f2-eb13-c2f8c4f9bfb4@redhat.com>
References: <20190214230307.GA17358@amd>
 <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
 <3d5407a7-9458-f071-a1d5-511b09678e20@gmail.com>
 <87a21c4e-8e5e-c180-2ff3-eb8170746e71@redhat.com>
 <80971bc3-1193-83ed-913a-12f6217016c8@gmail.com>
 <b15fd048-8206-4057-a354-07dc14ca15e3@redhat.com>
 <8a263266-a41f-c916-e990-02d04de9b5d0@gmail.com>
 <af5bec7b-0da1-ee19-cdf4-0240f56221ad@redhat.com>
 <20190216193727.GA14305@amd>
 <7be63b6b-8d8d-90b8-fb17-d219b87a101f@redhat.com>
 <20190217000851.GA29803@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217000851.GA29803@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 2/17/19 1:08 AM, Pavel Machek wrote:
> 
>>> I don't pretend to fully understand it, _but_ hw_pattern should really
>>> describe the pattern LED should do, not whether it reacts to charging
>>> or not.
>>
>> Then we are back to step 1 of the discussion, that we need another
>> mechanism outside of the trigger to select if the LED shows the configured
>> pattern always, or only when the charger is on.
> 
> Yep, sorry.
> 
>> These really are 2 orthogonal settings, there is a pattern which can
>> be set and the LED can either show that pattern always; or only when
>> charging the battery. Note that the same pattern is used in both cases.
>>
>> This is why I previously suggested having a custom sysfs hardware_control
>> attribute which selects between the "only show pattern when charging"
>> modes ("hardware_control=1" or "always show the pattern mode"
>> ("hardware_control=0").
> 
> I see... and yes, that would be the easiest solution.
> 
> But somehow I see "this LED is controlled by charging state" as
> primary and "it shows pulses instead of staying on" as secondary
> eye-candy.
> 
> This week there was another driver for charger LED.. but that one does
> not do pulses. Ideally, we'd like consistent interface to the
> userland.
> 
> (To make it complex, the other driver supports things like:
>    LED solid on -- fully charged
>    LED blinking slowly -- charging
>    LED blinking fast -- charge error
>    LED off -- not charging).

Something like that could be supported with my original hw_pattern
proposal where we simply encode all of this in the hw-pattern file:

tupple0: charging blinking_on_time
tupple1: charging blinking_off_time
tupple2: charging breathing_time
tupple3: manual blinking_on_time
tupple4: manual blinking_off_time
tupple5: manual breathing_time

So for this chip you mention, we do not need the breathing time (no breathing support),
so we would get the following tupples:

tupple0: not charging blinking_on_time
tupple1: not charging blinking_off_time
tupple2: slow charging blinking_on_time
tupple3: slow charging blinking_off_time
tupple4: fast charging blinking_on_time
tupple5: fast charging blinking_off_time
tupple6: charging error blinking_on_time
tupple7: charging error blinking_off_time

Where by solid on/off can be done by setting one
of the blinking times to 0.

Having hw_pattern ABIs like this where some of
the tupples only activate on certain conditions
might be better then a hardware_control sysfs
file as it offers more flexibility.

Regards,

Hans
