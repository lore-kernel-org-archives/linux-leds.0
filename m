From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Tue, 29 Mar 2016 23:43:23 +0200
Message-ID: <20160329214323.GA10455@amd>
References: <56D608ED.2090406@gmail.com>
 <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59544 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251AbcC2Vn1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 29 Mar 2016 17:43:27 -0400
Content-Disposition: inline
In-Reply-To: <56FAE7A8.2070302@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, patrikbachan@gmail.com, serge@hallyn.com
Cc: Greg KH <greg@kroah.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

Hi!

> > First, please Cc me on RGB color support.
> > 
> >> Add generic support for RGB Color LED's.
> >>
> >> Basic idea is to use enum led_brightness also for the hue and saturation
> >> color components.This allows to implement the color extension w/o
> >> changes to struct led_classdev.
> >>
> >> Select LEDS_RGB to enable building drivers using the RGB extension.
> >>
> >> Flag LED_SET_HUE_SAT allows to specify that hue / saturation
> >> should be overridden even if the provided values are zero.
> >>
> >> Some examples for writing values to /sys/class/leds/<xx>/brightness:
> >> (now also hex notation can be used)
> >>
> >> 255 -> set full brightness and keep existing color if set
> >> 0 -> switch LED off but keep existing color so that it can be restored
> >>      if the LED is switched on again later
> >> 0x1000000 -> switch LED off and set also hue and saturation to 0
> >> 0x00ffff -> set full brightness, full saturation and set hue to 0
> >> (red)
> > 
> > Umm, that's rather strange interface -- and three values in single sysfs
> > file is actually forbidden.
> > 
> > Plus, it is very much unlike existing interfaces for RGB LEDs, which
> > we already have supported in the tree. (At least nokia N900 and Sony
> > motion controller already contain supported three-color LEDs).
> > 
> > Now... yes, there's work to be done for the 3-color LEDs. Currently,
> > they are treated as three different LEDs. (Which makes some sense, you
> > can use "battery charging" trigger for LED, and CPU activity trigger
> > for green, for example). It would be good to have some kind of
> > grouping, so that userspace can tell "these 3 leds are actually
> > combined into one light".
> > 
> At first thanks for the review comments.
> Treating the three physical LEDs of a RGB LED as separate LED devices
> might have been implemented due to the lack of alternatives.

To be fair... they _are_ separate LED devices. In N900 case, you can
even see light comming from slightly different places if you look closely.

> With one trigger controlling the red LED and another controlling the green
> LED we may end up with a yellow light. Not sure whether this is what
> we want.

Well, it should be understandable for most people.

> One driver for this extension was the idea of triggers using color
> to visualize states etc.
> Therefore it's not only about userspace controlling the color.
> As a trigger is bound to a led_classdev we need a led_classdev
> representing a RGB LED device.
> 
> And ok: If required the sysfs interface can be splitted into separate
> attributes for hue, saturation, and (existing) brightness.

Required.

Ok, so:

a) Do we want RGB leds to be handled by existing subsystem, or do we
need separate layer on top of that?

b) Does RGB make sense, or HSV? RGB is quite widely used in graphics,
and it is what hardware implements. (But we'd need to do gamma
correction).

c) My hardware has "acceleration engine", LED is independend from
CPU. That's rather big deal. Does yours? It seems to be quite common,
at least in cellphones.

Ideally, I'd like to have "triggers", but different ones. As in: if
charging, do yellow " .xX" pattern. If fully charged, do green steady
light. If message is waiting, do blue " x x" pattern. If none of
above, do slow white blinking. (Plus priorities of events). But that's
quite different from existing support...)

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
