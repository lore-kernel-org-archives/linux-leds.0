From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Tue, 11 Apr 2017 16:17:39 -0700
Message-ID: <20170411231739.GH15143@minitux>
References: <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
 <20170407202603.GC15143@minitux>
 <20170408133904.GA9020@amd>
 <20170410191948.GE15143@minitux>
 <20170411175431.GA25483@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:36799 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752747AbdDKXRn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Apr 2017 19:17:43 -0400
Received: by mail-pf0-f174.google.com with SMTP id o126so5061556pfb.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2017 16:17:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170411175431.GA25483@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On Tue 11 Apr 10:54 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > > > How do we do with patterns that are implementable by the LP5xx but are
> > > > not with the LPG? Should we reject those or should we do some sort of
> > > > best-effort approach in the kernel?
> > > 
> > > Lets say you get series of
> > > 
> > > (red, green, blue, delta_t )
> > > 
> > > points, meaning "in delta_t msec, change color to red, green,
> > > blue. Lets ignore other channels for now. delta_t of 0 would be step
> > > change. Would such interface work for you?
> > 
> > So I presume this would be input to the RGB trigger that we discussed.
> > But in my current device I have 6 LEDs, that are not in any RGB-like
> > configuration. So we would need to come up with an interface that looks
> > to be the same in both single-LED and RGB-LED setups.
> 
> Ok.
> 
> > This should be sufficient to describe a subset of the patterns I've seen
> > so far in products.
> > 
> > But let's consider the standard use case for an RGB LED on an Android
> > phone; continuously blinking (pulsing based on patterns) as you have
> > some notifications waiting. In this case you want the LED hardware to do
> > all the work, so that you can deep-idle the CPU. So we would need to
> > introduce a "repeat pattern"-command.
> 
> I'd say have additional parameter with number of repetitions. Yes. In
> your case you can do 1 and infinity, LP5XX can do 1-255 or infinity.
> 

Sounds reasonable.

> > Then consider the fact that you want your patterns to have decent
> > resolution, but you have a limited amount of storage. So we either have
> > to be able to detect palindromes or have a way to represent this.
> 
> I'm not sure how common hardware support for palindromes is going to
> be. I'd say "detect", but...
> 

Even with the LP5xx I presume you would want to implement a natural
pulse by running back and forth over something like a section of a
sigmoid function - rather than encoding all the values for both raise
and falling edge.

But its easy to detect these patterns, so lets just have the drivers do
it for now.

> > > Simple compiler from this to LP5XX code should not be hard to
> > > do.
> > 
> > It sounds fairly straight forward to convert a pattern to instructions,
> > but we do have an extremely limited amount of storage so it must be a
> > quite good implementation for people to be able to use it for anything
> > real.
> > 
> > We could implement some optimization steps where we try to detect slopes
> > and generate ramp-instructions instead of set-pwm + wait instructions,
> > use some variables to handle ramp up/down and we could probably generate
> > some jump instructions to implement loops.
> 
> Actually it is easier than that. Hardware can do slopes itself. If we
> see change with non-zero delta_t, we issue slope, otherwise we issue
> set_value.
> 

So given a sequence of x, delta_t, y, delta_t', z, delta_t'' the
hardware should:

* set the brightness to x at time 0
* set the brightness to y at time delta_t
* set the brightness to z at time delta_t + delta_t'
* if repeating we will start the next sequence at time delta_t +
  delta_t' + delta_t''


The question is how to define the intermediate segments. We could say
that the transition between two points must always be some ramp or we
expect user space to use small enough delta_t so any differences between
hardware with or without ramp support are not noticeable.

In the prior LPG would have to make up intermediate values to create a
ramp effect, with some heuristics for not consuming to much lookup-table
space.

With the latter approach the LP55xx would probably be expected to drop
intermediate values that lay on the path between two other values in an
effort to reduce memory used.


I see a problem with the first approach in that with the LPG we could
overcommit to a smooth curve and later not have enough room to configure
some other curve (for some other LED).

So I would like to suggest that we go with the latter approach.

> Here's example "compiler": https://gitlab.com/tui/tui/blob/master/ofone/notcc.py
> Here's example "program": https://gitlab.com/tui/tui/blob/master/ofone/tests.notcc/primes.nc
> 
> > But do we really want this logic in the kernel, for each LED chip
> > supporting patterns?
> 
> I'd say so, yes. It should be, dunno, 200? 500? lines of code for
> LP5XX?  Sounds acceptable.
> 
> Otherwise we'd have to have led-chip-dependend part in userspace. That
> would be ok... but we'd _still_ need led-chip-dependend part in the
> kernel... and driver spread between kernel and userland is difficult.
> 
> The code needs to be created, anyway, so lets put it in kernel.
> 

My background is in consumer devices, where humans would generate the
sequence and just encode this in user space, you wouldn't recompile this
on the fly - and the LP5xx use of firmware files seems to indicate a
similar behavior.

But I think what we're discussing here fits the driver I'm trying to
upstream reasonably well, so if you think this is ok for the LP5xx we
should be good.

> > > AS3676 ... I'm not sure what to do, AFAICT it is too limited.
> > > 
> > 
> > So out of the three examples I've looked at we're skipping one and we're
> > abstracting away most functionality from another.
> 
> Well. We don't need to _skip_ AS3676, but its pattern engine is
> basically useless for anything involving different PWM levels.
> 

Yes

> And abstracting away most of LP5XX functionality... well, you can
> compute prime numbers on that chip (see example above), but you better
> should not. And patterns we'll pretty much expose all the functionality.
> 

Ok

> > I'm sorry for being pessimistic about this, but while I can see the
> > theoretical benefit of providing a uniform interface for this to user
> > space I see three very different pieces of hardware that would be used
> > in three different ways in products.
> 
> Three different pieces of hardware, at least two of them used in
> phones to provide blinking leds... I'd say common interface is the
> right thing to do.

All three of them are used in phones, to provide blinking light. With
some allowance for fitting points to the hardware's capabilities and the
ability to reject incompatible patterns it should be possible to support
some common cases.

I'll take a stab at this for the LPG and we can discuss from there.

Regards,
Bjorn
