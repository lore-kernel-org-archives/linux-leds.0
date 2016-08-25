From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 16:55:21 -0400
Message-ID: <20160825205521.GA32076@kroah.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
 <20160824092225.GB23180@kroah.com>
 <CACna6rxpzN7LrATEQ+Z5tBJrrr6DYVZr37M7qR3WLrWtH_H_bA@mail.gmail.com>
 <20160824210457.GC4305@kroah.com>
 <CACna6rz2YAFjkdmoZw8o29_EjV_z39tnK3osHvKoVHHOyLnXKg@mail.gmail.com>
 <20160825125305.GB15567@kroah.com>
 <8737lsy9pf.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8737lsy9pf.fsf@miraculix.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Aug 25, 2016 at 08:39:24PM +0200, Bjørn Mork wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> > On Thu, Aug 25, 2016 at 07:14:52AM +0200, Rafał Miłecki wrote:
> >>
> >> Good question. I would like to extend this USB port trigger in the
> >> future by reacting to USB activity. This involves playing with URBs
> >> and I believe that at that point it'd be getting too much USB specific
> >> to /rule them all/.
> >
> > Oh that's never going to work, sorry.  USB "activity" happens deep in
> > USB host controller hardware, not up at the kernel level at all.  It's
> > just too fast, and would take up too much CPU to do it otherwise.  Heck,
> > even old UHCI 1.1 USB controllers did this.
> >
> > USB "activity" happens all the time, look at a USB bus analyzer if you
> > want to see what goes on.  Teasing out what is "real data" and what is
> > just "normal bus activity" is impossible at the kernel level,
> 
> OK, I am going to play stupid again: Does this mean that usbmon is
> impossible?

Hah, nice try :)

I guess when I think "USB activity" I think about the lower layers of
frames and acks and naks on the bus.  But maybe because I have just
recently been doing a lot of work down at the EHCI frame timing layer
for some strange hardware...

But you are right, if all you care about is the data that the host sees,
then yes, you could do something like usbmon to "tickle" a led if you
want to.

Odds are, someone's already done this for a raspberry pi :)

thanks,

greg k-h
