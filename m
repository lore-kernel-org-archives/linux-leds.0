From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 1 Apr 2016 23:18:44 +0200
Message-ID: <20160401211844.GA21768@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FEC444.4040106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrik Bachan <patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi!

> >>It would have the same downsides as in case of having r, g and b in
> >>separate attributes, i.e. - problems with setting LED colour in
> >>a consistent way. This way LED blinking in whatever colour couldn't
> >>be supported reliably. It was one of your primary rationale standing
> >>behind this design, if I remember correctly. Second - what about
> >>triggers? We've had a long discussion about it and this design turned
> >>out to be most fitting.
> >
> >Are on/off triggers really that useful for a LED that can produce 16
> >million colors?
> >
> >I believe we should support patterns for RGB LEDs. Something like
> >[ (time, r, g, b), ... ] . Ok, what about this one?
> >
> >Lets say we have
> >
> >/sys/class/pattern/lp5533::0
> >/sys/class/pattern/software::0
> >
> >/sys/class/led/n900::red ; default trigger "lp5533::0:0"
> >/sys/class/led/n900::green ; default trigger "lp5533::0:1"
> >/sys/class/led/n900::blue ; default trigger "lp5533::0:2"
> >
> >Normally, pattern would correspond to one RGB LED. We could have
> >attribute "/sys/class/pattern/lp5533::0/color" containing R,G,B for
> >this pattern.
> 
> This involves the same issue you were opposed to: three values per
> sysfs attribute.

And solves a lot of other things. Like actually being backwards
compatible.

And yes, it involves three values in a file, but now it is array of
led brightnesses, and that might actually be acceptable. (At least the
values have uniform meaning).

Plus, it is not "issue you were opposed to" it is "something that is
not permitted by sysfs maintainers".

Thanks,
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
