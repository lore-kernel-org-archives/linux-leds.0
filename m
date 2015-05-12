From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] gpiolib: Add missing dummies for the unified device
 properties interface
Date: Tue, 12 May 2015 09:48:57 +0200
Message-ID: <CAMuHMdXy1FoN0_Ku1AjnH-kH7e9fjnvu5T41cm8YVzabwSzDXw@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
	<1430986090-7243-2-git-send-email-geert@linux-m68k.org>
	<CAK5ve-KX_LXxd07ifcTMhm3Qn=QkNK4pwq=hd6HV_wTQgF6X_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAK5ve-KX_LXxd07ifcTMhm3Qn=QkNK4pwq=hd6HV_wTQgF6X_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Bryan,

On Fri, May 8, 2015 at 7:43 PM, Bryan Wu <cooloney@gmail.com> wrote:
> On Thu, May 7, 2015 at 1:08 AM, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
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
>
> This patch looks good to me. Do you mind merging it through LED tree
> with other 2 more LED patches?

Now we have an ack from Alex, that's fine for me. Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
