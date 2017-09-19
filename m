From: Enric Balletbo Serra <eballetbo@gmail.com>
Subject: Re: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to
 human eye
Date: Wed, 20 Sep 2017 00:27:13 +0200
Message-ID: <CAFqH_53bS9ONLPzL3W7gQ9P=qQrsu8-K1HFuSZnPHLWtR3LauQ@mail.gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com>
 <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org> <000001d32664$db62b2a0$922817e0$@gmail.com>
 <CAD=FV=WohimLMHQTp=iTaggvfoO+yqZTiJZkSdO2UyEr33TRpQ@mail.gmail.com>
 <f6eb109d-96f3-4978-93b0-2b8506189e45@linaro.org> <CAD=FV=W4qH2JzskqU4VsH_1RU687DNsngsBB_zRbUeZRWptkAQ@mail.gmail.com>
 <CAFqH_53hL_UCVQg2p8sdsGaoyWOou9a3Kd5H7MVMVLumH5_cAg@mail.gmail.com> <478868b7-ff09-1332-5459-e788d0adae99@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:56651 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751797AbdISW1P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2017 18:27:15 -0400
In-Reply-To: <478868b7-ff09-1332-5459-e788d0adae99@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Jingoo Han <jingoohan1@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Lee Jones <lee.jones@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandru M Stan <amstan@chromium.org>

Hi Daniel,

2017-09-18 18:00 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
> On 14/09/17 11:46, Enric Balletbo Serra wrote:
>>>>>
>>>>> So far in these discussions folks have been assuming that if we just
>>>>> apply cie1931 to the PWM Duty Cycle then we're done and we have
>>>>> perceived brightness in Lumens.  ...but I think that's not quite
>>>>> right.  There are more factors.  Let's use the datasheet for a random
>>>>> backlight driver, like RT8561A.  There appears to be a public
>>>>> datasheet at
>>>>> <http://www.richtek.com/assets/product_file/RT8561A/DS8561A-02.pdf>.
>>>>>
>>>>> A) There may be a non-linear curve between PWM Duty Cycle and LED
>>>>> Current (mA).  The particular curve is different based on mode
>>>>> (Digital Ctrl vs. Analog Ctrl) and also PWM Frequency.  Sometimes this
>>>>> curve is nearly linear for large parts of the curve but not the whole
>>>>> curve.  Sometimes even though the curve is nearly linear there is an
>>>>> offset (AKA 10% duty cycle could still produce nearly zero light
>>>>> output).
>>>>>
>>>>> B) There may be a non-linear curve between LED current and light
>>>>> output in Watts (I think?).
>>>>>
>>>>> C) The human perception model means there is a non-linear curve
>>>>> between light output in Watts and human perceived brightness in
>>>>> Lumens.
>>>>>
>>>>> So A and B are hardware dependent and _do_ belong in the device tree
>>>>> (IMHO).
>>>>
>>>>
>>>>
>>>> You forgot to model how to screen size and its maximum light output of
>>>> the
>>>> backlight impact pupil dilation ;-).
>>>
>>>
>>> Silly me...  Oops, I also forgot to account for the absolute humidity
>>> of the room.  Do you think we can require all backlights come with a
>>> humidity sensor?
>>>
>>>
>>>> Or... putting it another way, A and B are only relevant if they help us
>>>> eliminate significant sources of error.
>>>
>>>
>>> Right.  ...so your point is we can't model everything and we just need
>>> to choose what's important.
>>>
>>> I'll agree that "B" above might not be worth modelling (though I don't
>>> know).  ...but I think we need to do _something_ about A.
>>>
>>>  From the datasheet I point at looking at "Figure 8. LED Current vs.
>>> ACTL PWM Dimming Duty Cycle", it seems like we at least need to do
>>> something to account for the curve if we happen to be running at 30
>>> kHz for whatever reason.  Specifically if we do no other work then any
>>> duty cycle below 8% will result in no brightness.  Eyeballing the
>>> graph 10% duty cycle looks to be about 2% current.
>>>
>>> One option to solve this type of problem is to to specify a minimum
>>> offset and assume things are linear after that offset.  That might
>>> work, but it also might prevent you from accessing some of those nice
>>> low brightness points.  Historically I have been frustrated when in
>>> dark rooms that I couldn't set the brightness to be dim enough...
>>>
>>> The whole piecewise linear concept is that maybe you'd specify the
>>> curve (in terms of milliPercent) like this (values found by measuring
>>> datasheet curve with a ruler):
>>>
>>> <0 0>
>>> <10000 1800> # 10% duty cycle gives 1.8% current
>>> <12000 4300> # 12% duty cycle gives 4.3% current
>>> <17000 10000> # 17% duty cycle gives 10% current
>>> <93000 90000> # 93% duty cycle gives 90% current
>>> <100000 100000> # 100% duty cycle gives 100% current
>>>
>>>
>>>>> ...then the question is whether the device tree should specify the
>>>>> curve so that the Watts scales linearly (and then the kernel adjust
>>>>> for human perception) or so that Lumens scales linearly (which is
>>>>> already adjusted for human perception).
>>>>>
>>>>> Historically I believe the device tree has always wanted it so that
>>>>> Lumens scales linearly.  So I guess the "we don't do anything" answer
>>>>> is that the device tree should help account for for A + B + C.
>>>>
>>>>
>>>>
>>>> I would interpret the history slightly differently (although I'm not an
>>>> authoritative historian here).
>>>>
>>>> There is a problem with the backlight interfaces (but entirely unrelated
>>>> to
>>>> Enric'c patch). The units the backlight users are not defined and varies
>>>> from driver to driver.
>>>>
>>
>> Based on this seems reasonable maintain current implementation to not
>> break backward compability. Even, I think makes sense improve current
>> implementation by adding somekind of piecewise linear concept to the
>> brightness levels, similar to Doug's suggestion. So if we want, i.e,
>> 256 levels or more, instead of specify the full table in the DT we can
>> only specify some points in DT but the driver can expose to userspace
>> more steps (how many?) between two brightness levels. Of course, this
>> doesn't makes the live of the future users easier but I think will
>> make the live of the current users of this interface more flexible
>> (specially when you want lots of levels).
>
>
> Ideally I'd like the driver to derive the number of steps based on the PWM
> resolution it discovers (I don't entirely agree that having a large portion
> of the slider map to no change is a good thing... we should be able to
> estimate the smallest useful step size).
>
> Having said that, I'm open to suggestions about why we cannot make such an
> estimate.
>
>
>> Then, to make the user live easier, there is the thing about human
>> perception, we can move brightness-levels to be optional and fall to
>> apply the human perception code if it's not specified. Here the thing
>> and point of discussion is, if the cie1931 is the right algorithm to
>> do the 'magic' in the driver. From what I investigated seems that is
>> but I might be wrong.
>
>
> It's certainly more correct than linear ;-) .
>
> Actually I don't recall you commenting on the idea that we could ditch the
> fixed point code and simply have a default table built into the driver that
> can be used if there is no brightness-levels property (interpreted by the
> same piecewise linear code as everything else).
>

Sounds a good idea, was on my mind improve the fixed point code, but
this is better, indeed. I'm not sure if one table will be enough
though, maybe we need a table for every PWM resolution? I'll try to do
some tests on some different boards.

Enric

> I suspect such a table could be fairly small.
>
>
>> Seems reasonable apply both solutions? I can send a second RFC with
>> both approaches.
>
>
> Works for me.
>
>
> Daniel.
