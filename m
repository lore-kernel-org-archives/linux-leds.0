From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Single gpio shared by LED and switch?
Date: Mon, 07 Sep 2015 15:03:50 +0200
Message-ID: <55ED8B36.60108@samsung.com>
References: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Geert,

On 09/01/2015 07:00 PM, Geert Uytterhoeven wrote:
> Hi,
>
> I'm wondering if there already exists a driver for a gpio that's connected
> to both an LED and an input switch.
>
> I'd expect such a hardware configuration to be fairly common, as gpios can be
> a limited resource.
> Most of the time the gpio would be in output mode, driving the LED, but at
> regular intervals the mode would be changed for a very short moment to input,
> to monitor the state of the switch.
>
> I had a quick look at various drivers (and of course at
> Documentation/gpio/drivers-on-gpio.txt), but couldn't find any.
>
> Does such a hybrid of "leds-gpio" and "gpio-keys(-polled)" already exists?

Can you share an example of such a circuit? Would it be possible to
construct it without additional GPIO driven transistor?

-- 
Best Regards,
Jacek Anaszewski
