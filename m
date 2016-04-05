From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Tue, 5 Apr 2016 11:01:41 +0200
Message-ID: <20160405090141.GA23282@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5702DDD2.2030902@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>, Greg KH <greg@kroah.com>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, pali.rohar@gmail.com, sre@kernel.org, khilman@kernel.org, aaro.koskinen@iki.fi, ivo.g.dimitrov.75@gmail.com, Patrik Bachan <patrikbachan@gmail.com>, serge@hallyn.com
List-Id: linux-leds@vger.kernel.org

Hi!

> >>>>It would have the same downsides as in case of having r, g and b in
> >>>>separate attributes, i.e. - problems with setting LED colour in
> >>>>a consistent way. This way LED blinking in whatever colour couldn't
> >>>>be supported reliably. It was one of your primary rationale standing
> >>>>behind this design, if I remember correctly. Second - what about
> >>>>triggers? We've had a long discussion about it and this design turned
> >>>>out to be most fitting.
> >>>
> >>>Are on/off triggers really that useful for a LED that can produce 16
> >>>million colors?
> >>>
> >>>I believe we should support patterns for RGB LEDs. Something like
> >>>[ (time, r, g, b), ... ] . Ok, what about this one?
> >>>
> >>>Lets say we have
> >>>
> >>>/sys/class/pattern/lp5533::0
> >>>/sys/class/pattern/software::0
> >>>
> >>>/sys/class/led/n900::red ; default trigger "lp5533::0:0"
> >>>/sys/class/led/n900::green ; default trigger "lp5533::0:1"
> >>>/sys/class/led/n900::blue ; default trigger "lp5533::0:2"
> >>>
> >>>Normally, pattern would correspond to one RGB LED. We could have
> >>>attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
> >>>this pattern.
> 
> Could you give an example on how to set a color for RGB LED using
> this interface? Would it be compatible with LED triggers?
> Where the "pattern" class would be implemented?

Well, 'echo "50 60 70" > /sys/class/pattern/lp5533::0/color' should
set the color for the led. 'echo "trigger-name" > trigger' would set
the trigger, probably just toggling between LED off and set color for
the old triggers.

Where to implement the patterns is different question, but for example
drivers/leds/pattern?

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
