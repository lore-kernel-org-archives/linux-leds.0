From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 12 Feb 2015 20:34:20 -0800
Message-ID: <54DD7ECC.5020504@codeaurora.org>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>		 <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>	 <1422535712.28891.3.camel@mm-sol.com> <54DD7896.9020403@codeaurora.org> <1423801725.1241.1.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1423801725.1241.1.camel@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 02/12/15 20:28, Ivan T. Ivanov wrote:
> On Thu, 2015-02-12 at 20:07 -0800, Stephen Boyd wrote:
>> On 01/29/15 04:48, Ivan T. Ivanov wrote:
>>> Otherwise it looks good. Driver is loaded and device is detected
>>> properly (i have added readings for type and subtype registers).
>>> Do you know where I can measure result from changing brightness
>>> sysfs entry. I am using 8074 dragonboard?
>> Does the backlight turn on? From what I can tell it controls the
>> backlight, but it may be that nothings getting displayed so it won't be
>> noticeable.
>>
> Yes, I can not see visual changes. That is why I have asked where
> I could hook the probe and measure current change or wherever.
> BL_WLEDx signals go out from J2, but somehow I was unable to 
> locate it on the board, will try to look harder :-)
>
>

When the screen is "off" in android I can still turn on the brightness
to max in sysfs and see the screen glow. Hopefully we don't need
something else to make that work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
