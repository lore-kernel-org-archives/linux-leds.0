From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Wed, 10 Feb 2016 15:21:14 +0100
Message-ID: <CACRpkdbh3coAedusUHgEZQu=3WkVyS4JW6=jUWAtbSxgUVhNiw@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
	<CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
	<56AA2C30.2040708@ti.com>
	<CAHp75Vd_CxDmPbFWX7jaNd=ukOdE2hN13RhhMC5D+H_grM_Xiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd_CxDmPbFWX7jaNd=ukOdE2hN13RhhMC5D+H_grM_Xiw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Andrew F. Davis" <afd@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Jan 31, 2016 at 11:52 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> It reminds me how 12 channel PWM chip is used on Intel Galileo Gen 2.
> Half pins are PWM, the other half is GPIO used for discrete based pin
> muxing and control. Nevertheless I think it's a userspace issue for
> now, otherwise we have to provide some 'semi-virtual' way of
> presenting pins as GPIO lines.

That sounds like an MFD spawning a GPIO and a PWM cell.
That it is called "a PWM chip" is no big deal, it should be
modeled according to what it is, not what it claims to be.

(Which makes me wanna merge this present patch as a GPIO
driver since it claims to be a LED driver but is a GPO.)

See the ST Multipurpose Expander for an example
drivers/mfd/stmpe.c
drivers/gpio/gpio-stmpe.c
drivers/input/keyboard/stmpe-keypad.c

Yours,
Linus Walleij
