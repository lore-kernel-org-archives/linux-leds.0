From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/5] leds: leds-pwm: implement PWM inversion
Date: Mon, 7 Apr 2014 09:52:45 +0100
Message-ID: <20140407085245.GT7528@n2100.arm.linux.org.uk>
References: <20140406221854.GS7528@n2100.arm.linux.org.uk> <E1WWvQI-00049e-Vl@rmk-PC.arm.linux.org.uk> <20140407084651.GA30127@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:52172 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750740AbaDGIxS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Apr 2014 04:53:18 -0400
Content-Disposition: inline
In-Reply-To: <20140407084651.GA30127@piout.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

On Mon, Apr 07, 2014 at 10:46:51AM +0200, Alexandre Belloni wrote:
> (adding Thierry Reding)
> 
> Hi,
> 
> On 06/04/2014 at 23:20:18 +0100, Russell King wrote :
> > Some PWM outputs are wired such that the LED they're controlling is
> > connected to supply rather than ground.  These PWMs may not support
> > output inversion, or when they do, disabling the PWM may set the
> > PWM output low, causing a "brightness" value of zero to turn the LED
> > fully on.
> > 
> > The platform data for this driver already indicates that this was
> > thought about, and we have the "active_low" property there already.
> > However, the implementation for this is missing.
> > 
> > Add the trivial implementation for this feature.
> > 
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> >  drivers/leds/leds-pwm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index e1b4c23a409a..1d47742c551f 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -70,6 +70,10 @@ static void led_pwm_set(struct led_classdev *led_cdev,
> >  
> >  	duty *= brightness;
> >  	do_div(duty, max);
> > +
> > +	if (led_dat->active_low)
> > +		duty = led_dat->period - duty;
> > +
> >  	led_dat->duty = duty;
> >  
> 
> This will conflict with my patch (which is still lacking proper review)
> there:
> http://thread.gmane.org/gmane.linux.leds/482
> 
> I would say that it is better to hide the polarity inversion in the PWM
> driver for your specific PWM. Else we will end up with all the drivers
> using PWMs trying to detect whether the PWM supports inversion and if it
> is not the case, calculating the inverted duty cycle.
> 
> So, I would go for my patch which is adding the missing polarity
> inversion setting when using platform data and then implement software
> polarity inversion in your underlying PWM driver. That also avoids patch
> 5/5 and I believe not adding a DT property is always a good idea.
> 
> What is your PWM that is not supporting polarity inversion ?

Did you read the commit message properly, particularly the last sentence
of the first paragraph which refers to the problem with your approach?

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
