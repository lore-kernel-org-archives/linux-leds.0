From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Thu, 14 Sep 2017 12:46:26 +0200
Message-ID: <CAFqH_53hL_UCVQg2p8sdsGaoyWOou9a3Kd5H7MVMVLumH5_cAg@mail.gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org> <000001d32664$db62b2a0$922817e0$@gmail.com>
 <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
 <f6eb109d-96f3-4978-93b0-2b8506189e45@linaro.org> <CAD=FV=W4qH2JzskqU4VsH_1RU687DNsngsBB_zRbUeZRWptkAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=W4qH2JzskqU4VsH_1RU687DNsngsBB_zRbUeZRWptkAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

2017-09-08 19:39 GMT+02:00 Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>:
> Hi,
>
> On Fri, Sep 8, 2017 at 4:18 AM, Daniel Thompson
> <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 07/09/17 19:04, Doug Anderson wrote:
>>> I'd agree that I don't think we should land Enric's series as-is.
>>> ...but I think something has been missing from the discussion so far:
>>> the fact that the backlight driver doesn't necessarily increase light
>>> output (in Watts) linearly in response to a linear increase in PWM
>>> duty cycle.
>>>
>>> I think that we can all agree that the end result is to be able to
>>> have a backlight that is easy to scale linearly with the human
>>> perception of brightness (aka in Lumens).  Right?  So how do we get
>>> there?
>>
>> I'd suggest we avoid talking about watts (measure of power, not limited to
>> visible light) and lumens (measure of visible light, preceptually weighted
>> for colour but *not* for perceived brightness).
>
> Ah, OK.  I thought lumens accounted for perceived brightness?  I was
> having a hard time following all the stuff I could find online about
> this.  Mostly I thought I saw people talking about Luminous Flux
> (measured in Lumens), but maybe I was mistaken.
>
>
>>> So far in these discussions folks have been assuming that if we just
>>> apply cie1931 to the PWM Duty Cycle then we're done and we have
>>> perceived brightness in Lumens.  ...but I think that's not quite
>>> right.  There are more factors.  Let's use the datasheet for a random
>>> backlight driver, like RT8561A.  There appears to be a public
>>> datasheet at
>>> <http://www.richtek.com/assets/product_file/RT8561A/DS8561A-02.pdf>.
>>>
>>> A) There may be a non-linear curve between PWM Duty Cycle and LED
>>> Current (mA).  The particular curve is different based on mode
>>> (Digital Ctrl vs. Analog Ctrl) and also PWM Frequency.  Sometimes this
>>> curve is nearly linear for large parts of the curve but not the whole
>>> curve.  Sometimes even though the curve is nearly linear there is an
>>> offset (AKA 10% duty cycle could still produce nearly zero light
>>> output).
>>>
>>> B) There may be a non-linear curve between LED current and light
>>> output in Watts (I think?).
>>>
>>> C) The human perception model means there is a non-linear curve
>>> between light output in Watts and human perceived brightness in
>>> Lumens.
>>>
>>> So A and B are hardware dependent and _do_ belong in the device tree
>>> (IMHO).
>>
>>
>> You forgot to model how to screen size and its maximum light output of the
>> backlight impact pupil dilation ;-).
>
> Silly me...  Oops, I also forgot to account for the absolute humidity
> of the room.  Do you think we can require all backlights come with a
> humidity sensor?
>
>
>> Or... putting it another way, A and B are only relevant if they help us
>> eliminate significant sources of error.
>
> Right.  ...so your point is we can't model everything and we just need
> to choose what's important.
>
> I'll agree that "B" above might not be worth modelling (though I don't
> know).  ...but I think we need to do _something_ about A.
>
> From the datasheet I point at looking at "Figure 8. LED Current vs.
> ACTL PWM Dimming Duty Cycle", it seems like we at least need to do
> something to account for the curve if we happen to be running at 30
> kHz for whatever reason.  Specifically if we do no other work then any
> duty cycle below 8% will result in no brightness.  Eyeballing the
> graph 10% duty cycle looks to be about 2% current.
>
> One option to solve this type of problem is to to specify a minimum
> offset and assume things are linear after that offset.  That might
> work, but it also might prevent you from accessing some of those nice
> low brightness points.  Historically I have been frustrated when in
> dark rooms that I couldn't set the brightness to be dim enough...
>
> The whole piecewise linear concept is that maybe you'd specify the
> curve (in terms of milliPercent) like this (values found by measuring
> datasheet curve with a ruler):
>
> <0 0>
> <10000 1800> # 10% duty cycle gives 1.8% current
> <12000 4300> # 12% duty cycle gives 4.3% current
> <17000 10000> # 17% duty cycle gives 10% current
> <93000 90000> # 93% duty cycle gives 90% current
> <100000 100000> # 100% duty cycle gives 100% current
>
>
>>> ...then the question is whether the device tree should specify the
>>> curve so that the Watts scales linearly (and then the kernel adjust
>>> for human perception) or so that Lumens scales linearly (which is
>>> already adjusted for human perception).
>>>
>>> Historically I believe the device tree has always wanted it so that
>>> Lumens scales linearly.  So I guess the "we don't do anything" answer
>>> is that the device tree should help account for for A + B + C.
>>
>>
>> I would interpret the history slightly differently (although I'm not an
>> authoritative historian here).
>>
>> There is a problem with the backlight interfaces (but entirely unrelated to
>> Enric'c patch). The units the backlight users are not defined and varies
>> from driver to driver.
>>

Based on this seems reasonable maintain current implementation to not
break backward compability. Even, I think makes sense improve current
implementation by adding somekind of piecewise linear concept to the
brightness levels, similar to Doug's suggestion. So if we want, i.e,
256 levels or more, instead of specify the full table in the DT we can
only specify some points in DT but the driver can expose to userspace
more steps (how many?) between two brightness levels. Of course, this
doesn't makes the live of the future users easier but I think will
make the live of the current users of this interface more flexible
(specially when you want lots of levels)

Then, to make the user live easier, there is the thing about human
perception, we can move brightness-levels to be optional and fall to
apply the human perception code if it's not specified. Here the thing
and point of discussion is, if the cie1931 is the right algorithm to
do the 'magic' in the driver. From what I investigated seems that is
but I might be wrong.

Seems reasonable apply both solutions? I can send a second RFC with
both approaches.

>> The userspace has never been able to tell but since most PC backlight
>> controls are perceptually weighted (through "magic" in the BIOS) we didn't
>> really discover the problems until lots of embedded folks had added
>> backlight drivers and many of these used linear controls.
>>
>> Anyhow we're stuck where we are... and we probably shouldn't bog down
>> discussion of it (since Enric's patch only affects one of the many drivers.
>
> See below discussion of how Chrome OS userspace deals with this today,
> but it feels like we need to come up with a less hacky solution...
>
>
>>> ...one proposal to fix this is to add some way to specify
>>> piecewise-linear in the device tree.  Using piecewise linear you can
>>> specify a nearly arbitrary curve with not too many points.  The idea
>>> here is that you're not limiting yourself to only selecting the points
>>> on the curve.
>>
>>> Hopefully Enric can try prototyping this up...
>>
>> You mean have an additional property that allows the driver to linearly
>> interpolate between steps in the brightness-levels table (so it can provide
>> more steps than are described)?
>>
>> Sounds OK to me although I'm still interested in whether an automatic table
>> can be "right enough"...
>
> My secret plan was that Enric could implement piecewise linear
> support, which really should be a very simple bit of code.  This would
> allow people to model the non-linearlity of their hardware if they
> wanted but would add very little overhead if they didn't want to.  AKA
> the lazy way to specify your "curve":
>
>   <0 0>
>   <100000 100000> # 100% duty cycle gives 100% current
>
> ...and of course you could just assume this "curve" if nothing was specified...
>
> ...then there's the question of whether or not Enric's human
> perception work should be applied atop this or if the super-cool-elite
> status of pieceiwse linear subsumes the need.  Said another way: once
> you have piecewise linear it would be pretty easy to manually apply
> the human perception model to your curve before putting it in the
> device tree...
>
> I guess the cop out answer is to add an attribute like
> "apply-human-perception-factor".  The presence of this attribute will
> cause Enric's code to run.  The lack of this attribute will cause it
> not to run.  Thus if you assume that hardware response is nearly
> linear (without counting human perception) and you want human
> perceived output, you'd do:
>
>   <0 0>
>   <100000 100000> # 100% duty cycle gives 100% current
>   apply-human-perception-factor
>
>
> If you want to go whole-hog and get out the light meter, it's probably
> pretty easy to just specify the full curve _after_ applying the human
> factor...
>
>
>> One great aspect of Enric's current work is that it has the potential to
>> allow the driver to get it "right enough" with little effort by the DT
>> author.
>>
>> Having said that allowing the driver to interpolate and having a reference
>> table in the driver (to allow brightness-levels to be optional) would do the
>> same thing and spare me having to review all the fixed point maths for the
>> CIE 1931 mappings as it evolves ;-)
>
> Right.  Essentially you'd be making the lazy solution currently
> implied in many Chrome OS boards (assume mostly linear hardware
> response) easier to do.
>
>
>> Right now I've been assuming the best a userspace can do is:
>>
>>  - Assume the backlight is perceptually weighted (since IIRC most x86
>>    PCs are)
>>
>>  - Use quirks tables (and perhaps also take a sneaky peak to identify
>>    "lazy" brightness-level tables in the DT) and do some kind of
>>    linear-to-perceptual mapping (where CIE 1931 is as good a model as
>>    anything else)
>>
>> Is ChromeOS doing anything like this is it just a bit of userspace
>> configuration to decide whether or not to apply a perceptual model?
>
> Right now Chrome OS has what's a bit of a hack.  You can see the code at:
>
> https://chromium.googlesource.com/chromiumos/platform2/+/master/power_manager/powerd/policy/internal_backlight_controller.cc
>
> Basically if the backlight has more than 100
> (kMinLevelsForNonLinearMapping) levels then it does some conversions
> to adjust things to be exponential.  I guess the idea is that the
> magic BIOS devices usually have < 100 levels and PWM backlights have
> more?
>
>
> The hope was that we could adjust the kernel to be consistent and then
> fix userspace to just drive everything the same way...
>
>
> -Doug

Best regards,
 Enric.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
