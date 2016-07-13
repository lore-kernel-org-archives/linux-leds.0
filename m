From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 0/2] usb: add HCD providers
Date: Wed, 13 Jul 2016 11:31:32 +0200
Message-ID: <CACna6rw1_+VHj59CdKZ+PJomc2d2xVbLZ04u++MoztckATTa=Q@mail.gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
 <20160713045140.GA29915@shlinux2> <CACna6rw6QOuY247qvDmO4mKrW3y4yXoeM3qr8SXAwn3CuYAMpw@mail.gmail.com>
 <20160713080242.GA11863@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36291 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276AbcGMJbj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jul 2016 05:31:39 -0400
In-Reply-To: <20160713080242.GA11863@shlinux2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 13 July 2016 at 10:02, Peter Chen <hzpeterchen@gmail.com> wrote:
> On Wed, Jul 13, 2016 at 07:21:09AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> On 13 July 2016 at 06:51, Peter Chen <hzpeterchen@gmail.com> wrote:
>> > On Tue, Jul 12, 2016 at 02:35:18PM +0200, Rafa=C5=82 Mi=C5=82ecki =
wrote:
>> >> I was working on an "usbport" LED trigger driver and specifying i=
ts
>> >> default state in DT. I realized I can't really determine numberin=
g of
>> >> USB ports on any device as it depends on compiled drivers and the
>> >> loading orders.
>> >>
>> >> It means that my physical USB port can be e.g. 1-1 or 2-1 dependi=
ng on
>> >> my current config/setup. I needed a way to specify a particular H=
CD in
>> >> DT and then hardcode port number (as this part doesn't change).
>> >>
>> >
>> > I have a question:
>> >
>> > What does your "usbport" LED trigger for? What kinds of informatio=
n
>> > you would like to show on LED?
>>
>> It's a trigger that turns on LED whenever USB device appears at
>> specified USB port. There are plenty of home routers that have USB
>> labeled LED(s). To support them nicely, first of all we need a trigg=
er
>> that will watch for USB subsystem events. Secondly we need a way to
>> setup its initial state correctly as most users don't want to play
>> with sysfs on their own.
>>
>> I sent usbport trigger in:
>> [PATCH] leds: trigger: Introduce an USB port trigger
>> <1468239883-22695-1-git-send-email-zajec5@gmail.com>
>> https://lkml.org/lkml/2016/7/11/305
>> You may read commit message and ledtrig-usbport.txt for more details=
=2E
>>
>
> Well, it is an interesting use case. You can try to add provider (un)=
register
> at hub driver (drivers/usb/core/hub.c) instead of each platform drive=
rs, you
> could refer my USB pwrseq as an example[1].

That was my initial plan, but then I realized we can have more complex
cases with few HCDs per single device (and device_node). Take a look
at dummy_hcd.c, xhci-mtk.c and xhci-plat.c. All of them register two
HCDs: a shared one and primary one. In above drivers I planned to have
custom xlate function with support for an extra argument. I was
thinking about something like:
usb-controllers =3D <&ohci>, <&ehci>, <&xhci USB_HCD_SHARED>;

Now you made me look closer at controller drivers, I'm not so sure
what is the best way for this.
We have ~65 drivers registering only one HCD and ~26 of them use DT.
We should modify at least those ~26 ones to register a provider.
So maybe it's indeed better to add providers in a generic way,
probably just inside usb_add_hcd. We could make generic xlate function
aware of primary and shared HCDs. Hopefully there won't be way more
complicate cases in the future, like a single controller driver
registering 3, 4 or more HCDs. If that ever happens, we can always
modify usb_add_hcd to somehow tell it to don't register providers in
such cases.


> For roothub, you can get the busnum through comparing controller's of=
_node, for
> internal hub, you can get hub's dev name like (1-1) through comparing
> its of_node (you need to describe your hard-wired hub on dts).

I'm not really sure what do you mean here. I believe my
of_hcd_get_from_provider already does compare controller's of_node?

When working with internal hubs I never meant to reference them in DT.
I meant to reference root hub only and then hardcode the rest of
"path". For example my old BCM4706 device (MIPS supported by bcm47xx
without DT) has internal
05e3:0608 Genesys Logic, Inc. USB-2.0 4-Port HUB
connected to the 1-1. It has 2 physical USB connectors, if I connect
USB device to the "upper" one it appears as 1-1.1, if I connect to the
"lower" it appears as 1-1.2.
In such case (if bcm47xx was using DT) I'd only need reference to "1"
root hub bus number and I could hardcode "1.1" and "1.2" in DT.


> Two more questions:
>
> - How to support the USB device on the port when boots up?

It's not supported by my usbport trigger driver yet. I'll probably
support it by calling usb_find_device_by_name whenever a new entry
gets added to the list of monitored ports.


> - Any cases we need to add mapping using new_port_store, the user may
> not know bus number for physical port.

Initially I implemented new_port_store for my testing purposes but I
think it may be useful for platforms without DT. It would allow some
user space scripts to add proper entries.

--=20
Rafa=C5=82
