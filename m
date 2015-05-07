From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/3] leds: leds-gpio: Allow compile test if !GPIOLIB
Date: Thu,  7 May 2015 10:08:07 +0200
Message-ID: <1430986090-7243-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-leds@vger.kernel.org

The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
functionality only, can still be compiled if GPIOLIB is not enabled.

This patch series allows compile testing of the leds-gpio driver if
GPIOLIB is not enabled. This requires adding a missing dummy to gpiolib,
and a missing include to leds-gpio.

This series follows the work started in the series "[PATCH 00/27] gpio:
Allow compile test of GPIO consumers if !GPIOLIB"
(https://lkml.org/lkml/2015/5/5/779), but can be applied independently.

The third patch depends on the first two patches, but it could be folded
into "[PATCH 09/27] leds: Allow compile test of GPIO consumers if
!GPIOLIB" of the series mentioned above, once its dependencies are
satisfied.

Thanks!

Geert Uytterhoeven (3):
  gpiolib: Add missing dummies for the unified device properties
    interface
  leds: leds-gpio: Add missing #include <linux/of.h>
  leds: leds-gpio: Allow compile test if !GPIOLIB

 drivers/leds/Kconfig          |  2 +-
 drivers/leds/leds-gpio.c      |  1 +
 include/linux/gpio/consumer.h | 15 +++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
