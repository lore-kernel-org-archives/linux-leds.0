From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Fri, 15 Jul 2016 07:48:11 +0200
Message-ID: <CACna6rzGSB0UVEhV2qvT0TDBpyH8=XgeGx9D4Pn1giO+dF9HsA@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com>
 <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
 <87inw9ir4k.fsf@linux.intel.com> <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com>
 <20160714094836.GB28730@shlinux2> <CACna6ryja8L+ORAzOtiGgUFTQ6OGcieJX4YO+=AQV0KptZftgQ@mail.gmail.com>
 <20160715022824.GA817@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160715022824.GA817@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 15 July 2016 at 04:28, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jul 14, 2016 at 05:52:43PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 14 July 2016 at 11:48, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Wed, Jul 13, 2016 at 04:40:53PM +0200, Rafa=C5=82 Mi=C5=82ecki =
wrote:
>> >> Thanks for your effort and looking at this closely. You're right,=
 I'm
>> >> interested in referencing USB ports, but I'm using controller pha=
ndle
>> >> (and then I specify ports manually).
>> >>
>> >> Having each port described by DT would be helpful, it's just some=
thing
>> >> I didn't find implemented, so I started looking for different way=
s. It
>> >> seems I should have picked a different solution.
>> >>
>> >> So should I work on describing USB ports in DT instead? This look=
s
>> >> like a complex thing to describe, so I'd like to ask for some gui=
dance
>> >> first. What do you think about following schema/example?
>> >>
>> >> ohci@1000 {
>> >>         compatible =3D "generic-ohci";
>> >>         reg =3D <0x00001000 0x1000>;
>> >>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>> >>
>> >>         primary-hcd {
>> >>                 ohci_port0: port@0 {
>> >>                         reg =3D <0>;
>> >>                 };
>> >>
>> >>                 ohci_port1: port@1 {
>> >>                         reg =3D <1>;
>> >>                 };
>> >>         }
>> >> };
>> >>
>> >> ehci@2000 {
>> >>         compatible =3D "generic-ehci";
>> >>         reg =3D <0x00002000 0x1000>;
>> >>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> >>
>> >>         primary-hcd {
>> >>                 ehci_port0: port@0 {
>> >>                         reg =3D <0>;
>> >>                 };
>> >>
>> >>                 ehci_port1: port@1 {
>> >>                         reg =3D <1>;
>> >>                 };
>> >>         }
>> >> };
>> >>
>> >> xhci@3000 {
>> >>         compatible =3D "generic-xhci";
>> >>         reg =3D <0x00003000 0x1000>;
>> >>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> >>
>> >>         primary-hcd {
>> >>         };
>> >>
>> >>         shared-hcd {
>> >>                 xhci_port0: port@0 {
>> >>                         reg =3D <0>;
>> >>                 };
>> >>         }
>> >> };
>> >>
>> >> With such a DT struct, how could I query port for a Linux-assigne=
d number?
>> >>
>> >> For example with OHCI, EHCI and XHCI drivers compiled, Linux assi=
gns
>> >> number 4 to my XHCI's shared HCD's root hub:
>> >> xhci-hcd 18023000.xhci: xHCI Host Controller
>> >> xhci-hcd 18023000.xhci: new USB bus registered, assigned bus numb=
er 4
>> >> hub 4-0:1.0: USB hub found
>> >> hub 4-0:1.0: 1 port detected
>> >>
>> >> If I disable OHCI and EHCI I get:
>> >> xhci-hcd xhci-hcd.0: xHCI Host Controller
>> >> xhci-hcd xhci-hcd.0: new USB bus registered, assigned bus number =
2
>> >> hub 2-0:1.0: USB hub found
>> >> hub 2-0:1.0: 1 port detected
>> >>
>> >> So I need my "usbport" trigger driver to be able to get "4-1" in =
the
>> >> first case and "2-1" in the second case. I guess I should use
>> >> &xhci_port0 but what then? How could I translate it into
>> >> Linux-assigned numbering?
>> >>
>> >
>> > For your current design, you need to fix shared hcd for xHCI probl=
em,
>> > since xHCI has two buses.
>> >
>> > Below I supply another thought, please check if it is feasible.
>> > In below design, you don't need to change any usb codes.
>> >
>> > dts:
>> >
>> > led_1 {
>> >         led_gpio_1;
>> >         usb_port =3D &ohci_port0, &ehci_port1;
>> > }
>> >
>> > led_2 {
>> >         led_gpio_2;
>> >         usb_port =3D &xhci_port0, &xhci_port1;
>> > }
>> >
>> > ohci@1000 {
>> >         compatible =3D "generic-ohci";
>> >         reg =3D <0x00001000 0x1000>;
>> >         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>> >
>> >         ohci_port0: port@0 {
>> >                 reg =3D <0>;
>> >         };
>> >
>> >         ohci_port1: port@1 {
>> >                 reg =3D <1>;
>> >         };
>> > };
>> >
>> > ehci@2000 {
>> >         compatible =3D "generic-ehci";
>> >         reg =3D <0x00002000 0x1000>;
>> >         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> >
>> >         ehci_port0: port@0 {
>> >                 reg =3D <0>;
>> >         };
>> >
>> >         ehci_port1: port@1 {
>> >                 reg =3D <1>;
>> >         };
>> > };
>> >
>> > xhci@3000 {
>> >         compatible =3D "generic-xhci";
>> >         reg =3D <0x00003000 0x1000>;
>> >         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> >
>> >         /* for xhci, port 0 - [N-1] is USB3, N - [M-1] is USB2/1.
>> >          * The port 0 and port N is the same physical port
>> >          */
>> >         xhci_port0: port@0 {
>> >                 reg =3D <0>;
>> >         };
>> >
>> >         xhci_port1: port@1 {
>> >                 reg =3D <1>;
>> >         };
>> >
>> > };
>> >
>> > At code, compare the usb_device's device_node at usbport_trig_noti=
fy
>> > if it is at led_1's usb device list, light on it.
>>
>> This is quite interesting idea, thanks!
>>
>> So I got following checking code:
>>
>> count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
>> for (i =3D 0; i < count; i++) {
>>     of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
>>     of_property_read_u32(args.np, "reg", &port);
>>     if (args.np->parent =3D=3D usb_dev->bus->controller->of_node &&
>>         port =3D=3D usb_dev->portnum) {
>>             of_node_put(args.np);
>>             return true;
>>     }
>>     of_node_put(args.np);
>> }
>> return false;
>
> No, compares the USB port directly.
>
> count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
> for (i =3D 0; i < count; i++) {
>     of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
>     if (args.np =3D=3D usb_dev->dev.of_node)
>             of_node_put(args.np);
>             return true;
>     }
>     of_node_put(args.np);
> }
> return false;

If we mean to use usb_dev->dev.of_node I *need* to modify USB
subsystem, since this pointer is never being set by the current code.

[   71.410505] usb 1-1: new high-speed USB device number 2 using ehci-p=
latform
[   71.564928] [usbport_trig_notify] usb_dev:c6ac1000 &usb_dev->dev:c6a=
c1068
[   71.579874] [usbport_trig_notify] dev_name(&usb_dev->dev):1-1
[   71.586580] [usbport_trig_notify] usb_dev->dev.of_node:  (null)

Or am I missing something?


>> This works, but I see 3 more problems:
>>
>> 1) How to access list of available USB devices during activation?
>
> You mean during LED activation? eg your usbport_trig_activate?
> Why do you need it?

Yes, I mean usbport_trig_activate. If user plugs in USB device and
*then* activates this trigger, we want to set a proper initial state.
We can't only depend on USB_DEVICE_ADD.


>> 2) What about support for non-DT platforms in usbport driver? Should=
 I
>> still allow specifying ports manually? Are you OK with that?
>
> I am afraid I still don't know how to do it for non-DT platforms.
> You can show your design.

Please take a look at
[PATCH] leds: trigger: Introduce an USB port trigger
https://lkml.org/lkml/2016/7/11/305

Basically my idea was to support:
echo usbport > trigger
echo 4-1 > new_port
echo 2-1 > new_port


>> 3) What about devices with internal hubs? Should we describe their U=
SB
>> ports in DT as well? Any idea how to do this?
>
> Well, the HUB must be hard-wired on board for this LED trigger case.
> So, you can described USB topology well at dts. Please note: the
> USB port phandle at LED node is the physical connector on board which
> the user can plug in USB device, it may be 2nd or more levels from th=
e
> controller.
>
> Below is the example for how to describe 3 levels USB devices, the
> USB ethernet port (axis) is one of the ports at internal HUB (genesys=
).
>
> http://www.spinics.net/lists/linux-usb/msg143698.html

Thanks for this example. I'm only afraid there isn't a way to say what
port "ethernet: asix@1" is attached to. Would that make sense to add
one more property to the "ethernet: asix@1", e.g.
usb-port: <&ehci_port1>;
(assuming there would be ehci_port1 in your DTS)?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
