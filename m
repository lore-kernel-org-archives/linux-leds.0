From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 09/27] leds: Allow compile test of GPIO consumers if !GPIOLIB
Date: Wed, 6 May 2015 10:31:46 +0200
Message-ID: <CAMuHMdVt5XpW+kJ1kD2PkuAZkkdJ_j=OXgWK-43JRvN-dVn_Kg@mail.gmail.com>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
	<1430843563-18615-1-git-send-email-geert@linux-m68k.org>
	<1430843563-18615-9-git-send-email-geert@linux-m68k.org>
	<5549C9BD.8010903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35354 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbbEFIbq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2015 04:31:46 -0400
In-Reply-To: <5549C9BD.8010903@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

On Wed, May 6, 2015 at 9:58 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Why don't you apply the same modification to all LED Kconfig
> entries with GPIOLIB dependency?

LEDS_PCA9532_GPIO is a GPIO provider, not a consumer. There are no
dummies for GPIO providers.
LEDS_GPIO doesn't compile if !GPIOLIB, but I missed that it's just due to
a missing dummy for devm_get_gpiod_from_child() and a missing include.
Will fix.

Thanks!

> On 05/05/2015 06:32 PM, Geert Uytterhoeven wrote:
>> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
>> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
>> functionality only, can still be compiled if GPIOLIB is not enabled.
>>
>> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
>> appropriate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
