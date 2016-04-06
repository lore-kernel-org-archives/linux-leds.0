From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 6 Apr 2016 11:53:23 +0200
Message-ID: <5704DC93.6050104@gmail.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33148 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755059AbcDFJyI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 05:54:08 -0400
In-Reply-To: <20160406085248.GB10196@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

On 04/06/2016 10:52 AM, Pavel Machek wrote:
> Hi!
>
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
>
> Well, RGB leds are basically useless without pattern support. And I
> believe we can do generic interface.
>
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
>
> Having one attribute across three devices is rather ugly. And we'll
> need to solve the pattern issue one day.
>
> What's tricky about patterns is that you need to control 3 (or more)
> leds at a time. Problem you are trying to solve here is ... control of
> 3 leds, at the same time.
>
> So let's solve them together.

OK, now I've got your point. So we'd need to have a means for defining
patterns. The interface could be located at /sys/class/leds/patterns.

We'd need to have a flexible way for defining LED class devices involved
in a pattern. Since we cannot guarantee no space in a LED class device
name, then a single attribute containing space separated list is not an
option. We'd have to create a predefined set of attributes that would
contain LED class device name. Predefined implies that it would be
a fixed number, i.e. either some attributes would always remain unused
or, which is even worse, we could run out of free attributes for some
use cases.

The same constraints would appear if we wanted to be able to define
more than one pattern.

It would be best to work out more flexible solution. I wonder if
ioctl interface isn't the only option.

-- 
Best regards,
Jacek Anaszewski
