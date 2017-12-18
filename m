From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 13:53:24 +0000
Message-ID: <20171218135324.ulvacip55md4g73n@oak.lan>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com>
 <CAD=FV=WY-2MmjRxGGaJrQjyeWt+k4_k7j12M4LxAnnZxJF7sXw@mail.gmail.com>
 <c6450f50-5c12-dc52-4340-b068c0b38c54@linaro.org>
 <CAFqH_50qgvntzwvZ_n3qhpw+BA2SpYqiJgsxfCMt1piNWzgDmA@mail.gmail.com>
 <20171215205735.GB19442@amd>
 <CAFqH_52z9O+0ZVB-rMTCNzw+55m26fDGKeaj-Fz-ccO74+j_MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:34035 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759164AbdLRNx3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Dec 2017 08:53:29 -0500
Received: by mail-wr0-f173.google.com with SMTP id y21so14122498wrc.1
        for <linux-leds@vger.kernel.org>; Mon, 18 Dec 2017 05:53:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAFqH_52z9O+0ZVB-rMTCNzw+55m26fDGKeaj-Fz-ccO74+j_MA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Doug Anderson <dianders@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 18, 2017 at 11:40:59AM +0100, Enric Balletbo Serra wrote:
> Hi Pavel,
> 
> 2017-12-15 21:57 GMT+01:00 Pavel Machek <pavel@ucw.cz>:
> > Hi!
> >
> >> Yes, I think that how you describe luminance and lightness is right,
> >> and sounds good improve the doc.
> >>
> >> To be clear the correction table for PWM values can be calculated with
> >> this code.
> >>
> >> OUTPUT_SIZE = 65535      # Output integer size
> >> INPUT_SIZE = 2047
> >>
> >> def cie1931(L):
> >>     L = L*100.0
> >>     if L <= 8:
> >>         return (L/902.3)
> >>     else:
> >>         return ((L+16.0)/116.0)**3
> >>
> >> x = range(0,int(INPUT_SIZE+1))
> >> y = [int(round(cie1931(float(L)/INPUT_SIZE)*(OUTPUT_SIZE))) for L in x]
> >
> > Can we just generate the table on the fly? Should not be hard to do in
> > fixed point, right?
> 
> This was discussed a bit in previous RFC which had the code to
> generate the table on the fly, see [1]. The use of a fixed table or an
> on the fly table is something that I'll let the maintainers to decide.
> I've no strong opinion on use the on the fly table if someone takes
> care to review deeply the fixed point maths :)

The last time we discussed this we concluded we would introduce linear
interpolation to make it easier enlarge the small tables we typically 
see in devicetree.

Having done that it seemed attractive (at least to me) to reuse any
interpolation code we get and then simply provide a "sane" default look 
up table for use by DT authors who don't really know how to map PWM on/
off times to luminance.

I did review the original fixed point code for the first RFC. IIRC some 
of the low level functions *looked* they could overflow but, on closer 
inspection, were never actually overflowed in practice due to the 
number ranges used by the callers. To be honest part of the attraction
of a LUT instead was that I wouldn't have to closely review nor ensure
all the fixed point code was properly commented ;-) .

The other item in favour of LUT was that (as Doug A. pointed out) PWM 
duty-cycle to luminance is not strictly linear. Whilst at the moment I 
am OK to discount this effect it is possible we might want to combined
the luminance to human perception values with values read out from
graphs in a datasheet.

Enric: Having said all that I don't want to give you a really heavy
       handed steer here. If you think the code was cleaner or clearer
       when using the formulae then I'd be happy to review the fixed
       point code.


Daniel.
