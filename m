From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] leds: lm3692x: Introduce LM3692x dual string driver
Date: Wed, 15 Nov 2017 07:06:37 -0600
Message-ID: <4a13eae0-044a-95f1-ab3e-68b2114f623b@ti.com>
References: <20171113205052.25884-1-dmurphy@ti.com>
 <20171113205052.25884-2-dmurphy@ti.com> <20171115104526.GC456@amd>
 <1b0c05a6-2261-85d5-a3c6-9753f7600a20@ti.com> <20171115130057.GA11557@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:60288 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752796AbdKONHM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Nov 2017 08:07:12 -0500
In-Reply-To: <20171115130057.GA11557@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Pavel

On 11/15/2017 07:00 AM, Pavel Machek wrote:
> Hi!
> 
>>>> +	ret = regmap_write(led->regmap, LM3692X_PWM_CTRL,
>>>> +		LM3692X_PWM_FILTER_100 | LM3692X_PWM_SAMP_24MHZ);
>>>> +	if (ret)
>>>> +		dev_err(&led->client->dev, "Failed programming PWM CTRL\n");
>>>> +
>>>> +	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
>>>> +			LM3692X_BRHT_MODE_RAMP_MULTI |
>>>> +			LM3692X_BL_ADJ_POL |
>>>> +			LM3692X_RAMP_RATE_250us);
>>>> +	if (ret)
>>>> +		dev_err(&led->client->dev, "Failed programming BOOST CTRL\n");
>>>> +
>>>> +	ret = regmap_write(led->regmap, LM3692X_AUTO_FREQ_HI, 0x00);
>>>> +	if (ret)
>>>> +		dev_err(&led->client->dev, "Failed programming AUTO HI FREQ\n");
>>>
>>> If something fails, is it wise to continue?
> 
> If something fails, is it wise to continue?
> 

Sorry missed that comment.  It is ok to continue but probably should goto out and return
an error so the probe fails.

Dan

> 									Pavel
> 


-- 
------------------
Dan Murphy
