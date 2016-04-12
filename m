From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color LED's
Date: Tue, 12 Apr 2016 09:13:24 +0200
Message-ID: <570CA014.7000709@samsung.com>
References: <20160401135748.GD11860@amd> <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd> <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd> <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd> <5704DC93.6050104@gmail.com>
 <20160407204540.GA11202@amd> <5707FCC0.6000204@gmail.com>
 <20160409160142.GD19362@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160409160142.GD19362-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrik Bachan <patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 04/09/2016 06:01 PM, Pavel Machek wrote:
> Hi!
>
>>>>> What's tricky about patterns is that you need to control 3 (or more)
>>>>> leds at a time. Problem you are trying to solve here is ... control of
>>>>> 3 leds, at the same time.
>>>>>
>>>>> So let's solve them together.
>>>>
>>>> OK, now I've got your point. So we'd need to have a means for defining
>>>> patterns. The interface could be located at /sys/class/leds/patterns.
>>>>
>>>> We'd need to have a flexible way for defining LED class devices involved
>>>> in a pattern. Since we cannot guarantee no space in a LED class device
>>>> name, then a single attribute containing space separated list is not an
>>>> option. We'd have to create a predefined set of attributes that would
>>>> contain LED class device name. Predefined implies that it would be
>>>> a fixed number, i.e. either some attributes would always remain unused
>>>> or, which is even worse, we could run out of free attributes for some
>>>> use cases.
>>>
>>> There's a better solution: make pattern behave as a trigger for leds
>>> it controls.
>>>
>>> So we'd have
>>>
>>> /sys/class/leds/patterns/lp5523
>>>
>>> then we'd have
>>>
>>> /sys/class/leds/lp5523::red/trigger = "lp5523:1"
>>> /sys/class/leds/lp5523::green/trigger = "lp5523:2"
>>> /sys/class/leds/lp5523::blue/trigger = "lp5523:3"
>>>
>>> (or something similar, I'd have to boot the n900 to see the exact
>>> names).
>>
>> How about implementing patterns as a specific typer of triggers?
>> Let's say we have ledtrig-rgb-pattern:
>
> Well, we'd need ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, ... , as we
> can have more than one rgb led. But yes.

Triggers can have many listeners, i.e. led_trigger_event() sets
brightness on all LED class devices registered on given trigger.
We could have led_trigger_rgb_event() that would set brightness
on all groups-of-three LEDs registered on given rgb-trigger.

I agree that ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, etc. would
be also needed to add a capability of setting different colors on
different LED devices.

>> After setting a trigger following sysfs attribute would appear
>> in a LED class device sysfs interface:
>>
>> $cat /sys/class/lp5523::red/rgb_color
>> red green blue [none]
>>
>> $echo "red" > /sys/class/leds/lp5523::red/rgb_color
>>
>> and similarly
>>
>> $echo "green" > /sys/class/leds/lp5523::green/rgb_color
>> $echo "blue" > /sys/class/leds/lp5523::blue/rgb_color
>
> Yes, that would work -- selecting channels from the pattern.
>
>> Similar approach could be applied for blink patterns:
>> There could be additional attributes provided for defining
>> the position in a blink sequence, or/and blink period.
>
> For patterns, I'd suggest array of (r g b time) values.
>
> Pattern engines can do stuff like "slowly turn LED from off to red, then switch color to
> white, then slowly turn it to yellow, then turn it off at once" with defined speeds
> for "slowly" and option of either linear on non-linear brightness ramping.
>
> The last option might be a bit too much, but I believe we should support the rest.

Yes, that's an interesting idea. It also turns out that trigger based
patterns could be also used for defining generic patterns for a group
of monochrome LEDs.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
