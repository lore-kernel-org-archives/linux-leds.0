From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Mon, 1 Feb 2016 00:52:43 +0200
Message-ID: <CAHp75Vd_CxDmPbFWX7jaNd=ukOdE2hN13RhhMC5D+H_grM_Xiw@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
	<CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
	<56AA2C30.2040708@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56AA2C30.2040708@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Jan 28, 2016 at 4:56 PM, Andrew F. Davis <afd@ti.com> wrote:
> On 01/28/2016 04:47 AM, Linus Walleij wrote:

>> So the TI datasheet says:
>> "8 bit LED driver with I2C interface"
>>
>> So it is *not* "general purpose input/output" (GPIO).
>>
>> It is special purpose LED drive output-only circuit.
>>
>> So why can it not have a driver directly in drivers/leds/*?
>>
>> I understand that it can also be used as a GPIO (and that it
>> is then nice to put leds-gpio on top of it) but then
>> I want a reference to the hardware that actually went ahead
>> and used this as a GPIO chip rather than using a proper
>> GPIO expander.

> These don't really have the traditional LED features (current control=
,
> HW blinking, etc), and all the use cases I've found treat them as GPO=
,
> including our Industrial Dev Kits=E2=80=A6

It reminds me how 12 channel PWM chip is used on Intel Galileo Gen 2.
Half pins are PWM, the other half is GPIO used for discrete based pin
muxing and control. Nevertheless I think it's a userspace issue for
now, otherwise we have to provide some 'semi-virtual' way of
presenting pins as GPIO lines.

just my 2 cents.

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
