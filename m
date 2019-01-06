From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Generic RGB LED support was Re: [PATCH 2/2] leds: lp5024: Add the
 LP5024/18 RGB LED driver
Date: Sun, 6 Jan 2019 16:52:26 +0100
Message-ID: <dac50714-9caf-2496-3208-fb62f886e31f@gmail.com>
References: <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
 <7f205102-e854-f1cb-cc03-1307d1cddc87@gmail.com>
 <c9f8965a-90f4-b456-8225-c70694c9f071@gmail.com>
 <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com> <20190104201256.GA2931@amd>
 <a4e3a782-de76-ba91-3727-4db69cf27c3a@gmail.com> <20190104220726.GA12395@amd>
 <4cf79414-578e-eea7-4f46-fc8789206988@gmail.com> <20190105123146.GA16354@amd>
 <8044cdd9-b9b3-fddd-6106-184b906859e2@gmail.com> <20190105221254.GA22322@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190105221254.GA22322@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 1/5/19 11:12 PM, Pavel Machek wrote:
> Hi!
> 
>>> Grab yourself an RGB LED and play with it; you'll see what the
>>> problems are. It is hard to explain colors over email...
>>
>> Video [0] gives some overview of lp5024 capabilities.
>>
>> I don't see any problems in exposing separate red,green,blue
>> files and brightness for the devices with hardware support for
>> that.
> 
> Well, that's what we do today, as three separate LEDs, right?

No. It doesn't allow for setting color intensity by having
the color fixed beforehand. Below is relevant excerpt from
the lp5024 documentation. This is not something that can be
mapped to RGB color space, but rather to HSV/HSL, with the
reservation that the hardware implementation uses PWM
for setting color intensity.

<quote>
8.3.1.2 Independent Intensity Control Per RGB LED Module

When color is fixed, the independent intensity-control is used to
achieve accurate and flexible dimming control for every RGB LED module.

8.3.1.2.1 Intensity-Control Register Configuration

Every three consecutive output channels are assigned to their respective
intensity-control register (LEDx_BRIGHTNESS). For example, OUT0, OUT1,
and OUT2 are assigned to LED0_BRIGHTNESS, so it is recommended to
connect the RGB LEDs in the sequence as shown in Table 1. The LP50xx
device allows 256-step intensity control for each RGB LED module, which
helps achieve a smooth dimming effect.
</quote>

> I don't have problem with that, either; other drivers already do
> that. He's free to use existing same interface.
> 
> But that is insufficient, as it does not allow simple stuff, such as
> turning led "white".
> 
> So... perhaps we should agree on requirements, first, and then we can
> discuss solutions?
> 
> Requirements for RGB LED interface:
> 
> 1) Userspace should be able to set the white color
> 
> 2) Userspace should be able to arbitrary color from well known list
> and it should approximately match what would CRT, LCD or OLED monitor display

The difference is that monitor display driver is pre-calibrated
for given display by the manufacturer. With the LED controllers the
manufacturer has no control over what LEDs will be connected to the
iouts. Therefore it should be not surprising that colors produced
by custom LEDs are not as user would expect when comparing to
the RGB color displayed on the monitor display.

TI provides "Various LED Ring Lighting Patterns Reference Design" [0]
that show how to produce various patterns with use of the reference
board with LED ring built using sixteen 19-337/R6GHBHC-A01/2T LEDs [1].

Document [0] mentions also specific "Design considerations" in the
chapter 2.2:

<quote>
Several considerations are taken into account for this particular design:
• LED map (ring) for meeting the requirement of popular human-machine 
interaction style.
• LED size, numbers and the diffuse design for meeting lighting pattern 
uniformity.
• Analog dimming in the difference ambient light lux without losing 
dimming resolution in lighting pattern.

These considerations apply to most human-machine interaction end 
equipment with day and night vision
designs in some way, but the designer must decide the particular 
considerations to take into account for a
specific design.
</quote>

This renders your requirement 2) infeasible with use of custom LEDs
any fixed algorithm, since the final effect will always heavily depend
on the LED circuit design.

> 
>      2a) LEDs probably slightly change color as they age. That's out of
>      scope, unless the variation is much greater than on monitors.
> 
>      2b) Manufacturing differences cause small color variation. Again,
>      that's out of scope, unless the variation is much greater than on
>      monitors.
> 
> Nice to have features:
> 
> 3) Full range of available colors/intensities should be available to
> userspace
> 
> 4) Interface should work well with existing triggers
> 
> 5) It would be nice if userland knew how many lumens are produced at
> each wavelength for each setting (again, minus aging and manufacturing
> variations).
> 
> 6) Complexity of math in kernel should be low, and preferably it
> should be integer or fixed point
> 
> Problems:
> 
> a) RGB LEDs are usually not balanced. Setting 100% PWM on
> red/green/blue channels will result in nothing close to white
> light. In fact, to get white light on N900, blue and green channel's
> PWM needs to be set pretty low, as in 5%.
> 
> b) LED class does not define any relation between "brightness" in
> sysfs and ammount of light in lumens. Some drivers use close to linear
> relation, some use exponential relation. Human eyes percieve logarithm
> of lumens. RGB color model uses even more complex function.
> 
> c) Except for white LEDs, LEDs are basically sources of single
> wavelength of light, while CRTs and LCDs produce broader
> spectrums.
> 
> d) RG, RGBW and probably other LED combinations exist.
> 
> e) Not all "red" LEDs will produce same wavelength. Similar
> differences will exist for other colors.
> 
> f) We have existing RGB LEDs represented as three separate
> monochromatic LEDs in sysfs.

One general question: do you have any solutions in store?

[0] http://www.ti.com/lit/ug/tiduee6/tiduee6.pdf
[1] http://www.everlight.com/file/ProductFile/19-337-R6GHBHC-A01-2T.pdf

-- 
Best regards,
Jacek Anaszewski
