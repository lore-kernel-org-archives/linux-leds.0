From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 13:37:50 +0100
Message-ID: <20140407123750.GC7528@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk> <20140407084651.GA30127@piout.net> <20140407111003.GA26985@ulmo> <20140407113547.GB7528@n2100.arm.linux.org.uk> <20140407120143.GF26985@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:52627 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755174AbaDGMiX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 08:38:23 -0400
Content-Disposition: inline
In-Reply-To: <20140407120143.GF26985@ulmo>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On Mon, Apr 07, 2014 at 02:01:45PM +0200, Thierry Reding wrote:
> On Mon, Apr 07, 2014 at 12:35:47PM +0100, Russell King - ARM Linux wrote:
> > Now, if PWM did define the starting point of the wave (which it doesn't,
> > or if it does, it's not documented which means we probably have loads of
> > buggy drivers) then yes, there would be some grounds to object.
> 
> PWM does in fact define the starting point. And it's even documented
> (see enum pwm_polarity in include/linux/pwm.h). The fact that you
> thought it wasn't documented probably indicates that it's the wrong
> place, so perhaps you can suggest a better location. One where you
> would've looked.

It's not documented in Documentation/pwm.txt, which is where I was
looking.

Okay, so what about this case - which is a case you need if you're
driving a H-bridge configuration with four synchronised PWMs (and
there are PWMs out there which can do this):

0: ~_________~_________~_________ (bottom left)
1: _____~_________~_________~____ (bottom right)
2: ~~~~~_~~~~~~~~~_~~~~~~~~~_~~~~ (top left)
3: _~~~~~~~~~_~~~~~~~~~_~~~~~~~~~ (top right)

The PWM design doesn't quite stretch to this use case.  (Example shown
driving four mosfets, two n-channel, two p-channel hence the inversion
requirement.)

In such a configuration, you must never end up turning both left or
both right mosfets on at the same time, otherwise you short the
supply and the magic blue smoke escapes.

Not quite as simple as you wanted it to be with your basic "rigorous"
definitions :)

> There's of course the issue that there could be hardware that doesn't
> allow changing the polarity but doesn't produce the signal as expected
> by the "normal" polarity. The only way I can think of handling that
> situation would be to allow drivers to provide a .get_polarity() and
> have client drivers chicken out if they can't cope with it. Nobody's
> ever had any incentive to be that rigorous, probably because all drivers
> really care about is the power of the signal.

There's also the issue of what value the PWM output is when you disable
the PWM, which is part of the problem here.

> > The electronic engineer in me says you're talking rubbish too, from the
> > point of view of designing stuff to produce a PWM signal.
> 
> Can you please elaborate. I don't understand what you're saying.

If I were designing a circuit to produce a PWM signal, and I wanted to
produce an inverted signal, I would not design a circuit to produce a
normal signal and then stick an inverter on the output.  I would instead
design it to produce the signal required directly.  Also, because the
application doesn't care about where the count starts, I would do which
ever turns out the easiest.

However, for this patch we are not talking about H bridge drivers, we
are not even talking about synchronised devices.  We are talking about
a *LED* which you have already acknowledged does not care about the
aspect of where the signal starts.  Even at low rates, where we want
the LED to blink with a duty cycle, it does not matter.  What matters
is the duty cycle emitted by the LED, not by the precise timing.

However, I'll meet you at the middle ground: I'll change the DT property
to "invert-duty" instead of "active-low".  Is that acceptable?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
