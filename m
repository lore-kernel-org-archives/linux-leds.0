From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Wed, 18 Feb 2015 06:54:30 -0800
Message-ID: <CAJAp7OjNK5WhZ62x5+z5RZG_GJ8sDoyyHDRq+BBUUkxY_ndjhw@mail.gmail.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
	<54DD7CE5.5000302@codeaurora.org>
	<CAJAp7OgD3+mGZ02o6xAWkJvKoD4BcQWVD1GS87Niw_fcReBMMA@mail.gmail.com>
	<54E3FCD3.4000304@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54E3FCD3.4000304@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Feb 17, 2015 at 6:45 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 02/17/15 15:02, Bjorn Andersson wrote:
>> On Thu, Feb 12, 2015 at 8:26 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
[..]
>>> This doesn't seem to do anything for the OVP spike mentioned in this
>>> patch[1]. Do you see that problem on your device? I imagine the PMIC is
>>> the same.
>>>
>>> [1]
>>> https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/?id=fef9e15072562f0f28dc7066dcdd69388df81ed3
>>>
>> That's odd, I can't find that fix in any officially supported releases
>> for 8974 - which Courtney used as reference for this driver.
>>
>> Just to make sure I understand the solution; when disabling the sinks
>> the over-voltage-protection sometimes triggers, so we should detect
>> that and reset the ovp configuration?
>>
>> I presume the side effect would be that the sinks would not give any
>> output until this is done?
>>
>
> It seems that commit is not very good at describing the problem. From
> what I can tell, the inductor current may spike when the WLED is turned
> off and the switch is stuck on (the circuit is a boost convertor). To
> make sure this doesn't happen, we force an OVP so that the switch is
> known to be open (i.e. off) and thus can't cause the current spike when
> we disable.
>

Apparently that commit is only half of the solution, there's another
commit earlier in history with the same commit message [2].

With both [1] and [2] in place there are a bunch of different
operations going on, so I'm not able to fully map these to your
description - which does make sense.

[2] https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/?id=b1a2f61113c69d2aba68c583101ac40a05cb2c5b

Regards,
Bjorn
