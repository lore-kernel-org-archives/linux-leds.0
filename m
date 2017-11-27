From: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 1/2] backlight: pwm_bl: linear interpolation between
 values of brightness-levels
Date: Mon, 27 Nov 2017 15:55:19 -0800
Message-ID: <CAD=FV=XHT_iEU918NVYHf26Xe=4UE0WO0oxBNy_VUfi2FdYGVA@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-2-enric.balletbo@collabora.com> <20171120185835.r4ded43i62wnu3jo@rob-hp-laptop>
 <CAFqH_50VqFJ-p=gRp9md4eHDHM5NpD6zPFfjwPY4LKTh2x6sHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFqH_50VqFJ-p=gRp9md4eHDHM5NpD6zPFfjwPY4LKTh2x6sHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

On Mon, Nov 27, 2017 at 3:21 AM, Enric Balletbo Serra
<eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> 2017-11-20 19:58 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Thu, Nov 16, 2017 at 03:11:50PM +0100, Enric Balletbo i Serra wrote:
>>> Setting use-linear-interpolation in the dts will allow you to have linear
>>> interpolation between values of brightness-levels.
>>>
>>> There are now 256 between each of the values of brightness-levels. If
>>> something is requested halfway between 2 values, we'll use linear
>>> interpolation.
>>>
>>> This way a high resolution pwm duty cycle can be used without having to
>>> list out every possible value in the dts.
>>
>> I thought we already had a way to do that.
>>
>>> This system also allows for
>>> gamma corrected values (eg: "brightness-levels = <0 2 4 8 16 32>;").
>>>
>>> Patch based on the Alexandru M Stan work done for ChromeOS kernels.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>  .../bindings/leds/backlight/pwm-backlight.txt      |  2 +
>>>  drivers/video/backlight/pwm_bl.c                   | 55 +++++++++++++++++-----
>>>  include/linux/pwm_backlight.h                      |  2 +
>>>  3 files changed, 47 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>>> index 764db86..7c48f20 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>>> @@ -17,6 +17,8 @@ Optional properties:
>>>                 "pwms" property (see PWM binding[0])
>>>    - enable-gpios: contains a single GPIO specifier for the GPIO which enables
>>>                    and disables the backlight (see GPIO binding[1])
>>> +  - use-linear-interpolation: set this propriety to enable linear interpolation
>>> +                              between each of the values of brightness-levels.
>>
>> Isn't this really just whether you allow values not listed because what
>> other kind of interpolation would you do?
>
> Yes, the idea behind this is just allow values not listed.
>
>> Seems like you should just be
>> able to query the resolution of the PWM and decide if it can take more
>> values than listed.
>>
>
> Without using a new DT propriety and let decide the driver when use
> intepolation and when not? Shouldn't this break current behavior then?
> You can have a high resolution PWM but I'm not sure if you want allow
> always more values than listed.

Right.  The assumption is that it's _possible_ that only the exact
values listed are valid duty cycles.  We don't want to break old
hardware by suddenly allowing other duty cycles to be used.  However,
it's expected that on most hardware you can simply use any duty cycle
between any of the specified ones and it should be fine.  Anyone
specifying this property would say that's OK for their hardware.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
