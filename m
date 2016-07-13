From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Wed, 13 Jul 2016 16:40:53 +0200
Message-ID: <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com>
 <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com> <87inw9ir4k.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87inw9ir4k.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 13 July 2016 at 15:50, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> w=
rote:
> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org=
> wrote:
>>> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>> Hi again,
>>>>
>>>> This is my second try of getting HCD providers into usb subsystem.
>>>>
>>>> During discussion of V1 I realized there are about 26 drivers addi=
ng a
>>>> single HCD and all of them would need to be modified. So instead I
>>>> decided to put relevant code in usb_add_hcd. It checks if the HCD =
we
>>>> register is a primary one and if so, it registers a proper provide=
r.
>>>>
>>>> Please note that of_hcd_xlate_simple was also extended to allow ge=
tting
>>>> shared HCD (which is used e.g. in case of XHCI).
>>>>
>>>> So now you can have something like:
>>>>
>>>> ohci: ohci@21000 {
>>>>       #usb-cells =3D <0>;
>>>>       compatible =3D "generic-ohci";
>>>>       reg =3D <0x00001000 0x1000>;
>>>>       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>>> };
>>>>
>>>> ehci: ehci@22000 {
>>>>       #usb-cells =3D <0>;
>>>>       compatible =3D "generic-ehci";
>>>>       reg =3D <0x00002000 0x1000>;
>>>>       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>>> };
>>>>
>>>> xhci: xhci@23000 {
>>>>       #usb-cells =3D <1>;
>>>>       compatible =3D "generic-xhci";
>>>>       reg =3D <0x00003000 0x1000>;
>>>>       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>>>> };
>>>>
>>>> The last (second) patch is not supposed to be applied, it's used o=
nly as
>>>> a proof and example of how providers can be used.
>>>
>>> nowhere here (or in previous patch) you clarify why exactly you nee=
d
>>> this. What is your LED trigger supposed to do? Why can't it handle =
ports
>>> changing number in different boots? Why do we need this at all? Why=
 is
>>> your code DT-specific?
>>>
>>> There are still too many 'unknowns' here.
>>
>> Are you sure you saw my reply to Peter's question?
>> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
>> http://www.spinics.net/lists/linux-usb/msg143708.html
>> http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2
>>
>> I think it should answer (some of?) your questions. Can you read it
>> and see if it gets a bit clearer?
>
> well, all that says is that you're writing a LED trigger to toggle LE=
D
> when a USB device gets added to a specified port. I don't think you n=
eed
> the actual port number for that. You should have a phandle to the act=
ual
> port, whatever its number is, or a phandle to the (root-)Hub and a po=
rt
> number from that hub.
>
> The problem, really, is that DT descriptor of USB Hosts is very, very
> minimal. Perhaps there's something more extensively defined from the
> original Open Firmware USB Addendum.

Thanks for your effort and looking at this closely. You're right, I'm
interested in referencing USB ports, but I'm using controller phandle
(and then I specify ports manually).

Having each port described by DT would be helpful, it's just something
I didn't find implemented, so I started looking for different ways. It
seems I should have picked a different solution.

So should I work on describing USB ports in DT instead? This looks
like a complex thing to describe, so I'd like to ask for some guidance
first. What do you think about following schema/example?

ohci@1000 {
        compatible =3D "generic-ohci";
        reg =3D <0x00001000 0x1000>;
        interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;

        primary-hcd {
                ohci_port0: port@0 {
                        reg =3D <0>;
                };

                ohci_port1: port@1 {
                        reg =3D <1>;
                };
        }
};

ehci@2000 {
        compatible =3D "generic-ehci";
        reg =3D <0x00002000 0x1000>;
        interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;

        primary-hcd {
                ehci_port0: port@0 {
                        reg =3D <0>;
                };

                ehci_port1: port@1 {
                        reg =3D <1>;
                };
        }
};

xhci@3000 {
        compatible =3D "generic-xhci";
        reg =3D <0x00003000 0x1000>;
        interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;

        primary-hcd {
        };

        shared-hcd {
                xhci_port0: port@0 {
                        reg =3D <0>;
                };
        }
};

With such a DT struct, how could I query port for a Linux-assigned numb=
er?

=46or example with OHCI, EHCI and XHCI drivers compiled, Linux assigns
number 4 to my XHCI's shared HCD's root hub:
xhci-hcd 18023000.xhci: xHCI Host Controller
xhci-hcd 18023000.xhci: new USB bus registered, assigned bus number 4
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 1 port detected

If I disable OHCI and EHCI I get:
xhci-hcd xhci-hcd.0: xHCI Host Controller
xhci-hcd xhci-hcd.0: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected

So I need my "usbport" trigger driver to be able to get "4-1" in the
first case and "2-1" in the second case. I guess I should use
&xhci_port0 but what then? How could I translate it into
Linux-assigned numbering?


> There's also no documentation for your new bindings nor are there any
> user demonstrating how DT should be written to use these new bindings=
=2E
>
> IMO, if you're describing it in DT and you need a specific port name,
> your bindings are wrong.

OK, point taken. I'll make sure to document it once we agree how to
proceed with implementation.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
