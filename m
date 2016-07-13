From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: add HCD providers
Date: Wed, 13 Jul 2016 07:21:09 +0200
Message-ID: <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com> <20160713045140.GA29915@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160713045140.GA29915@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:LED SUBSYSTEM" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 13 July 2016 at 06:51, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jul 12, 2016 at 02:35:18PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> I was working on an "usbport" LED trigger driver and specifying its
>> default state in DT. I realized I can't really determine numbering o=
f
>> USB ports on any device as it depends on compiled drivers and the
>> loading orders.
>>
>> It means that my physical USB port can be e.g. 1-1 or 2-1 depending =
on
>> my current config/setup. I needed a way to specify a particular HCD =
in
>> DT and then hardcode port number (as this part doesn't change).
>>
>
> I have a question:
>
> What does your "usbport" LED trigger for? What kinds of information
> you would like to show on LED?

It's a trigger that turns on LED whenever USB device appears at
specified USB port. There are plenty of home routers that have USB
labeled LED(s). To support them nicely, first of all we need a trigger
that will watch for USB subsystem events. Secondly we need a way to
setup its initial state correctly as most users don't want to play
with sysfs on their own.

I sent usbport trigger in:
[PATCH] leds: trigger: Introduce an USB port trigger
<1468239883-22695-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
https://lkml.org/lkml/2016/7/11/305
You may read commit message and ledtrig-usbport.txt for more details.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
