From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Wed, 31 Aug 2016 14:23:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1608311420010.1889-100000@iolanthe.rowland.org>
References: <CACna6rxbUB=jAV+YH-N3hzBU0hbNMY=pdTswVW7h8i4G9g5pmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6rxbUB=jAV+YH-N3hzBU0hbNMY=pdTswVW7h8i4G9g5pmQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, 30 Aug 2016, Rafał Miłecki wrote:

> >> As you quite often need more complex LED management, there are
> >> triggers that were introduced in 2006 by c3bc9956ec52f ("[PATCH] LED:
> >> add LED trigger tupport"). Some triggers are trivial and could be
> >> implemented in userspace as well (e.g. "timer"). Some had to be
> >> implemented in kernelspace (CPU activity, MTD activity, etc.). Having
> >> few triggers compiled, you can assign them to LEDs at it pleases you.
> >> Your hardware may have generic LED (not labeled) and you can
> >> dynamically assign various triggers to it, depending e.g. on user
> >> actions. E.g. if user (using GUI or whatever) wants to see flash
> >> activity, your userspace script should do:
> >> echo mtd > /sys/class/leds/foo/trigger
> >
> > So for example, you might want to do:
> >
> >         echo usb1-4 >/sys/class/leds/foo/trigger
> >
> > and then have the "foo" LED toggle whenever an URB was submitted or
> > completed for a device attached to the 1-4 port.  Right?
> 
> Not really as it won't cover some pretty common use cases. Many home
> routers have few USB ports (2-5) and only 1 USB LED. It has to be
> possible to assign few USB ports to a single LED (trigger). That way
> LED should be turned on (and kept on) if there is at least 1 USB
> device connected. You obviously can't do:
> echo "usb1-1 usb1-2 usb2-1" > /sys/class/leds/foo/trigger
> 
> This was already brought up by Rob (who mentioned CPU trigger) and I
> replied him pretty much the same way in:
> https://lkml.org/lkml/2016/7/29/38
> (reply starts with "Anyway, the serious limitation I see").

The code for a bunch of triggers must already be written.  What would 
the user do if he wanted to flash a single LED in response to both
CPU activity and MTD activity?  If not

	echo "cpu mtd" >/sys/class/leds/foo/trigger

then what?

Alan Stern
