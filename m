From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: Add missing dummies for the unified device
 properties interface
Date: Tue, 12 May 2015 16:47:01 +0900
Message-ID: <CAAVeFuJ2Uff9q9SUKVXAdOtRKQxUA0m7N9Aaee4bkHRxX+Y1dg@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org> <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:34614 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbbELHrW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 03:47:22 -0400
In-Reply-To: <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 7, 2015 at 5:08 PM, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> If GPIOLIB=3Dn:
>
>     drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=
=80=99:
>     drivers/leds/leds-gpio.c:187: error: implicit declaration of func=
tion =E2=80=98devm_get_gpiod_from_child=E2=80=99
>     drivers/leds/leds-gpio.c:187: warning: assignment makes pointer f=
rom integer without a cast
>
> Add dummies for fwnode_get_named_gpiod() and devm_get_gpiod_from_chil=
d()
> for the !GPIOLIB case to fix this.

This was obviously missing.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
