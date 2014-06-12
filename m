From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Thu, 12 Jun 2014 10:37:43 -0700
Message-ID: <CAK5ve-+j75g_cTDHAEF3F9fqHQqe9iGFQ+XfssS=dNn0sa+bmg@mail.gmail.com>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com>
 <20140407213337.GL7528@n2100.arm.linux.org.uk> <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com>
 <20140612171206.GA12123@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:54442 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752509AbaFLRiF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Jun 2014 13:38:05 -0400
In-Reply-To: <20140612171206.GA12123@n2100.arm.linux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Thu, Jun 12, 2014 at 10:12 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Apr 07, 2014 at 02:36:26PM -0700, Bryan Wu wrote:
>> On Mon, Apr 7, 2014 at 2:33 PM, Russell King - ARM Linux
>> <linux@arm.linux.org.uk> wrote:
>> > On Mon, Apr 07, 2014 at 02:31:00PM -0700, Bryan Wu wrote:
>> >> On Sun, Apr 6, 2014 at 3:18 PM, Russell King - ARM Linux
>> >> <linux@arm.linux.org.uk> wrote:
>> >> > This patch series fixes various problems with leds-pwm.
>> >> >
>> >> > The first patch is very important to solve a boot time oops on OMAP
>> >> > boards (and probably others) which has recently shown its face.
>> >> >
>> >> > The next two clean up leds-pwm so that we can avoid the madness of
>> >> > having entirely separate initialisation paths for DT and non-DT, which
>> >> > I believe is the core cause of the initial problem.
>> >> >
>> >> > The last two patches add support for LEDs connected in the opposite
>> >> > sense to PWM outputs, where either the PWM does not support inversion,
>> >> > or does not support it in a way that works sanely with leds-pwm.  These
>> >> > add a new property to leds-pwm, hence why that patch (and this cover)
>> >> > copies the DT people.
>> >> >
>> >> > The first patch is an absolute must for going.
>> >> >
>> >>
>> >> Cool, I think Thierry is good for this patchset. I'm going to merge it
>> >> with Thierry's ack and queue it for 3.16 merge window.
>> >
>> > I don't mind the majority of the patch set being queued for the next
>> > merge window, but I object to the first patch being delayed.  The
>> > first patch is a very necessary bug fix for a regression that has
>> > cropped up since -rc7.
>> >
>> > It may not be the fault of leds-pwm, but it's leds-pwm which is most
>> > certainly buggy.  kfree'ing a work_struct which is active is *not*
>> > on.
>> >
>>
>> Sure, actually just after I sent out my previous email, I think I need
>> add your first patch into my git pull request for 3.15 merge window.
>> So no worries, I will do that.
>
> So, I see this commit in mainline:
>
> commit e81d372ff9f694e13fa46e8b5aaed505c7fd2a1f
> Merge: 75e300c8ba58 2f05e1d4458f
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Dec 15 12:52:42 2012 -0800
>

Are you sure? this was a git pull in 2012. At that time I didn't get
any patch from you.

The latest pull was

commit 4162877d3ffa900b618c369c490c7faa6af60e47
Merge: 6c61403 14f5716
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Apr 10 09:06:10 2014 -0700

    Merge branch 'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds

    Pull LED updates from Bryan Wu:
     "This cycle we got:
       - new driver for leds-mc13783
       - bug fixes
       - code cleanup"

    * 'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds:
      leds: make sure we unregister a trigger only once
      leds: leds-pwm: properly clean up after probe failure

Here is your patch for the critical fixing which was merged.

      leds: clevo-mail: Make probe function __init
      leds-ot200: Fix dependencies
      leds-gpio: of: introduce MODULE_DEVICE_TABLE for module autoloading
      leds: clevo-mail: remove __initdata marker
      leds: leds-ss4200: remove __initdata marker
      leds: blinkm: remove unnecessary spaces
      leds: lp5562: remove unnecessary parentheses
      leds: leds-ss4200: remove DEFINE_PCI_DEVICE_TABLE macro
      leds: leds-s3c24xx: Trivial cleanup in header file
      drivers/leds: delete non-required instances of include <linux/init.h>
      leds: leds-gpio: add retain-state-suspended property
      leds: leds-mc13783: Add devicetree support
      leds: leds-mc13783: Remove unnecessary cleaning of registers on exit
      leds: leds-mc13783: Use proper "max_brightness" value fo LEDs
      leds: leds-mc13783: Use LED core PM functions
      leds: leds-mc13783: Add MC34708 LED support
      leds: Turn off led if blinking is disabled
      ledtrig-cpu: Handle CPU hot(un)plugging


>     Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds
>
>     Pull LED subsystem update from Bryan Wu.
>
>     * 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds: (47 commits)
>
> Yet I don't see this patch series in it.  What's the story behind the
> lack of progress on this?
>
> Your April response clearly indicated that the entire patch set was going
> in during the 3.16 merge window.
>

The rest of them are queued in my tree
http://git.kernel.org/cgit/linux/kernel/git/cooloney/linux-leds.git/log/?h=for-next

And I will send them out during 3.16 merge window but now mainline is
still 3.15-rc8. I believe this is what we talked about before.

Oh, no, I'm sorry, I messed up 3.16 merge window which is before
3.15-rc1 with 3.17 merge window. And I really mean 3.17 merge window
which is before 3.16-rc1. My bad, I will definitely send them all out
during 3.17 merge window.

Thanks,
-Bryan
