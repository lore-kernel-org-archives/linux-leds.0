From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Thu, 21 Jul 2016 15:42:59 -0500
Message-ID: <20160721204259.GA4931@rob-hp-laptop>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com>
 <20160720010222.GA21679@rob-hp-laptop>
 <CACna6rwzwRibjYpV3gGfVjHF8m0+cfLts6CE0p3HfURKJvnnQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36233 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753877AbcGUUnB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2016 16:43:01 -0400
Content-Disposition: inline
In-Reply-To: <CACna6rwzwRibjYpV3gGfVjHF8m0+cfLts6CE0p3HfURKJvnnQw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Wed, Jul 20, 2016 at 10:06:23AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 20 July 2016 at 03:02, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki w=
rote:
> >> This commit adds a new trigger that can turn on LED when USB devic=
e gets
> >> connected to the USB port. This can be useful for various home rou=
ters
> >> that have USB port and a proper LED telling user a device is conne=
cted.
> >>
> >> Right now this trigger is usable with a proper DT only, there isn'=
t a
> >> way to specify USB ports from user space. This may change in a fut=
ure.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >> ---
> >> V2: The first version got support for specifying list of USB ports=
 from
> >>     user space only. There was a (big try &) discussion on adding =
DT
> >>     support. It led to a pretty simple solution of comparing of_no=
de of
> >>     usb_device to of_node specified in usb-ports property.
> >>     Since it appeared DT support may be simpler and non-DT a bit m=
ore
> >>     complex, this version drops previous support for "ports" and
> >>     "new_port" and focuses on DT only. The plan is to see if this
> >>     solution with DT is OK, get it accepted and then work on non-D=
T.
> >>
> >> Felipe: if there won't be any objections I'd like to ask for your =
Ack.
> >> ---
> >>  Documentation/devicetree/bindings/leds/common.txt |  11 ++
> >>  Documentation/leds/ledtrig-usbport.txt            |  19 ++
> >>  drivers/leds/trigger/Kconfig                      |   8 +
> >>  drivers/leds/trigger/Makefile                     |   1 +
> >>  drivers/leds/trigger/ledtrig-usbport.c            | 206 +++++++++=
+++++++++++++
> >>  5 files changed, 245 insertions(+)
> >>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
> >>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/D=
ocumentation/devicetree/bindings/leds/common.txt
> >> index af10678..75536f7 100644
> >> --- a/Documentation/devicetree/bindings/leds/common.txt
> >> +++ b/Documentation/devicetree/bindings/leds/common.txt
> >> @@ -50,6 +50,12 @@ property can be omitted.
> >>  For controllers that have no configurable timeout the flash-max-t=
imeout-us
> >>  property can be omitted.
> >>
> >> +Trigger specific properties for child nodes:
> >> +
> >> +usbport trigger:
> >> +- usb-ports : List of USB ports that usbport should observed for =
turning on a
> >> +           given LED.
> >
> > I think this should be more generic such that it could work for dis=
k or
> > network LEDs too. Perhaps 'led-triggers =3D <nodes>'? trigger is a =
bit of
> > a Linux name, but I haven't thought of anything better. Really, I'd
> > prefer the link in the other direction (e.g. port node have a 'leds=
" or
> > '*-leds' property), but that's maybe harder to parse.
>=20
> I was already thinking on this as I plan to add "netdev" trigger at
> some point in the future. I'd like to use "net-devices" for it (as a
> equivalent or "usb-ports").
>=20
> However there is a problem with your idea of sharing "led-triggers"
> between triggers.. Consider device with generic purpose LED that
> should be controllable by a user. I believe we should let user switch
> it's state, e.g. with:
> echo usbport > trigger
> echo netdev > trigger
> with a shared property I don't see how we couldn't handle it properly=
=2E

Well, the userspace interface and DT bindings are independent things.=20
You can't argue for what the DT binding should look like based on the=20
userspace interface.

Perhaps we need a "device trigger" where you echo the device to=20
be the trigger (similar to how bind works). If you have something to id=
=20
the device, then you can lookup its struct device and then its of_node=20
ptr.

The other problem with your userspace interface is it only works if=20
the trigger is defined in DT. It doesn't allow for specifying which usb=
=20
port or which netdev. Any trigger source should be assignable to any=20
LED? I can assign the disk activity trigger to the numlock LED if I=20
want to...

> I don't think we can use anything like:
> led-triggers =3D <&ohci_port1>, <&ehci_port1>, <&ethmac0>;
> I'd get even more complicated if we ever need cells for any trigger.
> AFAIK it's not allowed to mix handles with different cells like:
> led-triggers =3D <&ohci_port1>, <&foo 5>, <&ethmac0>;

It is allowed, but you would have to have a '#led-trigger-cells'=20
property in each phandle target.

> These problems made me use trigger-specific properies for specifying
> LED triggers. Do you have any other idea for sharing a property &
> avoiding above problems at the same time?
>=20
>=20
> >> +
> >>  Examples:
> >>
> >>  system-status {
> >> @@ -58,6 +64,11 @@ system-status {
> >>       ...
> >>  };
> >>
> >> +usb {
> >> +     label =3D "USB";
> >
> > It's not really clear in the example this is an LED node as it is
> > incomplete.
>=20
> What do you mean by incomplete? Should I include e.g. ohci_port1 in
> this example?

label and usb-ports alone in this node does not make an LED node.

>=20
>=20
> >> +     usb-ports =3D <&ohci_port1>, <&ehci_port1>;
> >> +};
> >> +
> >>  camera-flash {
> >>       label =3D "Flash";
> >>       led-sources =3D <0>, <1>;
> >> diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentatio=
n/leds/ledtrig-usbport.txt
> >> new file mode 100644
> >> index 0000000..642c4cd
> >> --- /dev/null
> >> +++ b/Documentation/leds/ledtrig-usbport.txt
> >> @@ -0,0 +1,19 @@
> >> +USB port LED trigger
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This LED trigger can be used for signaling user a presence of USB=
 device in a
> >> +given port. It simply turns on LED when device appears and turns =
it off when it
> >> +disappears.
> >> +
> >> +It requires specifying a list of USB ports that should be observe=
d. This can be
> >> +done in DT by setting a proper property with list of a phandles. =
If more than
> >> +one port is specified, LED will be turned on as along as there is=
 at least one
> >> +device connected to any of ports.
> >> +
> >> +This trigger can be activated from user space on led class device=
s as shown
> >> +below:
> >> +
> >> +  echo usbport > trigger
> >
> > Why do I have to do this (by default)? I already specified in the D=
T
> > what the connection is. It should come up working OOTB, or don't pu=
t it
> > in DT.
>=20
> Just specifying connection with "usb-ports" (or "led-triggers") won't
> enable a given trigger and it shouldn't. There is already a way to
> specify default trigger using property "linux,default-trigger". So yo=
u
> can specify:
> 1) Default one with:
> linux,default-trigger =3D "usbport";
> 2) On runtime:
> echo usbport > trigger

IMO, these should be mutually exclusive. Either you specify a DT node a=
s=20
the trigger or you specify a linux specific trigger.

> >> +Nevertheless, current there isn't a way to specify list of USB po=
rts from user
> >> +space.
> >
> > s/current/currently/
> >
> > This is a problem since if it works by default and you switch to a
> > different trigger, there's no way to get back to the default (unles=
s
> > you remember the ports).
>=20
> There is no such problem. You can freely do:
> echo none > trigger
> (e.g. to disable LED during night or whatever)
> and then:
> echo usbport > trigger
>=20
> This will make "usbport" use triggers specified in DT as expected.

I think the singular "usbport" trigger is problematic. Look at how cpu=20
triggers are done. I can specify which cpu is the trigger. You should b=
e=20
able specify which port is the trigger, too.

In summary, I guess what I'm saying is don't push the problems of the=20
current userspace interface down to DT.

Rob
