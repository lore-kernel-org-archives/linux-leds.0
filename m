From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RFC 2/3] DT: leds: Add binding for the ISSI IS31FL32xx
 family of LED drivers
Date: Wed, 24 Feb 2016 13:49:46 -0600
Message-ID: <CAL_JsqJzcgSBW+fQ2dAV5M9O=pi_xc+KPymOhCyO4oifHo7y3Q@mail.gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
 <56CDD4A1.5030802@samsung.com> <20160224143440.374651b1.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45042 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932426AbcBXTuL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 24 Feb 2016 14:50:11 -0500
In-Reply-To: <20160224143440.374651b1.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Wed, Feb 24, 2016 at 1:34 PM, David Rivshin (Allworx)
<drivshin.allworx@gmail.com> wrote:
> On Wed, 24 Feb 2016 17:04:49 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi David,
>>
>> Thanks for the patch.
>>
>> On 02/23/2016 07:17 PM, David Rivshin (Allworx) wrote:
>> > From: David Rivshin <drivshin@allworx.com>
>> >
>> > This adds a binding description for the is31fl3236/35/18/16 I2C LED
>> > drivers.
>> >
>> > Signed-off-by: David Rivshin <drivshin@allworx.com>
>> > ---
>> >   .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 51 ++++++++++++++++++++++
>> >   1 file changed, 51 insertions(+)
>> >   create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>> > new file mode 100644
>> > index 0000000..0a05a1d
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>> > @@ -0,0 +1,51 @@
>> > +Binding for ISSI IS31FL32xx LED Drivers
>> > +
>> > +The IS31FL32xx family of LED drivers are I2C devices with multiple
>> > +constant-current channels, each with independent 256-level PWM control.
>> > +Each LED is represented as a sub-node of the device.
>> > +
>> > +Required properties:
>> > +- compatible: one of
>> > +   issi,is31fl3236
>> > +   issi,is31fl3235
>> > +   issi,is31fl3218
>> > +   issi,is31fl3216
>> > +- reg: I2C slave address
>> > +- address-cells : must be 1
>> > +- size-cells : must be 0
>> > +
>> > +LED sub-node properties:
>> > +- reg : LED channel number (1..N)
>> > +- max-brightness : (optional) Maximum brightness possible for the LED.
>>
>> Please use led-max-microamp instead. You can refer to
>> Documentation/devicetree/bindings/leds/common.txt for detailed
>> description.
>
> FYI, I think I got that property from leds-pwm, since these use PWMs
> internally, although I don't actually use it myself.
>
> I can see how led-max-microamp could be a useful property, however
> I'm uncertain about computing cdev->max_brightness from it as these
> devices look to control their max current via an external resistor.
> I suppose either the resistor value, or the resultant max-current
> would need to be given in the devicetree, and then that used along
> with led-max-microamp to compute cdev->max_brightness. Although I'd
> want it to be optional as I suspect most users don't need any
> restriction. Also, I don't think I can properly test the result,
> which always makes me nervous.
>
> Would it be acceptable to simply remove the max-brightness property
> without adding led-max-microamp? It can always be added if a user
> turns out to need it in the future. Or do you feel strongly that
> led-max-microamp should be in the binding from the start?

You should put in DT whatever makes sense for the controls the h/w
has. If you only have a PWM, then only max-brightness makes sense and
led-max-microamp does not.

Rob
