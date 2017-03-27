From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Sun, 26 Mar 2017 21:48:47 -0700
Message-ID: <20170327044847.GF70446@Bjorns-MacBook-Pro-2.local>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170323203749.GB8563@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Thu 23 Mar 13:37 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > PMICs from Qualcomm. It can operate on fixed parameters or based on a
> > lookup-table, altering the duty cycle over time - which provides the
> > means for e.g. hardware assisted transitions of LED brightness.
> 
> Ok, this is not first hardware that supports something like this. We
> have similar hardware that can do blinking on Nokia N900 -- please
> take a look at leds-lp55*.c
> 

I have not worked with the LP55xx chips before, they look quite capable!

> And it would be really good to provide hardware abstraction. We really
> don't want to have different userspace for LPG and for N900 and for
> ...
> 
> Which probably means finding subset that makes sense for everyone.
> 

While I share your concern of userspace differences I'm not sure how to
expose the advanced features of the LP55xx series and the LPG's limited
pattern-controlled PWM.

> Hmm. What is difference between "ping_pong" and "reverse"? And do we
> really want it? That seems little .. too specialized.
> 

Writing the appropriate bit in RAMP_CONTROL_REG of the LUT block
qcom_lpg_lut_sync() resets the ramp-walker; ping-pong causes the
ramp-walker to make one round-trip run over the pattern, while reverse
means that the ramp-walker should start from the hi-index.

I.e. with the pattern [1,2,3] we get:

ping-pong: [1,2,3,2,1]
reverse: [3,2,1]
ping-pong and reverse: [3,2,1,2,3]

> How are different channels on RGB LED synchronized?
> 

You can reset multiple ramp-generators simultaneously, which would cause
the channels to be synchronized. I have not implemented this though.

> > +What:		/sys/class/leds/<led>/pattern
> > +Date:		March 2017
> > +KernelVersion:	4.12
> > +Contact:	Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > +Description:
> > +		Comma-separated list of duty cycle values to output from
> > +		the ramp generator. Values should be in the range of 0
> > +		to 511.
> 
> We normally do "space separated" in sysfs.
> 

Okay, I'm fine with that.

> Can your engine do "smooth transitions"? For example if you want to
> slowly turn on the LED on, can you do something more clever than
> 
> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
> 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
> ...
> 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509,
> 510, 511
> 

There's nothing beyond "run the pattern", so this is exactly what you
would have to do if you need a perfectly smooth transition.

> ? What is the maximum length of the pattern?
> 

It differs between the various PMICs implementing this. I've seen cases
of 24 slots and 64 slots.

> Could we do patterns in form of "delay brightness delay brightness"
> .... ?
> 

The ramp-walker is configured to tick with a fixed clock (in
milliseconds) and the PWM will be configured with the duty-cycle of the
current element of the ramp.

So you can do this, given that all your "delay" is the same fixed delay,
which is max 511 milliseconds.

> > +static enum led_brightness lpg_brightnes_get(struct led_classdev *cdev)
> > +{
> > +	struct lpg *lpg = container_of(cdev, struct lpg, cdev);
> > +	unsigned long max = (1 << lpg->pwm_size) - 1;
> > +
> > +	if (!lpg->enabled)
> > +		return LED_OFF;
> > +
> > +	return lpg->pwm_value * cdev->max_brightness / max;
> > +}
> 
> Does this return something reasonable when pattern is running?
> 

No, I'll fix that. I treat brightness as a boolean if a pattern is
provided, but I'm concerned about modifying max_brightness to reflect
this.


As you can see from these answers, the hardware is quite limited in
comparison to the LP55xx series. It would make some sense to feed e.g. a
mathematical formula to the kernel and have the driver map that to
patterns for the LPG or program code in the case of LP55xx.

But this would add quite a bit of complexity and with hardware as
limited as the 24-slot LPG we likely need that direct control of the
patterns.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
