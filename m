From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 1 Apr 2016 20:56:04 +0200
Message-ID: <56FEC444.4040106@gmail.com>
References: <20160401135748.GD11860@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32859 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022AbcDAS4f (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 1 Apr 2016 14:56:35 -0400
In-Reply-To: <20160401135748.GD11860@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com



On 04/01/2016 03:57 PM, Pavel Machek wrote:
> Hi!
> On Wed 2016-03-30 09:57:38, Jacek Anaszewski wrote:
>> Hi Heiner and Pavel,
>>
>> On 03/29/2016 10:38 PM, Heiner Kallweit wrote:
>>> Am 29.03.2016 um 12:02 schrieb Pavel Machek:
>>>> Hi!
>>>>
>>>> First, please Cc me on RGB color support.
>>>>
>>>>> Add generic support for RGB Color LED's.
>>>>>
>>>>> Basic idea is to use enum led_brightness also for the hue and saturation
>>>>> color components.This allows to implement the color extension w/o
>>>>> changes to struct led_classdev.
>>>>>
>>>>> Select LEDS_RGB to enable building drivers using the RGB extension.
>>>>>
>>>>> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
>>>>> should be overridden even if the provided values are zero.
>>>>>
>>>>> Some examples for writing values to /sys/class/leds/<xx>/brightness:
>>>>> (now also hex notation can be used)
>>>>>
>>>>> 255 -> set full brightness and keep existing color if set
>>>>> 0 -> switch LED off but keep existing color so that it can be restored
>>>>>       if the LED is switched on again later
>>>>> 0x1000000 -> switch LED off and set also hue and saturation to 0
>>>>> 0x00ffff -> set full brightness, full saturation and set hue to 0
>>>>> (red)
>>>>
>>>> Umm, that's rather strange interface -- and three values in single sysfs
>>>> file is actually forbidden.
>>>>
>>>> Plus, it is very much unlike existing interfaces for RGB LEDs, which
>>>> we already have supported in the tree. (At least nokia N900 and Sony
>>>> motion controller already contain supported three-color LEDs).
>>>>
>>>> Now... yes, there's work to be done for the 3-color LEDs. Currently,
>>>> they are treated as three different LEDs. (Which makes some sense, you
>>>> can use "battery charging" trigger for LED, and CPU activity trigger
>>>> for green, for example). It would be good to have some kind of
>>>> grouping, so that userspace can tell "these 3 leds are actually
>>>> combined into one light".
> Hi!
>
>>> At first thanks for the review comments.
>>> Treating the three physical LEDs of a RGB LED as separate LED devices
>>> might have been implemented due to the lack of alternatives.
>>> With one trigger controlling the red LED and another controlling the green
>>> LED we may end up with a yellow light. Not sure whether this is what we want.
>>>
>>> One driver for this extension was the idea of triggers using color
>>> to visualize states etc.
>>> Therefore it's not only about userspace controlling the color.
>>> As a trigger is bound to a led_classdev we need a led_classdev
>>> representing a RGB LED device.
>>>
>>> And ok: If required the sysfs interface can be splitted into separate
>>> attributes for hue, saturation, and (existing) brightness.
>>
>> It would have the same downsides as in case of having r, g and b in
>> separate attributes, i.e. - problems with setting LED colour in
>> a consistent way. This way LED blinking in whatever colour couldn't
>> be supported reliably. It was one of your primary rationale standing
>> behind this design, if I remember correctly. Second - what about
>> triggers? We've had a long discussion about it and this design turned
>> out to be most fitting.
>
> Are on/off triggers really that useful for a LED that can produce 16
> million colors?
>
> I believe we should support patterns for RGB LEDs. Something like
> [ (time, r, g, b), ... ] . Ok, what about this one?
>
> Lets say we have
>
> /sys/class/pattern/lp5533::0
> /sys/class/pattern/software::0
>
> /sys/class/led/n900::red ; default trigger "lp5533::0:0"
> /sys/class/led/n900::green ; default trigger "lp5533::0:1"
> /sys/class/led/n900::blue ; default trigger "lp5533::0:2"
>
> Normally, pattern would correspond to one RGB LED. We could have
> attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
> this pattern.

This involves the same issue you were opposed to: three values per
sysfs attribute.

> Then we could have normal "trigger" mechanism, working
> with the color used. Probably recognizing "none" for manual control,
> and "pattern" for pattern control. (Pattern would be controlled as
> described above).
>
>> It's hard to address these requirements by having the settings in
>> separate attributes, due to synchronization issues, and LED trigger
>> mechanism specificity.
>>
>> There is a question whether we can bend the sysfs "one value per sysfs
>> file" rule down to RGB LEDs needs.
>>
>> Of course other brilliant ideas on how to approach the problem are
>> more than expected.
>
> linux-api sounds like interesting idea, please cc me if you do that.
>
> Best regards,
> 									Pavel
>

-- 
Best regards,
Jacek Anaszewski
