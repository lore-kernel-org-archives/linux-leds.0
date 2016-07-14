From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Thu, 14 Jul 2016 17:52:43 +0200
Message-ID: <CACna6ryja8L+ORAzOtiGgUFTQ6OGcieJX4YO+=AQV0KptZftgQ@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com>
 <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
 <87inw9ir4k.fsf@linux.intel.com> <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com>
 <20160714094836.GB28730@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34573 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbcGNPwp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2016 11:52:45 -0400
In-Reply-To: <20160714094836.GB28730@shlinux2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 14 July 2016 at 11:48, Peter Chen <hzpeterchen@gmail.com> wrote:
> On Wed, Jul 13, 2016 at 04:40:53PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 13 July 2016 at 15:50, Felipe Balbi <felipe.balbi@linux.intel.com=
> wrote:
>> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
>> >> On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi@linux.intel.=
com> wrote:
>> >>> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
>> >>>> Hi again,
>> >>>>
>> >>>> This is my second try of getting HCD providers into usb subsyst=
em.
>> >>>>
>> >>>> During discussion of V1 I realized there are about 26 drivers a=
dding a
>> >>>> single HCD and all of them would need to be modified. So instea=
d I
>> >>>> decided to put relevant code in usb_add_hcd. It checks if the H=
CD we
>> >>>> register is a primary one and if so, it registers a proper prov=
ider.
>> >>>>
>> >>>> Please note that of_hcd_xlate_simple was also extended to allow=
 getting
>> >>>> shared HCD (which is used e.g. in case of XHCI).
>> >>>>
>> >>>> So now you can have something like:
>> >>>>
>> >>>> ohci: ohci@21000 {
>> >>>>       #usb-cells =3D <0>;
>> >>>>       compatible =3D "generic-ohci";
>> >>>>       reg =3D <0x00001000 0x1000>;
>> >>>>       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>> >>>> };
>> >>>>
>> >>>> ehci: ehci@22000 {
>> >>>>       #usb-cells =3D <0>;
>> >>>>       compatible =3D "generic-ehci";
>> >>>>       reg =3D <0x00002000 0x1000>;
>> >>>>       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> >>>> };
>> >>>>
>> >>>> xhci: xhci@23000 {
>> >>>>       #usb-cells =3D <1>;
>> >>>>       compatible =3D "generic-xhci";
>> >>>>       reg =3D <0x00003000 0x1000>;
>> >>>>       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> >>>> };
>> >>>>
>> >>>> The last (second) patch is not supposed to be applied, it's use=
d only as
>> >>>> a proof and example of how providers can be used.
>> >>>
>> >>> nowhere here (or in previous patch) you clarify why exactly you =
need
>> >>> this. What is your LED trigger supposed to do? Why can't it hand=
le ports
>> >>> changing number in different boots? Why do we need this at all? =
Why is
>> >>> your code DT-specific?
>> >>>
>> >>> There are still too many 'unknowns' here.
>> >>
>> >> Are you sure you saw my reply to Peter's question?
>> >> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw@mail.gmail.c=
om>
>> >> http://www.spinics.net/lists/linux-usb/msg143708.html
>> >> http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2
>> >>
>> >> I think it should answer (some of?) your questions. Can you read =
it
>> >> and see if it gets a bit clearer?
>> >
>> > well, all that says is that you're writing a LED trigger to toggle=
 LED
>> > when a USB device gets added to a specified port. I don't think yo=
u need
>> > the actual port number for that. You should have a phandle to the =
actual
>> > port, whatever its number is, or a phandle to the (root-)Hub and a=
 port
>> > number from that hub.
>> >
>> > The problem, really, is that DT descriptor of USB Hosts is very, v=
ery
>> > minimal. Perhaps there's something more extensively defined from t=
he
>> > original Open Firmware USB Addendum.
>>
>> Thanks for your effort and looking at this closely. You're right, I'=
m
>> interested in referencing USB ports, but I'm using controller phandl=
e
>> (and then I specify ports manually).
>>
>> Having each port described by DT would be helpful, it's just somethi=
ng
>> I didn't find implemented, so I started looking for different ways. =
It
>> seems I should have picked a different solution.
>>
>> So should I work on describing USB ports in DT instead? This looks
>> like a complex thing to describe, so I'd like to ask for some guidan=
ce
>> first. What do you think about following schema/example?
>>
>> ohci@1000 {
>>         compatible =3D "generic-ohci";
>>         reg =3D <0x00001000 0x1000>;
>>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>
>>         primary-hcd {
>>                 ohci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>
>>                 ohci_port1: port@1 {
>>                         reg =3D <1>;
>>                 };
>>         }
>> };
>>
>> ehci@2000 {
>>         compatible =3D "generic-ehci";
>>         reg =3D <0x00002000 0x1000>;
>>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>
>>         primary-hcd {
>>                 ehci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>
>>                 ehci_port1: port@1 {
>>                         reg =3D <1>;
>>                 };
>>         }
>> };
>>
>> xhci@3000 {
>>         compatible =3D "generic-xhci";
>>         reg =3D <0x00003000 0x1000>;
>>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>>
>>         primary-hcd {
>>         };
>>
>>         shared-hcd {
>>                 xhci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>         }
>> };
>>
>> With such a DT struct, how could I query port for a Linux-assigned n=
umber?
>>
>> For example with OHCI, EHCI and XHCI drivers compiled, Linux assigns
>> number 4 to my XHCI's shared HCD's root hub:
>> xhci-hcd 18023000.xhci: xHCI Host Controller
>> xhci-hcd 18023000.xhci: new USB bus registered, assigned bus number =
4
>> hub 4-0:1.0: USB hub found
>> hub 4-0:1.0: 1 port detected
>>
>> If I disable OHCI and EHCI I get:
>> xhci-hcd xhci-hcd.0: xHCI Host Controller
>> xhci-hcd xhci-hcd.0: new USB bus registered, assigned bus number 2
>> hub 2-0:1.0: USB hub found
>> hub 2-0:1.0: 1 port detected
>>
>> So I need my "usbport" trigger driver to be able to get "4-1" in the
>> first case and "2-1" in the second case. I guess I should use
>> &xhci_port0 but what then? How could I translate it into
>> Linux-assigned numbering?
>>
>
> For your current design, you need to fix shared hcd for xHCI problem,
> since xHCI has two buses.
>
> Below I supply another thought, please check if it is feasible.
> In below design, you don't need to change any usb codes.
>
> dts:
>
> led_1 {
>         led_gpio_1;
>         usb_port =3D &ohci_port0, &ehci_port1;
> }
>
> led_2 {
>         led_gpio_2;
>         usb_port =3D &xhci_port0, &xhci_port1;
> }
>
> ohci@1000 {
>         compatible =3D "generic-ohci";
>         reg =3D <0x00001000 0x1000>;
>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>
>         ohci_port0: port@0 {
>                 reg =3D <0>;
>         };
>
>         ohci_port1: port@1 {
>                 reg =3D <1>;
>         };
> };
>
> ehci@2000 {
>         compatible =3D "generic-ehci";
>         reg =3D <0x00002000 0x1000>;
>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>
>         ehci_port0: port@0 {
>                 reg =3D <0>;
>         };
>
>         ehci_port1: port@1 {
>                 reg =3D <1>;
>         };
> };
>
> xhci@3000 {
>         compatible =3D "generic-xhci";
>         reg =3D <0x00003000 0x1000>;
>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>
>         /* for xhci, port 0 - [N-1] is USB3, N - [M-1] is USB2/1.
>          * The port 0 and port N is the same physical port
>          */
>         xhci_port0: port@0 {
>                 reg =3D <0>;
>         };
>
>         xhci_port1: port@1 {
>                 reg =3D <1>;
>         };
>
> };
>
> At code, compare the usb_device's device_node at usbport_trig_notify
> if it is at led_1's usb device list, light on it.

This is quite interesting idea, thanks!

So I got following checking code:

count =3D of_count_phandle_with_args(np, "usb-ports", NULL);
for (i =3D 0; i < count; i++) {
    of_parse_phandle_with_args(np, "usb-ports", NULL, i, &args);
    of_property_read_u32(args.np, "reg", &port);
    if (args.np->parent =3D=3D usb_dev->bus->controller->of_node &&
        port =3D=3D usb_dev->portnum) {
            of_node_put(args.np);
            return true;
    }
    of_node_put(args.np);
}
return false;

This works, but I see 3 more problems:

1) How to access list of available USB devices during activation?
2) What about support for non-DT platforms in usbport driver? Should I
still allow specifying ports manually? Are you OK with that?
3) What about devices with internal hubs? Should we describe their USB
ports in DT as well? Any idea how to do this? Nested ports in ports?
If so, how to parse such a tree in usbport driver? I could expect
something like:

ehci_port0: port@0 {
        reg =3D <0>;

        ehci_nested_port0: port@0 {
                reg =3D <0>;
        };

        ehci_nested_port1: port@1 {
                reg =3D <1>;
        };
};

ehci_port1: port@1 {
        reg =3D <1>;
};

Or even more complex tree, if we want to put another controller node
between 1st level ports and 2nd level ports. Should I then use
something like:
ports =3D <&ehci_nested_port1>
? If so, is there any helper for going nodes up, up to the root,
looking for "port" ones? Because I'll need to know it's port 0 of root
hub and port 1 of internal hub.

--=20
Rafa=C5=82
