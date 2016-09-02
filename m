From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Fri, 2 Sep 2016 10:33:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1609021025470.2027-100000@iolanthe.rowland.org>
References: <caccb909-bf51-8f67-cd57-de407e576afc@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <caccb909-bf51-8f67-cd57-de407e576afc-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Stephan Linz <linz-LlUBiLVY8XKsTnJN9+BGXg@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 2 Sep 2016, Jacek Anaszewski wrote:

> >>> I'm pretty sure noone ever planned to have more than 1 trigger
> >>> assigned to a single LED. I just realized there will be a problem with
> >>> proposed solution: sysfs files conflict.

...

> >> Currently we support only triggers dedicated to specific type of
> >> devices. Even in case of triggers that don't expose custom sysfs
> >> attributes, registered with led_trigger_register_simple(), device
> >> drivers have to generate trigger event with dedicated function, e.g:
> >>
> >> - ledtrig-cpu: void ledtrig_cpu(enum cpu_led_event ledevt)
> >> - ledtrig-disk: void ledtrig_disk_activity(void)
> >> - ledtrig-mtd: void ledtrig_mtd_activity(void)
> >>
> >> If one wanted to have the LED notified by different type of devices,
> >> then they would have to implement a trigger that would exposed all
> >> required types of API.
> >>
> >> Unfortunately, there are many possible combinations of
> >> triggers and that doesn't sound sane to add a new one when someone
> >> will find it useful. Of course it would entail adding a call to the
> >> new trigger API in the drivers, which doesn't seem like something
> >> acceptable in the mainline.
> >
> > Maybe it would make more sense, in this case, to allow only three
> > possibilities for a USB port activity trigger.  Toggle the LED
> > whenever:
> >
> > 	There is activity on the specified port, or
> >
> > 	There is any activity on any port on the specified hub, or
> >
> > 	There is any USB activity on any port.
> >
> > That ought to cover most of the normal use cases, and it would be
> > simple enough to implement.
> 
> What would be the benefit of having a USB port activity trigger,
> for which we would be specifying the port to observe, but in the same
> time we would react on any activity on any port (cases 1 and 3)?

I meant these three cases to be mutually exclusive.  For a given LED,
you could have only one of those trigger types (like mentioned above,
only one trigger per LED).  For example, you might accept any one of:

	echo usb1-4.2 >/sys/class/led/foo/trigger

	echo hub1-4 >/sys/class/led/foo/trigger

	echo usb >/sys/class/led/foo/trigger

Yes, it would be possible to have a port-specific trigger for one LED
and an overall USB activity trigger for another LED.  I don't know how
useful this would be -- you could probably imagine some unlikely
scenario.

The point is that doing things this way wouldn't require any API
violations, and it would allow users to do almost all of the things
they are likely to want.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
