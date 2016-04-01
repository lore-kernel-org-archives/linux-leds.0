From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 1 Apr 2016 14:52:17 +0200
Message-ID: <20160401125217.GA11860@amd>
References: <56D608ED.2090406@gmail.com>
 <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com>
 <20160329214323.GA10455@amd>
 <56FB6B03.7080202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FB6B03.7080202@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, patrikbachan@gmail.com, serge@hallyn.com, Greg KH <greg@kroah.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> > To be fair... they _are_ separate LED devices. In N900 case, you can
> > even see light comming from slightly different places if you look closely.
> > 
> I mainly work with encapsulated USB HID LED devices like Thingm blink(1).
> Due to the diffuse plastic cover you don't see the individual LEDs on the chip.

Yeah, so on N900, you can't really see the individual LEDs, either.
But white is not uniform white.

On PS/3 motion controller (another device that is already supported),
diffusing works a bit better. 

> > Required.
> > 
> > Ok, so:
> > 
> > a) Do we want RGB leds to be handled by existing subsystem, or do we
> > need separate layer on top of that?
> > 
> > b) Does RGB make sense, or HSV? RGB is quite widely used in graphics,
> > and it is what hardware implements. (But we'd need to do gamma
> > correction).
> > 
> HSV has the charme that the current monochrome V-only is a subset.
> Therefore the current API can be used also with color LEDs.
> However there might be good reasons for using RGB too.

Yes, nice, but we already have RGB LED support in kernel, and it looks
different from what is proposed here. And quite incompatible. 

> > c) My hardware has "acceleration engine", LED is independend from
> > CPU. That's rather big deal. Does yours? It seems to be quite common,
> > at least in cellphones.
> > 
> Devices like blink(1) support storing and re-playing patterns, fading etc.
> 
> > Ideally, I'd like to have "triggers", but different ones. As in: if
> > charging, do yellow " .xX" pattern. If fully charged, do green steady
> > light. If message is waiting, do blue " x x" pattern. If none of
> > above, do slow white blinking. (Plus priorities of events). But that's
> > quite different from existing support...)
> > 
> I think for this a separate layer would be helpful.
> Your primary intention is to e.g. display "charging" on the RGB LED
> device. Most likely you don't want to split yellow into its red + green
> component and then write to the respective (sub-)LEDs.
> Also just think of the case that later you might decide that orange
> is nicer than yellow.

Well, so what about keeping existing red/green/blue LED devices (to
stay backward compatible) and then add separate device that links to
these, and controls patterns and colors?

Small complication is that (at least on N900) the pattern capability
can control keyboard backlight LEDs, too. It has nine channels, and
you select 3 channels that are connected to pattern generator.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
