From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Wed, 18 Feb 2015 01:32:14 +0100
Message-ID: <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com> <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35690 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754473AbbBRAcg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 19:32:36 -0500
In-Reply-To: <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hello Bryan

On Wed, Feb 18, 2015 at 12:59 AM, Bryan Wu <cooloney@gmail.com> wrote:
>
> DT just describe the hardware, so if it's a different hardware, they
> should have different name.
> red0 for GPIO 0, red1 for GPIO 1 or choose other good name instead of 0 and 1.

I think I have not managed to explain myself properly.

We have a host computer. with 2 pcie slots. The host is described with
a DT that looks like:

&axi1 {

pci0{
  reg = < 0x20000000 0x10000000 >
}

pci1{
  reg = < 0x30000000 0x10000000 >
}
}

The user can connect anything to the pci slots. (pci0 and pci1)


Lets say that we have a type of add-on card. Described by this DT
overlay (card.dtb):

&pci {

gpio_0: gpio_0 {
#gpio-cells = <2>;
compatible = "xlnx,xps-gpio-1.00.a";
reg = < 0x30040000 010000 >;
};


/*Leds*/
leds {
reg = < 0x30040000 010000 >;
compatible = "gpio-leds";
red {
gpios = <&gpio_0 0 0>;
linux,default-trigger = "drop-qt5023_video0";
};
}

}

The user connects two of those cards to the system (at locations pci0 and pci1).

Then we have TWO gpios chip. Each of them have a led named red. When
the second gpio-led is probed we have an error. Everything else
(address offset, phandle, device renaming) is handled properly already
by the kernel.

On this system I cannot control card.dtb, or which type of cards will
the user connect to the system. The DT is generated in run-time based
on the hardware connected to the pci slots.

I humbly believe that the issue here is that the subsystem does not
protect ourselves against name collisions, because a month ago a
device tree was considered immutable and in full control of the system
designer, unfortunately this is not the case anymore.

Thanks!

-- 
Ricardo Ribalda
