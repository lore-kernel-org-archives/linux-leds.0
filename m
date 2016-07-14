From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Thu, 14 Jul 2016 13:05:22 +0300
Message-ID: <877fcoilgd.fsf@linux.intel.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com> <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com> <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com> <87inw9ir4k.fsf@linux.intel.com> <CACna6rxscQAE_hrM7Rnsntp5QZjL2kD0+mbuXgfo6kPQZ=UDJw@mail.gmail.com> <20160714094836.GB28730@shlinux2>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160714094836.GB28730@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> On Wed, Jul 13, 2016 at 04:40:53PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 13 July 2016 at 15:50, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wr=
ote:
>> > Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> >> On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>=
 wrote:
>> >>> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> >>>> Hi again,
>> >>>>
>> >>>> This is my second try of getting HCD providers into usb subsystem.
>> >>>>
>> >>>> During discussion of V1 I realized there are about 26 drivers addin=
g a
>> >>>> single HCD and all of them would need to be modified. So instead I
>> >>>> decided to put relevant code in usb_add_hcd. It checks if the HCD we
>> >>>> register is a primary one and if so, it registers a proper provider.
>> >>>>
>> >>>> Please note that of_hcd_xlate_simple was also extended to allow get=
ting
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
>> >>>> The last (second) patch is not supposed to be applied, it's used on=
ly as
>> >>>> a proof and example of how providers can be used.
>> >>>
>> >>> nowhere here (or in previous patch) you clarify why exactly you need
>> >>> this. What is your LED trigger supposed to do? Why can't it handle p=
orts
>> >>> changing number in different boots? Why do we need this at all? Why =
is
>> >>> your code DT-specific?
>> >>>
>> >>> There are still too many 'unknowns' here.
>> >>
>> >> Are you sure you saw my reply to Peter's question?
>> >> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
>> >> http://www.spinics.net/lists/linux-usb/msg143708.html
>> >> http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2
>> >>
>> >> I think it should answer (some of?) your questions. Can you read it
>> >> and see if it gets a bit clearer?
>> >
>> > well, all that says is that you're writing a LED trigger to toggle LED
>> > when a USB device gets added to a specified port. I don't think you ne=
ed
>> > the actual port number for that. You should have a phandle to the actu=
al
>> > port, whatever its number is, or a phandle to the (root-)Hub and a port
>> > number from that hub.
>> >
>> > The problem, really, is that DT descriptor of USB Hosts is very, very
>> > minimal. Perhaps there's something more extensively defined from the
>> > original Open Firmware USB Addendum.
>>=20
>> Thanks for your effort and looking at this closely. You're right, I'm
>> interested in referencing USB ports, but I'm using controller phandle
>> (and then I specify ports manually).
>>=20
>> Having each port described by DT would be helpful, it's just something
>> I didn't find implemented, so I started looking for different ways. It
>> seems I should have picked a different solution.
>>=20
>> So should I work on describing USB ports in DT instead? This looks
>> like a complex thing to describe, so I'd like to ask for some guidance
>> first. What do you think about following schema/example?
>>=20
>> ohci@1000 {
>>         compatible =3D "generic-ohci";
>>         reg =3D <0x00001000 0x1000>;
>>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>=20
>>         primary-hcd {
>>                 ohci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>=20
>>                 ohci_port1: port@1 {
>>                         reg =3D <1>;
>>                 };
>>         }
>> };
>>=20
>> ehci@2000 {
>>         compatible =3D "generic-ehci";
>>         reg =3D <0x00002000 0x1000>;
>>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>=20
>>         primary-hcd {
>>                 ehci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>=20
>>                 ehci_port1: port@1 {
>>                         reg =3D <1>;
>>                 };
>>         }
>> };
>>=20
>> xhci@3000 {
>>         compatible =3D "generic-xhci";
>>         reg =3D <0x00003000 0x1000>;
>>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>>=20
>>         primary-hcd {
>>         };
>>=20
>>         shared-hcd {
>>                 xhci_port0: port@0 {
>>                         reg =3D <0>;
>>                 };
>>         }
>> };
>>=20
>> With such a DT struct, how could I query port for a Linux-assigned numbe=
r?
>>=20
>> For example with OHCI, EHCI and XHCI drivers compiled, Linux assigns
>> number 4 to my XHCI's shared HCD's root hub:
>> xhci-hcd 18023000.xhci: xHCI Host Controller
>> xhci-hcd 18023000.xhci: new USB bus registered, assigned bus number 4
>> hub 4-0:1.0: USB hub found
>> hub 4-0:1.0: 1 port detected
>>=20
>> If I disable OHCI and EHCI I get:
>> xhci-hcd xhci-hcd.0: xHCI Host Controller
>> xhci-hcd xhci-hcd.0: new USB bus registered, assigned bus number 2
>> hub 2-0:1.0: USB hub found
>> hub 2-0:1.0: 1 port detected
>>=20
>> So I need my "usbport" trigger driver to be able to get "4-1" in the
>> first case and "2-1" in the second case. I guess I should use
>> &xhci_port0 but what then? How could I translate it into
>> Linux-assigned numbering?
>>=20
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
> 	led_gpio_1;
> 	usb_port =3D &ohci_port0, &ehci_port1;
> }
>
> led_2 {
> 	led_gpio_2;
> 	usb_port =3D &xhci_port0, &xhci_port1;
> }
>
> ohci@1000 {
>         compatible =3D "generic-ohci";
>         reg =3D <0x00001000 0x1000>;
>         interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>
> 	ohci_port0: port@0 {
> 		reg =3D <0>;
> 	};
>
> 	ohci_port1: port@1 {
> 		reg =3D <1>;
> 	};
> };
>
> ehci@2000 {
>         compatible =3D "generic-ehci";
>         reg =3D <0x00002000 0x1000>;
>         interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>
> 	ehci_port0: port@0 {
> 		reg =3D <0>;
> 	};
>
> 	ehci_port1: port@1 {
> 		reg =3D <1>;
> 	};
> };
>
> xhci@3000 {
>         compatible =3D "generic-xhci";
>         reg =3D <0x00003000 0x1000>;
>         interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>
> 	/* for xhci, port 0 - [N-1] is USB3, N - [M-1] is USB2/1.
> 	 * The port 0 and port N is the same physical port
> 	 */
> 	xhci_port0: port@0 {
> 		reg =3D <0>;
> 	};
>
> 	xhci_port1: port@1 {
> 		reg =3D <1>;
> 	};
>
> };
>
> At code, compare the usb_device's device_node at usbport_trig_notify
> if it is at led_1's usb device list, light on it.

that's what I was thinking, yes. Instead of maching a port number, match
the actual device.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXh2PjAAoJEIaOsuA1yqREosYQAKW7ECCcbCIkywK41fgq4mPo
Cq4QQcvh+/Kd1dLT7trm3HBf4ynJU438tcLpMthd2VZHKWGrumHUwNQ8IkduuRht
piKTUoIj62J1moyMDuslPlBjKntF7VM1rKyS3rnAsz+ttAa57h7N5vM1DlG6MUQN
+QJcEnQPNW0yqOK0whXvSBHRbH7z1qEjLW90Xv6VDOnsGgU9A+PdyUe+iYatEjxg
M2F+Hx9nXQOqr4DbL4xigJg7ZjoUkQjihvObm+9i9RKkauInYmWJHHMPiUPo4S/p
W09YC94VKbHcWTjWcqPsxqk3JheYeHVRMa3cqwk3SfjF28KuBL4Pgpx/mMYflrWn
PBkQShdN78y/gHzcHAWGSsXnBx3BMCW7oPOfvOyqpF6uz1BHKNwl2gkmKcceSb+w
iZt90C8m9OQqwyhDzw9Wlv4uFVcp/f32dmO8hLnWFS9ih03fpA6qlZqB+V66wp2l
txJW7tti0Ix/MdECv/acIhNUfwqSGU59mMxaO+u3o99EOf8m7fw6wyH4kPLLkksX
EsLVi6yx4KjpGi+fxf5a93QQXn9JDB7/xkkMYKRyGG81PAVFaTx9VW6YqCwuhv6P
ci5PBhhyJQyO9NK03UYwaGusepAk4rsYmJ6gSpwmJt/wrK2epOcyavfZtblCN+Lw
HfpEq+lRnR1soEupxOEL
=EuZO
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
