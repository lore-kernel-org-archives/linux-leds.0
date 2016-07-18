From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Mon, 18 Jul 2016 08:55:52 +0200
Message-ID: <CACna6rzcbZRpAshvmeG0_DJeQh1Tvnde4nTkAHMAWinK0cgqpQ@mail.gmail.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com> <20160718023126.GB31293@shlinux2>
 <CACna6rxii6hkX6rOTbYXn90AoanP1UMKyCZrUjQ08w0eid4aDA@mail.gmail.com>
 <20160718054010.GE31293@shlinux2> <CACna6rxuiXS=cBkN4b9mzSBfcMdqpENyUmQ973p7yR1S=WotWA@mail.gmail.com>
 <20160718055345.GF31293@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160718055345.GF31293@shlinux2>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 18 July 2016 at 07:53, Peter Chen <hzpeterchen@gmail.com> wrote:
> On Mon, Jul 18, 2016 at 07:57:34AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 18 July 2016 at 07:40, Peter Chen <hzpeterchen@gmail.com> wrote:
>> > On Mon, Jul 18, 2016 at 06:44:49AM +0200, Rafa=C5=82 Mi=C5=82ecki =
wrote:
>> >> On 18 July 2016 at 04:31, Peter Chen <hzpeterchen@gmail.com> wrot=
e:
>> >> > On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ec=
ki wrote:
>> >> >> +
>> >> >> +usbport trigger:
>> >> >> +- usb-ports : List of USB ports that usbport should observed =
for turning on a
>> >> >> +           given LED.
>> >> >> +
>> >> >
>> >> > %s/should/should be
>> >>
>> >> Thanks.
>> >>
>> >>
>> >> >> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/=
leds/trigger/ledtrig-usbport.c
>> >> >> new file mode 100644
>> >> >> index 0000000..97b064c
>> >> >> --- /dev/null
>> >> >> +++ b/drivers/leds/trigger/ledtrig-usbport.c
>> >> >> @@ -0,0 +1,206 @@
>> >> >> +/*
>> >> >> + * USB port LED trigger
>> >> >> + *
>> >> >> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@=
gmail.com>
>> >> >> + *
>> >> >> + * This program is free software; you can redistribute it and=
/or modify
>> >> >> + * it under the terms of the GNU General Public License as pu=
blished by
>> >> >> + * the Free Software Foundation; either version 2 of the Lice=
nse, or (at
>> >> >> + * your option) any later version.
>> >> >> + */
>> >> >
>
> In your COPYRIGHT, it says "or any later version". But afaik, It shou=
ld
> not be on GPL v3.

If one picks my code, modifies it, relicenses it using GPL v3, we
can't include it anymore. It's the same story as with BSD systems and
their BSD licenses. If one picks e.g. BSD 3-clause licensed code,
makes it GPL, releases it (e.g. by putting in Linux), BSD can't use it
anymore.

Still, this license is GPL v2 compatible and as is it can be included
in the Linux.

--=20
Rafa=C5=82
