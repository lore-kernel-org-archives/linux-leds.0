From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: leds-gpio: no GPIO labels (in debugfs)
Date: Fri, 2 Dec 2016 13:51:13 +0100
Message-ID: <CACRpkdaDy=40qdFeU8KEf=hDyTdw2MWteZYx7iK4tOCM94CSNg@mail.gmail.com>
References: <CGME20161130162439epcas2p4c540b29ad1d0856e8c5a7155e4d999cf@epcas2p4.samsung.com>
 <3428499.pbM7ylo2PO@ws-stein> <80b3fbe0-5200-e80e-a7f4-99b45d65b165@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:35417 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932607AbcLBMvP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Dec 2016 07:51:15 -0500
Received: by mail-qk0-f172.google.com with SMTP id n204so277453070qke.2
        for <linux-leds@vger.kernel.org>; Fri, 02 Dec 2016 04:51:14 -0800 (PST)
In-Reply-To: <80b3fbe0-5200-e80e-a7f4-99b45d65b165@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Thu, Dec 1, 2016 at 9:45 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 11/30/2016 05:24 PM, Alexander Stein wrote:

>> I jut noticed that the used GPIOs for leds-gpio do not have an actual
>> label
>> which is visible in debugfs (/sys/kernel/debug/gpio):
>>>
>>> gpiochip4: GPIOs 368-383, parent: spi/spi0.2, mcp23s17, can sleep:
>>>  gpio-369 P0.1 (?           ) out hi
>>>  gpio-370 P0.2 (?           ) out lo
>>>  gpio-371 P0.3 (?           ) out lo
>>>  gpio-372 P0.4 (?           ) out lo
>>>  gpio-373 P0.5 (?           ) out lo
>>>  gpio-374 P0.6 (?           ) out lo
>>
>> The reason is that the call to devm_get_gpiod_from_child() in
>> gpio_leds_create() eventually calls "gpiod_request(desc, NULL);" in
>> fwnode_get_named_gpiod. So no label attached to GPIO, hence "?" output.
>>
>> As we have already a gpiod in create_gpio_led(), devm_gpio_request_one()
>> with
>> the proper label is not called.
>> I don't know much of that code, so what would be needed to have a proper
>> GPIO
>> label? And how?
>
> From the LED subsystem perspective everything looks OK both
> in the case when label is defined and without it (node name is
> used for the LED class device name then).
>
> Since this seems to be an issue within GPIOLIB internals,
> I'm adding Linus Walleij.

The consumer label is entirely optional, it's just a very nice thing to
get right for debugging and feeling you have everything in check on
the system.

So it's not a bug, it is an optional feature.

If you want to fix it better looking I guess dig into the code :)

Yours,
Linus Walleij
