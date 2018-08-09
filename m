From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Thu, 9 Aug 2018 15:24:18 +0200
Message-ID: <20180809132418.GB4469@localhost>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <20180808195903.GB20912@amd>
 <f6b3534b-2ee9-782e-35e5-e103c34528bc@ti.com>
 <20180808210215.GA15831@amd>
 <f18a5616-bb25-da0d-aec8-585e042b4919@ti.com>
 <53691469-4554-42a8-c182-762c1a3939b7@gmail.com>
 <01bbf05a-8e5e-d3ce-857a-ac5c6efb779c@ti.com>
 <683f9e60-9ad8-93d8-e4ed-dbfdae78c307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <683f9e60-9ad8-93d8-e4ed-dbfdae78c307@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> >>> 2 sinks 3 LED strings.  How do you know which LED string is which and what bank it belongs
> >>> to when setting the brightness.  Each Bank has a separate register for brightness control.
> >>
> >> Just a blind shot, without going into details - could you please check
> >> if led-sources property documented in the common LED bindings couldn't
> >> help here?
> >>
> > 
> > I could change the name to led-sources.  But this part does not really follow the 1 output to a
> > 1 LED string topology.
> 
> led-sources was designed for describing the topology where one LED can
> be connected to more then one output, see bindings of
> max77693-led (in Documentation/devicetree/bindings/mfd/max77693.txt).
> 
> Here the topology is a bit different - more than one LED (string) can be
> connected to a single bank, but this is accomplished inside the chip.
> Logically LEDs configured that way can be treated as a single LED
> (string) connected to two outputs, and what follows they should be
> described by a single DT child node.
> 
> led-sources will fit very well for this purpose. You could do
> the following mapping:
> 
> 0 - HVLED1
> 1 - HVLED2
> 2 - HVLED3
> 
> Then, in the child DT nodes you would use these identifiers to describe
> the topology:
> 
> Following node would describe strings connected to the outputs
> HVLED1 and HVLED2 controlled by bank A.
> 
> led@0 {
> 	reg = <0>;
> 	led-sources = <0>. <1>;
> 	label = "white:first_backlight_cluster";
> 	linux,default-trigger = "backlight";
> };
> 
> 
> IOW I agree with Pavel, but I propose to use already documented common
> DT LED property.

This is better than my proposal. Thanks!
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
