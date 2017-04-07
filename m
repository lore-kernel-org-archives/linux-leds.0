From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Fri, 7 Apr 2017 13:26:04 -0700
Message-ID: <20170407202603.GC15143@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dce7f2b1-8d1d-1c5d-5fa5-54c22b6f4758@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon 03 Apr 13:38 PDT 2017, Jacek Anaszewski wrote:

> On 04/03/2017 09:00 PM, Bjorn Andersson wrote:
[..]
> > For the patterns I don't know how a trigger for this would look like,
> > how would setting the pattern of a trigger be propagated down to the
> > hardware?
> 
> We'd need a new op and API similar to blink_set()/led_blink_set().
> 

I've tried to find different LED circuits with some sort of pattern
generator in an attempt to figure out how to design this interface, but
turned out to be quite hard to find examples; the three I can compare
are:

* LP5xx series "implements" pattern generation by executing code.

* Qualcomm LPG iterates over 2-64 brightness-values in a pattern, at a
  fixed rate with knobs to configure what happens before starting and
  after finishing iterating over the defined values. It does not support
  smooth transitions between values.

* AS3676 supports a pattern of 32 values controlling if the output
  should be enabled or disabled for each 32.5ms (or 250ms) time period.
  The delay before repeating the pattern can be configured. It support
  smooth transitions between the states.


So, while I think I see how you would like to architect this interface I
am not sure how to figure out the details.

The pattern definition would have to be expressive enough to support the
features of LP5xx and direct enough to support the limited AS3676. It
would likely have to express transitions, so that the LPG could generate
intermediate steps (and we will have to adapt the resolution of the
ramps based on the other LPGs in the system).

How do we do with patterns that are implementable by the LP5xx but are
not with the LPG? Should we reject those or should we do some sort of
best-effort approach in the kernel?

> >>> Second, there are more issues than just patterns with the RGB
> >>> LED. Most important is ability to set particular colors. You want to
> >>> set the RGB LED to "white", but that does not mean you can set
> >>> red=green=blue=1.0. You want color to look the same on LCD and on the
> >>> LED, which means coefficients for white and some kind of function for
> >>> brightness-to-PWM conversion.
> >>
> >> Shouldn't we leave that entirely to the userspace? Can we come up
> >> with coefficients that will guarantee the same result on all existing
> >> LCD devices?
> >>
> > 
> > How about we just force user space perform the 3 writes and save us the
> > cost of another trigger in that case? Configuring the brightness of 3
> > LEDs is not board specific - and even with a RGB-interface we still need
> > to specify which RGB-LED should be controlled.
> 
> This is what we have now, so we can live with it. Addition of a new
> RGB trigger would be an improvement of the existing state.
> 

If we do the brightness compensation (for e.g. white balance
adjustments) in a trigger then there's added value.

The part where I see this affects the LPG driver is that the brightness
of the patterns might have to be adjusted accordingly - which probably
would be easier to implement if the kernel just exposed the compensation
values to user space.

Regards,
Bjorn
