From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Wed, 20 Jul 2016 10:06:23 +0200
Message-ID: <CACna6rwzwRibjYpV3gGfVjHF8m0+cfLts6CE0p3HfURKJvnnQw@mail.gmail.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com> <20160720010222.GA21679@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35634 "EHLO
	mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004AbcGTIGZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 Jul 2016 04:06:25 -0400
In-Reply-To: <20160720010222.GA21679@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On 20 July 2016 at 03:02, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> This commit adds a new trigger that can turn on LED when USB device =
gets
>> connected to the USB port. This can be useful for various home route=
rs
>> that have USB port and a proper LED telling user a device is connect=
ed.
>>
>> Right now this trigger is usable with a proper DT only, there isn't =
a
>> way to specify USB ports from user space. This may change in a futur=
e.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>> V2: The first version got support for specifying list of USB ports f=
rom
>>     user space only. There was a (big try &) discussion on adding DT
>>     support. It led to a pretty simple solution of comparing of_node=
 of
>>     usb_device to of_node specified in usb-ports property.
>>     Since it appeared DT support may be simpler and non-DT a bit mor=
e
>>     complex, this version drops previous support for "ports" and
>>     "new_port" and focuses on DT only. The plan is to see if this
>>     solution with DT is OK, get it accepted and then work on non-DT.
>>
>> Felipe: if there won't be any objections I'd like to ask for your Ac=
k.
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt |  11 ++
>>  Documentation/leds/ledtrig-usbport.txt            |  19 ++
>>  drivers/leds/trigger/Kconfig                      |   8 +
>>  drivers/leds/trigger/Makefile                     |   1 +
>>  drivers/leds/trigger/ledtrig-usbport.c            | 206 +++++++++++=
+++++++++++
>>  5 files changed, 245 insertions(+)
>>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
>>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Doc=
umentation/devicetree/bindings/leds/common.txt
>> index af10678..75536f7 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -50,6 +50,12 @@ property can be omitted.
>>  For controllers that have no configurable timeout the flash-max-tim=
eout-us
>>  property can be omitted.
>>
>> +Trigger specific properties for child nodes:
>> +
>> +usbport trigger:
>> +- usb-ports : List of USB ports that usbport should observed for tu=
rning on a
>> +           given LED.
>
> I think this should be more generic such that it could work for disk =
or
> network LEDs too. Perhaps 'led-triggers =3D <nodes>'? trigger is a bi=
t of
> a Linux name, but I haven't thought of anything better. Really, I'd
> prefer the link in the other direction (e.g. port node have a 'leds" =
or
> '*-leds' property), but that's maybe harder to parse.

I was already thinking on this as I plan to add "netdev" trigger at
some point in the future. I'd like to use "net-devices" for it (as a
equivalent or "usb-ports").

However there is a problem with your idea of sharing "led-triggers"
between triggers.. Consider device with generic purpose LED that
should be controllable by a user. I believe we should let user switch
it's state, e.g. with:
echo usbport > trigger
echo netdev > trigger
with a shared property I don't see how we couldn't handle it properly.
I don't think we can use anything like:
led-triggers =3D <&ohci_port1>, <&ehci_port1>, <&ethmac0>;
I'd get even more complicated if we ever need cells for any trigger.
AFAIK it's not allowed to mix handles with different cells like:
led-triggers =3D <&ohci_port1>, <&foo 5>, <&ethmac0>;

These problems made me use trigger-specific properies for specifying
LED triggers. Do you have any other idea for sharing a property &
avoiding above problems at the same time?


>> +
>>  Examples:
>>
>>  system-status {
>> @@ -58,6 +64,11 @@ system-status {
>>       ...
>>  };
>>
>> +usb {
>> +     label =3D "USB";
>
> It's not really clear in the example this is an LED node as it is
> incomplete.

What do you mean by incomplete? Should I include e.g. ohci_port1 in
this example?


>> +     usb-ports =3D <&ohci_port1>, <&ehci_port1>;
>> +};
>> +
>>  camera-flash {
>>       label =3D "Flash";
>>       led-sources =3D <0>, <1>;
>> diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/=
leds/ledtrig-usbport.txt
>> new file mode 100644
>> index 0000000..642c4cd
>> --- /dev/null
>> +++ b/Documentation/leds/ledtrig-usbport.txt
>> @@ -0,0 +1,19 @@
>> +USB port LED trigger
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This LED trigger can be used for signaling user a presence of USB d=
evice in a
>> +given port. It simply turns on LED when device appears and turns it=
 off when it
>> +disappears.
>> +
>> +It requires specifying a list of USB ports that should be observed.=
 This can be
>> +done in DT by setting a proper property with list of a phandles. If=
 more than
>> +one port is specified, LED will be turned on as along as there is a=
t least one
>> +device connected to any of ports.
>> +
>> +This trigger can be activated from user space on led class devices =
as shown
>> +below:
>> +
>> +  echo usbport > trigger
>
> Why do I have to do this (by default)? I already specified in the DT
> what the connection is. It should come up working OOTB, or don't put =
it
> in DT.

Just specifying connection with "usb-ports" (or "led-triggers") won't
enable a given trigger and it shouldn't. There is already a way to
specify default trigger using property "linux,default-trigger". So you
can specify:
1) Default one with:
linux,default-trigger =3D "usbport";
2) On runtime:
echo usbport > trigger


>> +Nevertheless, current there isn't a way to specify list of USB port=
s from user
>> +space.
>
> s/current/currently/
>
> This is a problem since if it works by default and you switch to a
> different trigger, there's no way to get back to the default (unless
> you remember the ports).

There is no such problem. You can freely do:
echo none > trigger
(e.g. to disable LED during night or whatever)
and then:
echo usbport > trigger

This will make "usbport" use triggers specified in DT as expected.

--=20
Rafa=C5=82
