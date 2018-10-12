From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Fri, 12 Oct 2018 11:26:19 -0500
Message-ID: <20181012162619.GA28573@bogus>
References: <20181011165123.32198-1-dmurphy@ti.com>
 <20181011165123.32198-3-dmurphy@ti.com>
 <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Oct 11, 2018 at 09:38:53PM +0200, Jacek Anaszewski wrote:
> On 10/11/2018 08:34 PM, Dan Murphy wrote:
> > Pavel
> > 
> > On 10/11/2018 01:27 PM, Pavel Machek wrote:
> >> On Thu 2018-10-11 11:51:16, Dan Murphy wrote:
> >>> Remove support for the LM3697 LED device
> >>> from the ti-lmu.  The LM3697 will be supported
> >>> via a stand alone LED driver.
> >>>
> >>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>
> >> NAK.
> > 
> > Thanks for the NAK.
> > 
> > This NAK was NAK'd by other maintainer in the V2 RFC patchset
> > 
> > https://lore.kernel.org/patchwork/patch/993171/
> 
> I confirm. LM3697 is a standalone device and not a cell of any
> MFD device.
> 
> Waiting for DT maintainer's ack.

You all sort out what you want... I can't follow it all, and I'm not 
going to spend the time trying to figure out what is going on here.

As this is worded, changing the driver is a Linux problem and irrelevant 
to the binding. Now if you want to move documentation to a location that 
makes more sense, then fine. But structure patches that way and make it 
clear that from an binding ABI perspective, nothing is changing.

Rob
