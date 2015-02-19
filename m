From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Fri, 20 Feb 2015 00:22:46 +0100
Message-ID: <CAPybu_1g5=pJwDTUWV_pP58fCuUm-vWU_O9h-Qah7G_wSPyjbA@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
 <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
 <CAPybu_26e3evmHM3W7ZsUXin0LMWJWAbPSf8rFnDnLG821Jwpg@mail.gmail.com>
 <CAK5ve-Kuj5Z_Mwo7=-z4VPSmwEiv52YH2e=XCQ=7MvPiOErvJA@mail.gmail.com>
 <CAPybu_2e7P0O+x6Q37crg-T=y2vb05HuC3aE9NwPVjcP3TDQzA@mail.gmail.com>
 <CAK5ve-JbVX17SK9WBy4dT4g-CFJcPDjiwcUiSi=kssz7SJAsLA@mail.gmail.com>
 <CAPybu_3e3LRiyuUPzZkMQCsh3VtH8gB5Jhezyq7r4e9V113_XA@mail.gmail.com>
 <CAK5ve-KWrZL8wZ8UjEbe0cuBHoAxbRw_24wpVOiBd75rp-Jyuw@mail.gmail.com>
 <CAPybu_1hWj_LX_399tXxNWW-bD1bUhv2FESt5t0G5VH9HwS=SQ@mail.gmail.com>
 <CAK5ve-LNgZpUKhwe8jOPeipWDg7pv8ruQ9SSbjDmyUDDdbi04w@mail.gmail.com> <20150219231558.GA30417@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:46892 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459AbbBSXXI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Feb 2015 18:23:08 -0500
In-Reply-To: <20150219231558.GA30417@jcartwri.amer.corp.natinst.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: Bryan Wu <cooloney@gmail.com>, Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Helo Josh

On Fri, Feb 20, 2015 at 12:15 AM, Josh Cartwright <joshc@ni.com> wrote:
>
> Is this solvable by adding support for led properties in an aliases { }
> node?  I suppose that would mean you'd need to also overlay a selection
> of which LED is "red", but I don't know if that is a problem.

I think there are two concens here. One is to provide an unique name
when a led is register and the other is to locate the led.

This patch is just mend for providing unique names, so the led
subsystem can play nicer with overlays.

The other might be solved with an sysfs symbolic link.... I need to
check it out, but it is a different issue.

>
>   Josh



-- 
Ricardo Ribalda
