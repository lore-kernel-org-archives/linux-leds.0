From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Tue, 5 Apr 2016 22:43:25 +0200
Message-ID: <5704236D.5080805@gmail.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36697 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbcDEUnh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 5 Apr 2016 16:43:37 -0400
In-Reply-To: <570415C4.5070003@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

Am 05.04.2016 um 21:45 schrieb Jacek Anaszewski:
> On 04/05/2016 11:01 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>>>> It would have the same downsides as in case of having r, g and b in
>>>>>>> separate attributes, i.e. - problems with setting LED colour in
>>>>>>> a consistent way. This way LED blinking in whatever colour couldn't
>>>>>>> be supported reliably. It was one of your primary rationale standing
>>>>>>> behind this design, if I remember correctly. Second - what about
>>>>>>> triggers? We've had a long discussion about it and this design turned
>>>>>>> out to be most fitting.
>>>>>>
>>>>>> Are on/off triggers really that useful for a LED that can produce 16
>>>>>> million colors?
>>>>>>
>>>>>> I believe we should support patterns for RGB LEDs. Something like
>>>>>> [ (time, r, g, b), ... ] . Ok, what about this one?
>>>>>>
>>>>>> Lets say we have
>>>>>>
>>>>>> /sys/class/pattern/lp5533::0
>>>>>> /sys/class/pattern/software::0
>>>>>>
>>>>>> /sys/class/led/n900::red ; default trigger "lp5533::0:0"
>>>>>> /sys/class/led/n900::green ; default trigger "lp5533::0:1"
>>>>>> /sys/class/led/n900::blue ; default trigger "lp5533::0:2"
>>>>>>
>>>>>> Normally, pattern would correspond to one RGB LED. We could have
>>>>>> attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
>>>>>> this pattern.
>>>
>>> Could you give an example on how to set a color for RGB LED using
>>> this interface? Would it be compatible with LED triggers?
>>> Where the "pattern" class would be implemented?
>>
>> Well, 'echo "50 60 70" > /sys/class/pattern/lp5533::0/color' should
>> set the color for the led. 'echo "trigger-name" > trigger' would set
>> the trigger, probably just toggling between LED off and set color for
>> the old triggers.
>>
>> Where to implement the patterns is different question, but for example
>> drivers/leds/pattern?
> 
> I'd rather leave the pattern issue for now, since it seems to be
> different from the problem Heiner was trying to solve with his LED RGB
> extension. Moreover, hardware patterns are device specific and it could
> be hard to propose a generic interface.
> Drivers can always expose their custom sysfs attributes for configuring
> the patterns.
> 
> Regardless of the above, some of your considerations brought me an idea
> on how to add generic and backwards compatible support for setting RGB
> color at one go.
> 
> Currently LED class drivers of RGB LED controllers expose three LED
> class devices - one per R, G and B color component. I propose that
> such drivers set LED_DEV_CAP_RGB flag for each LED class device they
> register. LED core, seeing the flag, would create a generic "color"
> sysfs attribute for each of the three LED class devices.
> 
> The "color" attribute would contain "R G B" values. Setting the "color"
> attribute of any of the three LED class devices would affect brightness
> properties (i.e. constituent colors) of the remaining two ones.
> It would result in disabling any active triggers and writing all the
> three color settings to the RGB LED controller at one go.
> 
> We would probably need additional op in the LED core : color_set.
> 
> Having the color set to nonzero value would signify the the three LED
> class devices are in sync and that setting a trigger on any of them
> applies to the remaining two ones. It would have to be considered
> whether existing triggers could be made compatible with synchronized
> RGB LED class devices.
> 
> I'm curious what do you think about the idea.
> 
> Pavel, Heiner, others?
> 
Exposing "coupled LED devices" as separate LED devices most likely is ok
when accessed from user space as the name of the led_classdev's indicates
that they belong together.
But how about a trigger wanting to set a RGB LED to a specific color?
(That's not available yet but one possible use case for RGB LED's)
A trigger is bound to a led_classdev currently. In addition we'd need
to introduce some kind of super_led_classdev having links to the respective
R/G/B led_classdev's (+ trigger functions dealing with this super_led_classdev).

These changes / extensions are not needed if a RGB LED is exposed as one
led_classdev, just with flag LED_DEV_CAP_RGB set.
OK, we'd still have to change the sysfs interface as obviously setting
hue/sat/brightness via one "brightness" attribute is not acceptable.
However this constraint might not affect the kernel-internal trigger API
(usage of parameter brightness in led_trigger_event).

I see Pavel's point that there might be different types of multi-color LED's.
At least we have:
- multi-color LED's where each single LED is visible even if all are switched on
- multi-color LED's like RGB LED's where you usually just see a uniform color

Last but not least regarding the patterns:
Something like proposed by Pavel is e.g. (partially) supported by the blink(1)
firmware. That would be an example of such a "hardware-accelerated" pattern.

As I see it the current blinking support then would be one special case of a pattern.
As a consequence once having pattern support we might be able to switch users of blinking
to pattern and remove the blinking support.

Regards, Heiner
