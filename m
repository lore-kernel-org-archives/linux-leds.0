From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Fri, 9 Sep 2016 13:05:09 +0200
Message-ID: <20160909110509.GB6356@kroah.com>
References: <20160908160904.31719-1-zajec5@gmail.com>
 <20160909093440.GF15637@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160909093440.GF15637@b29397-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Stephan Linz <linz-LlUBiLVY8XKsTnJN9+BGXg@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Sep 09, 2016 at 05:34:40PM +0800, Peter Chen wrote:
> On Thu, Sep 08, 2016 at 06:08:24PM +0200, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> > 
> > This commit adds a new trigger responsible for turning on LED when USB
> > device gets connected to the selected USB port. This can can useful for
> > various home routers that have USB port(s) and a proper LED telling user
> > a device is connected.
> > 
> > The trigger gets its documentation file but basically it just requires
> > enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).
> > 
> > There was a long discussion on design of this driver. Its current state
> > is a result of picking them most adjustable solution as others couldn't
> > handle all cases.
> > 
> > 1) It wasn't possible for the driver to register separated trigger for
> >    each USB port. Some physical USB ports are handled by more than one
> >    controller and so by more than one USB port. E.g. USB 2.0 physical
> >    port may be handled by OHCI's port and EHCI's port.
> >    It's also not possible to assign more than 1 trigger to a single LED
> >    and implementing such feature would be tricky due to syncing triggers
> >    and sysfs conflicts with old triggers.
> > 
> > 2) Another idea was to register trigger per USB hub. This wouldn't allow
> >    handling devices with multiple USB LEDs and controllers (hubs)
> >    controlling more than 1 physical port. It's common for hubs to have
> >    few ports and each may have its own LED.
> > 
> > This final trigger is highly flexible. It allows selecting any USB ports
> > for any LED. It was also modified (compared to the initial version) to
> > allow choosing ports rather than having user /guess/ proper names. It
> > was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
> > 2 physical ports and 3 controllers.
> > 
> > Another planned feature is support for LED reacting to the USB activity.
> > This can be implemented with another sysfs file for setting mode. The
> > default mode wouldn't change so there won't be ABI breakage and such
> > feature can be safely implemented later.
> > 
> 
> It has such driver at: drivers/usb/common/led.c

Ugh, I thought I had seen something like this before...

Rafał, can you just use this in-kernel code instead?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
