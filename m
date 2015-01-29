From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds: ipaq needs LEDS_CLASS
Date: Thu, 29 Jan 2015 10:24:18 +0100
Message-ID: <CACRpkdZi9R8f+6cGz8cMmBTdvHpMu5SDG7qwbMvHXNFk=81g2w@mail.gmail.com>
References: <7354226.f7e3npkAlC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:53236 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbbA2JYU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jan 2015 04:24:20 -0500
Received: by mail-lb0-f177.google.com with SMTP id p9so25911645lbv.8
        for <linux-leds@vger.kernel.org>; Thu, 29 Jan 2015 01:24:18 -0800 (PST)
In-Reply-To: <7354226.f7e3npkAlC@wuerfel>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <philipp.zabel@gmail.com>, Paul Parsons <lost.distance@yahoo.com>

On Wed, Jan 28, 2015 at 9:05 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> All other drivers have a dependency on this already, but this one
> does not, which can lead to a link error when LEDS_CLASS is not set.
>
> drivers/built-in.o: In function `micro_leds_remove':
> :(.text+0x13d1bc): undefined reference to `led_classdev_unregister'
> drivers/built-in.o: In function `micro_leds_probe':
> :(.text+0x13d3d0): undefined reference to `led_classdev_register'
>
> This patch adds the missing dependency.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry for screwing up...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
