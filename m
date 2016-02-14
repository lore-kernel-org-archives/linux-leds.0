From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Sun, 14 Feb 2016 14:18:23 +0100
Message-ID: <CACRpkdZ18LMdqfuE3Wju5p5BC39qSLUCX9+_kCEB-OR9+mTM7Q@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
	<CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
	<56AA2C30.2040708@ti.com>
	<CAHp75Vd_CxDmPbFWX7jaNd=ukOdE2hN13RhhMC5D+H_grM_Xiw@mail.gmail.com>
	<CACRpkdbh3coAedusUHgEZQu=3WkVyS4JW6=jUWAtbSxgUVhNiw@mail.gmail.com>
	<CAHp75VfTofe13JCcJmFq=yex7zRdmzTSMMSX8Tap5cBZ80rJ2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36561 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452AbcBNNSX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 14 Feb 2016 08:18:23 -0500
Received: by mail-ob0-f174.google.com with SMTP id gc3so79226313obb.3
        for <linux-leds@vger.kernel.org>; Sun, 14 Feb 2016 05:18:23 -0800 (PST)
In-Reply-To: <CAHp75VfTofe13JCcJmFq=yex7zRdmzTSMMSX8Tap5cBZ80rJ2Q@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Andrew F. Davis" <afd@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 10, 2016 at 3:29 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Feb 10, 2016 at 4:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Sun, Jan 31, 2016 at 11:52 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>
>>> It reminds me how 12 channel PWM chip is used on Intel Galileo Gen 2.
>>> Half pins are PWM, the other half is GPIO used for discrete based pin
>>> muxing and control. Nevertheless I think it's a userspace issue for
>>> now, otherwise we have to provide some 'semi-virtual' way of
>>> presenting pins as GPIO lines.
>>
>> That sounds like an MFD spawning a GPIO and a PWM cell.
>> That it is called "a PWM chip" is no big deal, it should be
>> modeled according to what it is, not what it claims to be.
>
> Although I agree with model I barely imagine how in this case drivers
> should access PWM chip registers in non-race way (take into account
> that PWM itself is connected to i2c bus).

There is a pattern for that. You add a set of accessor functions that
performs the I2C traffic in the MFD layer.

The accessor functions take a mutex. Since this is all slowpath,
waiting/preempting in a mutex is perfectly fine for all subdrivers.

Look at this:

/**
 * stmpe_reg_write() - write a single STMPE register
 * @stmpe:      Device to write to
 * @reg:        Register to write
 * @val:        Value to write
 */
int stmpe_reg_write(struct stmpe *stmpe, u8 reg, u8 val)
{
        int ret;

        mutex_lock(&stmpe->lock);
        ret = __stmpe_reg_write(stmpe, reg, val);
        mutex_unlock(&stmpe->lock);

        return ret;
}
EXPORT_SYMBOL_GPL(stmpe_reg_write);

Yours,
Linus Walleij
