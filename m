From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Mon, 18 Jul 2016 13:53:45 +0800
Message-ID: <20160718055345.GF31293@shlinux2>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com>
 <20160718023126.GB31293@shlinux2>
 <CACna6rxii6hkX6rOTbYXn90AoanP1UMKyCZrUjQ08w0eid4aDA@mail.gmail.com>
 <20160718054010.GE31293@shlinux2>
 <CACna6rxuiXS=cBkN4b9mzSBfcMdqpENyUmQ973p7yR1S=WotWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rxuiXS=cBkN4b9mzSBfcMdqpENyUmQ973p7yR1S=WotWA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Jul 18, 2016 at 07:57:34AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 18 July 2016 at 07:40, Peter Chen <hzpeterchen@gmail.com> wrote:
> > On Mon, Jul 18, 2016 at 06:44:49AM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> On 18 July 2016 at 04:31, Peter Chen <hzpeterchen@gmail.com> wrote=
:
> >> > On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82eck=
i wrote:
> >> >> +
> >> >> +usbport trigger:
> >> >> +- usb-ports : List of USB ports that usbport should observed f=
or turning on a
> >> >> +           given LED.
> >> >> +
> >> >
> >> > %s/should/should be
> >>
> >> Thanks.
> >>
> >>
> >> >> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/l=
eds/trigger/ledtrig-usbport.c
> >> >> new file mode 100644
> >> >> index 0000000..97b064c
> >> >> --- /dev/null
> >> >> +++ b/drivers/leds/trigger/ledtrig-usbport.c
> >> >> @@ -0,0 +1,206 @@
> >> >> +/*
> >> >> + * USB port LED trigger
> >> >> + *
> >> >> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@g=
mail.com>
> >> >> + *
> >> >> + * This program is free software; you can redistribute it and/=
or modify
> >> >> + * it under the terms of the GNU General Public License as pub=
lished by
> >> >> + * the Free Software Foundation; either version 2 of the Licen=
se, or (at
> >> >> + * your option) any later version.
> >> >> + */
> >> >

In your COPYRIGHT, it says "or any later version". But afaik, It should
not be on GPL v3.

Peter
> >> > GPL v2 only.
> >> >
> >> >> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.co=
m>");
> >> >> +MODULE_DESCRIPTION("USB port trigger");
> >> >> +MODULE_LICENSE("GPL");
> >> >
> >> > GPL v2
> >>
> >> What's the reason for this? I don't have any real preference, but =
I
> >> never heard heard about kernel/Linux preference neither.
> >>
> >
> > https://en.wikipedia.org/wiki/Linux_kernel
>=20
> Well, Linux is released under GPL v2, I'm well aware of that. It mean=
s
> all its code needs to be GPL v2 compatible. There are multiple
> compatible licenses: MIT, BSD 3-clause, BSD 2-clause. The one I used
> allows treating code as GPL V2 as well. I could release this code
> using MIT and it should be acceptable as well.
>=20
> I still don't see what's wrong with the picked license.
>=20
> --=20
> Rafa=C5=82

--=20

Best Regards,
Peter Chen
