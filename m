From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 PROOF OF CONCEPT 2/1] trigger: ledtrig-usbport: read
 initial state from DT
Date: Wed, 13 Jul 2016 17:05:32 +0200
Message-ID: <CACna6rwgjZoPiU1Qo_4PU35ZuovN-cBe5kVZpUQQPDUf1xQyLA@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <1468413734-9569-1-git-send-email-zajec5@gmail.com> <1468413734-9569-3-git-send-email-zajec5@gmail.com>
 <578654A7.2020909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <578654A7.2020909-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 13 July 2016 at 16:48, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> w=
rote:
> On 07/13/2016 02:42 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> This allows specifying USB ports that should be observed by a trigge=
r
>> right after activating it. Example:
>>
>> usb {
>>         gpios =3D <&gpio 0 GPIO_ACTIVE_HIGH>;
>>         linux,default-trigger =3D "usbport";
>>         usb-controllers =3D <&ohci>, <&ehci>, <&xhci USB_HCD_SHARED>=
;
>>         usb-ports =3D "1", "1", "1";
>
>
> Port is a numerical value, right?
> Wouldn't it be better to define it as an array of integers?
>
> e.g.: usb-ports =3D <1>. <1>, <1>;

Not always. Let me quote this part of "usbport" documentation:

> This also allows handling devices with internal hubs (when root hub's=
 port has
> always a device (hub) connected). User can simply specify specify int=
ernal hub
> ports then (e.g. 1-1.1, 1-1.2, etc.).

In such case we'd need usb-ports =3D "1.1", "1.2";

Anyway, there is a discussion ongoing in:
[PATCH V2 0/1] usb: add HCD providers
so let's see if someone will have a better idea for referencing USB
ports inside DT.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
