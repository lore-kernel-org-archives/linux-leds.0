From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Add the LED burst trigger
Date: Fri, 27 Dec 2013 20:37:26 +0100
Message-ID: <20131227193726.GA29672@amd.pavel.ucw.cz>
References: <1387895407-28031-1-git-send-email-lgxue@hotmail.com>
 <20131225230935.GB13593@amd.pavel.ucw.cz>
 <BLU172-W52032BFEF4512123D7516EACC20@phx.gbl>
 <20131227115746.4cbd9523@alan.etchedpixels.co.uk>
 <20131227125725.GA21506@amd.pavel.ucw.cz>
 <20131227141826.3fe406e4@alan.etchedpixels.co.uk>
 <20131227152354.GA24152@amd.pavel.ucw.cz>
 <20131227181349.475abe88@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131227181349.475abe88@alan.etchedpixels.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Joe Xue <lgxue@hotmail.com>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> > Well, this one will be really smaller. And yes, it will make some
> > memory non-swappable, but I believe with triggers and infrastructure
> > for N900 (and similar) it will be worth it.
> 
> Ah yes thats such a major proportion of platforms

I don't know other cellphone hardware in details, but there are 900M
Android devices and multi-colored LEDs are quite common.

> > Plus, it will actually save CPU cycles, and thus significant power.
> 
> All of which will be totally wiped out if you bump all the millions of
> x86 server boxes in the world up by one page of kernel space and cause a
> few disk I/Os

I don't suggest people enable this on PCs/servers. This is useful for
small devices, not for PCs. LED subsystem is not usually used on
PCs...

> > > little driver but the rest belongs in a library and the library can use
> > > accelerators (of any kind) if available, or even things like lightbulbs
> > > via X10 so you can have the big red light in the control room flash if
> > > the machine dies  8)
> > 
> > Well, I'd prefer my cellphone to signal me "you have a message" by
> > flashing blue light, not by dimming lights in the control room ;-).
> 
> Where the cellphone has an offload it makes sense to use it, but in the
> general case userspace is much more flexible. You may not want a flashing
> big red light and a siren but if its in kernel then nobody can have it,
> if it's through a library you can.

Well, library is nicer for sending message to the admin over social
network of the month, while kernel module is better for Arduino-based
USB-connected Turing-complete 3-color led.

Unfortunately, collaboration between GNU and Android worlds ends at
the kernel-userspace barrier, so we are unlikely to end up with one
useful library... 

[You are right that we could have done something like lpd and have
library+daemon in the userspace playing the LED patterns. I just
believe that this is easier and better done in kernel.]

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
