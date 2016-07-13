From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Wed, 13 Jul 2016 16:50:35 +0300
Message-ID: <87inw9ir4k.fsf@linux.intel.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com> <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com> <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wro=
te:
>> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>> Hi again,
>>>
>>> This is my second try of getting HCD providers into usb subsystem.
>>>
>>> During discussion of V1 I realized there are about 26 drivers adding a
>>> single HCD and all of them would need to be modified. So instead I
>>> decided to put relevant code in usb_add_hcd. It checks if the HCD we
>>> register is a primary one and if so, it registers a proper provider.
>>>
>>> Please note that of_hcd_xlate_simple was also extended to allow getting
>>> shared HCD (which is used e.g. in case of XHCI).
>>>
>>> So now you can have something like:
>>>
>>> ohci: ohci@21000 {
>>>       #usb-cells =3D <0>;
>>>       compatible =3D "generic-ohci";
>>>       reg =3D <0x00001000 0x1000>;
>>>       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>>> };
>>>
>>> ehci: ehci@22000 {
>>>       #usb-cells =3D <0>;
>>>       compatible =3D "generic-ehci";
>>>       reg =3D <0x00002000 0x1000>;
>>>       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>>> };
>>>
>>> xhci: xhci@23000 {
>>>       #usb-cells =3D <1>;
>>>       compatible =3D "generic-xhci";
>>>       reg =3D <0x00003000 0x1000>;
>>>       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>>> };
>>>
>>> The last (second) patch is not supposed to be applied, it's used only as
>>> a proof and example of how providers can be used.
>>
>> nowhere here (or in previous patch) you clarify why exactly you need
>> this. What is your LED trigger supposed to do? Why can't it handle ports
>> changing number in different boots? Why do we need this at all? Why is
>> your code DT-specific?
>>
>> There are still too many 'unknowns' here.
>
> Are you sure you saw my reply to Peter's question?
> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
> http://www.spinics.net/lists/linux-usb/msg143708.html
> http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2
>
> I think it should answer (some of?) your questions. Can you read it
> and see if it gets a bit clearer?

well, all that says is that you're writing a LED trigger to toggle LED
when a USB device gets added to a specified port. I don't think you need
the actual port number for that. You should have a phandle to the actual
port, whatever its number is, or a phandle to the (root-)Hub and a port
number from that hub.

The problem, really, is that DT descriptor of USB Hosts is very, very
minimal. Perhaps there's something more extensively defined from the
original Open Firmware USB Addendum.

There's also no documentation for your new bindings nor are there any
user demonstrating how DT should be written to use these new bindings.

IMO, if you're describing it in DT and you need a specific port name,
your bindings are wrong.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhkcrAAoJEIaOsuA1yqRE0sMP/1rrK3SFOyTsRev5tPHgAhD2
7JjSLJ95ughDCrP7bOHQaXFGWR1B/sWzk33NhzFYxAAnawIFg1BB1w+56Z00Mnnc
Z0oOuVVfowR7buX+EXp3MwyPqciNyvtzPw/8Z/Zcr3NsEW532F4LSH8TJjvZsc+d
dhVREFLUQxZMViRdxs36nJrAldq9mdqvjgiXk3fMlxKCDYUHjYgx7M2m+Vd+lYtE
lHKu6ffmhNzVwb96RXd1V4KyyDIz1uNvmBWR7zqrWRt20SqGAoUhbMIwtosM7LMw
sgQ5Io4h/K87xWtOr5eh5a2QS3HsX0VlzzoFy1ipObMDd+H6gR/opYwHkJkz0/hx
RNYAY6wuXlAhlH/HDq5Uj4Ap5CU1w3DXRhUF16CYYwtX0TTBpLzJC1hfrZEp+fkw
oQXHnjUGGYXnOW4YzjCQNOPKA0DXp2y3akESptIfua36LfXEWmjySgtQ8pA4MLgF
8rpJx6b7SLd552ltayKaJlpin5w29w7lgFug7aeC1xcoNVRRnN5NfavIqAu7u8Ct
docwlf5GsAORrd2/FcJa/x/IvJE/llOWBDoGmMRkY2WWfeC0xAuo/n2VYdL/blQU
ass3DlxFxNsdf6FzYUeRiVuunReqMBIdUP7JPNfdnYkVthnb3WLqLje0SCE/+vEY
tkue8kOKdN7pnGgmjy4P
=cnSL
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
