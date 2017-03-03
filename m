From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: core: add struct device_node pointer to the
 struct led_classdev
Date: Fri, 3 Mar 2017 23:20:16 +0100
Message-ID: <01956b2d-35bc-6948-21f6-4c702c2e881b@gmail.com>
References: <20170227222300.2060-1-zajec5@gmail.com>
 <a535b820-b29f-252f-ba55-25a2f376f773@gmail.com>
 <CACna6ry3WTZcGntsaD8UsFxNDW-7G0Q6n6z=MBTCLh8PDJ=0rQ@mail.gmail.com>
 <40a9e4b2-bafa-9503-14b2-5ff6046d561e@gmail.com>
 <CACna6rxr4Yijgo4HWFH+v4KVKWHfyM4sadozrVNdsSSoMWLcFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36603 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752118AbdCCWVD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Mar 2017 17:21:03 -0500
Received: by mail-wm0-f65.google.com with SMTP id v190so5096788wme.3
        for <linux-leds@vger.kernel.org>; Fri, 03 Mar 2017 14:21:02 -0800 (PST)
In-Reply-To: <CACna6rxr4Yijgo4HWFH+v4KVKWHfyM4sadozrVNdsSSoMWLcFQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 03/02/2017 11:45 PM, Rafał Miłecki wrote:
> On 2 March 2017 at 21:29, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>> On 03/02/2017 06:42 PM, Rafał Miłecki wrote:
>>> On 28 February 2017 at 22:20, Jacek Anaszewski
>>> <jacek.anaszewski@gmail.com> wrote:
>>>> Thanks for the patch. How about following what has been already
>>>> done for spi, i.e. adding a wrapper of_led_classdev_register()
>>>> (please refer to of_register_spi_device() in drivers/spi/spi.c)?
>>>
>>> I like this idea, but I'll need to split led_classdev_register into
>>> two functions: allocation & actual registering function. That way I
>>> can alloc, then read DT proprties and finally register LED (just like
>>> it's done in of_register_spi_device).
>>>
>>> Does it sound OK?
>>
>> Yes, after thinking a bit more about that I came to the same
>> conclusion.
> 
> OK, I spent some extra time on this today, this seem a bit more complex.
> 
> I was starring at of_register_spi_device for quite some time and it
> doesn't seem really related to this situation. In case of
> of_register_spi_device:
> 1) It's used internally in spi core code only
> 2) It handles DT controller child node totally on its own
> 
> This patch I sent is about interaction between drivers registering
> LEDs and LED core code. There are few drivers (that register LEDs)
> parsing DT on their own. I'm afraid comparing this situation to
> of_register_spi_device is a bit confusing for me. I really don't see a
> place for of_led_classdev_register that would be called for every
> child of LED controller (?!).
> 
> So I'd like to suggest not comparing this situation to
> of_register_spi_device and discussing this problem on our own.
> 
> My current problem is that led_classdev_register:
> 1) Allocates struct device & registers LED
> 2) It means drivers can't touch struct device before having LED registered
> 3) It doesn't allow passing of_node
> 4) It is used in so many places it's almost impossible to modify all
> callers at once
> 
> So maybe I could work on of_led_classdev_register that:
> 1) Would be almost identical to led_classdev_register
> 2) It would accept extra struct device_node argument
> 
> Does it make sense? Or maybe it's even what you meant from the beginning?

I intended that of_led_classdev_register() was almost identical to
led_classdev_register() but additionally had device_node parameter.

When agreeing with you on splitting led_classdev_register() to
allocation and registering function I meant creating two helper
functions that could be used as follows:

[pseudocode]

led_classdev_register(...):
    led_cdev->dev = alloc_led_classdev
    register_led_classdev(led_cdev)

of_led_classdev_register(..., of_node):
    led_cdev->dev = alloc_led_classdev
    led_cdev->of_node = of_node
    register_led_classdev(led_cdev)

I didn't mean updating all existing drivers to use new of_
prefixed API.

> Two things I'll need to take in mind while working on this:
> 1) I'll need devm variant

Right.

> 2) I should share code between (of_)led_classdev_register functions

Exactly.

-- 
Best regards,
Jacek Anaszewski
