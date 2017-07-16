From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 0/3] Qualcomm Light Pulse Generator
Date: Sat, 15 Jul 2017 22:34:29 -0700
Message-ID: <20170716053429.GR1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170715091032.GA26602@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170715091032.GA26602@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

On Sat 15 Jul 02:10 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > This series introduces a generic pattern interface in the LED class and a
> > driver for the Qualcomm Light Pulse Generator.
> > 
> > Bjorn Andersson (3):
> >   leds: core: Introduce generic pattern interface
> 
> This one should be last. Let me review that, it is important to get
> this one right.
> 
> >   leds: Add driver for Qualcomm LPG
> 
> >   DT: leds: Add Qualcomm Light Pulse Generator binding
> 
> This one should be first.
> 

Okay, no problems.

> And I guess I'd prefer the driver to go in first, before the generic
> pattern interface.
> 

The driver won't compile without the additions to the header file. Would
you like the rest of the driver to go in first, then the generic
interface and finally the pattern part of the driver?

Large portions of the driver doesn't make sense without the pattern
part, so I think I would prefer it to go in as one patch.

Please let me know and I'll update the series.

Regards,
Bjorn
