From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH RFC 2/3] DT: leds: Add binding for the ISSI IS31FL32xx
 family of LED drivers
Date: Wed, 24 Feb 2016 18:16:37 -0500
Message-ID: <20160224181637.75e3edab.drivshin.allworx@gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
	<1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
	<20160224011508.GA20343@rob-hp-laptop>
	<20160224135713.1eb1e234.drivshin.allworx@gmail.com>
	<CAL_JsqKf8b-bE+WUkAkQ5pMz6FptppJ4eWY0bUi-euGM38gxrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f66.google.com ([209.85.192.66]:36728 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbcBXXQs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2016 18:16:48 -0500
In-Reply-To: <CAL_JsqKf8b-bE+WUkAkQ5pMz6FptppJ4eWY0bUi-euGM38gxrg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On Wed, 24 Feb 2016 13:45:14 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Feb 24, 2016 at 12:57 PM, David Rivshin (Allworx)
> <drivshin.allworx@gmail.com> wrote:
> > On Tue, 23 Feb 2016 19:15:08 -0600
> > Rob Herring <robh@kernel.org> wrote:
> >  
> >> On Tue, Feb 23, 2016 at 01:17:24PM -0500, David Rivshin (Allworx) wrote:  
> >> > From: David Rivshin <drivshin@allworx.com>
> >> >
> >> > This adds a binding description for the is31fl3236/35/18/16 I2C LED
> >> > drivers.
> >> >
> >> > Signed-off-by: David Rivshin <drivshin@allworx.com>
> >> > ---
> >> >  .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 51 ++++++++++++++++++++++
> >> >  1 file changed, 51 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt  
> >>
> >> Acked-by: Rob Herring <robh@kernel.org>  
> >
> > Thanks, Rob. I just want to double check whether you noticed some
> > binding-related questions I had in the coverletter [1]. In hindsight
> > I should probably have included them in the patch comments as well so
> > they'd show up in patchwork. For convenience, I'll repeat them here:  
> 
> I had not.
> 
> > I choose to have 'reg' be 1-based in order to follow the hardware
> > documentation. It seems 0-based is the normal choice, although HW
> > docs also usually use the 0-based numbering. Perhaps being consistent
> > with other bindings is more important than being consistent with the
> > datasheet's numbering?  
> 
> Usually reg is some type of address, so you should follow whatever is
> more natural for accessing the h/w.

In this case I don't think there is a natural "address" in the HW. 
There are a number of (non-contiguous) registers (or parts thereof) 
which together control a "channel". They are not so much an "single-
LED controller" block which is replicated N times, but an monolithic 
"N-channel LED controller".

That is also why originally I had used a 'chan' property instead. But, 
I then saw that ePAPR required a 'reg' property to use the @n labeling, 
and it seemed all bindings for similar devices used a 'reg' property.

> Ideally, it is not just an index for s/w convenience.

Thanks, that is useful clarification. 

> > I used the 'reg' property for the LED channel, as it seemed ePAPR
> > required that name. I also considered naming the property 'chan',
> > and not pretending that it represented a bus address at all (and
> > then removing the @n from the subnode names). That would solve the
> > 'reg' question above as a side-effect, but would be inconstant with
> > other LED bindings (tca6507, pca963x, tlc59108, etc).  
> 
> I would expect the reg value is either the register (base) address for
> each channel or a bit offset in a register if they are all in the same
> register. Or it could be how the pins are labeled on the package if
> neither of those work.

I don't think that 'reg' being a register base address or bit offset
would work in this case, for the reasons mentioned above.
The only really obvious numbering is that the datasheets name them 
OUT1 through OUTn, and I'd expect schematics to follow that naming. 
So that seemed like the natural way to refer to them in the devicetree, 
and let the driver compute the various register addresses.

Just for the sake of illustration here are some of the important 
registers for these devices:
 3236:
   - 0x01-0x24: per channel PWM duty cycle registers (low-to-high)
   - 0x26-0x49: per channel enable bit and current divisor
 3235:
   - 0x01-0x20: per channel PWM duty cycle registers (low-to-high)
   - 0x2A-0x45: per channel enable bit and current divisor
 3218:
   - 0x01-0x12: per channel PWM duty cycle registers (low-to-high)
   - 0x13h: OUT1-6 packed enable bits, LSB to MSB
   - 0x14h: OUT7-12 packed enable bits, LSB to MSB
   - 0x15h: OUT13-18 packed enable bits, LSB to MSB
 3216:
   - 0x01: OUT9-16 packed enable bits, LSB to MSB
   - 0x02: OUT1-8 packed enable bits, LSB to MSB
   - 0x04: OUT9-16 GPIO (vs LED) bits
   - 0x10-0x1F: per channel PWM duty cycle registers (high-to-low)
   - 0x20-0xAF: 8 sets of enable and PWM registers for animation

> > Note that the recently-added (and only in for-next) SN3218 driver
> > uses a 0-based 'reg' property, and the SN3218 has the same HW doc
> > numbering as the IS31FL32xx family (indeed the IS31FL3218 appears
> > to be a rebranded SN3218). So perhaps that sets the precedent if
> > there was not one before?  
> 
> If they are the same, then you should use the SN3218 binding. If it
> has problems, then it is not too late to fix it. 

Given the above, do you think that the SN3218 binding should be changed
so that 'reg' is 1-based instead of 0-based?

> You may want to add
> another compatible string if they are not truly the exact same die.

Are you implying that if the IS31FL3218 and SN3218 are the same die
(which they may well be), that it would *not* be appropriate to have 
two "compatible" strings for them (in the same binding)? 
I was assuming that having two compatible strings would be preferable 
regardless, as they are sold under two different part numbers and 
companies. The only reason I noticed they were the same was because I 
was looking for an example of another device that numbered channels 
starting with '1' and was surprised how similar the datasheet was.
