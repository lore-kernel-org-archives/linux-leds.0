From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 10 Jun 2019 14:54:03 -0700
Message-ID: <20190610215403.GC137143@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
 <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain>
 <819ecbcd-18e3-0f6b-6121-67cb363df440@collabora.com>
 <20190610203928.GA137143@google.com>
 <c8992414-8067-f82a-55f0-74fe9c2e1b3e@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c8992414-8067-f82a-55f0-74fe9c2e1b3e@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Pavel Machek <pavel@ucw.cz>, Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

On Mon, Jun 10, 2019 at 11:02:27PM +0200, Enric Balletbo i Serra wrote:
> Hi Matthias,
> 
> On 10/6/19 22:39, Matthias Kaehlcke wrote:
> > Hi Enric
> > 
> > On Mon, Jun 10, 2019 at 12:00:02PM +0200, Enric Balletbo i Serra wrote:
> >> Hi Matthias,
> >>
> >> On 8/6/19 23:02, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>>> +	 * Note that this method is based on empirical testing on different
> >>>>> +	 * devices with PWM of 8 and 16 bits of resolution.
> >>>>> +	 */
> >>>>> +	n = period;
> >>>>> +	while (n) {
> >>>>> +		counter += n % 2;
> >>>>> +		n >>= 1;
> >>>>> +	}
> >>>>
> >>>> I don't quite follow the heuristics above. Are you sure the number of
> >>>> PWM bits can be infered from the period? What if the period value (in
> >>>> ns) doesn't directly correspond to a register value? And even if it
> >>>> did, counting the number of set bits (the above loops is a
> >>>> re-implementation of ffs()) doesn't really result in the dividers
> >>>> mentioned in the comment. E.g. a period of 32768 ns (0x8000) results
> >>>> in a divider of 1, i.e. 32768 brighness levels.
> >>>>
> >>
> >> Right, I think that only works on the cases that we only have one pwm cell, and
> >> looks like during my tests I did only tests on devices with one pwm cell :-(
> >>
> >> And as you point the code is broken for other cases (pwm-cells > 1)
> >>
> >>>> On veyron minnie the period is 1000000 ns, which results in 142858
> >>>> levels (1000000 / 7)!
> >>>>
> >>>> Not sure if there is a clean solution using heuristics, a DT property
> >>>> specifying the number of levels could be an alternative. This could
> >>>> also be useful to limit the number of (mostly) redundant levels, even
> >>>> the intended max of 4096 seems pretty high.
> >>>>
> >>
> >> Looking again looks like we _can not_ deduce the number of bits of a pwm, it is
> >> not exposed at all, so I think we will need to end adding a property to specify
> >> this. Something similar to what leds-pwm binding does, it has:
> >>
> >> max-brightness : Maximum brightness possible for the LED
> > 
> > Thanks for the confirmation that I didn't just miss some clever trick.
> > 
> > I also think that some kind of DT property is needed, I'll try to come
> > up with a reasonable name, keeping in mind that some devices might not
> > want to use the entire range of levels.
> > 
> 
> Note that, If I remember correctly, the original idea behind all these patches
> was provide a default curve with enough points following the  CIE 1931 formula
> (which describes how we perceive light). When default doesn't work for your
> hardware, you could play and define your own curve using the
> num-interpolated-steps property I.e:
> 
>  brightness-levels = <0 2048 4096 8192 16384 65535>;
>  num-interpolated-steps = <2048>;
>  default-brightness-level = <4096>;
> 
> Or even expose all the possible levels, like you do with your chromeos kernel.
> 
>  brightness-levels = <0 65535>;
>  num-interpolated-steps = <65535>;
>  default-brightness-level = <4096>;
> 
> The above should work independently of the bug found (that of course needs to be
> fixed)

Thanks for the info, indeed (keep) using a custom curve could be an
option.

I'm learning about the corresponding user space component of Chrome OS
as we speak. It looks like it's possible to specify the minimum
brightness level to use, which should do the trick, also making the OS
aware of the exponential nature of the backlight levels might help.
