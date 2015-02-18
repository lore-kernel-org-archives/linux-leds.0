From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Tue, 17 Feb 2015 17:36:48 -0800
Message-ID: <CAK5ve-Ks-EnKjCKKUbi1xJsf-C3UintkHXkQ1HWNKVY33Xo46Q@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
 <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
 <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com>
 <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com> <CAPybu_27uhrpEK3jz05=f_YwOQR96vuxP-Zx10cRZg16LR01Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:45683 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbbBRBhJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 20:37:09 -0500
In-Reply-To: <CAPybu_27uhrpEK3jz05=f_YwOQR96vuxP-Zx10cRZg16LR01Ng@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

> Thanks!

On Tue, Feb 17, 2015 at 5:11 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hello Bryan
>
> On Wed, Feb 18, 2015 at 1:52 AM, Bryan Wu <cooloney@gmail.com> wrote:
>>>
>>> Lets say that we have a type of add-on card. Described by this DT
>>> overlay (card.dtb):
>>>
>>
>> I think who write this card.dtb should understand this issue. And
>> choose the right name.
>
> card.dtb just describe the hardware in the card, and it is not be
> aware of the rest of the system.
>
> I dont think it is practical to have card_HOST0_PCI1.dtb,
> card_HOST0_PCI2.dtb to HOST0_PCI16.dtb and then HOST1_, HOST2....
>
>>> gpio_0: gpio_0 {
>>What happen if you just use name 'gpio: gpio {' here.? Any conflicts
>>or kernel oops?
>
> No problem here, one will create the device
>
> /sys/devices/pci0000:00/0000:00:05.0/0000:01:00.0/30040000.gpio
>
> and the other:
>
> /sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/40040000.gpio
>
> Name is created with hierarnchy
>
> /sys/class/gpio/  will also work fine, because the gpiochip id is
> created dynamically
>
> On the other hand all the leds are under,
>
> /sys/class/leds/NAME
>
> Do not have any dynamic naming or hierarchical name.
>

I got it. In this case we need to give the leds device a unique name.
Go back to your patch, you're adding 0, 1 at the end of the name of
leds. It's better like GPIO I think you can pick up <reg> value of
leds device node and put it in front of the name of leds. like
/sys/class/leds/30040000.red and /sys/class/leds/40040000.red.

Thanks,
-Bryan
