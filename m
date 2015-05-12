From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: Add missing dummies for the unified device
 properties interface
Date: Tue, 12 May 2015 12:31:35 +0200
Message-ID: <CACRpkdbsOvOpx8ctm2h2ZCQefpa-dB-fWOfObm4BSCG8xcupow@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
	<1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34330 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbbELKbg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 06:31:36 -0400
Received: by obfe9 with SMTP id e9so1920919obf.1
        for <linux-leds@vger.kernel.org>; Tue, 12 May 2015 03:31:35 -0700 (PDT)
In-Reply-To: <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 7, 2015 at 10:08 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

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
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 40b7318319281b1b ("gpio: Support for unified device properties=
 interface")

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Counting on this to go through the LEDs tree as discussed.

Yours,
Linus Walleij
