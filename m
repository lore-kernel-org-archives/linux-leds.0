From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Thu, 19 Feb 2015 23:59:57 +0100
Message-ID: <CAPybu_3=NdkJhGyLW4pAkTbpFqXuY5He+dDiJ5Ec3pCRsP8_Zg@mail.gmail.com>
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
 <CAK5ve-Ks-EnKjCKKUbi1xJsf-C3UintkHXkQ1HWNKVY33Xo46Q@mail.gmail.com>
 <CAPybu_2zQ2mw45vdxp9-UyoVKmD8D5vZ4xLvCUhgkWu3-_GR0A@mail.gmail.com> <CAK5ve-L_gp7Gr6YxUdTRzzCSXJcchUmxELrDhETisAp0TBjeHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:37450 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753599AbbBSXAT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Feb 2015 18:00:19 -0500
In-Reply-To: <CAK5ve-L_gp7Gr6YxUdTRzzCSXJcchUmxELrDhETisAp0TBjeHg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hello Bryan

On Thu, Feb 19, 2015 at 8:12 PM, Bryan Wu <cooloney@gmail.com> wrote:
> Yes, this is what I want. It's good to let the user know there are
> multiple leds share the same name in DT. Sometime they made some
> mistake in the DTS file.

I have added that message now:

dev_info(parent, "Led %s renamed to %s due to name collision",
led_cdev->name, dev_name(led_cdev->dev));

>
> Please update the patch, we can start to discuss the implementation, then.
>
> Actually I think we don't need the temp_name and just use the "name".

We need to keep a pointer to the generated string, to release it later
with kfree.
Also I rather allocate new memory only if there is a name collision.

> And one more thing is device_find_child() will find child of the
> parent. But in your 2 PCI card case, these 2 parents are different
> then device_find_child() will return false twice even if your 2 red
> leds have the same name.

I am now iterating with

while (class_find_device(leds_class, NULL, name, match_name));


Thanks

-- 
Ricardo Ribalda
