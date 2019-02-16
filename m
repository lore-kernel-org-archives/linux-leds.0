From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Sat, 16 Feb 2019 18:02:34 +0100
Message-ID: <8a263266-a41f-c916-e990-02d04de9b5d0@gmail.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com> <20190213230731.GA8557@amd>
 <42078a81-e32e-81b7-528f-d1adb60d31c3@redhat.com>
 <20190213233806.GA11867@amd>
 <562e2acd-a60a-2aea-4050-6d9414d23a4e@redhat.com> <20190214111423.GE6132@amd>
 <92cf09b8-726d-4f1b-94ba-368a66af2246@redhat.com>
 <2b6faaa5-b21e-a512-de7d-ca21be5045fc@gmail.com> <20190214230307.GA17358@amd>
 <2a5e2002-e5f1-6da3-8a43-317801b69657@redhat.com>
 <3d5407a7-9458-f071-a1d5-511b09678e20@gmail.com>
 <87a21c4e-8e5e-c180-2ff3-eb8170746e71@redhat.com>
 <80971bc3-1193-83ed-913a-12f6217016c8@gmail.com>
 <b15fd048-8206-4057-a354-07dc14ca15e3@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b15fd048-8206-4057-a354-07dc14ca15e3@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Hans,

On 2/16/19 12:14 AM, Hans de Goede wrote:
> Hi,
> 
> On 2/15/19 11:31 PM, Jacek Anaszewski wrote:
>> On 2/15/19 11:26 PM, Hans de Goede wrote:
> 
> <snip>
> 
>>> I think that should work fine, which means that we can use the timer and
>>> pattern trigger support for the blinking and breathing modes.
>>>
>>> That still leaves the switching between user and hw-control modes,
>>> as discussed the hw-controlled mode could be modelled as a new 
>>> "hardware"
>>> trigger, but then we cannot choose between on/blink/breathing when
>>> in hw-controlled mode. As Pavel mentioned, that would require some
>>> sort of composed trigger, where we have both the hardware and
>>> timer triggers active for example.
>>>
>>> I think it might be easier to just allow turning on/off the hardware
>>> control mode through a special "hardware_control" sysfs attribute and
>>> then use the existing timer and pattern triggers for blinking / 
>>> breathing.
>>
>> Pattern trigger exposes pattern file by default and hw_pattern if
>> pattern_set/get ops are provided. Writing them enables software and
>> hardware pattern respectively.
> 
> This is not about software vs hardware pattern.
> 
> There are 2 *orthogonal*, separate problems/challenges with this LED 
> controller:
> 
> 1) It has hardware blinking and breathing, as discussed this can be
> controlled through the timer and pattern triggers, so this problem
> is solved.
> 
> 2) It has 2 operating modes:
> 
> a) Automatic/hardware controlled, in this mode the LED is turned
> off or on (where on can be continues on, blinking or breathing)
> by the hardware itself, when in this mode we / userspace is not
> in control of the LED
> 
> b) Manual/user controlled mode, in this mode we / userspace can
> control of the LED.
> 
> Currently there is no API in the ledclass to switch a LED from
> automatic controlled to user controlled and back, This is what
> the proposed hardware trigger was for, to switch to automatic
> mode. A problem with this is that we still want to be able
> to chose between continues on, blinking or breathing (when on),
> configure the max brightness, etc.

Yes, we do have the API to switch a LED from automatic (hardware
accelerated) control to software control and back. This is pattern
trigger, which exposes two files for setting pattern: pattern
and hw_pattern. Writing pattern file switches the device to software
control mode and writing hw_pattern switches it to the hardware control,
with the possibility of defining device specific ABI syntax to enable
particular pattern (blinking, breathing or event permanently on
in case of this device).

The hw_pattern is device specific, so the device specific ABI
documentation can state that when the pattern trigger is enabled
for this device in hw accelerated mode, then it will blink the
LED only when specific conditions are met - in this case it will
be activation of charging.

Since timer trigger does not allow to explicitly choose between
software and hardware timer engine, then I propose to not take
it into account for supporting hardware blinking offered by
this device. Enabling pattern trigger will just periodically
set brightness of the LED.

Since pattern trigger is a superset of timer, then it can handle
ordinary blinking as well.

> Since there cannot be more then 1 trigger active, with the
> hardware trigger solution we cannot say we want automatic
> control (hardware trigger) and blinking when the automatic
> mode says the LED should be on (timer trigger) as that
> would mean having 2 triggers active with the hardware
> trigger solution.
> 
> As such I think the switch between automatic and manual
> control would be best exported through a special "hardware_control"
> sysfs attribute and then use the existing timer and pattern
> triggers for blinking / breathing.
> 
> Regards,
> 
> Hans
> 

-- 
Best regards,
Jacek Anaszewski
