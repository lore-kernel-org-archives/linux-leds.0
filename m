From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Wed, 10 Feb 2016 16:29:46 +0200
Message-ID: <CAHp75VfTofe13JCcJmFq=yex7zRdmzTSMMSX8Tap5cBZ80rJ2Q@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
	<CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
	<56AA2C30.2040708@ti.com>
	<CAHp75Vd_CxDmPbFWX7jaNd=ukOdE2hN13RhhMC5D+H_grM_Xiw@mail.gmail.com>
	<CACRpkdbh3coAedusUHgEZQu=3WkVyS4JW6=jUWAtbSxgUVhNiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbh3coAedusUHgEZQu=3WkVyS4JW6=jUWAtbSxgUVhNiw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Feb 10, 2016 at 4:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Jan 31, 2016 at 11:52 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
>> It reminds me how 12 channel PWM chip is used on Intel Galileo Gen 2.
>> Half pins are PWM, the other half is GPIO used for discrete based pin
>> muxing and control. Nevertheless I think it's a userspace issue for
>> now, otherwise we have to provide some 'semi-virtual' way of
>> presenting pins as GPIO lines.
>
> That sounds like an MFD spawning a GPIO and a PWM cell.
> That it is called "a PWM chip" is no big deal, it should be
> modeled according to what it is, not what it claims to be.

Although I agree with model I barely imagine how in this case drivers
should access PWM chip registers in non-race way (take into account
that PWM itself is connected to i2c bus).

> (Which makes me wanna merge this present patch as a GPIO
> driver since it claims to be a LED driver but is a GPO.)
>
> See the ST Multipurpose Expander for an example
> drivers/mfd/stmpe.c
> drivers/gpio/gpio-stmpe.c
> drivers/input/keyboard/stmpe-keypad.c

I will look to the example later, thanks.

-- 
With Best Regards,
Andy Shevchenko
