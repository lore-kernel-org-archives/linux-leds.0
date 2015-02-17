From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Tue, 17 Feb 2015 15:05:55 -0800
Message-ID: <CAJAp7OgGVifWrdnGc4XK86jkGr-5OO1CRr4o5+pN760h5OTvcg@mail.gmail.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
	<1422535712.28891.3.camel@mm-sol.com>
	<54DD7896.9020403@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54DD7896.9020403@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Feb 12, 2015 at 8:07 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/29/15 04:48, Ivan T. Ivanov wrote:
>>
>> Otherwise it looks good. Driver is loaded and device is detected
>> properly (i have added readings for type and subtype registers).
>> Do you know where I can measure result from changing brightness
>> sysfs entry. I am using 8074 dragonboard?
>
> Does the backlight turn on? From what I can tell it controls the
> backlight, but it may be that nothings getting displayed so it won't be
> noticeable.
>

I have not measured the voltage/current, nor have had something on the
display. But on the various devices I've tested (Xperia Z1 & Xperia Z
Ultra) the backlight is clearly on.

Regards,
Bjorn
