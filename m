From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 6 Apr 2016 10:52:48 +0200
Message-ID: <20160406085248.GB10196@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <570415C4.5070003@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com
List-Id: linux-leds@vger.kernel.org

Hi!

> >>>>>Lets say we have
> >>>>>
> >>>>>/sys/class/pattern/lp5533::0
> >>>>>/sys/class/pattern/software::0
> >>>>>
> >>>>>/sys/class/led/n900::red ; default trigger "lp5533::0:0"
> >>>>>/sys/class/led/n900::green ; default trigger "lp5533::0:1"
> >>>>>/sys/class/led/n900::blue ; default trigger "lp5533::0:2"
> >>>>>
> >>>>>Normally, pattern would correspond to one RGB LED. We could have
> >>>>>attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
> >>>>>this pattern.
> >>
> >>Could you give an example on how to set a color for RGB LED using
> >>this interface? Would it be compatible with LED triggers?
> >>Where the "pattern" class would be implemented?
> >
> >Well, 'echo "50 60 70" > /sys/class/pattern/lp5533::0/color' should
> >set the color for the led. 'echo "trigger-name" > trigger' would set
> >the trigger, probably just toggling between LED off and set color for
> >the old triggers.
> >
> >Where to implement the patterns is different question, but for example
> >drivers/leds/pattern?
> 
> I'd rather leave the pattern issue for now, since it seems to be
> different from the problem Heiner was trying to solve with his LED RGB
> extension. Moreover, hardware patterns are device specific and it could
> be hard to propose a generic interface.

Well, RGB leds are basically useless without pattern support. And I
believe we can do generic interface.

> Drivers can always expose their custom sysfs attributes for configuring
> the patterns.
> 
> Regardless of the above, some of your considerations brought me an idea
> on how to add generic and backwards compatible support for setting RGB
> color at one go.
> 
> Currently LED class drivers of RGB LED controllers expose three LED
> class devices - one per R, G and B color component. I propose that
> such drivers set LED_DEV_CAP_RGB flag for each LED class device they
> register. LED core, seeing the flag, would create a generic "color"
> sysfs attribute for each of the three LED class devices.
> 
> The "color" attribute would contain "R G B" values. Setting the "color"
> attribute of any of the three LED class devices would affect brightness
> properties (i.e. constituent colors) of the remaining two ones.
> It would result in disabling any active triggers and writing all the
> three color settings to the RGB LED controller at one go.

Having one attribute across three devices is rather ugly. And we'll
need to solve the pattern issue one day.

What's tricky about patterns is that you need to control 3 (or more)
leds at a time. Problem you are trying to solve here is ... control of
3 leds, at the same time.

So let's solve them together.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
