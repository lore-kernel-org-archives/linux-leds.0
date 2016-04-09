From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Sat, 9 Apr 2016 18:01:43 +0200
Message-ID: <20160409160142.GD19362@xo-6d-61-c0.localdomain>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd>
 <5704DC93.6050104@gmail.com>
 <20160407204540.GA11202@amd>
 <5707FCC0.6000204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5707FCC0.6000204@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com
List-Id: linux-leds@vger.kernel.org

Hi!

> >>>What's tricky about patterns is that you need to control 3 (or more)
> >>>leds at a time. Problem you are trying to solve here is ... control of
> >>>3 leds, at the same time.
> >>>
> >>>So let's solve them together.
> >>
> >>OK, now I've got your point. So we'd need to have a means for defining
> >>patterns. The interface could be located at /sys/class/leds/patterns.
> >>
> >>We'd need to have a flexible way for defining LED class devices involved
> >>in a pattern. Since we cannot guarantee no space in a LED class device
> >>name, then a single attribute containing space separated list is not an
> >>option. We'd have to create a predefined set of attributes that would
> >>contain LED class device name. Predefined implies that it would be
> >>a fixed number, i.e. either some attributes would always remain unused
> >>or, which is even worse, we could run out of free attributes for some
> >>use cases.
> >
> >There's a better solution: make pattern behave as a trigger for leds
> >it controls.
> >
> >So we'd have
> >
> >/sys/class/leds/patterns/lp5523
> >
> >then we'd have
> >
> >/sys/class/leds/lp5523::red/trigger = "lp5523:1"
> >/sys/class/leds/lp5523::green/trigger = "lp5523:2"
> >/sys/class/leds/lp5523::blue/trigger = "lp5523:3"
> >
> >(or something similar, I'd have to boot the n900 to see the exact
> >names).
> 
> How about implementing patterns as a specific typer of triggers?
> Let's say we have ledtrig-rgb-pattern:

Well, we'd need ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, ... , as we
can have more than one rgb led. But yes.

> After setting a trigger following sysfs attribute would appear
> in a LED class device sysfs interface:
> 
> $cat /sys/class/lp5523::red/rgb_color
> red green blue [none]
> 
> $echo "red" > /sys/class/leds/lp5523::red/rgb_color
> 
> and similarly
> 
> $echo "green" > /sys/class/leds/lp5523::green/rgb_color
> $echo "blue" > /sys/class/leds/lp5523::blue/rgb_color

Yes, that would work -- selecting channels from the pattern.

> Similar approach could be applied for blink patterns:
> There could be additional attributes provided for defining
> the position in a blink sequence, or/and blink period.

For patterns, I'd suggest array of (r g b time) values.

Pattern engines can do stuff like "slowly turn LED from off to red, then switch color to
white, then slowly turn it to yellow, then turn it off at once" with defined speeds
for "slowly" and option of either linear on non-linear brightness ramping.

The last option might be a bit too much, but I believe we should support the rest.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
