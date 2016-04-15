From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 15 Apr 2016 13:53:30 +0200
Message-ID: <20160415115330.GA18196@amd>
References: <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
 <20160406085248.GB10196@amd>
 <5704DC93.6050104@gmail.com>
 <20160407204540.GA11202@amd>
 <5707FCC0.6000204@gmail.com>
 <20160409160142.GD19362@xo-6d-61-c0.localdomain>
 <570CA014.7000709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56292 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428AbcDOLxh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 15 Apr 2016 07:53:37 -0400
Content-Disposition: inline
In-Reply-To: <570CA014.7000709@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com

Hi!

> >>How about implementing patterns as a specific typer of triggers?
> >>Let's say we have ledtrig-rgb-pattern:
> >
> >Well, we'd need ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, ... , as we
> >can have more than one rgb led. But yes.
> 
> Triggers can have many listeners, i.e. led_trigger_event() sets
> brightness on all LED class devices registered on given trigger.
> We could have led_trigger_rgb_event() that would set brightness
> on all groups-of-three LEDs registered on given rgb-trigger.

I do not understand that.

> I agree that ledtrig-rgb-pattern-1, ledtrig-rgb-pattern-2, etc. would
> be also needed to add a capability of setting different colors on
> different LED devices.

Ok.

> >For patterns, I'd suggest array of (r g b time) values.
> >
> >Pattern engines can do stuff like "slowly turn LED from off to red, then switch color to
> >white, then slowly turn it to yellow, then turn it off at once" with defined speeds
> >for "slowly" and option of either linear on non-linear brightness ramping.
> >
> >The last option might be a bit too much, but I believe we should support the rest.
> 
> Yes, that's an interesting idea. It also turns out that trigger based
> patterns could be also used for defining generic patterns for a group
> of monochrome LEDs.

Yes, controlling monochrome LEDs synchronously is another task for
patterns. Actually, N900 uses that to control 6 keyboard backlight
LEDs synchronously... and yes, it would be somehow nice to preserve
this functionality.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
