From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 6 Apr 2016 00:15:11 +0200
Message-ID: <570438EF.4080904@gmail.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
 <5704236D.5080805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5704236D.5080805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrik Bachan <patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Heiner,

Thanks for the feedback.

On 04/05/2016 10:43 PM, Heiner Kallweit wrote:
> Am 05.04.2016 um 21:45 schrieb Jacek Anaszewski:
>> On 04/05/2016 11:01 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>>>> It would have the same downsides as in case of having r, g and b in
>>>>>>>> separate attributes, i.e. - problems with setting LED colour in
>>>>>>>> a consistent way. This way LED blinking in whatever colour couldn't
>>>>>>>> be supported reliably. It was one of your primary rationale standing
>>>>>>>> behind this design, if I remember correctly. Second - what about
>>>>>>>> triggers? We've had a long discussion about it and this design turned
>>>>>>>> out to be most fitting.
>>>>>>>
>>>>>>> Are on/off triggers really that useful for a LED that can produce 16
>>>>>>> million colors?
>>>>>>>
>>>>>>> I believe we should support patterns for RGB LEDs. Something like
>>>>>>> [ (time, r, g, b), ... ] . Ok, what about this one?
>>>>>>>
>>>>>>> Lets say we have
>>>>>>>
>>>>>>> /sys/class/pattern/lp5533::0
>>>>>>> /sys/class/pattern/software::0
>>>>>>>
>>>>>>> /sys/class/led/n900::red ; default trigger "lp5533::0:0"
>>>>>>> /sys/class/led/n900::green ; default trigger "lp5533::0:1"
>>>>>>> /sys/class/led/n900::blue ; default trigger "lp5533::0:2"
>>>>>>>
>>>>>>> Normally, pattern would correspond to one RGB LED. We could have
>>>>>>> attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
>>>>>>> this pattern.
>>>>
>>>> Could you give an example on how to set a color for RGB LED using
>>>> this interface? Would it be compatible with LED triggers?
>>>> Where the "pattern" class would be implemented?
>>>
>>> Well, 'echo "50 60 70" > /sys/class/pattern/lp5533::0/color' should
>>> set the color for the led. 'echo "trigger-name" > trigger' would set
>>> the trigger, probably just toggling between LED off and set color for
>>> the old triggers.
>>>
>>> Where to implement the patterns is different question, but for example
>>> drivers/leds/pattern?
>>
>> I'd rather leave the pattern issue for now, since it seems to be
>> different from the problem Heiner was trying to solve with his LED RGB
>> extension. Moreover, hardware patterns are device specific and it could
>> be hard to propose a generic interface.
>> Drivers can always expose their custom sysfs attributes for configuring
>> the patterns.
>>
>> Regardless of the above, some of your considerations brought me an idea
>> on how to add generic and backwards compatible support for setting RGB
>> color at one go.
>>
>> Currently LED class drivers of RGB LED controllers expose three LED
>> class devices - one per R, G and B color component. I propose that
>> such drivers set LED_DEV_CAP_RGB flag for each LED class device they
>> register. LED core, seeing the flag, would create a generic "color"
>> sysfs attribute for each of the three LED class devices.
>>
>> The "color" attribute would contain "R G B" values. Setting the "color"
>> attribute of any of the three LED class devices would affect brightness
>> properties (i.e. constituent colors) of the remaining two ones.
>> It would result in disabling any active triggers and writing all the
>> three color settings to the RGB LED controller at one go.
>>
>> We would probably need additional op in the LED core : color_set.
>>
>> Having the color set to nonzero value would signify the the three LED
>> class devices are in sync and that setting a trigger on any of them
>> applies to the remaining two ones. It would have to be considered
>> whether existing triggers could be made compatible with synchronized
>> RGB LED class devices.
>>
>> I'm curious what do you think about the idea.
>>
>> Pavel, Heiner, others?
>>
 >
> Exposing "coupled LED devices" as separate LED devices most likely is ok
> when accessed from user space as the name of the led_classdev's indicates
> that they belong together.
> But how about a trigger wanting to set a RGB LED to a specific color?

RGB triggers would use a new color_set op. It means that currently
implemented triggers would be unable to set arbitrary color, but
they could be used only in a monochrome context.

> (That's not available yet but one possible use case for RGB LED's)
> A trigger is bound to a led_classdev currently. In addition we'd need
> to introduce some kind of super_led_classdev having links to the respective
> R/G/B led_classdev's (+ trigger functions dealing with this super_led_classdev).
>
> These changes / extensions are not needed if a RGB LED is exposed as one
> led_classdev, just with flag LED_DEV_CAP_RGB set.
> OK, we'd still have to change the sysfs interface as obviously setting
> hue/sat/brightness via one "brightness" attribute is not acceptable.
> However this constraint might not affect the kernel-internal trigger API
> (usage of parameter brightness in led_trigger_event).

We would still have to abuse brightness parameter semantics.

> I see Pavel's point that there might be different types of multi-color LED's.
> At least we have:
> - multi-color LED's where each single LED is visible even if all are switched on
> - multi-color LED's like RGB LED's where you usually just see a uniform color

I think that if we are talking about RGB LEDs it is always the second
case.

> Last but not least regarding the patterns:
> Something like proposed by Pavel is e.g. (partially) supported by the blink(1)
> firmware. That would be an example of such a "hardware-accelerated" pattern.
>
> As I see it the current blinking support then would be one special case of a pattern.
> As a consequence once having pattern support we might be able to switch users of blinking
> to pattern and remove the blinking support.

Let's split patterns related discussion into a separate thread.
It would be best if it began with a patch.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
