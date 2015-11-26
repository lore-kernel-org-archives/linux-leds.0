From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v6 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 26 Nov 2015 10:43:25 +0100
Message-ID: <5656D43D.106@samsung.com>
References: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
 <1448446948-13729-3-git-send-email-ingi2.kim@samsung.com>
 <5655D001.8090803@samsung.com> <5656BC88.2070603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41867 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753036AbbKZJn3 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2015 04:43:29 -0500
In-reply-to: <5656BC88.2070603@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, andi.shyti@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

On 11/26/2015 09:02 AM, Ingi Kim wrote:
[...]
>>> +torch_unlock:
>>> +    mutex_unlock(&led->lock);
>>> +    return ret;
>>> +}
>>> +
>>> +static int rt5033_led_flash_brightness_set(struct led_classdev_flash *fled_cdev,
>>> +                       u32 brightness)
>>> +{
>>> +    struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
>>> +    struct rt5033_led *led = sub_led_to_led(sub_led);
>>> +
>>> +    mutex_lock(&led->lock);
>>> +    sub_led->flash_brightness = brightness;
>>> +    mutex_unlock(&led->lock);
>>
>> Mutex protection is redundant in this case. You would need it if device
>> state was also changed here.
>
> Okay, I'll remove it.
>
>>
>> BTW why flash brightness can't be written to the device here?
>>
>
> Flash brightness is only affected when FLED flashed (strobing).
> So, I think it is better to be written in rt5033_led_flash_strobe_set function.

strobe_set op should strobe the flash ASAP, and delegating brightness
setting there extends a delay between calling strobe_set op
and actual flash strobe. If you set the brightness here, then you
wouldn't have to do that in the strobe_set op, of course unless the
the brightness is altered through the API of the other LED, in two
separate LEDs case.

>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int rt5033_led_flash_timeout_set(struct led_classdev_flash *fled_cdev,
>>> +                    u32 timeout)
>>> +{
>>> +    struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
>>> +    struct rt5033_led *led = sub_led_to_led(sub_led);
>>> +
>>> +    mutex_lock(&led->lock);
>>> +    sub_led->flash_timeout = timeout;
>>> +    mutex_unlock(&led->lock);
>>
>> Ditto.
>>

Timeout should be also written here.

If you will add regmap_write in both ops, then mutex protection will
have to be preserved, to assure consistency between registers state
and sub_led->flash_brightness and sub_led->flash_timeout state.

>
>>> +#define RT5033_FLED_CTRL4_VTRREG_MAX    0x60
>>
>> Rename DEF to MASK.

Hmm, here it should be: Rename MAX to MASK.

-- 
Best Regards,
Jacek Anaszewski
