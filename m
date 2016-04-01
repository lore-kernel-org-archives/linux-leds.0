From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Fri, 1 Apr 2016 14:53:37 +0200
Message-ID: <20160401125337.GB11860@amd>
References: <56D608ED.2090406@gmail.com>
 <20160329100258.GA24964@amd>
 <56FAE7A8.2070302@gmail.com>
 <20160329214323.GA10455@amd>
 <56FB893C.60203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FB893C.60203-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi!

> >Ideally, I'd like to have "triggers", but different ones. As in: if
> >charging, do yellow " .xX" pattern. If fully charged, do green steady
> >light. If message is waiting, do blue " x x" pattern. If none of
> >above, do slow white blinking. (Plus priorities of events). But that's
> >quite different from existing support...)
> 
> Please note that HSV colour scheme allows to neatly project monochrome
> brightness semantics on the RGB realm. I.e. you can have fixed
> hue and saturation, and by changing the brightness component a perceived
> colour intensity can be altered.

Yes, that's nice, but it is incompatible with already existing RGB
support in kernel. Plus, echoing hue into file called brightness is
extremely ugly, and it violates sysfs rules.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
