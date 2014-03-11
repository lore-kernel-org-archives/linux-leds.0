From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] ARM/leds: move ARM Versatile LED driver to leds subsystem
Date: Tue, 11 Mar 2014 13:18:19 +0100
Message-ID: <CACRpkdb+nLnjM7PUtkzmSJLjEC7FOH65sgOB6m-BUPB8YMzxiA@mail.gmail.com>
References: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
	<1393509500-26002-2-git-send-email-linus.walleij@linaro.org>
	<1393510075.460580224@f137.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:33686 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754071AbaCKMST convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Mar 2014 08:18:19 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so8415341oag.6
        for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2014 05:18:19 -0700 (PDT)
In-Reply-To: <1393510075.460580224@f137.i.mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pawel Moll <pawel.moll@arm.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Thu, Feb 27, 2014 at 3:07 PM, Alexander Shiyan <shc_work@mail.ru> wr=
ote:
> =FE=C5=D4=D7=C5=D2=C7, 27 =C6=C5=D7=D2=C1=CC=D1 2014, 14:58 +01:00 =CF=
=D4 Linus Walleij <linus.walleij@linaro.org>:
>> Now that we have converted this driver to a real platform device
>> module-based thing, we move the driver down into the LEDs
>> subsystem and rename the config option to LEDS_VERSATILE.
>
> In fact, it can be converted to use basic-mmio-gpio =3D> leds-gpio.

Hm, yeah I see what you mean. However this register is not described
as a GPIO register, and on all Versatile/RealView boards these signals
are soldered to LEDs, so they are not general purpose at all.

On some systems without "real" GPIO the above would lead to
compiling in the entire gpiolib (149 KB) just to do this.

I would agree more with inventing something like leds-mmio as a
separate refactoring after this, i.e. a driver for any memory-mapped
LED, which should cover a few cases. What do you think about this
idea?

Yours,
Linus Walleij
