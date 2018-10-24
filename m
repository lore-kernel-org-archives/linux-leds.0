From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3633
Date: Wed, 24 Oct 2018 09:35:06 -0500
Message-ID: <20181024143506.GA9327@bogus>
References: <20181023170623.31820-1-dmurphy@ti.com>
 <20181023170623.31820-5-dmurphy@ti.com>
 <20181024092328.GD24997@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024092328.GD24997@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, lee.jones@linaro.org, tony@atomide.com
List-Id: linux-leds@vger.kernel.org

On Wed, Oct 24, 2018 at 11:23:28AM +0200, Pavel Machek wrote:
> On Tue 2018-10-23 12:06:21, Dan Murphy wrote:
> > The LM3633 is a single function LED driver. The single function LED
> > driver needs to reside in the LED directory as a dedicated LED driver
> > and not as a MFD device.  The device does have common brightness and ramp
> > features and those can be accomodated by a TI LMU framework.
> > 
> > The LM3633 dt binding needs to be moved from the ti-lmu.txt and a dedicated
> > LED dt binding needs to be added.  The new LM3633 LED dt binding will then
> > reside in the Documentation/devicetree/bindings/leds directory and follow the
> > current LED and general bindings guidelines.
> 
> What?
> 
> >  .../devicetree/bindings/leds/leds-lm3633.txt  | 102 ++++++++++++++++++
> >  .../devicetree/bindings/mfd/ti-lmu.txt        |  48 ---------
> >  2 files changed, 102 insertions(+), 48 deletions(-)
> >  create mode 100644
> >  Documentation/devicetree/bindings/leds/leds-lm3633.txt
> 
> > index 920f910be4e9..573e88578d3d 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> > +++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
> > @@ -7,7 +7,6 @@ TI LMU driver supports lighting devices below.
> >    LM3532       Backlight
> >    LM3631       Backlight and regulator
> >    LM3632       Backlight and regulator
> > -  LM3633       Backlight, LED and fault monitor
> >    LM3695       Backlight
> 
> Are you seriously proposing to take one binding and split it into 6
> copy&pasted ones?
> 
> That's not the way we do development. NAK.
> 
> We don't want to have copy & pasted code. We also don't want to have
> copy & pasted bindings. Nor changelogs, for that matter.

I looked at the LM3633 and LM3632 datasheets. They look quite different 
to me and should be separate IMO. Just looking at different LED 
functions and GPIO control lines is enough to make that determination. 
The LM3697 looks like a subset of LM3633 at least at a schematic 
diagram level, so maybe those can be shared.

While we could litter the binding with conditions on properties 
depending on specific compatible strings (such as which GPIO properties 
apply to which compatible), that is going to be problematic down the 
line when we convert to json-schema[1].

Rob

[1] https://lkml.org/lkml/2018/10/5/883
