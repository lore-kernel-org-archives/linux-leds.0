From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Mon, 10 Apr 2017 12:19:48 -0700
Message-ID: <20170410191948.GE15143@minitux>
References: <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
 <20170407202603.GC15143@minitux>
 <20170408133904.GA9020@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:34407 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753192AbdDJTTw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Apr 2017 15:19:52 -0400
Received: by mail-pf0-f178.google.com with SMTP id c198so26539338pfc.1
        for <linux-leds@vger.kernel.org>; Mon, 10 Apr 2017 12:19:51 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170408133904.GA9020@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

On Sat 08 Apr 06:39 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > [..]
> > > > For the patterns I don't know how a trigger for this would look like,
> > > > how would setting the pattern of a trigger be propagated down to the
> > > > hardware?
> > > 
> > > We'd need a new op and API similar to blink_set()/led_blink_set().
> > > 
> > 
> > I've tried to find different LED circuits with some sort of pattern
> > generator in an attempt to figure out how to design this interface, but
> > turned out to be quite hard to find examples; the three I can compare
> > are:
> > 
> > * LP5xx series "implements" pattern generation by executing code.
> > 
> > * Qualcomm LPG iterates over 2-64 brightness-values in a pattern, at a
> >   fixed rate with knobs to configure what happens before starting and
> >   after finishing iterating over the defined values. It does not support
> >   smooth transitions between values.
> > 
> > * AS3676 supports a pattern of 32 values controlling if the output
> >   should be enabled or disabled for each 32.5ms (or 250ms) time period.
> >   The delay before repeating the pattern can be configured. It support
> >   smooth transitions between the states.
> > 
> > 
> > So, while I think I see how you would like to architect this interface I
> > am not sure how to figure out the details.
> > 
> > The pattern definition would have to be expressive enough to support the
> > features of LP5xx and direct enough to support the limited AS3676. It
> > would likely have to express transitions, so that the LPG could generate
> > intermediate steps (and we will have to adapt the resolution of the
> > ramps based on the other LPGs in the system).
> > 
> > How do we do with patterns that are implementable by the LP5xx but are
> > not with the LPG? Should we reject those or should we do some sort of
> > best-effort approach in the kernel?
> 
> Lets say you get series of
> 
> (red, green, blue, delta_t )
> 
> points, meaning "in delta_t msec, change color to red, green,
> blue. Lets ignore other channels for now. delta_t of 0 would be step
> change. Would such interface work for you?
> 

So I presume this would be input to the RGB trigger that we discussed.
But in my current device I have 6 LEDs, that are not in any RGB-like
configuration. So we would need to come up with an interface that looks
to be the same in both single-LED and RGB-LED setups.


This should be sufficient to describe a subset of the patterns I've seen
so far in products.

But let's consider the standard use case for an RGB LED on an Android
phone; continuously blinking (pulsing based on patterns) as you have
some notifications waiting. In this case you want the LED hardware to do
all the work, so that you can deep-idle the CPU. So we would need to
introduce a "repeat pattern"-command.

Then consider the fact that you want your patterns to have decent
resolution, but you have a limited amount of storage. So we either have
to be able to detect palindromes or have a way to represent this.

> Simple compiler from this to LP5XX code should not be hard to
> do.

It sounds fairly straight forward to convert a pattern to instructions,
but we do have an extremely limited amount of storage so it must be a
quite good implementation for people to be able to use it for anything
real.

We could implement some optimization steps where we try to detect slopes
and generate ramp-instructions instead of set-pwm + wait instructions,
use some variables to handle ramp up/down and we could probably generate
some jump instructions to implement loops.

But do we really want this logic in the kernel, for each LED chip
supporting patterns?

> AS3676 ... I'm not sure what to do, AFAICT it is too limited.
> 

So out of the three examples I've looked at we're skipping one and we're
abstracting away most functionality from another.

I'm sorry for being pessimistic about this, but while I can see the
theoretical benefit of providing a uniform interface for this to user
space I see three very different pieces of hardware that would be used
in three different ways in products.

Regards,
Bjorn
