From: Bjorn <bjorn@sonymobile.com>
Subject: Re: [PATCH 1/2] leds: add DT binding for Qualcomm PM8941 WLED block
Date: Thu, 18 Dec 2014 15:36:53 -0800
Message-ID: <20141218233652.GD19036@sonymobile.com>
References: <1418084551-28946-1-git-send-email-bjorn.andersson@sonymobile.com>
 <5490D949.4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5490D949.4@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue 16 Dec 17:15 PST 2014, Stephen Boyd wrote:

> On 12/08/2014 04:22 PM, Bjorn Andersson wrote:
> 
[..]
> > +- qcom,current-limit: mA; per-string current limit; value from 0 to 25
> > +	default: 20mA
> > +- qcom,current-boost-limit: mA; boost current limit; one of:
> > +	105, 385, 525, 805, 980, 1260, 1400, 1680
> > +	default: 805mA
[..]
> > +- qcom,ovp: V; Over-voltage protection limit; one of:
> > +	27, 29, 32, 35
> > +	default: 29V
> 
> It would be nice if the units were part of the property name, i.e.
> qcom,ovp-V, qcom,current-boost-limit-mA, etc. That way the units are
> known without having to refer to the documentation.
> 

That might be useful, on the other hand one probably need to look inte bindings
docs to figure out valid values anyways.

> > +- qcom,num-strings: #; number of led strings attached; value from 1 to 3
> > +	default: 2
> 
> I wonder if qcom,#strings is more appropriate?
> 

Checking the other docs indicate that it's far more common to use num- than #
here, but I haven't found anything written about it - it's more common to name
this just "qcom,strings" than "qcom,#strings" at least...

Regards,
Bjorn
