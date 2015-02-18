From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Wed, 18 Feb 2015 02:11:16 +0100
Message-ID: <CAPybu_27uhrpEK3jz05=f_YwOQR96vuxP-Zx10cRZg16LR01Ng@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
 <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
 <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com> <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:46448 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492AbbBRBLj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 20:11:39 -0500
In-Reply-To: <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hello Bryan

On Wed, Feb 18, 2015 at 1:52 AM, Bryan Wu <cooloney@gmail.com> wrote:
>>
>> Lets say that we have a type of add-on card. Described by this DT
>> overlay (card.dtb):
>>
>
> I think who write this card.dtb should understand this issue. And
> choose the right name.

card.dtb just describe the hardware in the card, and it is not be
aware of the rest of the system.

I dont think it is practical to have card_HOST0_PCI1.dtb,
card_HOST0_PCI2.dtb to HOST0_PCI16.dtb and then HOST1_, HOST2....

>> gpio_0: gpio_0 {
>What happen if you just use name 'gpio: gpio {' here.? Any conflicts
>or kernel oops?

No problem here, one will create the device

/sys/devices/pci0000:00/0000:00:05.0/0000:01:00.0/30040000.gpio

and the other:

/sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/40040000.gpio

Name is created with hierarnchy

/sys/class/gpio/  will also work fine, because the gpiochip id is
created dynamically

On the other hand all the leds are under,

/sys/class/leds/NAME

Do not have any dynamic naming or hierarchical name.


> So you're supposed to get 2 card.dtb files for 2 PCI cards, right?
> They should be different and you need to choose different name for the
> hardware.

There is only one card.dtb because both cards are identical cards,
they are just connected to different ports

>
> From device tree point of view, I believe different device should got
> different name although they can match to same compatible string. Let
> me invite DT folks for help.

Another example of duplicated names could be partitions on an mtd. You
can have two devices with a partition called Golden.

If my memory is right, you can even have two partition with the same
name on the same device. The offset of the partition will be part of
the name in that case.

>
> Thanks,
> -Bryan

Thanks!

-- 
Ricardo Ribalda
