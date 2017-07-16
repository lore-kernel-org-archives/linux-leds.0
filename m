From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Sun, 16 Jul 2017 12:57:30 -0700
Message-ID: <20170716195730.GT1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170706031801.GB12954-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Wed 05 Jul 20:18 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > Some LED controllers have support for autonomously controlling
> > brightness over time, according to some preprogrammed pattern or
> > function.
> > 
> > This adds a new optional operator that LED class drivers can implement
> > if they support such functionality as well as a new device attribute to
> > configure the pattern for a given LED.
> 
> > @@ -61,3 +61,23 @@ Description:
> >  		gpio and backlight triggers. In case of the backlight trigger,
> >  		it is useful when driving a LED which is intended to indicate
> >  		a device in a standby like state.
> > +
> > +What:		/sys/class/leds/<led>/pattern
> > +Date:		July 2017
> > +KernelVersion:	4.14
> > +Description:
> > +		Specify a pattern for the LED, for LED hardware that support
> > +		altering the brightness as a function of time.
> > +
> > +		The pattern is given by a series of tuples, of brightness and
> > +		duration (ms). The LED is expected to traverse the series and
> > +		each brightness value for the specified duration.
> > +
> > +		Additionally a repeat marker ":|" can be appended to the
> > +		series, which should cause the pattern to be repeated
> > +		endlessly.
> > +
> > +		As LED hardware might have different capabilities and precision
> > +		the requested pattern might be slighly adjusted by the driver
> > +		and the resulting pattern of such operation should be returned
> > +		when this file is read.
> 
> Well. I believe this is mostly useful for RGB LEDs. Unfortunately, having patterns
> per-LED will present opportunity for different channels becoming de-synchronized
> from each other, which will not look nice.
> 

The two laptops on my desk indicates suspend state by pulsing a white
and a green LED respectively, so there's definitely people out there who
found it useful to do single channel patterns.


In the case of the Qualcomm LPG each channel (4-8 in a typical Qualcomm
PMIC) is implemented as a standalone hardware block. The pattern
generator is in a separate hardware block that is shared between the
LPGs and to synchronize pattern between channels the "start signal" to
the pattern generator can cover multiple channels.

But any combination of the LPG channels can be routed to any of the RGB
channels and there are use cases where you want to use a single LPG
channel to drive a single LED (or some other sink).

It therefor doesn't make sense to enforce any such groupings in the
driver itself - at least not for the LPG.


Similarly it's conceivable to design a board where one uses 3 PWM
channels to drive a RBG LED, in which case we would like to use the
leds-pwm driver, rather than creating a 3-channel-pwm LED driver.

So, based on our previous discussions on this topic, I think it makes
sense to have a virtual multi-channel LED driver, that through triggers
can have any LED instances associated with its channels. It would then
"broadcast" the brightness and pattern requests to the individual LED
instances.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
