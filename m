From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Thu, 30 Nov 2017 19:34:06 +0100
Message-ID: <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com> <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6450f50-5c12-dc52-4340-b068c0b38c54-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

2017-11-30 12:27 GMT+01:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>
>
> On 30/11/17 00:44, Doug Anderson wrote:
>>
>> Hi,
>>
>> On Thu, Nov 16, 2017 at 6:11 AM, Enric Balletbo i Serra
>> <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>>>
>>> When you want to change the brightness using a PWM signal, one thing yo=
u
>>> need to consider is how human perceive the brightness. Human perceive t=
he
>>> brightness change non-linearly, we have better sensitivity at low
>>> luminance than high luminance, so to achieve perceived linear dimming,
>>> the
>>> brightness must be matches to the way our eyes behave. The CIE 1931
>>> lightness formula is what actually describes how we perceive light.
>>>
>>> This patch adds support to compute the brightness levels based on a
>>> static
>>> table filled with the numbers provided by the CIE 1931 algorithm, for n=
ow
>>> it only supports PWM resolutions up to 65535 (16 bits) with 1024 steps.
>>> Lower PWM resolutions are implemented using the same curve but with les=
s
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
> We do know that its not linear, however the graphs from a couple of examp=
le
> devices didn't look too scary and nobody has proposed a better formula.
>
> At this point the linear interpolation code in patch 1 allows people with
> especially alinear devices to express suitable brightness curves.
>
> However we also know that many DT authors choose not to create good
> brightness tables for their devices... and we'd rather they used allowed =
the
> kernel to choose a model than to use no model at all.
>
>
> Daniel.
>
>
>
> Enric: BTW sorry I haven't replied so far. That's mostly because
>        these looked more "real" and that I should pay them close
>        attention (which requires time I haven't had spare to
>        consume yet).
>

No problem. It also took me some time to send v2 because of was busy
with other things :)

>
>
>>> The calculation of the duty cycle using the CIE 1931 algorithm is enabl=
ed
>>> by
>>> default when you do not define the 'brightness-levels' propriety in you=
r
>>> device tree.
>>
>>
>> One note is that you probably still want at least a "min" duty cycle.
>> I seem to remember some PWM backlights don't work well when the duty
>> cycle is too low and it would still be nice to be able to use your
>> table.
>>

Right, iirc that is needed on some veyron devices, and this is another
reason why the first patch needs to support to be able to describe
corrected gamma curves and not only linear-interpolation between 2
points. I'd say that:

1. For low and high resolution PWMs,  if you know nothing about PWM
backlight, patch 2 can provide to the user a default table that should
work.
2. If you need something more specific you should use the old way
(aka, use brightness levels table)
    2.1 If you have a high resolution PWM you might be interested on
enable interpolation.

>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>   drivers/video/backlight/pwm_bl.c | 160
>>> +++++++++++++++++++++++++++++++++++----
>>>   include/linux/pwm_backlight.h    |   1 +
>>>   2 files changed, 147 insertions(+), 14 deletions(-)
>>
>>
>> Something I'd like to see in a patch somewhere in this series is a way
>> to expose the backlight "units" to userspace.  As far as I know right
>> now the backlight exposed to userspace is "unitless", but it would be
>> nice for userspace to query that the backlight is now linear to human
>> perception.  For old code, it could always expose the unit as
>> "unknown".
>>
>>
>>> diff --git a/drivers/video/backlight/pwm_bl.c
>>> b/drivers/video/backlight/pwm_bl.c
>>> index 59b1bfb..ea96358 100644
>>> --- a/drivers/video/backlight/pwm_bl.c
>>> +++ b/drivers/video/backlight/pwm_bl.c
>>> @@ -26,6 +26,112 @@
>>>
>>>   #define NSTEPS 256
>>>
>>> +/*
>>> + * CIE lightness to PWM conversion table. The CIE 1931 lightness formu=
la
>>> is what
>>> + * actually describes how we perceive light:
>>> + *
>>> + *          Y =3D (L* / 902.3)           if L* =E2=89=A4 0.08856
>>> + *          Y =3D ((L* + 16) / 116)^3    if L* > 0.08856
>>> + *
>>> + * Where Y is the luminance (output) between 0.0 and 1.0, and L* is th=
e
>>> + * lightness (input) between 0 and 100.
>>
>>
>> Just because I'm stupid and not 100% sure, I think:
>>

Just because I'm also stupid and I'm still learning :) I'll try to
clarify a bit more that ...


>> luminance =3D the amount of light coming out of the screen
>> lightness =3D how bright a human perceives the screen to be
>>
>> Is that right?  If so could you add it to the comments?  So "output"
>> here is the output to the PWM and "input" is the input from userspace
>> (and thus should be expressed in terms of human perception).
>>

Yes, I think that how you describe luminance and lightness is right,
and sounds good improve the doc.

To be clear the correction table for PWM values can be calculated with
this code.

OUTPUT_SIZE =3D 65535      # Output integer size
INPUT_SIZE =3D 2047

def cie1931(L):
    L =3D L*100.0
    if L <=3D 8:
        return (L/902.3)
    else:
        return ((L+16.0)/116.0)**3

x =3D range(0,int(INPUT_SIZE+1))
y =3D [int(round(cie1931(float(L)/INPUT_SIZE)*(OUTPUT_SIZE))) for L in x]


>>
>>> +       0, 7, 14, 21, 28, 35, 43, 50, 57, 64, 71, 78, 85, 92, 99, 106,
>>> 114, 121,
>>
>>
>> Seems like you could save space (and nicely use the previous patch) by
>> using the linear interpolation code from the previous patch, since
>>
>> 0 + 7 =3D 7
>> + 7 =3D 14
>> + 7 =3D 21
>> + 7 =3D 28
>> + 7 =3D 35
>>
>> ...and it would likely be OK to keep going and be slight off, so:
>>
>> + 7 =3D 42
>> + 7 =3D 49
>> + 7 =3D 56
>> + 7 =3D 63
>> + 7 =3D 70
>> ...
>> ...
>>
>> In other words it seems like you're just providing a default table...
>>

Yes, I think that's the Daniel idea ;)

>> -Doug
>>
>

Best regards,
 - Enric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
