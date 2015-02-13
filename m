From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 12 Feb 2015 20:07:50 -0800
Message-ID: <54DD7896.9020403@codeaurora.org>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>	 <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com> <1422535712.28891.3.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422535712.28891.3.camel@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 01/29/15 04:48, Ivan T. Ivanov wrote:
>
> Otherwise it looks good. Driver is loaded and device is detected
> properly (i have added readings for type and subtype registers).
> Do you know where I can measure result from changing brightness 
> sysfs entry. I am using 8074 dragonboard?

Does the backlight turn on? From what I can tell it controls the
backlight, but it may be that nothings getting displayed so it won't be
noticeable.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
