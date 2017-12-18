From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 11:40:59 +0100
Message-ID: <CAFqH_52z9O+0ZVB-rMTCNzw+55m26fDGKeaj-Fz-ccO74+j_MA@mail.gmail.com>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com> <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org> <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
 <20171215205735.GB19442@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215205735.GB19442@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

2017-12-15 21:57 GMT+01:00 Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>:
> Hi!
>
>> Yes, I think that how you describe luminance and lightness is right,
>> and sounds good improve the doc.
>>
>> To be clear the correction table for PWM values can be calculated with
>> this code.
>>
>> OUTPUT_SIZE = 65535      # Output integer size
>> INPUT_SIZE = 2047
>>
>> def cie1931(L):
>>     L = L*100.0
>>     if L <= 8:
>>         return (L/902.3)
>>     else:
>>         return ((L+16.0)/116.0)**3
>>
>> x = range(0,int(INPUT_SIZE+1))
>> y = [int(round(cie1931(float(L)/INPUT_SIZE)*(OUTPUT_SIZE))) for L in x]
>
> Can we just generate the table on the fly? Should not be hard to do in
> fixed point, right?

This was discussed a bit in previous RFC which had the code to
generate the table on the fly, see [1]. The use of a fixed table or an
on the fly table is something that I'll let the maintainers to decide.
I've no strong opinion on use the on the fly table if someone takes
care to review deeply the fixed point maths :)

[1] https://lkml.org/lkml/2017/9/4/335

Regards,
 Enric
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
