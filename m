From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 0/1] usb: add HCD providers
Date: Wed, 13 Jul 2016 15:34:08 +0200
Message-ID: <CACna6rxGN5evQhRpNORUP4RP3-pMa292pQW=4=VWLLnzJyhJJw@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com> <87lh15isi7.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lh15isi7.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 13 July 2016 at 15:20, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> w=
rote:
> Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> Hi again,
>>
>> This is my second try of getting HCD providers into usb subsystem.
>>
>> During discussion of V1 I realized there are about 26 drivers adding=
 a
>> single HCD and all of them would need to be modified. So instead I
>> decided to put relevant code in usb_add_hcd. It checks if the HCD we
>> register is a primary one and if so, it registers a proper provider.
>>
>> Please note that of_hcd_xlate_simple was also extended to allow gett=
ing
>> shared HCD (which is used e.g. in case of XHCI).
>>
>> So now you can have something like:
>>
>> ohci: ohci@21000 {
>>       #usb-cells =3D <0>;
>>       compatible =3D "generic-ohci";
>>       reg =3D <0x00001000 0x1000>;
>>       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>> };
>>
>> ehci: ehci@22000 {
>>       #usb-cells =3D <0>;
>>       compatible =3D "generic-ehci";
>>       reg =3D <0x00002000 0x1000>;
>>       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> };
>>
>> xhci: xhci@23000 {
>>       #usb-cells =3D <1>;
>>       compatible =3D "generic-xhci";
>>       reg =3D <0x00003000 0x1000>;
>>       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>> };
>>
>> The last (second) patch is not supposed to be applied, it's used onl=
y as
>> a proof and example of how providers can be used.
>
> nowhere here (or in previous patch) you clarify why exactly you need
> this. What is your LED trigger supposed to do? Why can't it handle po=
rts
> changing number in different boots? Why do we need this at all? Why i=
s
> your code DT-specific?
>
> There are still too many 'unknowns' here.

Are you sure you saw my reply to Peter's question?
<CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
http://www.spinics.net/lists/linux-usb/msg143708.html
http://marc.info/?l=3Dlinux-usb&m=3D146838735627093&w=3D2

I think it should answer (some of?) your questions. Can you read it
and see if it gets a bit clearer?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
