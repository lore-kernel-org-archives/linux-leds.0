From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] leds: Add driver for Qualcomm LPG
Date: Fri, 7 Apr 2017 13:36:49 -0700
Message-ID: <20170407203649.GD15143@minitux>
References: <20170323055435.29197-1-bjorn.andersson@linaro.org>
 <20170323203749.GB8563@amd>
 <20170329021734.afhqmfpmbcjyv7bu@rob-hp-laptop>
 <20170329190725.GN20094@minitux>
 <20170329222301.GB7977@amd>
 <20170330000955.GP20094@minitux>
 <20170330074309.GA28533@amd>
 <bf999f34-4509-6f0b-602c-f82d50a18e97@gmail.com>
 <20170403190032.GX20094@minitux>
 <20170407133223.GE4756@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407133223.GE4756@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri 07 Apr 06:32 PDT 2017, Pavel Machek wrote:

> > For the patterns I don't know how a trigger for this would look like,
> > how would setting the pattern of a trigger be propagated down to the
> > hardware?
> 
> Well... I'm not sure if we _want_ to do triggers for
> patterns. LED triggers change rather quickly (100 times a second?) so
> doing them in kernel makes sense. Patterns take 10s of seconds, so we
> do not need to handle them in kernel. 
> 

On any current Qualcomm based phone (using the Qualcomm PMIC to drive
the RGB notification LED) the patterns are hard coded in DeviceTree and
the option you have in runtime is to enable/disable the usage of the
configured pattern and a few knobs of how to traverse the configured
pattern.

When you enter e.g. a low-battery scenario you trigger the red LED to
run its low-battery-pattern and you don't touch it until there's a
higher prio notification (e.g. someone connects the charger).

So in the current implementation patterns "never" changes and they are
triggered only every time you get some event/notification.


A benefit of not using triggers for patterns is that I can assign
patterns to triggered events, e.g. I can configure my LEDs to flash &
fade out when some trigger happens.

Regards,
Bjorn
