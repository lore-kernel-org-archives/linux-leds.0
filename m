From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Thu, 30 Nov 2017 08:57:00 -0800
Message-ID: <CAD=FV=V+PBUENVgANVrnm44Mp27HbsNNmu6qaqU3txS5VGZGww@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com> <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6450f50-5c12-dc52-4340-b068c0b38c54-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Thu, Nov 30, 2017 at 3:27 AM, Daniel Thompson
<daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>
> On 30/11/17 00:44, Doug Anderson wrote:
>>
>> Hi,
>>
>> On Thu, Nov 16, 2017 at 6:11 AM, Enric Balletbo i Serra
>> <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>>>
>>> When you want to change the brightness using a PWM signal, one thing you
>>> need to consider is how human perceive the brightness. Human perceive the
>>> brightness change non-linearly, we have better sensitivity at low
>>> luminance than high luminance, so to achieve perceived linear dimming,
>>> the
>>> brightness must be matches to the way our eyes behave. The CIE 1931
>>> lightness formula is what actually describes how we perceive light.
>>>
>>> This patch adds support to compute the brightness levels based on a
>>> static
>>> table filled with the numbers provided by the CIE 1931 algorithm, for now
>>> it only supports PWM resolutions up to 65535 (16 bits) with 1024 steps.
>>> Lower PWM resolutions are implemented using the same curve but with less
>>> steps, e.g. For a PWM resolution of 256 (8 bits) we have 37 steps.
>>
>>
>> Your patch assumes that the input to your formula (luminance, I think)
>> scales linearly with PWM duty cycle.  I don't personally know this,
>> but has anyone confirmed it's common in reality, or at least is a
>> close enough approximation of reality?
>
>
> Isn't this the loop we went round for v1?
>
> We do know that its not linear, however the graphs from a couple of example
> devices didn't look too scary and nobody has proposed a better formula.
>
> At this point the linear interpolation code in patch 1 allows people with
> especially alinear devices to express suitable brightness curves.
>
> However we also know that many DT authors choose not to create good
> brightness tables for their devices... and we'd rather they used allowed the
> kernel to choose a model than to use no model at all.

OK, cool.  I didn't remember anyone actually confirming that they had
checked that this was the case, but that's probably just my bad memory
and failures at searching through history.  I don't have any
objections to the idea if people are convinced it's a good enough
approximation.  :)

It would be kinda nice if something could go in the commit message, like:

This method will work in any cases where linearly scaling the PWM duty
cycle causes a roughly linear scaling of the luminance of the
backlight.

:)

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
