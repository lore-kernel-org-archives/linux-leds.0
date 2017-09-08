From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human
 eye
Date: Fri, 8 Sep 2017 12:18:42 +0100
Message-ID: <f6eb109d-96f3-4978-93b0-2b8506189e45@linaro.org>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org>
 <000001d32664$db62b2a0$922817e0$@gmail.com>
 <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Lee Jones <lee.jones@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandru M Stan <amstan@chromium.org>
List-Id: linux-leds@vger.kernel.org

On 07/09/17 19:04, Doug Anderson wrote:
 > I'd agree that I don't think we should land Enric's series as-is.
 > ...but I think something has been missing from the discussion so far:
 > the fact that the backlight driver doesn't necessarily increase light
 > output (in Watts) linearly in response to a linear increase in PWM
 > duty cycle.
 >
 > I think that we can all agree that the end result is to be able to
 > have a backlight that is easy to scale linearly with the human
 > perception of brightness (aka in Lumens).  Right?  So how do we get
 > there?

I'd suggest we avoid talking about watts (measure of power, not limited 
to visible light) and lumens (measure of visible light, preceptually 
weighted for colour but *not* for perceived brightness).


> So far in these discussions folks have been assuming that if we just
> apply cie1931 to the PWM Duty Cycle then we're done and we have
> perceived brightness in Lumens.  ...but I think that's not quite
> right.  There are more factors.  Let's use the datasheet for a random
> backlight driver, like RT8561A.  There appears to be a public
> datasheet at <http://www.richtek.com/assets/product_file/RT8561A/DS8561A-02.pdf>.
> 
> A) There may be a non-linear curve between PWM Duty Cycle and LED
> Current (mA).  The particular curve is different based on mode
> (Digital Ctrl vs. Analog Ctrl) and also PWM Frequency.  Sometimes this
> curve is nearly linear for large parts of the curve but not the whole
> curve.  Sometimes even though the curve is nearly linear there is an
> offset (AKA 10% duty cycle could still produce nearly zero light
> output).
> 
> B) There may be a non-linear curve between LED current and light
> output in Watts (I think?).
> 
> C) The human perception model means there is a non-linear curve
> between light output in Watts and human perceived brightness in
> Lumens.
>
> So A and B are hardware dependent and _do_ belong in the device tree (IMHO).

You forgot to model how to screen size and its maximum light output of 
the backlight impact pupil dilation ;-).

Or... putting it another way, A and B are only relevant if they help us 
eliminate significant sources of error.


> ...then the question is whether the device tree should specify the
> curve so that the Watts scales linearly (and then the kernel adjust
> for human perception) or so that Lumens scales linearly (which is
> already adjusted for human perception).
> 
> Historically I believe the device tree has always wanted it so that
> Lumens scales linearly.  So I guess the "we don't do anything" answer
> is that the device tree should help account for for A + B + C.

I would interpret the history slightly differently (although I'm not an 
authoritative historian here).

There is a problem with the backlight interfaces (but entirely unrelated 
to Enric'c patch). The units the backlight users are not defined and 
varies from driver to driver.

The userspace has never been able to tell but since most PC backlight 
controls are perceptually weighted (through "magic" in the BIOS) we 
didn't really discover the problems until lots of embedded folks had 
added backlight drivers and many of these used linear controls.

Anyhow we're stuck where we are... and we probably shouldn't bog down 
discussion of it (since Enric's patch only affects one of the many drivers.


> ...one proposal to fix this is to add some way to specify
> piecewise-linear in the device tree.  Using piecewise linear you can
> specify a nearly arbitrary curve with not too many points.  The idea
> here is that you're not limiting yourself to only selecting the points
> on the curve.
 > Hopefully Enric can try prototyping this up...

You mean have an additional property that allows the driver to linearly 
interpolate between steps in the brightness-levels table (so it can 
provide more steps than are described)?

Sounds OK to me although I'm still interested in whether an automatic 
table can be "right enough"...


> One last note is that it would be nice to find some way to make it
> easier for people to get this right.

... and this is why.

One great aspect of Enric's current work is that it has the potential to 
allow the driver to get it "right enough" with little effort by the DT 
author.

Having said that allowing the driver to interpolate and having a 
reference table in the driver (to allow brightness-levels to be 
optional) would do the same thing and spare me having to review all the 
fixed point maths for the CIE 1931 mappings as it evolves ;-)


> I will take responsibility and admit that I've been involved in
> device trees that just specified a > linear curve from 1 to 256.  That's
 > not quite right, but it's never
> been terribly easy to measure the correct curve (and never super
> critical).  On Chrome OS (where I've been working) historically I
> believe that the cie1931 transformation has historically happened in
> userspace, so effectively above I've asserted that "A + B" was linear
> enough and then we've done "C" programmatically.

Right now I've been assuming the best a userspace can do is:

  - Assume the backlight is perceptually weighted (since IIRC most x86
    PCs are)

  - Use quirks tables (and perhaps also take a sneaky peak to identify
    "lazy" brightness-level tables in the DT) and do some kind of
    linear-to-perceptual mapping (where CIE 1931 is as good a model as
    anything else)

Is ChromeOS doing anything like this is it just a bit of userspace 
configuration to decide whether or not to apply a perceptual model?


> I'm not saying what we've done in the past is terribly correct, but I
> am saying that we should definitely take into account making this very
> easy for people to get right.  Possibly this could be as simple as
> documenting a good / cheap light meter and how exactly to generate a
> table...

Again no objections... but TBH I just don't see many DT authors actually 
breaking out the light meter and doing it.


Daniel.
