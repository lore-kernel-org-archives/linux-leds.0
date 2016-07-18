From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Mon, 18 Jul 2016 10:31:26 +0800
Message-ID: <20160718023126.GB31293@shlinux2>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36157 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbcGRCj2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 17 Jul 2016 22:39:28 -0400
Content-Disposition: inline
In-Reply-To: <1468617060-29830-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> +
> +usbport trigger:
> +- usb-ports : List of USB ports that usbport should observed for tur=
ning on a
> +	      given LED.
> +

%s/should/should be

>  Examples:
> =20
>  system-status {
> @@ -58,6 +64,11 @@ system-status {
>  	...
>  };
> =20
> +usb {
> +	label =3D "USB";
> +	usb-ports =3D <&ohci_port1>, <&ehci_port1>;
> +};
> +
>  camera-flash {
>  	label =3D "Flash";
>  	led-sources =3D <0>, <1>;
> diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/l=
eds/ledtrig-usbport.txt
> new file mode 100644
> index 0000000..642c4cd
> --- /dev/null
> +++ b/Documentation/leds/ledtrig-usbport.txt
> @@ -0,0 +1,19 @@
> +USB port LED trigger
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This LED trigger can be used for signaling user a presence of USB de=
vice in a
> +given port. It simply turns on LED when device appears and turns it =
off when it
> +disappears.
> +
> +It requires specifying a list of USB ports that should be observed. =
This can be
> +done in DT by setting a proper property with list of a phandles. If =
more than
> +one port is specified, LED will be turned on as along as there is at=
 least one
> +device connected to any of ports.
> +
> +This trigger can be activated from user space on led class devices a=
s shown
> +below:
> +
> +  echo usbport > trigger
> +
> +Nevertheless, current there isn't a way to specify list of USB ports=
 from user
> +space.
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kcon=
fig
> index 9893d91..5b8e7c7 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -126,4 +126,12 @@ config LEDS_TRIGGER_PANIC
>  	  a different trigger.
>  	  If unsure, say Y.
> =20
> +config LEDS_TRIGGER_USBPORT
> +	tristate "USB port LED trigger"
> +	depends on LEDS_TRIGGERS && USB && OF
> +	help
> +	  This allows LEDs to be controlled by USB events. This trigger wil=
l
> +	  enable LED if some USB device gets connected to any of ports spec=
ified
> +	  in DT.
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Mak=
efile
> index 8cc64a4..80e2494 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+=3D ledtrig-=
default-on.o
>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+=3D ledtrig-transient.o
>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+=3D ledtrig-camera.o
>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+=3D ledtrig-panic.o
> +obj-$(CONFIG_LEDS_TRIGGER_USBPORT)	+=3D ledtrig-usbport.o
> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/tr=
igger/ledtrig-usbport.c
> new file mode 100644
> index 0000000..97b064c
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-usbport.c
> @@ -0,0 +1,206 @@
> +/*
> + * USB port LED trigger
> + *
> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.c=
om>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or=
 (at
> + * your option) any later version.
> + */

GPL v2 only.

> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com>");
> +MODULE_DESCRIPTION("USB port trigger");
> +MODULE_LICENSE("GPL");

GPL v2

After you fix above, feel free to add:
Reviewed-by: Peter Chen <peter.chen@nxp.com>

--=20

Best Regards,
Peter Chen
