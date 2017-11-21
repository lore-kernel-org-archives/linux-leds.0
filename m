From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/3] leds: core: Introduce generic pattern interface
Date: Mon, 20 Nov 2017 16:21:02 -0800
Message-ID: <20171121002102.GD28761@minitux>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-2-bjorn.andersson@linaro.org>
 <20171115073642.GA21307@kroah.com>
 <20171120232015.GB13906@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171120232015.GB13906@amd>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <greg@kroah.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On Mon 20 Nov 15:20 PST 2017, Pavel Machek wrote:

> On Wed 2017-11-15 08:36:42, Greg KH wrote:
> > On Tue, Nov 14, 2017 at 11:13:43PM -0800, Bjorn Andersson wrote:
> > > Some LED controllers have support for autonomously controlling
> > > brightness over time, according to some preprogrammed pattern or
> > > function.
> > > 
> > > This adds a new optional operator that LED class drivers can implement
> > > if they support such functionality as well as a new device attribute to
> > > configure the pattern for a given LED.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > 
> > > Changes since v2:
> > > - None
> > > 
> > > Changes since v1:
> > > - New patch, based on discussions following v1
> > > 
> > >  Documentation/ABI/testing/sysfs-class-led |  20 ++++
> > >  drivers/leds/led-class.c                  | 150 ++++++++++++++++++++++++++++++
> > >  include/linux/leds.h                      |  21 +++++
> > >  3 files changed, 191 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> > > index 5f67f7ab277b..74a7f5b1f89b 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-led
> > > +++ b/Documentation/ABI/testing/sysfs-class-led
> > > @@ -61,3 +61,23 @@ Description:
> > >  		gpio and backlight triggers. In case of the backlight trigger,
> > >  		it is useful when driving a LED which is intended to indicate
> > >  		a device in a standby like state.
> > > +
> > > +What:		/sys/class/leds/<led>/pattern
> > > +Date:		July 2017
> > 
> > That was many months ago :)
> > 
> > > +KernelVersion:	4.14
> > 
> > And that kernel version is long since released :)
> 
> Yeah, the other problem is it has some interesting format with ":|"
> marking repeat,

So what would you prefer?

We can either add another file ("pattern_repeat"?) that allows you to
describe this separately or some other symbol.

> and is not really suitable for RGB LEDs...
> 

I can think of two ways to support patterns for a RGB LED;
1) Provide N files for the N channels
2) Make each entry in the suggested pattern file be N brightness values
   followed by the duration - if we wrap each N-tuple in some symbol
   (e.g. <>) this would transparently support "set all channels to same
   brightness value" and per-channel values.

The latter being fully compatible with the proposed interface.

> I'd really prefer to get driver in first, and add pattern interface
> later.
> 

Sure, I can move all the pattern-related code from the driver into a
separate patch.

Regards,
Bjorn
