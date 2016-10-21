From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/10] gpio: gpio-i2cs: Document bindings of I2CS FPGA
 GPIO block
Date: Fri, 21 Oct 2016 10:59:25 +0200
Message-ID: <CACRpkdZ=mWYJpBV_WmxYcAwA5TdHM4qv9k17Jb6TnoOL4YAPHA@mail.gmail.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853669-22480-7-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-7-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.o>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 7, 2016 at 5:21 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> +This is virtual gpio driver, that maps each bit of the I2CS FPGA to
> +a gpio. It's used as a compatibility replacement for FRUs that use
> +I2CS FPGA to report presence, control and report power status in
> +the Juniper's driver infra that uses gpios. Compatible with any I2CS.

What does "virtual" mean?

I regularly NACK patches that try to shoehorn stuff into
GPIO not because they are actually GPIO hardware drivers or
general purpose at all, but because it is convenient. Don't do this.

> +- i2c-gpio-map: Map of "I2CS register" and "direction". The registers
> +       are 8 bit wide, each bit of the register is mapped to either
> +       input or output depending on the bits of the "direction". If
> +       the bit in the direction is 1, then that bit from the I2CS
> +       register is mapped to gpio input, otherwise to gpio output.

Does this mean that the hardware is synthesized so that some lines
are hardwired as input and some hardwired as output?

That again does not sound like "general purpose" at all.

I think this happens in other hardware and should be a generic
binding like

gpio-lines-input-only = <0>, <4>;
gpio-lines-output-only = <7>, <8>;

And no bitmasking, use the local offset, parse and construct the
mask.

Yours,
Linus Walleij
