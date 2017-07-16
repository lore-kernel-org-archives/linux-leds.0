From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Sun, 16 Jul 2017 14:14:56 -0700
Message-ID: <20170716211456.GV1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
 <20170706031801.GB12954@xo-6d-61-c0.localdomain>
 <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <beb9b4c3-4922-1ebb-5017-a4b791cdb4d7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Sun 16 Jul 11:49 PDT 2017, Jacek Anaszewski wrote:

> Hi,
> 
> On 07/06/2017 05:18 AM, Pavel Machek wrote:
> > Hi!
> > 
> >> Some LED controllers have support for autonomously controlling
> >> brightness over time, according to some preprogrammed pattern or
> >> function.
> >>
> >> This adds a new optional operator that LED class drivers can implement
> >> if they support such functionality as well as a new device attribute to
> >> configure the pattern for a given LED.
> > 
> >> @@ -61,3 +61,23 @@ Description:
> >>  		gpio and backlight triggers. In case of the backlight trigger,
> >>  		it is useful when driving a LED which is intended to indicate
> >>  		a device in a standby like state.
> >> +
> >> +What:		/sys/class/leds/<led>/pattern
> >> +Date:		July 2017
> >> +KernelVersion:	4.14
> >> +Description:
> >> +		Specify a pattern for the LED, for LED hardware that support
> >> +		altering the brightness as a function of time.
> >> +
> >> +		The pattern is given by a series of tuples, of brightness and
> >> +		duration (ms). The LED is expected to traverse the series and
> >> +		each brightness value for the specified duration.
> >> +
> >> +		Additionally a repeat marker ":|" can be appended to the
> >> +		series, which should cause the pattern to be repeated
> >> +		endlessly.
> >> +
> >> +		As LED hardware might have different capabilities and precision
> >> +		the requested pattern might be slighly adjusted by the driver
> >> +		and the resulting pattern of such operation should be returned
> >> +		when this file is read.
> > 
> > Well. I believe this is mostly useful for RGB LEDs. Unfortunately, having patterns
> > per-LED will present opportunity for different channels becoming de-synchronized
> > from each other, which will not look nice.
> 
> Hmm, they are only [brightness duration] tuples, and no definition of
> R, G and B LED device is covered here, so how it can be useful for RGB
> LEDs?
> 

The typical Qualcomm PMIC sports 4-8 LPG channels. The output of these
channels can be configured to some extent, but in theory any combination
of the 8 could be hooked up to the three channels of a RGB LED.

So looking at the LPG hw block, there's no such thing as RGB.

> I've been working on addition of RGB LED support to the LED core for
> some time now, in the way as we agreed upon at [0], but it turns out to
> be less trivial if we want to do it in an elegant way.
> 

Generally 3 predefined LPG blocks are routed to the TRILED current sink.

Exposing the TRILED block as a RGB LED instance would make sense in its
own, but it doesn't give us a coherent solution for the LPG.

The current board I'm working on (DragonBoard820c) has 4 LEDs, 3 of them
are connected to the TRILED and the fourth is on a "GPIO" in current
sink mode.

By having each LPG represented as a LED device gives us a unified view
of the hardware even though there are two different types of current
sinks.


Further more, per the 96boards specification we're expected to have
different triggers on the different "colors" of the TRILED.

So I do not agree with imposing this kind of decisions on the board
design just to support this higher level feature.

> Less elegant way would be duplicating led-core functions and changing
> single enum led_brightness argument with the three ones (or a struct
> containing three brightness components)
> 
> I chose to go the elegant way and tried to introduce led_classdev_base
> type that would be customizable with the set of ops, that would allow
> for making the number of brightness components to be set at once
> customizable. This of course entails significant amount of changes in
> the LED core and some changes in LED Trigger core.
> 

I think that the RGB interface has to be a "frontend" of any
configurable LED instances and not tied to a particular hardware
controller.

For patterns you need to have some sort of synchronization between the
channels, but for non-pattern cases you can have any combination of LED
drivers to drive the individual components and I believe this should be
possible to expose through our RGB interface.

> Unfortunately I can't predict how much time it will take
> to submit an RFC due to limited amount of time I can spend working
> on it.
> 
> [0] https://www.spinics.net/lists/linux-leds/msg07959.html

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
