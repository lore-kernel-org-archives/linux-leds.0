From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Fri, 15 Jul 2016 10:28:25 +0800
Message-ID: <20160715022824.GA817@shlinux2>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com>
 <87lh15isi7.fsf@linux.intel.com>
 <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
 <87inw9ir4k.fsf@linux.intel.com>
 <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com>
 <20160714094836.GB28730@shlinux2>
 <CACna6ryja8L+ORAzOtiGgUFTQ6OGcieJX4YO+=AQV0KptZftgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34770 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680AbcGOCgO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2016 22:36:14 -0400
Content-Disposition: inline
In-Reply-To: <CACna6ryja8L+ORAzOtiGgUFTQ6OGcieJX4YO+=AQV0KptZftgQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Jul 14, 2016 at 05:52:43PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 14 July 2016 at 11:48, Peter Chen <hzpeterchen@gmail.com> wrote:
> > On Wed, Jul 13, 2016 at 04:40:53PM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> On 13 July 2016 at 15:50, Felipe Balbi <felipe.balbi@linux.intel.c=
om> wrote:
> >> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
> >> >> On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi@linux.inte=
l.com> wrote:
> >> >>> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
> >> >>>> Hi again,
> >> >>>>
> >> >>>> This is my second try of getting HCD providers into usb subsy=
stem.
> >> >>>>
> >> >>>> During discussion of V1 I realized there are about 26 drivers=
 adding a
> >> >>>> single HCD and all of them would need to be modified. So inst=
ead I
> >> >>>> decided to put relevant code in usb_add_hcd. It checks if the=
 HCD we
> >> >>>> register is a primary one and if so, it registers a proper pr=
ovider.
> >> >>>>
> >> >>>> Please note that of_hcd_xlate_simple was also extended to all=
ow getting
> >> >>>> shared HCD (which is used e.g. in case of XHCI).
> >> >>>>
> >> >>>> So now you can have something like:
> >> >>>>
> >> >>>> ohci: ohci@21000 {
> >> >>>>       #usb-cells =3D <0>;
> >> >>>>       compatible =3D "generic-ohci";
> >> >>>>       reg =3D <0x00001000 0x1000>;
> >> >>>>       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> >> >>>> };
> >> >>>>
> >> >>>> ehci: ehci@22000 {
> >> >>>>       #usb-cells =3D <0>;
> >> >>>>       compatible =3D "generic-ehci";
> >> >>>>       reg =3D <0x00002000 0x1000>;
> >> >>>>       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> >> >>>> };
> >> >>>>
> >> >>>> xhci: xhci@23000 {
> >> >>>>       #usb-cells =3D <1>;
> >> >>>>       compatible =3D "generic-xhci";
> >> >>>>       reg =3D <0x00003000 0x1000>;
> >> >>>>       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> >> >>>> };
> >> >>>>
> >> >>>> The last (second) patch is not supposed to be applied, it's u=
sed only as
> >> >>>> a proof and example of how providers can be used.
> >> >>>
> >> >>> nowhere here (or in previous patch) you clarify why exactly yo=
u need
> >> >>> this. What is your LED trigger supposed to do? Why can't it ha=
ndle ports
> >> >>> changing number in different boots? Why do we need this at all=
? Why is
> >> >>> your code DT-specific?
> >> >>>
> >> >>> There are still too many 'unknowns' here.
> >> >>
> >> >> Are you sure you saw my reply to Peter's question?
> >> >> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw@mail.gmail=
=2Ecom>
> >> >> http://www.spinics.net/lists/linux-usb/msg143708.html
> >> >> http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2
> >> >>
> >> >> I think it should answer (some of?) your questions. Can you rea=
d it
> >> >> and see if it gets a bit clearer?
> >> >
> >> > well, all that says is that you're writing a LED trigger to togg=
le LED
> >> > when a USB device gets added to a specified port. I don't think =
you need
> >> > the actual port number for that. You should have a phandle to th=
e actual
> >> > port, whatever its number is, or a phandle to the (root-)Hub and=
 a port
> >> > number from that hub.
> >> >
> >> > The problem, really, is that DT descriptor of USB Hosts is very,=
 very
> >> > minimal. Perhaps there's something more extensively defined from=
 the
> >> > original Open Firmware USB Addendum.
> >>
> >> Thanks for your effort and looking at this closely. You're right, =
I'm
> >> interested in referencing USB ports, but I'm using controller phan=
dle
> >> (and then I specify ports manually).
> >>
> >> Having each port described by DT would be helpful, it's just somet=
hing
> >> I didn't find implemented, so I started looking for different ways=
=2E It
> >> seems I should have picked a different solution.
> >>
> >> So should I work on describing USB ports in DT instead? This looks
> >> like a complex thing to describe, so I'd like to ask for some guid=
ance
> >> first. What do you think about following schema/example?
> >>
> >> ohci@1000 {
> >>         compatible =3D "generic-ohci";
> >>         reg =3D <0x00001000 0x1000>;
> >>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> >>
> >>         primary-hcd {
> >>                 ohci_port0: port@0 {
> >>                         reg =3D <0>;
> >>                 };
> >>
> >>                 ohci_port1: port@1 {
> >>                         reg =3D <1>;
> >>                 };
> >>         }
> >> };
> >>
> >> ehci@2000 {
> >>         compatible =3D "generic-ehci";
> >>         reg =3D <0x00002000 0x1000>;
> >>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> >>
> >>         primary-hcd {
> >>                 ehci_port0: port@0 {
> >>                         reg =3D <0>;
> >>                 };
> >>
> >>                 ehci_port1: port@1 {
> >>                         reg =3D <1>;
> >>                 };
> >>         }
> >> };
> >>
> >> xhci@3000 {
> >>         compatible =3D "generic-xhci";
> >>         reg =3D <0x00003000 0x1000>;
> >>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> >>
> >>         primary-hcd {
> >>         };
> >>
> >>         shared-hcd {
> >>                 xhci_port0: port@0 {
> >>                         reg =3D <0>;
> >>                 };
> >>         }
> >> };
> >>
> >> With such a DT struct, how could I query port for a Linux-assigned=
 number?
> >>
> >> For example with OHCI, EHCI and XHCI drivers compiled, Linux assig=
ns
> >> number 4 to my XHCI's shared HCD's root hub:
> >> xhci-hcd 18023000.xhci: xHCI Host Controller
> >> xhci-hcd 18023000.xhci: new USB bus registered, assigned bus numbe=
r 4
> >> hub 4-0:1.0: USB hub found
> >> hub 4-0:1.0: 1 port detected
> >>
> >> If I disable OHCI and EHCI I get:
> >> xhci-hcd xhci-hcd.0: xHCI Host Controller
> >> xhci-hcd xhci-hcd.0: new USB bus registered, assigned bus number 2
> >> hub 2-0:1.0: USB hub found
> >> hub 2-0:1.0: 1 port detected
> >>
> >> So I need my "usbport" trigger driver to be able to get "4-1" in t=
he
> >> first case and "2-1" in the second case. I guess I should use
> >> &xhci_port0 but what then? How could I translate it into
> >> Linux-assigned numbering?
> >>
> >
> > For your current design, you need to fix shared hcd for xHCI proble=
m,
> > since xHCI has two buses.
> >
> > Below I supply another thought, please check if it is feasible.
> > In below design, you don't need to change any usb codes.
> >
> > dts:
> >
> > led_1 {
> >         led_gpio_1;
> >         usb_port =3D &ohci_port0, &ehci_port1;
> > }
> >
> > led_2 {
> >         led_gpio_2;
> >         usb_port =3D &xhci_port0, &xhci_port1;
> > }
> >
> > ohci@1000 {
> >         compatible =3D "generic-ohci";
> >         reg =3D <0x00001000 0x1000>;
> >         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> >
> >         ohci_port0: port@0 {
> >                 reg =3D <0>;
> >         };
> >
> >         ohci_port1: port@1 {
> >                 reg =3D <1>;
> >         };
> > };
> >
> > ehci@2000 {
> >         compatible =3D "generic-ehci";
> >         reg =3D <0x00002000 0x1000>;
> >         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> >
> >         ehci_port0: port@0 {
> >                 reg =3D <0>;
> >         };
> >
> >         ehci_port1: port@1 {
> >                 reg =3D <1>;
> >         };
> > };
> >
> > xhci@3000 {
> >         compatible =3D "generic-xhci";
> >         reg =3D <0x00003000 0x1000>;
> >         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> >
> >         /* for xhci, port 0 - [N-1] is USB3, N - [M-1] is USB2/1.
> >          * The port 0 and port N is the same physical port
> >          */
> >         xhci_port0: port@0 {
> >                 reg =3D <0>;
> >         };
> >
> >         xhci_port1: port@1 {
> >                 reg =3D <1>;
> >         };
> >
> > };
> >
> > At code, compare the usb_device's device_node at usbport_trig_notif=
y
> > if it is at led_1's usb device list, light on it.
>=20
> This is quite interesting idea, thanks!
>=20
> So I got following checking code:
>=20
> count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
> for (i =3D 0; i < count; i++) {
>     of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
>     of_property_read_u32(args.np, "reg", &port);
>     if (args.np->parent =3D=3D usb_dev->bus->controller->of_node &&
>         port =3D=3D usb_dev->portnum) {
>             of_node_put(args.np);
>             return true;
>     }
>     of_node_put(args.np);
> }
> return false;

No, compares the USB port directly.

count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
for (i =3D 0; i < count; i++) {
    of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
    if (args.np =3D=3D usb_dev->dev.of_node)
            of_node_put(args.np);
            return true;
    }
    of_node_put(args.np);
}
return false;

>=20
> This works, but I see 3 more problems:
>=20
> 1) How to access list of available USB devices during activation?

You mean during LED activation? eg your usbport_trig_activate?
Why do you need it?

> 2) What about support for non-DT platforms in usbport driver? Should =
I
> still allow specifying ports manually? Are you OK with that?

I am afraid I still don't know how to do it for non-DT platforms.
You can show your design.=20

> 3) What about devices with internal hubs? Should we describe their US=
B
> ports in DT as well? Any idea how to do this?

Well, the HUB must be hard-wired on board for this LED trigger case.
So, you can described USB topology well at dts. Please note: the=20
USB port phandle at LED node is the physical connector on board which
the user can plug in USB device, it may be 2nd or more levels from the
controller.

Below is the example for how to describe 3 levels USB devices, the
USB ethernet port (axis) is one of the ports at internal HUB (genesys).

http://www.spinics.net/lists/linux-usb/msg143698.html

--=20

Best Regards,
Peter Chen
