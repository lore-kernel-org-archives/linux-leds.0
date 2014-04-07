From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Mon, 7 Apr 2014 14:31:00 -0700
Message-ID: <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:51753 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754665AbaDGVbW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 17:31:22 -0400
In-Reply-To: <20140406221854.GS7528@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Sun, Apr 6, 2014 at 3:18 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> This patch series fixes various problems with leds-pwm.
>
> The first patch is very important to solve a boot time oops on OMAP
> boards (and probably others) which has recently shown its face.
>
> The next two clean up leds-pwm so that we can avoid the madness of
> having entirely separate initialisation paths for DT and non-DT, which
> I believe is the core cause of the initial problem.
>
> The last two patches add support for LEDs connected in the opposite
> sense to PWM outputs, where either the PWM does not support inversion,
> or does not support it in a way that works sanely with leds-pwm.  These
> add a new property to leds-pwm, hence why that patch (and this cover)
> copies the DT people.
>
> The first patch is an absolute must for going.
>

Cool, I think Thierry is good for this patchset. I'm going to merge it
with Thierry's ack and queue it for 3.16 merge window.

-Bryan


>  .../devicetree/bindings/leds/leds-pwm.txt          |   2 +
>  drivers/leds/leds-pwm.c                            | 161 ++++++++++-----------
>  2 files changed, 82 insertions(+), 81 deletions(-)
>
> --
> FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
> improving, and getting towards what was expected from it.
