From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/3] leds: Add driver for Qualcomm LPG
Date: Tue, 21 Nov 2017 23:01:40 +0100
Message-ID: <d291deae-d962-5ca1-2c84-721b90bd0bce@gmail.com>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-3-bjorn.andersson@linaro.org>
 <19018aa2-c460-1d5e-8dd2-1cfa557be2f2@gmail.com>
 <20171120211033.GZ28761@minitux> <20171120232211.GC13906@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38097 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751302AbdKUWCj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Nov 2017 17:02:39 -0500
In-Reply-To: <20171120232211.GC13906@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

On 11/21/2017 12:22 AM, Pavel Machek wrote:
> On Mon 2017-11-20 13:10:33, Bjorn Andersson wrote:
>> On Sun 19 Nov 13:36 PST 2017, Jacek Anaszewski wrote:
>>
>>> Hi Bjorn,
>>>
>>> Thanks for the patch. Please refer to my comments in the code.
>>>
>>> On 11/15/2017 08:13 AM, Bjorn Andersson wrote:
>> [..]
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 52ea34e337cd..ccc3aa4b2474 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -651,6 +651,13 @@ config LEDS_POWERNV
>>>>  	  To compile this driver as a module, choose 'm' here: the module
>>>>  	  will be called leds-powernv.
>>>>  
>>>> +config LEDS_QCOM_LPG
>>>> +	tristate "LED support for Qualcomm LPG"
>>>> +	depends on LEDS_CLASS
>>>
>>> You were mentioning that this driver is for a MFD child block,
>>> so we should probably depend on the parent MFD driver?
>>>
>>
>> There's no build time dependency between the two, so it's not strictly
>> necessary.
>>
>> Adding a dependency on MFD_SPMI_PMIC would indirectly add a dependency
>> on ARCH_QCOM, which limit build testing and stop some static code
>> checkers to check the driver.
>>
>> So, unless you strongly object I would prefer not to mention the
>> MFD.
> 
> OTOH, this way even users that can't have qualcom LPG are asked the
> question.
> 
> So right way is depends on LEdS_CLASS && (BUILD_TEST || MFD_SPMI_PMIC).

Ack.

-- 
Best regards,
Jacek Anaszewski
