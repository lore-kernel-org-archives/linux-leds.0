From: "Jingoo Han" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/2] backlight: pwm_bl: support linear brightness to human eye
Date: Tue, 5 Sep 2017 12:34:33 -0400
Message-ID: <000001d32664$db62b2a0$922817e0$@gmail.com>
References: <20170904153504.27963-1-enric.balletbo@collabora.com> <239c9153-c0ea-319c-b554-3c727b75c8cd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <239c9153-c0ea-319c-b554-3c727b75c8cd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Daniel Thompson' <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Enric Balletbo i Serra' <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, 'Lee Jones' <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Jacek Anaszewski' <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Pavel Machek' <pavel-+ZI9xUNit7I@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Doug Anderson' <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Brian Norris' <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Guenter Roeck' <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Tuesday, September 5, 2017 7:06 AM, Daniel Thompson wrote:
> 
> On 04/09/17 16:35, Enric Balletbo i Serra wrote:
> > Dear all,
> >
> > This patch series is a first RFC to know your opinion about implement
> > support to create brightness levels tables dinamically. I tried to argue
> > in every patch the specific reasons we think this can be interesting, to
> > sumup, the idea behind these patches is be able to pass via device tree
> > two parameters to the driver so it can calculate the brightness levels
> > based on the CIE 1931 lightness formula, which is what actually
> describes
> > how we perceive light.
> >
> > I think that at least the maths involved can be improved, and I've still
> > some doubts. With current code if you create a table with a max PWM
> > value of 255 and 127 steps, the first numbers are repeated so I'm
> thinking > that maybe we should skip/remove the repeated values. i.e. have
> a table
> > like this,
> >
> > [0, 1, 2, 3  ...  235, 240, 245, 250, 255]
> >
> > instead of
> >
> > [0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3  ...  235, 240, 245, 250, 255]
> >
> > Well, I know there are things to improve but lets see your feedback
> first
> > before dedicate more time on it. The patches were tested on a couple of
> > devices but I'll test on more devices meanwhile we discuss about it.
> 
> I'm not fully decided on this one but my initial reaction isn't to
> question the concept so much as to ask why the number of levels should
> go in the devicetree at all! We could just make brightness-levels
> optional and get the driver to pick sane curves by default.
> 
> I'm sure we can debate what "sane" means for a couple of e-mails yet but
> in principle, given it knows the PWM max counter value, the driver
> should be able to calculate the "right" number of steps too. If we have
> that your core code remains but we don't have to complexify the device
> 
> <strawman>
> Basically we prefer X (?100 like some of the Intel DRM drivers do for
> connector properties?) steps but we reduce the number of steps if the
> PWM is rather course and we can't get sufficiently different steps.
> </strawman>
> 
> I guess the summary of what I'm saying is that if we can
> programmatically derive brightness curves then the number of steps is
> not really a property of the hardware and doesn't belong in devicetree.

Yep, I agree with Daniel's opinion. I cannot find the reason
this feature can be added to the device tree.

In my opinion, this feature can be handled by upper user level layer,
not backlight framework level. However, we can discuss this topic to
find how to handle it.

Best regards,
Jingoo Han

> 
> 
> Daniel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
