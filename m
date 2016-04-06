From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 6 Apr 2016 11:12:28 +0200
Message-ID: <20160406091228.GC10196@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
 <5704236D.5080805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33788 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753410AbcDFJMc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 05:12:32 -0400
Content-Disposition: inline
In-Reply-To: <5704236D.5080805@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

Hi!

> > We would probably need additional op in the LED core : color_set.
> > 
> > Having the color set to nonzero value would signify the the three LED
> > class devices are in sync and that setting a trigger on any of them
> > applies to the remaining two ones. It would have to be considered
> > whether existing triggers could be made compatible with synchronized
> > RGB LED class devices.
> > 
> > I'm curious what do you think about the idea.
> > 
> > Pavel, Heiner, others?
> > 
> Exposing "coupled LED devices" as separate LED devices most likely is ok
> when accessed from user space as the name of the led_classdev's indicates
> that they belong together.
> But how about a trigger wanting to set a RGB LED to a specific color?
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

Your proposal would break existing hardware. We already have RGB LEDs
exposed as three LEDs. It is too late to change interface there.

> I see Pavel's point that there might be different types of multi-color LED's.
> At least we have:
> - multi-color LED's where each single LED is visible even if all are switched on
> - multi-color LED's like RGB LED's where you usually just see a
> uniform color

Well, I suggest we ignore that distinction. Yes, I can see different
colors coming from different directions, but the LED was clearly
designed to look like single light. 

> Last but not least regarding the patterns:
> Something like proposed by Pavel is e.g. (partially) supported by the blink(1)
> firmware. That would be an example of such a "hardware-accelerated" pattern.
> 
> As I see it the current blinking support then would be one special case of a pattern.
> As a consequence once having pattern support we might be able to switch users of blinking
> to pattern and remove the blinking support.

No, you can't remove existing blinking support, due to backwards
compatibility reasons.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
