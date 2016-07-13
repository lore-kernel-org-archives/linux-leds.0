From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: add HCD providers
Date: Wed, 13 Jul 2016 16:02:42 +0800
Message-ID: <20160713080242.GA11863@shlinux2>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <20160713045140.GA29915@shlinux2>
 <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 13, 2016 at 07:21:09AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 13 July 2016 at 06:51, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Jul 12, 2016 at 02:35:18PM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> I was working on an "usbport" LED trigger driver and specifying it=
s
> >> default state in DT. I realized I can't really determine numbering=
 of
> >> USB ports on any device as it depends on compiled drivers and the
> >> loading orders.
> >>
> >> It means that my physical USB port can be e.g. 1-1 or 2-1 dependin=
g on
> >> my current config/setup. I needed a way to specify a particular HC=
D in
> >> DT and then hardcode port number (as this part doesn't change).
> >>
> >
> > I have a question:
> >
> > What does your "usbport" LED trigger for? What kinds of information
> > you would like to show on LED?
>=20
> It's a trigger that turns on LED whenever USB device appears at
> specified USB port. There are plenty of home routers that have USB
> labeled LED(s). To support them nicely, first of all we need a trigge=
r
> that will watch for USB subsystem events. Secondly we need a way to
> setup its initial state correctly as most users don't want to play
> with sysfs on their own.
>=20
> I sent usbport trigger in:
> [PATCH] leds: trigger: Introduce an USB port trigger
> <1468239883-22695-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> https://lkml.org/lkml/2016/7/11/305
> You may read commit message and ledtrig-usbport.txt for more details.
>=20

Well, it is an interesting use case. You can try to add provider (un)re=
gister
at hub driver (drivers/usb/core/hub.c) instead of each platform drivers=
, you
could refer my USB pwrseq as an example[1].

=46or roothub, you can get the busnum through comparing controller's of=
_node, for
internal hub, you can get hub's dev name like (1-1) through comparing
its of_node (you need to describe your hard-wired hub on dts).

http://www.spinics.net/lists/linux-usb/msg143699.html

Two more questions:

- How to support the USB device on the port when boots up?
- Any cases we need to add mapping using new_port_store, the user may
not know bus number for physical port.

--=20

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
