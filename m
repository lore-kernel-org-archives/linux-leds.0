From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Tue, 19 Jul 2016 20:02:22 -0500
Message-ID: <20160720010222.GA21679@rob-hp-laptop>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468617060-29830-1-git-send-email-zajec5@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> This commit adds a new trigger that can turn on LED when USB device g=
ets
> connected to the USB port. This can be useful for various home router=
s
> that have USB port and a proper LED telling user a device is connecte=
d.
>=20
> Right now this trigger is usable with a proper DT only, there isn't a
> way to specify USB ports from user space. This may change in a future=
=2E
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> V2: The first version got support for specifying list of USB ports fr=
om
>     user space only. There was a (big try &) discussion on adding DT
>     support. It led to a pretty simple solution of comparing of_node =
of
>     usb_device to of_node specified in usb-ports property.
>     Since it appeared DT support may be simpler and non-DT a bit more
>     complex, this version drops previous support for "ports" and
>     "new_port" and focuses on DT only. The plan is to see if this
>     solution with DT is OK, get it accepted and then work on non-DT.
>=20
> Felipe: if there won't be any objections I'd like to ask for your Ack=
=2E
> ---
>  Documentation/devicetree/bindings/leds/common.txt |  11 ++
>  Documentation/leds/ledtrig-usbport.txt            |  19 ++
>  drivers/leds/trigger/Kconfig                      |   8 +
>  drivers/leds/trigger/Makefile                     |   1 +
>  drivers/leds/trigger/ledtrig-usbport.c            | 206 ++++++++++++=
++++++++++
>  5 files changed, 245 insertions(+)
>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>=20
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Docu=
mentation/devicetree/bindings/leds/common.txt
> index af10678..75536f7 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -50,6 +50,12 @@ property can be omitted.
>  For controllers that have no configurable timeout the flash-max-time=
out-us
>  property can be omitted.
> =20
> +Trigger specific properties for child nodes:
> +
> +usbport trigger:
> +- usb-ports : List of USB ports that usbport should observed for tur=
ning on a
> +	      given LED.

I think this should be more generic such that it could work for disk or=
=20
network LEDs too. Perhaps 'led-triggers =3D <nodes>'? trigger is a bit =
of=20
a Linux name, but I haven't thought of anything better. Really, I'd=20
prefer the link in the other direction (e.g. port node have a 'leds" or=
=20
'*-leds' property), but that's maybe harder to parse.

> +
>  Examples:
> =20
>  system-status {
> @@ -58,6 +64,11 @@ system-status {
>  	...
>  };
> =20
> +usb {
> +	label =3D "USB";

It's not really clear in the example this is an LED node as it is=20
incomplete.

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

Why do I have to do this (by default)? I already specified in the DT=20
what the connection is. It should come up working OOTB, or don't put it=
=20
in DT.

> +Nevertheless, current there isn't a way to specify list of USB ports=
 from user
> +space.

s/current/currently/

This is a problem since if it works by default and you switch to a=20
different trigger, there's no way to get back to the default (unless=20
you remember the ports).

Rob
