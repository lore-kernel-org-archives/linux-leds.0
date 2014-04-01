From: Bryan Wu <cooloney@gmail.com>
Subject: Re: brightness units
Date: Tue, 1 Apr 2014 15:09:55 -0700
Message-ID: <CAK5ve-LNU_BGUB_HxsbgiO4baM-39C7PWHRVx0DL=JTYfJGSuA@mail.gmail.com>
References: <533A6905.3010600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:59772 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbaDAWKR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Apr 2014 18:10:17 -0400
Received: by mail-la0-f41.google.com with SMTP id gl10so7500854lab.14
        for <linux-leds@vger.kernel.org>; Tue, 01 Apr 2014 15:10:15 -0700 (PDT)
In-Reply-To: <533A6905.3010600@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, milo kim <milo.kim@ti.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

On Tue, Apr 1, 2014 at 12:21 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> I am currently integrating LED subsystem and V4L2 Flash API.
> V4L2 Flash API defines units of torch and flash intensity
> in milliampers. In the LED subsystem documentation I can't
> find any reference to the brightness units. On the other
> hand there is led_brightness enum defined in the <linux/leds.h>
> header, with LED_FULL = 255, but not all leds drivers use it.
> I am aware that there are LEDs that can be only turned on/off
> without any possibility to set the current and in such cases
> LED_FULL doesn't reflect the current set.
>

Actually led_brightness is an logic concept not like milliampers,
since different led drivers has different implementation which is
hardware related. Like PWM led driver, it will be converted to duty
cycles.

For current control I do see some specific driver like LP55xx have it
but not for every one.

> So far I've assumed that brightness is expressed in milliampers
> and I don't stick to the LED_FULL limit. It allows for passing
> flash/torch intensity from V4L2 controls to the leds API
> without conversion. I am not sure if the units should be
> fixed to milliampers in the LED subsystem or not. It would
> clarify the situation, but if the existing LED drivers don't
> stick to this unit then it would make a confusion.
>

We probably need to convert those intensity to brightness numbers, for
example mapping the intensity value to 0 ~ 255 brightness level and
pass it to LED subsystem.

> In view of the above I'd like to ask for any advice on
> how to proceed.
>

Add Milo for some advice, who is maintaining LP55xx LED driver.

-Bryan
