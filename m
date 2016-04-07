From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Thu, 7 Apr 2016 22:45:40 +0200
Message-ID: <20160407204540.GA11202@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd>
 <5704DC93.6050104@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45116 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753278AbcDGUpo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2016 16:45:44 -0400
Content-Disposition: inline
In-Reply-To: <5704DC93.6050104@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

Hi!

> >>The "color" attribute would contain "R G B" values. Setting the "color"
> >>attribute of any of the three LED class devices would affect brightness
> >>properties (i.e. constituent colors) of the remaining two ones.
> >>It would result in disabling any active triggers and writing all the
> >>three color settings to the RGB LED controller at one go.
> >
> >Having one attribute across three devices is rather ugly. And we'll
> >need to solve the pattern issue one day.
> >
> >What's tricky about patterns is that you need to control 3 (or more)
> >leds at a time. Problem you are trying to solve here is ... control of
> >3 leds, at the same time.
> >
> >So let's solve them together.
> 
> OK, now I've got your point. So we'd need to have a means for defining
> patterns. The interface could be located at /sys/class/leds/patterns.
> 
> We'd need to have a flexible way for defining LED class devices involved
> in a pattern. Since we cannot guarantee no space in a LED class device
> name, then a single attribute containing space separated list is not an
> option. We'd have to create a predefined set of attributes that would
> contain LED class device name. Predefined implies that it would be
> a fixed number, i.e. either some attributes would always remain unused
> or, which is even worse, we could run out of free attributes for some
> use cases.

There's a better solution: make pattern behave as a trigger for leds
it controls.

So we'd have

/sys/class/leds/patterns/lp5523

then we'd have

/sys/class/leds/lp5523::red/trigger = "lp5523:1"
/sys/class/leds/lp5523::green/trigger = "lp5523:2"
/sys/class/leds/lp5523::blue/trigger = "lp5523:3"

(or something similar, I'd have to boot the n900 to see the exact
names).

That means that we don't need space-separated lists. (And actually
gives us more flexibility; Maemo for example used the pattern engine
not for RGB led, but for 6 keyboard backlight leds.)

> The same constraints would appear if we wanted to be able to define
> more than one pattern.

We'd like to have more than one pattern _engine_, but it should be
enough to have one pattern per pattern engine at a time. 

> It would be best to work out more flexible solution. I wonder if
> ioctl interface isn't the only option.

Well, there's configs, which is more flexible, but...

Best regards,

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
