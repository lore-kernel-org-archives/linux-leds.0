From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] leds: Add Spreadtrum SC27xx breathing light
 controller driver
Date: Thu, 21 Jun 2018 15:25:07 +0800
Message-ID: <CAMz4kuJh+H_5XkeO=FpmHXdusMqPu9=NUfr1YOgumMh2mPsoJA@mail.gmail.com>
References: <f393ca5a99059e7086307b99fc435777fe09018b.1525757122.git.baolin.wang@linaro.org>
 <9a2a07b8eb313ae3ba64af911337ee7ff7c9ad43.1525757122.git.baolin.wang@linaro.org>
 <20180509142539.GB25131@amd> <bddc1f89-8c2c-ba6e-3c7e-d89710ed5424@gmail.com>
 <20180510113749.GG6977@amd> <6289571e-7224-ca5e-1acf-5b099be57302@gmail.com>
 <20180512083559.GB8944@amd> <7c9d5eec-4e6b-9b26-470c-f8002cca5f27@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c9d5eec-4e6b-9b26-470c-f8002cca5f27@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek and Bjorn,

> OK, I've revised the discussion under Qualcomm LPG patch set and
> it seems that we have almost ready solution in [0], except the
> pattern_repeat file you mention in [1]. So probably Baolin could
> address your remarks from [1] and add pattern_repeat file to the
> patch that begins thread [0].
>
> [0] https://lkml.org/lkml/2017/11/15/27
> [1] https://lkml.org/lkml/2017/12/8/470

I did not see Bjorn's patch introducing the 'pattern' and
'pattern_repeat' interfaces was resend, but we have some requirements
depend on this patch for Spreadtrum LED controller.

Bjorn, will you resend your patchset? and I will help to test it. Or
can I help to resend the patch with keeping your authorization?
Thanks.

-- 
Baolin.wang
Best Regards
