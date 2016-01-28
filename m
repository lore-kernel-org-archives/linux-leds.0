From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Thu, 28 Jan 2016 11:47:15 +0100
Message-ID: <CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1453738452-23633-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Jan 25, 2016 at 5:14 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.
>
> The TPIC2810 has 8 open-drain outputs that can but used to drive
> LEDs and other low-side switched resistive loads.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
> Changes from v1:
>  - Added OF match table at Javier Martinez Canillas request

So the TI datasheet says:
"8 bit LED driver with I2C interface"

So it is *not* "general purpose input/output" (GPIO).

It is special purpose LED drive output-only circuit.

So why can it not have a driver directly in drivers/leds/*?

I understand that it can also be used as a GPIO (and that it
is then nice to put leds-gpio on top of it) but then
I want a reference to the hardware that actually went ahead
and used this as a GPIO chip rather than using a proper
GPIO expander.

Yours,
Linus Walleij
