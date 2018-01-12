From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Fri, 12 Jan 2018 11:50:52 +0000
Message-ID: <20180112115052.GB3642@birch.example.com>
References: <20180110223046.17696-1-enric.balletbo@collabora.com>
 <20180110223046.17696-4-enric.balletbo@collabora.com>
 <CAFqH_50zs+TMZaRNegxYPQOcysvwm9EY5iB8DqNeGYN+QaJP6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_50zs+TMZaRNegxYPQOcysvwm9EY5iB8DqNeGYN+QaJP6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 12, 2018 at 11:14:54AM +0100, Enric Balletbo Serra wrote:
> > @@ -441,6 +544,26 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >
> >         dev_dbg(&pdev->dev, "got pwm for backlight\n");
> >
> > +       if (!data->levels) {
> > +               /* Get the PWM period (in nanoseconds) */
> > +               pwm_get_state(pb->pwm, &state);
> > +
> > +               ret = pwm_backlight_brightness_default(&pdev->dev, data,
> > +                                                      state.period);
> > +               if (ret < 0) {
> > +                       dev_err(&pdev->dev,
> > +                               "failed to setup default brightness table\n");
> > +                       goto err_alloc;
> > +               }
> > +       }
> > +
> > +       for (i = 0; i <= data->max_brightness; i++)
> 
> Oops, horrible and unjustifiable mistake, missing { here :/

Well, at least you found it rather than us :-)


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
