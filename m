From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 18 Dec 2017 13:15:07 +0000
Message-ID: <20171218131507.7td6z6aqmpzs5qvr@oak.lan>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-2-enric.balletbo@collabora.com>
 <20171215144052.3b62gd3bkiqtuvk7@oak.lan>
 <CAFqH_51O5zqDUJiRp5nktM-ks=URkgCwMSy9fhbZG6D0qarJrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:44783 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753116AbdLRNPM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Dec 2017 08:15:12 -0500
Received: by mail-wm0-f66.google.com with SMTP id t8so29061132wmc.3
        for <linux-leds@vger.kernel.org>; Mon, 18 Dec 2017 05:15:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAFqH_51O5zqDUJiRp5nktM-ks=URkgCwMSy9fhbZG6D0qarJrg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Doug Anderson <dianders@google.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Dec 18, 2017 at 10:47:24AM +0100, Enric Balletbo Serra wrote:
> Hi Daniel,
> 
> 2017-12-15 15:40 GMT+01:00 Daniel Thompson <daniel.thompson@linaro.org>:
> > On Thu, Nov 16, 2017 at 03:11:50PM +0100, Enric Balletbo i Serra wrote:
> >>
> >> Setting use-linear-interpolation in the dts will allow you to have linear
> >> interpolation between values of brightness-levels.
> >>
> >> There are now 256 between each of the values of brightness-levels. If
> >> something is requested halfway between 2 values, we'll use linear
> >> interpolation.
> >
> > Why 256?
> 
> To be honest there isn't a strong reason, I thought that 256 was a
> good value because is the minimum number of steps possible (8 bits
> pwm). But yeah, guess the discussion is more if this value should be
> calculated, or specified in the the DT more than the value itself.
> 
> >>
> >> This way a high resolution pwm duty cycle can be used without having to
> >> list out every possible value in the dts. This system also allows for
> >> gamma corrected values (eg: "brightness-levels = <0 2 4 8 16 32>;").
> >>
> >> Patch based on the Alexandru M Stan work done for ChromeOS kernels.
> >>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >>  .../bindings/leds/backlight/pwm-backlight.txt      |  2 +
> >>  drivers/video/backlight/pwm_bl.c                   | 55 +++++++++++++++++-----
> >>  include/linux/pwm_backlight.h                      |  2 +
> >>  3 files changed, 47 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> >> index 764db86..7c48f20 100644
> >> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> >> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> >> @@ -17,6 +17,8 @@ Optional properties:
> >>                 "pwms" property (see PWM binding[0])
> >>    - enable-gpios: contains a single GPIO specifier for the GPIO which enables
> >>                    and disables the backlight (see GPIO binding[1])
> >> +  - use-linear-interpolation: set this propriety to enable linear interpolation
> >> +                              between each of the values of brightness-levels.
> >
> > Deciding whether or not this deployment of interpolation is a property
> > of the hardware is a finely balanced judgement. On the whole I conclude
> > that since the lookup table is a property of the hardware so too is the
> > deployment of interpolation.
> >
> > Following up on the "why 256?" comment. IMHO either the number of
> > interpolated steps should be calculated from the underlying PWM
> > resolution or it could simply be specified in the DT (e.g. replace
> > use-linear-interpolation with num-interpolated-steps).
> >
> 
> Personally I like the idea to have the possibility to specify the
> number of interpolated steps in the DT, I think that will be more
> flexible for the user. If it's ok let me send a first version using
> num-interpolated-steps, and continue the discussion about if makes
> sense to have that in the DT or not.

It's ok from my side.


Daniel.
