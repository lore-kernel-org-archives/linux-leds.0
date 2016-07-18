From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Mon, 18 Jul 2016 06:44:49 +0200
Message-ID: <CACna6rxii6hkX6rOTbYXn90AoanP1UMKyCZrUjQ08w0eid4aDA@mail.gmail.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com> <20160718023126.GB31293@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160718023126.GB31293@shlinux2>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 18 July 2016 at 04:31, Peter Chen <hzpeterchen@gmail.com> wrote:
> On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> +
>> +usbport trigger:
>> +- usb-ports : List of USB ports that usbport should observed for tu=
rning on a
>> +           given LED.
>> +
>
> %s/should/should be

Thanks.


>> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/t=
rigger/ledtrig-usbport.c
>> new file mode 100644
>> index 0000000..97b064c
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-usbport.c
>> @@ -0,0 +1,206 @@
>> +/*
>> + * USB port LED trigger
>> + *
>> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.=
com>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r (at
>> + * your option) any later version.
>> + */
>
> GPL v2 only.
>
>> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com>");
>> +MODULE_DESCRIPTION("USB port trigger");
>> +MODULE_LICENSE("GPL");
>
> GPL v2

What's the reason for this? I don't have any real preference, but I
never heard heard about kernel/Linux preference neither.

--=20
Rafa=C5=82
