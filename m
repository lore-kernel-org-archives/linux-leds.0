From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: leds-gpio: no GPIO labels (in debugfs)
Date: Thu, 01 Dec 2016 09:45:40 +0100
Message-ID: <80b3fbe0-5200-e80e-a7f4-99b45d65b165@samsung.com>
References: <CGME20161130162439epcas2p4c540b29ad1d0856e8c5a7155e4d999cf@epcas2p4.samsung.com>
 <3428499.pbM7ylo2PO@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40270 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbcLAI6A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Dec 2016 03:58:00 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OHI002MT0C7Y270@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 01 Dec 2016 08:45:43 +0000 (GMT)
In-reply-to: <3428499.pbM7ylo2PO@ws-stein>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Alexander,

On 11/30/2016 05:24 PM, Alexander Stein wrote:
> Hi,
>
> I jut noticed that the used GPIOs for leds-gpio do not have an actual label
> which is visible in debugfs (/sys/kernel/debug/gpio):
>> gpiochip4: GPIOs 368-383, parent: spi/spi0.2, mcp23s17, can sleep:
>>  gpio-369 P0.1 (?           ) out hi
>>  gpio-370 P0.2 (?           ) out lo
>>  gpio-371 P0.3 (?           ) out lo
>>  gpio-372 P0.4 (?           ) out lo
>>  gpio-373 P0.5 (?           ) out lo
>>  gpio-374 P0.6 (?           ) out lo
>
> The reason is that the call to devm_get_gpiod_from_child() in
> gpio_leds_create() eventually calls "gpiod_request(desc, NULL);" in
> fwnode_get_named_gpiod. So no label attached to GPIO, hence "?" output.
>
> As we have already a gpiod in create_gpio_led(), devm_gpio_request_one() with
> the proper label is not called.
> I don't know much of that code, so what would be needed to have a proper GPIO
> label? And how?

 From the LED subsystem perspective everything looks OK both
in the case when label is defined and without it (node name is
used for the LED class device name then).

Since this seems to be an issue within GPIOLIB internals,
I'm adding Linus Walleij.

-- 
Best regards,
Jacek Anaszewski
