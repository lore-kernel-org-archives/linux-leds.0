From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/4] leds: core: add generic support for color LED's
Date: Tue, 23 Feb 2016 19:58:47 +0100
Message-ID: <56CCABE7.9010908@gmail.com>
References: <56C37838.5030309@gmail.com> <56C46891.3020301@samsung.com>
 <56C4DAD1.7000803@gmail.com> <56C59A21.2080301@samsung.com>
 <56C62AEC.4080208@gmail.com> <56C71FAF.50602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38743 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752340AbcBWS6y (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 13:58:54 -0500
Received: by mail-wm0-f41.google.com with SMTP id a4so223025239wme.1
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2016 10:58:53 -0800 (PST)
In-Reply-To: <56C71FAF.50602@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Am 19.02.2016 um 14:59 schrieb Jacek Anaszewski:
> On 02/18/2016 09:34 PM, Heiner Kallweit wrote:
> [...]
>>>>>>             /* Time to switch the LED on. */
>>>>>>             brightness = led_cdev->blink_brightness;
>>>>>>             delay = led_cdev->blink_delay_on;
>>>>>> @@ -133,8 +133,8 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
>>>>>>         if (current_brightness)
>>>>>>             led_cdev->blink_brightness = current_brightness;
>>>>>>         if (!led_cdev->blink_brightness)
>>>>>> -        led_cdev->blink_brightness = led_cdev->max_brightness;
>>>>>> -
>>>>>> +        led_cdev->blink_brightness =
>>>>>> +                led_validate_brightness(led_cdev, LED_FULL);
>>>>>
>>>>> This function name doesn't fit here, since term "validation" usually
>>>>> refers to validating user provided data.
>>>>>
>>>>> led_confine_brightness() ?
>>>>>
>>>>> And why LED_FULL and not led_cdev->max_brightness?
>>>>>
>>>> LED_FULL is reduced to max_brightness anyway by led_validate_brightness.
>>>> IMHO LED_FULL makes clearer that the intention is: switch it on.
>>>> max_brightness is a device-specific property that I'd like to hide
>>>> as far as possible in the generic core code.
>>>
>>> Without checking led_validate_brightness() internals it looks like this
>>> patch was changing led_set_software_blink() semantics.
>>>
>> As far as I can see it doesn't. In monochrome mode
>> led_validate_brightness(led_cdev, LED_FULL) evaluates to
>> led_cdev->max_brightness.
> 
> I meant that looking at this change alone makes such an impression.
> Besides, if we now have led_confine_brightness(), then it implies that
> brightness will be limited up to LED_FULL level, whereas in fact
> the upper limit will be max_brightness for monochrome LEDs.
> 
Ah, now I get you. Yes, at a first glance it seems like the semantics were
changed. However I don't see this as a bad thing if we interpret LED_FULL
as "maximum brightness of a device".
