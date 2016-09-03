From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Sat, 3 Sep 2016 11:17:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1609031111030.768-100000@netrider.rowland.org>
References: <b41c3864-9986-b1a0-ea33-76f2ec91790b@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:57699 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1753891AbcICPSA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 11:18:00 -0400
In-Reply-To: <b41c3864-9986-b1a0-ea33-76f2ec91790b@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Sat, 3 Sep 2016, Jacek Anaszewski wrote:

> >>> Maybe it would make more sense, in this case, to allow only three
> >>> possibilities for a USB port activity trigger.  Toggle the LED
> >>> whenever:
> >>>
> >>> 	There is activity on the specified port, or
> >>>
> >>> 	There is any activity on any port on the specified hub, or
> >>>
> >>> 	There is any USB activity on any port.
> >>>
> >>> That ought to cover most of the normal use cases, and it would be
> >>> simple enough to implement.
> >>
> >> What would be the benefit of having a USB port activity trigger,
> >> for which we would be specifying the port to observe, but in the same
> >> time we would react on any activity on any port (cases 1 and 3)?
> >
> > I meant these three cases to be mutually exclusive.  For a given LED,
> > you could have only one of those trigger types (like mentioned above,
> > only one trigger per LED).  For example, you might accept any one of:
> >
> > 	echo usb1-4.2 >/sys/class/led/foo/trigger
> >
> > 	echo hub1-4 >/sys/class/led/foo/trigger
> >
> > 	echo usb >/sys/class/led/foo/trigger
> >
> > Yes, it would be possible to have a port-specific trigger for one LED
> > and an overall USB activity trigger for another LED.  I don't know how
> > useful this would be -- you could probably imagine some unlikely
> > scenario.
> >
> > The point is that doing things this way wouldn't require any API
> > violations, and it would allow users to do almost all of the things
> > they are likely to want.
> 
> We'd have to define single API for generating USB trigger event,
> so as not enforce addition of three different API calls to the USB
> drivers.

The USB core would need only one LED-API call, which it would make upon
the completion of an URB.  The trigger code should be able to handle
all the rest (i.e., see which LEDs should be triggered by that URB).

>  The type of USB events that the LED should react upon could be
> defined by parsing the value written to the sysfs file.

There is only one type of event: completion of an URB.  Triggers would
differ depending only on the device/port that the URB was aimed at.  
_That_ information could be defined by parsing the value written to the 
sysfs file.

> This of course implies, that we should have single LED USB port trigger.
> 
> The remaining issue is the sysfs interface design for defining and
> presenting multiple USB ports. I'm still in favour of a single
> attribute with space separated list. This scheme is commonly used
> in existing interfaces.

No such interface is needed if you do things the way I outlined above.  
Each trigger would require the user to specify either one port, one 
hub, or nothing at all.  Multiple ports would not be used.

Alan Stern
