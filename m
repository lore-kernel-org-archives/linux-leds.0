From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Qualcomm Light Pulse Generator
Date: Sun, 16 Jul 2017 13:53:04 -0700
Message-ID: <20170716205304.GU1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170715091032.GA26602@amd>
 <20170716053429.GR1618@tuxbook>
 <20170706031813.GC12954@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170706031813.GC12954-5NIqAleC692hcjWhqY66xCZi+YwRKgec@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Wed 05 Jul 20:18 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > > >   DT: leds: Add Qualcomm Light Pulse Generator binding
> > > 
> > > This one should be first.
> > > 
> > 
> > Okay, no problems.
> > 
> > > And I guess I'd prefer the driver to go in first, before the generic
> > > pattern interface.
> > > 
> > 
> > The driver won't compile without the additions to the header file. Would
> > you like the rest of the driver to go in first, then the generic
> > interface and finally the pattern part of the driver?
> > 
> > Large portions of the driver doesn't make sense without the pattern
> > part, so I think I would prefer it to go in as one patch.
> 
> Can we get minimum driver without the pattern parts?
> 

It's possible to do, but I must admit I find it slightly contrived.

The overall design of different parts of the driver does relate to how I
decided to structure and implement the pattern support, so this would
mean that the driver we merge has a conceptual dependency on a
out-of-tree part.


May I ask about the reasoning for your request? Is it just to not leave
the driver hanging while we conclude the discussion on the pattern
interface?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
