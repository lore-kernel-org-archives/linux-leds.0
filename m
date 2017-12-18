From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 20:21:55 +0000
Message-ID: <20171218202155.wzefxazbjakd2dhh@oak.lan>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com>
 <20171215145120.2d2o33tqlechp45h@oak.lan>
 <CAFqH_50Jqs5_5n7D019_ZxvQD1FPCZAYhaLunNm6qzj_cH3tiw@mail.gmail.com>
 <20171218133138.smvnucfm44bgmdpw@oak.lan>
 <CAD=FV=VEakDGqfEkOZbuiq=FvUw46=6u9rTOgTk5FyJ9_2Rh4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VEakDGqfEkOZbuiq=FvUw46=6u9rTOgTk5FyJ9_2Rh4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 18, 2017 at 08:46:09AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 18, 2017 at 5:31 AM, Daniel Thompson
> <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > I think two different values on the userspace side should always map to
> > different values on the kernel side.
> 
> This is what I thought originally, but I believe I've convinced myself
> that this contradicts other goals and therefore needs to be relaxed.
> Specifically:
> 
> Goal #1: A linear adjustment in the number exposed to userspace should
> result in a linear increase in human perceived brightness.
> 
> Goal #2: Don't needlessly throw away precision available to the
> hardware.  For instance, if the hardware only supports 64, 128 or 256
> levels, it seems like a worthy goal to make sure that userspace can
> access each of these brightness levels.
> 
> 
> So if we accept that #1 and #2 are goals,

I'm not sure that I accept goal #1 for highly constrained hardware that
is physically capable only of a very few steps.

I think adopting Goal #1 favours the slider use-case too much over the
hot-key use case. If you linearise a tiny space then the hot-key risks
doing nothing then pressed.

It's not that I don't think this is a real problem but I think it is
one that must be solved in the ABI (e.g. by communicating the typical
curve to userspace and revealing true hardware steps).


> the only solution is to
> expose a larger "virtual" space and have more than one user-exposed
> value map to the same actual brightness.  As a very simple example,
> let's say we have a backlight that allows 8 levels:
> 
> 0 = black
> 1 = 20% user brightness
> 2 = 40% user brightness
> 3 = 60% user brightness
> 4 = 75% user brightness
> 5 = 85% user brightness
> 6 = 90% user brightness
> 7 = 95% user brightness
> 8 = 100% user brightness

Note that these patches are for the PWM backlight; these steps seem
unlikely even for an 8-bit PWM.

That leads us to a difficult question. When presented with a low-bit PWM
then are automatic curves the right tool? With such low steps we
probably need to compromise linearity to some extent (and maybe the DT
author may be forced to tune for slider versus hotkey depending on what
our form-factor is).


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
