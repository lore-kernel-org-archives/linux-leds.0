From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: New problems after f363a870eaef ("leds: core: use deferred
 probing if default trigger isn't available yet")
Date: Wed, 8 Mar 2017 21:24:38 +0100
Message-ID: <a12aa6e1-da13-b585-daf4-cfc8e02c9b31@gmail.com>
References: <CACna6rx-mDw0UQ-hxQ+S-McP3HbitqncDgUVa-mrd7FPPGXykQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:35274 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754463AbdCHUdc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2017 15:33:32 -0500
Received: by mail-wr0-f170.google.com with SMTP id g10so31562873wrg.2
        for <linux-leds@vger.kernel.org>; Wed, 08 Mar 2017 12:33:21 -0800 (PST)
In-Reply-To: <CACna6rx-mDw0UQ-hxQ+S-McP3HbitqncDgUVa-mrd7FPPGXykQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

Hi Rafał,

Thanks for this detailed report and analysis.
I've dropped the patch in question.

I think that Heiner mentioned his problem in the commit
message - the situation when the trigger to be set is not
yet registered is silently ignored.

Probably he solution would be adding dev_warn() (?)
in led_trigger_set_default() when no trigger is matched.

Best regards,
Jacek Anaszewski

On 03/08/2017 10:13 AM, Rafał Miłecki wrote:
> Hi,
> 
> I backported commit f363a870eaef ("leds: core: use deferred probing if
> default trigger isn't available yet") to my standard kernel and
> noticed some problems when using it.
> 
> First of all my LEDs stopped working despite having all triggers
> enabled. It has appeared to be caused by my DTS files using invalid
> "default-off" trigger. I already sent patches fixing this:
> [1/2] ARM: dts: BCM53573: Don't use nonexistent "default-off" LED trigger
> [2/2] ARM: dts: BCM5301X: Don't use nonexistent "default-off" LED trigger
> but maybe there are more devices regressed by this change? Does it
> count as breaking DT files compatibility?
> 
> Related problem is that with this change user won't get any LED
> working even if there is only a single trigger missing. People may
> decide not to use some triggers for various reasons. Let's say I don't
> care about USB support and I disable whole USB subsystem including
> "usbport" trigger. If my DTS file includes "userport" default trigger
> for any LED, I won't get any LED registered at all. I'd definitely
> want to have other LEDs working.
> 
> Finally this commit introduces delay when e.g. mixing built-in with
> modules. Thanks to DTS files a lot of devices can share a single
> kernel. I don't want to bloat it (the kernel) so I keep subsystem
> modules & extra triggers as modules. I built-in leds-gpio and
> ledtrig-default-on as they are used by 99% of devices and are needed
> early to indicate device/kernel is alive. With the commit in question
> LEDs don't get registered/enabled until are triggers are ready and
> some triggers need to be loaded as modules from rootfs. This delays
> settings LEDs to some initial state indicating e.g. device is powered
> on.
> 
> Because of these problems I'd like to suggest reverting that commit
> and look for a different solution.
> 
> Unfortunately first of all I need to ask for a better explanation of
> the problem. I read commit description but this load order doesn't
> make sense to me. If you take a look at led_trigger_register, you'll
> see it iterates over registered LEDs and enables just-loaded trigger
> for these using it as default one. I also just tested this feature and
> it works as expected for me. I loaded ledtrig-timer.ko and LED with
> linux,default-trigger = "timer" started blinking nicely!
> 
> Heiner: can you describe what exactly was a problem for you? Why you
> needed deffer solution and why you decided to keep setting trigger in
> led_trigger_register function? They seems like 2 competing solutions
> of the same problem.
> 
