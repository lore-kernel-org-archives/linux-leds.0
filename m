From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] Qualcomm Light Pulse Generator
Date: Thu, 6 Jul 2017 05:18:13 +0200
Message-ID: <20170706031813.GC12954@xo-6d-61-c0.localdomain>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170715091032.GA26602@amd>
 <20170716053429.GR1618@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170716053429.GR1618@tuxbook>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> > >   DT: leds: Add Qualcomm Light Pulse Generator binding
> > 
> > This one should be first.
> > 
> 
> Okay, no problems.
> 
> > And I guess I'd prefer the driver to go in first, before the generic
> > pattern interface.
> > 
> 
> The driver won't compile without the additions to the header file. Would
> you like the rest of the driver to go in first, then the generic
> interface and finally the pattern part of the driver?
> 
> Large portions of the driver doesn't make sense without the pattern
> part, so I think I would prefer it to go in as one patch.

Can we get minimum driver without the pattern parts?

Sorry about the additional work.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
