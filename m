From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Wed, 29 Mar 2017 17:09:56 -0700
Message-ID: <20170330000955.GP20094@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170329222301.GB7977@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed 29 Mar 15:23 PDT 2017, Pavel Machek wrote:

> On Wed 2017-03-29 12:07:25, Bjorn Andersson wrote:
> > On Tue 28 Mar 19:17 PDT 2017, Rob Herring wrote:
> > 
> > > On Thu, Mar 23, 2017 at 09:37:49PM +0100, Pavel Machek wrote:
> > > > Hi!
> > > > 
> > > > > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > > > > PMICs from Qualcomm. It can operate on fixed parameters or based on a
> > > > > lookup-table, altering the duty cycle over time - which provides the
> > > > > means for e.g. hardware assisted transitions of LED brightness.
> > > > 
> > > > Ok, this is not first hardware that supports something like this. We
> > > > have similar hardware that can do blinking on Nokia N900 -- please
> > > > take a look at leds-lp55*.c
> > > 
> > > And perhaps some alignment on the bindings too if the N900 has bindings.
> > > 
> > 
> > There is a binding for ti,lp55xx, but there's nothing I can reuse from
> > that binding...because it's completely different hardware.
> 
> Agreed, if you drop the pattern stuff from the binding, at least for now. 
> 

I do not have a strong preference to expose these knobs in devicetree
and I do fear that finding some common "pattern" bindings that suits
everyone will be very difficult.

So I'll drop them from the binding for now.

> > > > And it would be really good to provide hardware abstraction. We really
> > > > don't want to have different userspace for LPG and for N900 and for
> > > 
> > > I'm interested in what this looks like as several AOSP platforms do 
> > > tri-color LEDs with custom sysfs extensions.
> > 
> > How to model RGB LEDs has been discussed many times before and I was
> > hoping for that discussion to come to some conclusion during the last 2
> > years, but now I couldn't wait more - we need this driver for
> > db820c.
> 
> If you want driver merged quickly, I believe the best way would be to
> leave out pattern support for now. We can merge the basic driver
> easily to 4.12.
> 

I'm not that much in a hurry and would rather see that we resolve any
outstanding issues with the implementation of the pattern handling.


But regardless of this we still have the problem that the typical
Qualcomm PMIC has 8 LPG-blocks and any triple could be driving a
RGB-LED. So we would have to create some sort of in-driver-wrapper
around any three instances exposing them as a single LED to the user.

I rather expose the individual channels and make sure that when we
trigger a blink operation or enable a pattern (i.e. the two operations
that do require synchronization) we will perform that synchronization
under the hood.

> > With this driver, as with many existing, you will have 3 LEDs that you
> > set independently.
> > 
> > I did implement blinking by using the PWM straight off, so you can't set
> > brightness or synchronize the multiple channels. Perhaps this should be
> > changed to use the ramp generator.
> > 
> > To synchronize patterns I suggest that we extend the LUT binding to
> > describe groups and when any LPG trigger a restart of the pattern-walker
> > we trigger all that are grouped.
> > 
> > These two changes combined allows you to set brightness and blink with a
> > RGB-LED.
> > 
> > 
> > But I will have to dig up some hardware that uses the LPG for driving a
> > RGB-LED to be able to test this (and I do prefer that to be done with
> > some incremental patches at some later time, if acceptable).
> 
> Incremental patches sound like a good idea, yes.
> 
> I'd say that testing with actual RGB LED is not a requirement... as
> long as we design reasonable interface where the synchronizaction will
> be easy.
> 

As this relates to the board layout (which LPG-channels are hooked to a
RGB) I think it makes sense to expose a mechanism in devicetree to
indicate which channels should have their pattern/blink synchronized.

We should be able to extend the LUT (the hardware that actually
implements the pattern-walker logic) with a DT-property like:

  qcom,synchronize-group-0 = <1, 2, 3>;
  qcom,synchronize-group-1 = <5, 6, 7>;

And whenever we configure a pattern involving one of the affected LEDs
from a group we start all of them.

I'll implement this in a separate patch and include in version 2 as
well.

Regards,
Bjorn
