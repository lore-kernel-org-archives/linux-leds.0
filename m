From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 12:35:47 +0100
Message-ID: <20140407113547.GB7528@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk> <20140407084651.GA30127@piout.net> <20140407111003.GA26985@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:52431 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754274AbaDGLgT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 07:36:19 -0400
Content-Disposition: inline
In-Reply-To: <20140407111003.GA26985@ulmo>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On Mon, Apr 07, 2014 at 01:10:05PM +0200, Thierry Reding wrote:
> On Mon, Apr 07, 2014 at 10:46:51AM +0200, Alexandre Belloni wrote:
> > (adding Thierry Reding)
> > 
> > Hi,
> > 
> > On 06/04/2014 at 23:20:18 +0100, Russell King wrote :
> > > Some PWM outputs are wired such that the LED they're controlling is
> > > connected to supply rather than ground.  These PWMs may not support
> > > output inversion, or when they do, disabling the PWM may set the
> > > PWM output low, causing a "brightness" value of zero to turn the LED
> > > fully on.
> > > 
> > > The platform data for this driver already indicates that this was
> > > thought about, and we have the "active_low" property there already.
> > > However, the implementation for this is missing.
> > > 
> > > Add the trivial implementation for this feature.
> > > 
> > > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > > ---
> > >  drivers/leds/leds-pwm.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > > index e1b4c23a409a..1d47742c551f 100644
> > > --- a/drivers/leds/leds-pwm.c
> > > +++ b/drivers/leds/leds-pwm.c
> > > @@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led_cdev,
> > >  
> > >  	duty *= brightness;
> > >  	do_div(duty, max);
> > > +
> > > +	if (led_dat->active_low)
> > > +		duty = led_dat->period - duty;
> > > +
> > >  	led_dat->duty = duty;
> > >  
> > 
> > This will conflict with my patch (which is still lacking proper review)
> > there:
> > http://thread.gmane.org/gmane.linux.leds/482
> > 
> > I would say that it is better to hide the polarity inversion in the PWM
> > driver for your specific PWM. Else we will end up with all the drivers
> > using PWMs trying to detect whether the PWM supports inversion and if it
> > is not the case, calculating the inverted duty cycle.
> 
> If the PWM hardware really does support inversion of the polarity, then
> by all means that's what you should be using. However, and I've said
> this a few times already, polarity inversion is not the same as
> reversing the duty-cycle. The *effect* will be the same for LEDs and
> backlights, but the signal is not in fact inverted.

Sorry, for the general case, you're talking rubbish there.  The PWM layer
does not define the starting point in the PWM cycle, so there's no precise
definition of the exact waveform.  Therefore:

Here's a 10% duty cycle:		~_________~_________~_________
Here's another 10% duty cycle:		_________~_________~_________~
which are both equally valid implementations of a 10% PWM.

Here's a 90% duty cycle:		~~~~~~~~~_~~~~~~~~~_~~~~~~~~~_
Here's another 90% duty cycle:		_~~~~~~~~~_~~~~~~~~~_~~~~~~~~~
which are again both equally valid implementations of a 90% PWM.

Here's the first 10% duty cycle,
inverted:				_~~~~~~~~~_~~~~~~~~~_~~~~~~~~~
which is the same as the second example of a 90% PWM signal.

Here's the second 10% duty cycle,
inverted:				~~~~~~~~~_~~~~~~~~~_~~~~~~~~~_
which is the same as the first example of a 90% PWM signal.

Now, if PWM did define the starting point of the wave (which it doesn't,
or if it does, it's not documented which means we probably have loads of
buggy drivers) then yes, there would be some grounds to object.

In any case, we probably already have drivers which implement both
variants of the 10% signal, so really there's no grounds to say "a 90%
duty cycle is not the same as an inverted 10% duty cycle signal".

The electronic engineer in me says you're talking rubbish too, from the
point of view of designing stuff to produce a PWM signal.

So please, justify your statement.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
