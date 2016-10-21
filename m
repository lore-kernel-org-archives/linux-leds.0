From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/10] gpio: i2cs: Juniper I2CS to GPIO pin mapping driver
Date: Fri, 21 Oct 2016 10:41:56 +0200
Message-ID: <CACRpkdbBECP=39sdVEfHmcFv70bzdgpN90-sVHqRyCZifAYRUg@mail.gmail.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853669-22480-6-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-6-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.o>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 7, 2016 at 5:21 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> From: Guenter Roeck <groeck@juniper.net>
>
> This driver maps I2C slave register bits to GPIO pins. Registers
> are supposed to be 8 bit wide. Interrupt support is optional.
>
> The driver is implemented as client of the I2CS MFD driver.
>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Guenter Roeck <groeck@juniper.net>
> Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

This driver again has the same review comments as the two first
ones, GPIOLIB_IRQCHIP etc. Revise accordingly and repost
and I will look at it again.

(Interestingly this one uses BIT() properly.)

Yours,
Linus Walleij
