From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: Add missing dummies for the unified device
 properties interface
Date: Tue, 12 May 2015 10:48:28 -0700
Message-ID: <CAK5ve-+9jtPMYdYmicJDRwiUcb8g5XD0h-G88RULY3GX6skZmQ@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
 <1430986090-7243-2-git-send-email-geert@linux-m68k.org> <CACRpkdbsOvOpx8ctm2h2ZCQefpa-dB-fWOfObm4BSCG8xcupow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:36505 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933003AbbELRst convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 13:48:49 -0400
In-Reply-To: <CACRpkdbsOvOpx8ctm2h2ZCQefpa-dB-fWOfObm4BSCG8xcupow@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 12, 2015 at 3:31 AM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> On Thu, May 7, 2015 at 10:08 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>
>> If GPIOLIB=3Dn:
>>
>>     drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=
=80=99:
>>     drivers/leds/leds-gpio.c:187: error: implicit declaration of fun=
ction =E2=80=98devm_get_gpiod_from_child=E2=80=99
>>     drivers/leds/leds-gpio.c:187: warning: assignment makes pointer =
from integer without a cast
>>
>> Add dummies for fwnode_get_named_gpiod() and devm_get_gpiod_from_chi=
ld()
>> for the !GPIOLIB case to fix this.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Fixes: 40b7318319281b1b ("gpio: Support for unified device propertie=
s interface")
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Counting on this to go through the LEDs tree as discussed.
>
> Yours,
> Linus Walleij


OK, merged with Alex and Linus Acks. Thanks,
-Bryan
