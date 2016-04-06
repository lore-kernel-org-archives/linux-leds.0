From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v5 1/4] leds: core: add generic support for RGB Color
 LED's
Date: Wed, 6 Apr 2016 11:16:38 +0200
Message-ID: <20160406091638.GD10196@amd>
References: <20160401135748.GD11860@amd>
 <56FEC444.4040106@gmail.com>
 <20160401211844.GA21768@amd>
 <5702DDD2.2030902@gmail.com>
 <20160405090141.GA23282@amd>
 <570415C4.5070003@gmail.com>
 <5704236D.5080805@gmail.com>
 <570438EF.4080904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570438EF.4080904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Tissoires <benjamin.tissoires-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aaro.koskinen-X3B1VOXEql0@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrik Bachan <patrikbachan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi!

> >As I see it the current blinking support then would be one special case of a pattern.
> >As a consequence once having pattern support we might be able to switch users of blinking
> >to pattern and remove the blinking support.
> 
> Let's split patterns related discussion into a separate thread.
> It would be best if it began with a patch.

Lets design userland interface first, then decide how to implement it
in the kernel. Patches are useless at this point.

And actually... without patterns, existing interface works just
fine. Even if you can't "atomically" write values to three different
files, operation is so fast that user will not see the intermediate
state, anyway. So solving the "atomic" issue without solving the rest
is pretty much useless.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
