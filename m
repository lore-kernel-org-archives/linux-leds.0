From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Single gpio shared by LED and switch?
Date: Tue, 1 Sep 2015 19:00:54 +0200
Message-ID: <CAMuHMdVPvLgKfHh+d1Gx0W2FzqkJkqG8E93QuAHOS=SAJBZ-xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36826 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbbIARA4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2015 13:00:56 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi,

I'm wondering if there already exists a driver for a gpio that's connected
to both an LED and an input switch.

I'd expect such a hardware configuration to be fairly common, as gpios can be
a limited resource.
Most of the time the gpio would be in output mode, driving the LED, but at
regular intervals the mode would be changed for a very short moment to input,
to monitor the state of the switch.

I had a quick look at various drivers (and of course at
Documentation/gpio/drivers-on-gpio.txt), but couldn't find any.

Does such a hybrid of "leds-gpio" and "gpio-keys(-polled)" already exists?

Thanks in advance!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
