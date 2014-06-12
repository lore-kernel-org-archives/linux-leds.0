From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/5] Fix various issues with leds-pwm
Date: Thu, 12 Jun 2014 19:03:34 +0100
Message-ID: <20140612180333.GM23430@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <CAK5ve-JijCvD8cZMpx+zG7YAjce3hnhpwTHCJr+zzfMKmJPt=g@mail.gmail.com> <20140407213337.GL7528@n2100.arm.linux.org.uk> <CAK5ve-KMLvxZgwFiks7eQHdBfakfMUPqUiuY0+KFmGLat8VhPA@mail.gmail.com> <20140612171206.GA12123@n2100.arm.linux.org.uk> <CAK5ve-+j75g_cTDHAEF3F9fqHQqe9iGFQ+XfssS=dNn0sa+bmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:56214 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751864AbaFLSDl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Thu, 12 Jun 2014 14:03:41 -0400
Content-Disposition: inline
In-Reply-To: <CAK5ve-+j75g_cTDHAEF3F9fqHQqe9iGFQ+XfssS=dNn0sa+bmg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

On Thu, Jun 12, 2014 at 10:37:43AM -0700, Bryan Wu wrote:
> > So, I see this commit in mainline:
> >
> > commit e81d372ff9f694e13fa46e8b5aaed505c7fd2a1f
> > Merge: 75e300c8ba58 2f05e1d4458f
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sat Dec 15 12:52:42 2012 -0800
> 
> Are you sure? this was a git pull in 2012. At that time I didn't get
> any patch from you.

Yes, it's the wrong commit, sorry.

> The rest of them are queued in my tree
> http://git.kernel.org/cgit/linux/kernel/git/cooloney/linux-leds.git/log/?h=for-next
> 
> And I will send them out during 3.16 merge window but now mainline is
> still 3.15-rc8. I believe this is what we talked about before.

I'm not sure why you think that.

First, the merge window is almost over - it opened one week early when
-rc8 was released:

https://lkml.org/lkml/2014/6/1/264

Date	Sun, 1 Jun 2014 19:37:20 -0700
Subject	Linux 3.15-rc8 ... and merge window for 3.16

Secondly, 3.15 was released last Sunday:

Date	Sun, 8 Jun 2014 11:52:27 -0700
Subject	Linux 3.15 .. and continuation of merge window

> Oh, no, I'm sorry, I messed up 3.16 merge window which is before
> 3.15-rc1 with 3.17 merge window. And I really mean 3.17 merge window
> which is before 3.16-rc1. My bad, I will definitely send them all out
> during 3.17 merge window.

Sorry, I sent the patches in /good/ time for the 3.16 merge window -
two months before the current merge window opened... and now you seem
to be saying that you intended to get them *not* into the merge window
two months away from that point, but *five* months away from the point
that you claimed to accept them?

I'm also told that my patches are in next-20140528, and indeed in the
last linux-next, they are still there:

http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/log/drivers/leds/leds-pwm.c

So you /can/ send them right now to Linus - the merge window is still
open for 3.16.

As for which merge window... here's a lesson.  This is how it normally
works:

3.15-rc8
3.15
<merge window for 3.16>
3.16-rc1
3.16-rc2
3.16-rc3
...
3.16-rc7
...
3.16
<merge window for 3.17>
3.17-rc1

So, your statement "3.16 merge window which is before 3.15-rc1" is
totally wrong.  The 3.X merge window happens immediately before
3.X-rc1 is released, for any X.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
