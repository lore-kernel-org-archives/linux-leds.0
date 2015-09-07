From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Single gpio shared by LED and switch?
Date: Mon, 7 Sep 2015 15:22:44 +0200
Message-ID: <CAMuHMdUrhrJv_3UX32AMC2Z_f4xp+LABgDCjgWdcJFa6=k9n_g@mail.gmail.com>
References: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
	<55ED8B36.60108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35259 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbbIGNWp (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 09:22:45 -0400
In-Reply-To: <55ED8B36.60108@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

On Mon, Sep 7, 2015 at 3:03 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 09/01/2015 07:00 PM, Geert Uytterhoeven wrote:
>> I'm wondering if there already exists a driver for a gpio that's connected
>> to both an LED and an input switch.
>>
>> I'd expect such a hardware configuration to be fairly common, as gpios can
>> be
>> a limited resource.
>> Most of the time the gpio would be in output mode, driving the LED, but at
>> regular intervals the mode would be changed for a very short moment to
>> input,
>> to monitor the state of the switch.
>>
>> I had a quick look at various drivers (and of course at
>> Documentation/gpio/drivers-on-gpio.txt), but couldn't find any.
>>
>> Does such a hybrid of "leds-gpio" and "gpio-keys(-polled)" already exists?
>
> Can you share an example of such a circuit? Would it be possible to

Something like this?

                     VCC         VCC
                      |           |
                      R           R
                      |           |
              __|__   |           |
          +---o   o---+          _|_
          |           |          \ /
          |           |          ---
         GND          R           |
                      |           |
                      |         |-+
                      |         |<+
GPIO -----------------+---------|-|
                                  |
                                  |
                                 GND

> construct it without additional GPIO driven transistor?

Perhaps just like this?

                     VCC
                      |
                      R
                      |
                      |
                     _|_
                     \ /
                     ---
                      |
                      |
GPIO -----R-----------+
                      |
                      |
                    | o
                   -|
                    | o
                      |
                      |
                     GND

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
