From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] leds: leds-gpio: Allow compile test if !GPIOLIB
Date: Tue, 12 May 2015 12:23:09 +0200
Message-ID: <CACRpkdZrgFCHzY7=56A54Cg=6U4TN-fZz=7BTwDnsz3jicc3sA@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
	<1430986090-7243-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430986090-7243-4-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, May 7, 2015 at 10:08 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>
> Relax the dependency of LEDS_GPIO on GPIOLIB if COMPILE_TEST is
> enabled.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
