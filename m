From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/6] dt: bindings: lp8860: Update the bindings to the
 standard
Date: Mon, 4 Dec 2017 16:35:00 -0600
Message-ID: <20171204223500.f6ukdorpcmerzwot@rob-hp-laptop>
References: <20171201165613.10358-1-dmurphy@ti.com>
 <20171201165613.10358-4-dmurphy@ti.com>
 <a07f883c-4c4c-780d-2dac-f023907a2629@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a07f883c-4c4c-780d-2dac-f023907a2629@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Dec 03, 2017 at 02:27:20PM +0100, Jacek Anaszewski wrote:
> Dan,
> 
> On 12/01/2017 05:56 PM, Dan Murphy wrote:
> > Update the lp8860 dt binding to the LED standard where
> > the LED should have a child node and also adding a
> > LED trigger entry.
> > 
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> > 
> > v6 - New patch to fix binding documentation
> > 
> >  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > index aad38dd94d4b..4cf396de6eba 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > @@ -12,17 +12,24 @@ Required properties:
> >  	- label - Used for naming LEDs
> >  
> >  Optional properties:
> > -	- enable-gpio - gpio pin to enable/disable the device.
> > -	- supply - "vled" - LED supply
> > +	- enable-gpios : gpio pin to enable/disable the device.
> > +	- vled-supply : LED supply
> > +	- label : see Documentation/devicetree/bindings/leds/common.txt
> > +	- linux,default-trigger : (optional)
> > +	   see Documentation/devicetree/bindings/leds/common.txt
> >  
> >  Example:
> >  
> > -leds: leds@6 {
> > +lp8860@2d {

leds@2d

> >  	compatible = "ti,lp8860";
> >  	reg = <0x2d>;
> > -	label = "display_cluster";
> >  	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> >  	vled-supply = <&vbatt>;
> > +
> > +	backlight: backlight@0 {

unit-address requires a 'reg' property. Building your dts files with W=1 
will tell you this.

> > +		label = "backlight_cluster";
> 
> You'll need to change this to:
> 
> label = "white:backlight_cluster"
> 
> Please always cc your patches with DT bindings to
> devicetree@vger.kernel.org and related maintainers.
> 
> > +		linux,default-trigger = "backlight";
> > +	};
> >  }
> >  
> >  For more product information please see the link below:
> > 
> 
> -- 
> Best regards,
> Jacek Anaszewski
