From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Thu, 19 Feb 2015 11:12:42 -0800
Message-ID: <CAK5ve-L_gp7Gr6YxUdTRzzCSXJcchUmxELrDhETisAp0TBjeHg@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
 <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
 <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com>
 <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com>
 <CAPybu_27uhrpEK3jz05=f_YwOQR96vuxP-Zx10cRZg16LR01Ng@mail.gmail.com>
 <CAK5ve-Ks-EnKjCKKUbi1xJsf-C3UintkHXkQ1HWNKVY33Xo46Q@mail.gmail.com> <CAPybu_2zQ2mw45vdxp9-UyoVKmD8D5vZ4xLvCUhgkWu3-_GR0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:45404 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbbBSTNE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Feb 2015 14:13:04 -0500
In-Reply-To: <CAPybu_2zQ2mw45vdxp9-UyoVKmD8D5vZ4xLvCUhgkWu3-_GR0A@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2015 at 10:55 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi
>
> On Wed, Feb 18, 2015 at 2:36 AM, Bryan Wu <cooloney@gmail.com> wrote:
>
>>>
>>
>> I got it. In this case we need to give the leds device a unique name.
>> Go back to your patch, you're adding 0, 1 at the end of the name of
>> leds. It's better like GPIO I think you can pick up <reg> value of
>> leds device node and put it in front of the name of leds. like
>> /sys/class/leds/30040000.red and /sys/class/leds/40040000.red.
>
> Hmmm.... That will not solve the issue for every device.
>
> If I had a mmio, the gpio would be located at
>
> /sys/devices/pci0000:00/0000:00:05.0/0000:01:00.0/30040000.gpio
> and
> /sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/30040000.gpio
>
> Also it could be the case where the gpio is not memory mapped, then it
> would be something like:
>
> /sys/devices/pci0000:00/0000:00:05.0/0000:01:00.0/gpio
> and
> /sys/devices/pci0000:00/0000:00:06.0/0000:01:00.0/gpio
>
> And at any case we should respect the old api, we can only rename the
> second device, not the first one.
>
> What is your concern about the initial proposal? What about NAME_dup0
> instead of NAME_0?
>

Actually I'd like to see some meaningful unique name for each device
when we create.
But looks like there is no such way to find some unique properties
from device tree node.

> We could throw a dev_info(), so the system developer will have a
> chance to fix it (if he can) and the user to ignore it safely.
>

Yes, this is what I want. It's good to let the user know there are
multiple leds share the same name in DT. Sometime they made some
mistake in the DTS file.

Please update the patch, we can start to discuss the implementation, then.

Actually I think we don't need the temp_name and just use the "name".
And one more thing is device_find_child() will find child of the
parent. But in your 2 PCI card case, these 2 parents are different
then device_find_child() will return false twice even if your 2 red
leds have the same name.

I think the better solution is search the name in registered leds
device, if found name is the same, then add a number or something. And
move out this name processing code to a separated function.

Thanks,
-Bryan
