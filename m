From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 12 Nov 2015 10:21:02 +0100
Message-ID: <564459FE.8020209@gmail.com>
References: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com> <1447121864-15460-3-git-send-email-ingi2.kim@samsung.com> <56421B8F.6010107@samsung.com> <56444681.9020604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35010 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753700AbbKLJVL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Nov 2015 04:21:11 -0500
In-Reply-To: <56444681.9020604@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

On 11/12/2015 08:57 AM, Ingi Kim wrote:
[...]
>>> +        regmap_write(led->regmap, RT5033_REG_FLED_FUNCTION1, val);
>>> +    } else {
>>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
>>> +                   RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL |
>>> +                   rt5033_fled_used(led, fled_id));
>>> +        regmap_update_bits(led->regmap,    RT5033_REG_FLED_CTRL1,
>>> +                   RT5033_FLED_CTRL1_MASK,
>>> +                   (brightness - 1) << 4);
>>> +        regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
>>> +                   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED);
>>> +    }
>>
>> How are you distinguishing between setting brightness for iout_joint
>> case and for individual LEDs? Have you tested this use case?
>> Even if you don't have a board with two separate LEDs,
>> you should be able to test two LED class devices with a single
>> connected LED.
>>
>
> Thanks, I missed a iout_joint case :(
> I have tested a board with integrated single LED,
> It looks fine and all feature works well even if it has limitation.

Please also test two separate LEDs case, by defining two child
nodes in DT, and in a result you will get two LED class devices.
After that you can set brightness separately for each LED class
device, and you'll be able to verify that the driver works properly
by observing the single LED connected to both outputs.
In order to make the testing even more valuable, you can
set triggers for both LEDs

-- 
Best Regards,
Jacek Anaszewski
