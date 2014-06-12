From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Thu, 12 Jun 2014 18:12:06 +0100
Message-ID: <20140612171206.GA12123@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com> <20140407213337.GL7528@n2100.arm.linux.org.uk> <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:56186 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753017AbaFLRMR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 12 Jun 2014 13:12:17 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Mon, Apr 07, 2014 at 02:36:26PM -0700, Bryan Wu wrote:
> On Mon, Apr 7, 2014 at 2:33 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Mon, Apr 07, 2014 at 02:31:00PM -0700, Bryan Wu wrote:
> >> On Sun, Apr 6, 2014 at 3:18 PM, Russell King - ARM Linux
> >> <linux@arm.linux.org.uk> wrote:
> >> > This patch series fixes various problems with leds-pwm.
> >> >
> >> > The first patch is very important to solve a boot time oops on OMAP
> >> > boards (and probably others) which has recently shown its face.
> >> >
> >> > The next two clean up leds-pwm so that we can avoid the madness of
> >> > having entirely separate initialisation paths for DT and non-DT, which
> >> > I believe is the core cause of the initial problem.
> >> >
> >> > The last two patches add support for LEDs connected in the opposite
> >> > sense to PWM outputs, where either the PWM does not support inversion,
> >> > or does not support it in a way that works sanely with leds-pwm.  These
> >> > add a new property to leds-pwm, hence why that patch (and this cover)
> >> > copies the DT people.
> >> >
> >> > The first patch is an absolute must for going.
> >> >
> >>
> >> Cool, I think Thierry is good for this patchset. I'm going to merge it
> >> with Thierry's ack and queue it for 3.16 merge window.
> >
> > I don't mind the majority of the patch set being queued for the next
> > merge window, but I object to the first patch being delayed.  The
> > first patch is a very necessary bug fix for a regression that has
> > cropped up since -rc7.
> >
> > It may not be the fault of leds-pwm, but it's leds-pwm which is most
> > certainly buggy.  kfree'ing a work_struct which is active is *not*
> > on.
> >
> 
> Sure, actually just after I sent out my previous email, I think I need
> add your first patch into my git pull request for 3.15 merge window.
> So no worries, I will do that.

So, I see this commit in mainline:

commit e81d372ff9f694e13fa46e8b5aaed505c7fd2a1f
Merge: 75e300c8ba58 2f05e1d4458f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Dec 15 12:52:42 2012 -0800

    Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds
    
    Pull LED subsystem update from Bryan Wu.
    
    * 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds: (47 commits)

Yet I don't see this patch series in it.  What's the story behind the
lack of progress on this?

Your April response clearly indicated that the entire patch set was going
in during the 3.16 merge window.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
