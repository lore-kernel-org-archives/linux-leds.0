From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Mon, 10 Apr 2017 11:52:08 +0200
Message-ID: <20170410095207.GA4475@xo-6d-61-c0.localdomain>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <1192806d-13bf-3b5c-4179-b7795737ed40@gmail.com>
 <20170403182158.GV20094@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170403182158.GV20094@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> > Actually we could achieve the goal by listing all available pattern
> > configurations for given LED class device, so in case of Qualcomm LPG
> > driver we could have transition-pattern-1 to transition-pattern-15
> > listed after executing "cat trigger".
> > 
> 
> There's a common pattern-table of 24 (or 64) entries, that is shared
> among the 8 LPGs (each LPG simply has to indices pointing into the
> shared table). Each entry in the table holds a value between 0 and 511.
> So that's a lot of "available pattern configurations".

> > I wonder if I'm not missing some vital constraints here that could
> > make this design unfeasible.
> > 
> 
> Regardless of how we expose RGBs to userspace, the 8 LPG hardware blocks
> are independent of each other. The fact that they end up controlling
> something that is perceived by the human eye as some mixed color is to
> me a matter of system integration, and as such should not convolute the
> implementation of the individual instances.

Well... the 8 LPG blocks share the pattern-table.. and the pattern-table is very
limited. We could statically allocate 3 entries to each LPG block, but that
would not be too useful. And if we dynamically allocate entries depending on
patterns, then the LPG blocks are no longer independent.

									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
