From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Fri, 15 Jul 2016 14:22:09 +0800
Message-ID: <20160715062209.GC817@shlinux2>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com>
 <87lh15isi7.fsf@linux.intel.com>
 <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
 <87inw9ir4k.fsf@linux.intel.com>
 <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com>
 <20160714094836.GB28730@shlinux2>
 <CACna6ryja8L+ORAzOtiGgUFTQ6OGcieJX4YO+=AQV0KptZftgQ@mail.gmail.com>
 <20160715022824.GA817@shlinux2>
 <CACna6rzGSB0UVEhV2qvT0TDBpyH8=XgeGx9D4Pn1giO+dF9HsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:33376 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709AbcGOGaA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 15 Jul 2016 02:30:00 -0400
Content-Disposition: inline
In-Reply-To: <CACna6rzGSB0UVEhV2qvT0TDBpyH8=XgeGx9D4Pn1giO+dF9HsA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Fri, Jul 15, 2016 at 07:48:11AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> >> > Below I supply another thought, please check if it is feasible.
> >> > In below design, you don't need to change any usb codes.
> >> >
> >> > dts:
> >> >
> >> > led_1 {
> >> >         led_gpio_1;
> >> >         usb_port =3D &ohci_port0, &ehci_port1;
> >> > }
> >> >
> >> > led_2 {
> >> >         led_gpio_2;
> >> >         usb_port =3D &xhci_port0, &xhci_port1;
> >> > }
> >> >
> >> > ohci@1000 {
> >> >         compatible =3D "generic-ohci";
> >> >         reg =3D <0x00001000 0x1000>;
> >> >         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> >> >
> >> >         ohci_port0: port@0 {
> >> >                 reg =3D <0>;
> >> >         };
> >> >
> >> >         ohci_port1: port@1 {
> >> >                 reg =3D <1>;
> >> >         };
> >> > };
> >> >
> >> > ehci@2000 {
> >> >         compatible =3D "generic-ehci";
> >> >         reg =3D <0x00002000 0x1000>;
> >> >         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> >> >
> >> >         ehci_port0: port@0 {
> >> >                 reg =3D <0>;
> >> >         };
> >> >
> >> >         ehci_port1: port@1 {
> >> >                 reg =3D <1>;
> >> >         };
> >> > };
> >> >
> >> > xhci@3000 {
> >> >         compatible =3D "generic-xhci";
> >> >         reg =3D <0x00003000 0x1000>;
> >> >         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> >> >
> >> >         /* for xhci, port 0 - [N-1] is USB3, N - [M-1] is USB2/1=
=2E
> >> >          * The port 0 and port N is the same physical port
> >> >          */
> >> >         xhci_port0: port@0 {
> >> >                 reg =3D <0>;
> >> >         };
> >> >
> >> >         xhci_port1: port@1 {
> >> >                 reg =3D <1>;
> >> >         };
> >> >
> >> > };
> >> >
> >> > At code, compare the usb_device's device_node at usbport_trig_no=
tify
> >> > if it is at led_1's usb device list, light on it.
> >>
> >> This is quite interesting idea, thanks!
> >>
> >> So I got following checking code:
> >>
> >> count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
> >> for (i =3D 0; i < count; i++) {
> >>     of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
> >>     of_property_read_u32(args.np, "reg", &port);
> >>     if (args.np->parent =3D=3D usb_dev->bus->controller->of_node &=
&
> >>         port =3D=3D usb_dev->portnum) {
> >>             of_node_put(args.np);
> >>             return true;
> >>     }
> >>     of_node_put(args.np);
> >> }
> >> return false;
> >
> > No, compares the USB port directly.
> >
> > count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
> > for (i =3D 0; i < count; i++) {
> >     of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
> >     if (args.np =3D=3D usb_dev->dev.of_node)
> >             of_node_put(args.np);
> >             return true;
> >     }
> >     of_node_put(args.np);
> > }
> > return false;
>=20
> If we mean to use usb_dev->dev.of_node I *need* to modify USB
> subsystem, since this pointer is never being set by the current code.
>=20
> [   71.410505] usb 1-1: new high-speed USB device number 2 using ehci=
-platform
> [   71.564928] [usbport_trig_notify] usb_dev:c6ac1000 &usb_dev->dev:c=
6ac1068
> [   71.579874] [usbport_trig_notify] dev_name(&usb_dev->dev):1-1
> [   71.586580] [usbport_trig_notify] usb_dev->dev.of_node:  (null)
>=20
> Or am I missing something?
>=20

You may need below patches:

commit 69bec725985324e79b1c47ea287815ac4ddb0521
Author: Peter Chen <peter.chen@freescale.com>
Date:   Fri Feb 19 17:26:15 2016 +0800

    USB: core: let USB device know device node

commit 7222c832254a75dcd67d683df75753d4a4e125bb
Author: Nicolai Stange <nicstange@gmail.com>
Date:   Thu Mar 17 23:53:02 2016 +0100

    usb/core: usb_alloc_dev(): fix setting of ->portnum

>=20
> >> This works, but I see 3 more problems:
> >>
> >> 1) How to access list of available USB devices during activation?
> >
> > You mean during LED activation? eg your usbport_trig_activate?
> > Why do you need it?
>=20
> Yes, I mean usbport_trig_activate. If user plugs in USB device and
> *then* activates this trigger, we want to set a proper initial state.
> We can't only depend on USB_DEVICE_ADD.
>=20

Oh, I see, I asked it before.

Either you need to register USB notifier before activation
Or you need to implement something like usb_node_to_dev
eg: like usb_for_each_dev. If device's state is USB_STATE_CONFIGURED
this USB device is available.

>=20
> >> 2) What about support for non-DT platforms in usbport driver? Shou=
ld I
> >> still allow specifying ports manually? Are you OK with that?
> >
> > I am afraid I still don't know how to do it for non-DT platforms.
> > You can show your design.
>=20
> Please take a look at
> [PATCH] leds: trigger: Introduce an USB port trigger
> https://lkml.org/lkml/2016/7/11/305
>=20
> Basically my idea was to support:
> echo usbport > trigger
> echo 4-1 > new_port
> echo 2-1 > new_port
>=20

I know your patch, how you plan to support non-DT platforms before?

>=20
> >> 3) What about devices with internal hubs? Should we describe their=
 USB
> >> ports in DT as well? Any idea how to do this?
> >
> > Well, the HUB must be hard-wired on board for this LED trigger case=
=2E
> > So, you can described USB topology well at dts. Please note: the
> > USB port phandle at LED node is the physical connector on board whi=
ch
> > the user can plug in USB device, it may be 2nd or more levels from =
the
> > controller.
> >
> > Below is the example for how to describe 3 levels USB devices, the
> > USB ethernet port (axis) is one of the ports at internal HUB (genes=
ys).
> >
> > http://www.spinics.net/lists/linux-usb/msg143698.html
>=20
> Thanks for this example. I'm only afraid there isn't a way to say wha=
t
> port "ethernet: asix@1" is attached to.

Why? You know your hardware design, you should know the topology, eg
This physical port is from ehci port, and which port number for its
internal hub port number. If not, how we describe USB devices on
dts.

--=20

Best Regards,
Peter Chen
