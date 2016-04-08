From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 8 Apr 2016 20:47:28 +0200
Message-ID: <5707FCC0.6000204@gmail.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd> <5704DC93.6050104@gmail.com>
 <20160407204540.GA11202@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160407204540.GA11202@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com
List-Id: linux-leds@vger.kernel.org

On 04/07/2016 10:45 PM, Pavel Machek wrote:
> Hi!
>
>>>> The "color" attribute would contain "R G B" values. Setting the "color"
>>>> attribute of any of the three LED class devices would affect brightness
>>>> properties (i.e. constituent colors) of the remaining two ones.
>>>> It would result in disabling any active triggers and writing all the
>>>> three color settings to the RGB LED controller at one go.
>>>
>>> Having one attribute across three devices is rather ugly. And we'll
>>> need to solve the pattern issue one day.
>>>
>>> What's tricky about patterns is that you need to control 3 (or more)
>>> leds at a time. Problem you are trying to solve here is ... control of
>>> 3 leds, at the same time.
>>>
>>> So let's solve them together.
>>
>> OK, now I've got your point. So we'd need to have a means for defining
>> patterns. The interface could be located at /sys/class/leds/patterns.
>>
>> We'd need to have a flexible way for defining LED class devices involved
>> in a pattern. Since we cannot guarantee no space in a LED class device
>> name, then a single attribute containing space separated list is not an
>> option. We'd have to create a predefined set of attributes that would
>> contain LED class device name. Predefined implies that it would be
>> a fixed number, i.e. either some attributes would always remain unused
>> or, which is even worse, we could run out of free attributes for some
>> use cases.
>
> There's a better solution: make pattern behave as a trigger for leds
> it controls.
>
> So we'd have
>
> /sys/class/leds/patterns/lp5523
>
> then we'd have
>
> /sys/class/leds/lp5523::red/trigger = "lp5523:1"
> /sys/class/leds/lp5523::green/trigger = "lp5523:2"
> /sys/class/leds/lp5523::blue/trigger = "lp5523:3"
>
> (or something similar, I'd have to boot the n900 to see the exact
> names).

How about implementing patterns as a specific typer of triggers?
Let's say we have ledtrig-rgb-pattern:

After setting a trigger following sysfs attribute would appear
in a LED class device sysfs interface:

$cat /sys/class/lp5523::red/rgb_color
red green blue [none]

$echo "red" > /sys/class/leds/lp5523::red/rgb_color

and similarly

$echo "green" > /sys/class/leds/lp5523::green/rgb_color
$echo "blue" > /sys/class/leds/lp5523::blue/rgb_color

Similar approach could be applied for blink patterns:
There could be additional attributes provided for defining
the position in a blink sequence, or/and blink period.

Now it has become apparent to me that triggers in fact assure
LED class device synchronization.

> That means that we don't need space-separated lists. (And actually
> gives us more flexibility; Maemo for example used the pattern engine
> not for RGB led, but for 6 keyboard backlight leds.)
>
>> The same constraints would appear if we wanted to be able to define
>> more than one pattern.
>
> We'd like to have more than one pattern _engine_, but it should be
> enough to have one pattern per pattern engine at a time.
>
>> It would be best to work out more flexible solution. I wonder if
>> ioctl interface isn't the only option.
>
> Well, there's configs, which is more flexible, but...
>
> Best regards,
>
> 									Pavel
>

-- 
Best regards,
Jacek Anaszewski
