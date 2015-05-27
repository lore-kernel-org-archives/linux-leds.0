From: Pavel Machek <pavel@ucw.cz>
Subject: Re: CPU LED trigger: add hooks to generic code so that it works on
 x86
Date: Wed, 27 May 2015 09:47:57 +0200
Message-ID: <20150527074757.GB1254@amd>
References: <20150527065712.GA4415@amd>
 <20150527074343.GI19282@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39068 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750977AbbE0Hr7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2015 03:47:59 -0400
Content-Disposition: inline
In-Reply-To: <20150527074343.GI19282@twins.programming.kicks-ass.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org

On Wed 2015-05-27 09:43:43, Peter Zijlstra wrote:
> On Wed, May 27, 2015 at 08:57:12AM +0200, Pavel Machek wrote:
> > 
> > CPU LED trigger hooks are currently hidden in arm-specific code, which
> > means that this trigger only works on arm. Add it to the generic
> > code, so that it works on x86, too.
> 
> And why do we want to go and slow down the idle loop for everyone?

If the trigger is not configured, this is not slowing down anyone.

If the trigger is configured, well, then the user requested the
functionality. So we are not slowing down _everyone_, just the people
that want the blinking.

								Pavel

include/linux/leds.h:

#ifdef CONFIG_LEDS_TRIGGER_CPU
extern void ledtrig_cpu(enum cpu_led_event evt);
#else
static inline void ledtrig_cpu(enum cpu_led_event evt)
{
	return;
	}
#endif
	

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
