From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds: gpio: set led_dat->gpiod pointer for OF defined
 GPIO leds
Date: Thu, 25 Oct 2018 14:55:20 +0200
Message-ID: <CACRpkdaHBf1eJig5t2_u89HhKb2Ne8FV1AhfdZ3Yy_XTZQdEqw@mail.gmail.com>
References: <20181018001432.710-1-liviu@dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018001432.710-1-liviu@dudau.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: liviu@dudau.co.uk
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Oct 18, 2018 at 2:14 AM Liviu Dudau <liviu@dudau.co.uk> wrote:

> Commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> removed the common code path that set the led_dat->gpiod pointer in
> create_gpio_led(), but only added it back for the devices that have
> a valid gpio_led_platform_data structure. Calling gpio_leds_create()
> in gpio_led_probe() is not enough to get a valid gpiod pointer.
>
> Fortunately enough, gpio_leds_create() already gets the needed pointer,
> we just need to assign it to the relevant gpio_led_data structure.
>
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>

Ooops
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
