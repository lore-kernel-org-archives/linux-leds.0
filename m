From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Tue, 17 Feb 2015 15:59:01 -0800
Message-ID: <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com> <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:35064 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752945AbbBQX7Y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 17 Feb 2015 18:59:24 -0500
In-Reply-To: <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2015 at 3:47 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi
>
> On Wed, Feb 18, 2015 at 12:35 AM, Bryan Wu <cooloney@gmail.com> wrote:
>
>> So why not use name "red0" and name another one "red1"? since you have
>> multiple different red leds here any way.
>
> I cannot control how many cameras the user will decide to attach to
> the system, and if two similar cameras are attached to pciA and pciB,
> they would try to load the same dt.
>

DT just describe the hardware, so if it's a different hardware, they
should have different name.
red0 for GPIO 0, red1 for GPIO 1 or choose other good name instead of 0 and 1.

If this is true, you can just name one LED like gpio-led and let the
kernel to add number after that name. I don't think this is a good
idea to name the hardware. And These aren't like other devices which
will create device node like /dev/video0 /dev/video1. This is from
device tree to describe the hardware.

Thanks,
-Bryan
