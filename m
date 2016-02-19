From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 1/4] leds: core: add generic support for color LED's
Date: Fri, 19 Feb 2016 14:59:11 +0100
Message-ID: <56C71FAF.50602@samsung.com>
References: <56C37838.5030309@gmail.com> <56C46891.3020301@samsung.com>
 <56C4DAD1.7000803@gmail.com> <56C59A21.2080301@samsung.com>
 <56C62AEC.4080208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45800 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423837AbcBSN7Q (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2016 08:59:16 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O2S002RIS6POW60@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 19 Feb 2016 13:59:13 +0000 (GMT)
In-reply-to: <56C62AEC.4080208@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org

On 02/18/2016 09:34 PM, Heiner Kallweit wrote:
[...]
>>>>>             /* Time to switch the LED on. */
>>>>>             brightness = led_cdev->blink_brightness;
>>>>>             delay = led_cdev->blink_delay_on;
>>>>> @@ -133,8 +133,8 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>>>>>         if (current_brightness)
>>>>>             led_cdev->blink_brightness = current_brightness;
>>>>>         if (!led_cdev->blink_brightness)
>>>>> -        led_cdev->blink_brightness = led_cdev->max_brightness;
>>>>> -
>>>>> +        led_cdev->blink_brightness =
>>>>> +                led_validate_brightness(led_cdev, LED_FULL);
>>>>
>>>> This function name doesn't fit here, since term "validation" usually
>>>> refers to validating user provided data.
>>>>
>>>> led_confine_brightness() ?
>>>>
>>>> And why LED_FULL and not led_cdev->max_brightness?
>>>>
>>> LED_FULL is reduced to max_brightness anyway by led_validate_brightness.
>>> IMHO LED_FULL makes clearer that the intention is: switch it on.
>>> max_brightness is a device-specific property that I'd like to hide
>>> as far as possible in the generic core code.
>>
>> Without checking led_validate_brightness() internals it looks like this
>> patch was changing led_set_software_blink() semantics.
>>
> As far as I can see it doesn't. In monochrome mode
> led_validate_brightness(led_cdev, LED_FULL) evaluates to
> led_cdev->max_brightness.

I meant that looking at this change alone makes such an impression.
Besides, if we now have led_confine_brightness(), then it implies that
brightness will be limited up to LED_FULL level, whereas in fact
the upper limit will be max_brightness for monochrome LEDs.

-- 
Best regards,
Jacek Anaszewski
