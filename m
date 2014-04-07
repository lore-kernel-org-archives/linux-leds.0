From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 16:20:24 +0200
Message-ID: <20140407142024.GX30127@piout.net>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk>
 <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk>
 <20140407084651.GA30127@piout.net>
 <20140407111003.GA26985@ulmo>
 <20140407113547.GB7528@n2100.arm.linux.org.uk>
 <20140407120143.GF26985@ulmo>
 <20140407123750.GC7528@n2100.arm.linux.org.uk>
 <20140407133758.GA25556@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:48150 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755131AbaDGOU3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 10:20:29 -0400
Content-Disposition: inline
In-Reply-To: <20140407133758.GA25556@ulmo>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On 07/04/2014 at 15:37:59 +0200, Thierry Reding wrote :
> On Mon, Apr 07, 2014 at 01:37:50PM +0100, Russell King - ARM Linux wrote:
> > On Mon, Apr 07, 2014 at 02:01:45PM +0200, Thierry Reding wrote:
> > > On Mon, Apr 07, 2014 at 12:35:47PM +0100, Russell King - ARM Linux wrote:
> > > > Now, if PWM did define the starting point of the wave (which it doesn't,
> > > > or if it does, it's not documented which means we probably have loads of
> > > > buggy drivers) then yes, there would be some grounds to object.
> > > 
> > > PWM does in fact define the starting point. And it's even documented
> > > (see enum pwm_polarity in include/linux/pwm.h). The fact that you
> > > thought it wasn't documented probably indicates that it's the wrong
> > > place, so perhaps you can suggest a better location. One where you
> > > would've looked.
> > 
> > It's not documented in Documentation/pwm.txt, which is where I was
> > looking.
> 
> Okay, I'll work up a patch to include a paragraph about the expected
> signals in that file.
> 
> > Okay, so what about this case - which is a case you need if you're
> > driving a H-bridge configuration with four synchronised PWMs (and
> > there are PWMs out there which can do this):
> > 
> > 0: ~_________~_________~_________ (bottom left)
> > 1: _____~_________~_________~____ (bottom right)
> > 2: ~~~~~_~~~~~~~~~_~~~~~~~~~_~~~~ (top left)
> > 3: _~~~~~~~~~_~~~~~~~~~_~~~~~~~~~ (top right)
> 
> That's a very interesting use-case. I'll need to look into that further.
> 
> > The PWM design doesn't quite stretch to this use case.  (Example shown
> > driving four mosfets, two n-channel, two p-channel hence the inversion
> > requirement.)
> > 
> > In such a configuration, you must never end up turning both left or
> > both right mosfets on at the same time, otherwise you short the
> > supply and the magic blue smoke escapes.
> 
> So that's exactly a case where the inversion matters. If some driver
> were to simply emulate inversion by reversing the duty cycle, then
> you'll short the supply. Doesn't that support my argument of not
> allowing drivers to emulate inversion in software?
> 
> > Not quite as simple as you wanted it to be with your basic "rigorous"
> > definitions :)
> 
> Well, at least PWM is aware that such requirements exist. Having a
> rigorous definition may not be all, but it's definitely necessary for
> cases such as this.
> 
> I wonder how software is usually set up to drive such an H-bridge. You
> say that there are PWMs out there which can do this, so there must be a
> way for software to control this. Or perhaps those chips will only
> output synchronized signals in which case they should be able to work
> with the PWM subsystem just fine.
> 
> I'd appreciate any insight you could provide, since I'm interested in
> supporting such use-cases. What I'm trying to avoid is tayloring the
> subsystem to special cases, such as backlight or LED where signal
> inversion and duty cycle reversion are effectively the same.
> 

The Allwinner A31 ans the Atmel sama5d3 are able to output complementary
signals on different pins. You don't have much to do in that case. But
the sama5d3 is able to generate a dead time between the edges of the two
complimentary outputs.

> > > There's of course the issue that there could be hardware that doesn't
> > > allow changing the polarity but doesn't produce the signal as expected
> > > by the "normal" polarity. The only way I can think of handling that
> > > situation would be to allow drivers to provide a .get_polarity() and
> > > have client drivers chicken out if they can't cope with it. Nobody's
> > > ever had any incentive to be that rigorous, probably because all drivers
> > > really care about is the power of the signal.
> > 
> > There's also the issue of what value the PWM output is when you disable
> > the PWM, which is part of the problem here.
> 
> I had assumed that for normal polarity the output was low when disabled,
> and the reverse being true for inverse polarity. But apparently that's
> not the case. I've wanted to document the expected behaviour as well,
> but it seems like there's nothing drivers can really do about it. In
> this case I'm not sure an unambiguous definition would be any good if
> drivers have no influence over it at all.
> 
> It always seemed to me that this should be solvable on a board-level,
> too, using pinctrl or what not, but so far nobody ever investigated as
> far as I can tell.
> 

Actually, I had that issue at first with the atmel PWM driver, back in
September. After investigation it turns out that your assumptions are
still correct for that IP.
However, I'm still wondering what we should do when we know that the PWM
controller can't honor that expected behaviour. Would moving from
pwm_enable()/pwm_disable() to pwm_request/pwm_free() be the solution ?
As you commented that would mean that the PWM will always be running but
that is what we need anyway if we want to achieve the desired result...

> > > > The electronic engineer in me says you're talking rubbish too, from the
> > > > point of view of designing stuff to produce a PWM signal.
> > > 
> > > Can you please elaborate. I don't understand what you're saying.
> > 
> > If I were designing a circuit to produce a PWM signal, and I wanted to
> > produce an inverted signal, I would not design a circuit to produce a
> > normal signal and then stick an inverter on the output.  I would instead
> > design it to produce the signal required directly.  Also, because the
> > application doesn't care about where the count starts, I would do which
> > ever turns out the easiest.
> 
> Apparently not everybody thinks as sanely as you do. Usually the reason
> why people need polarity inversion is because there's actually an
> inverter somewhere on the board that requires that the PWM be inverted
> in order to make some backlight or LED light up properly.
> 
> > However, for this patch we are not talking about H bridge drivers, we
> > are not even talking about synchronised devices.  We are talking about
> > a *LED* which you have already acknowledged does not care about the
> > aspect of where the signal starts.  Even at low rates, where we want
> > the LED to blink with a duty cycle, it does not matter.  What matters
> > is the duty cycle emitted by the LED, not by the precise timing.
> 
> I fully agree. All of which are reasons why the LED driver should be
> implementing the inversion. It is the only place where the knowledge
> exists that only the signal power matters rather than the polarity.
> 
> > However, I'll meet you at the middle ground: I'll change the DT property
> > to "invert-duty" instead of "active-low".  Is that acceptable?
> 
> Maybe there was a misunderstanding. I wasn't objecting to your patch at
> all. If you want to call the DT property active-low, then by all means
> go ahead. What I'm objecting to is that people start to implement PWM
> polarity support in PWM drivers by "emulating it in software", which is
> just another way of saying they compute "duty = period - duty;".
> 
> So in fact I'm all in favour of your patch to implement this within the
> leds-pwm driver. Because that driver knows exactly that the effect can
> be achieved either by inverting the polarity or by reversing the duty
> cycle.
> 
> But emulation in the PWM driver is wrong, in my opinion, because then a
> driver that needs to know about the *real* polarity of the signal will
> be fooled into shorting the supply in your H-bridge setup.
> 

Point taken. I'm still a bit afraid about people then setting both the
inverted polarity on the PWM and active-low. Or not knowing when to
choose which one. I would expect that inverting the PWM is still the
better choice as it allows to disable the PWM.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
