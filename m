From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 0/4]  Add a generic driver for LED-based backlight
Date: Wed, 10 Jul 2019 14:39:28 +0200
Message-ID: <20190710123932.28244-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>
List-Id: linux-leds@vger.kernel.org

This series aims to add a led-backlight driver, similar to pwm-backlight,
but using a LED class device underneath.

A few years ago (2015), Tomi Valkeinen posted a series implementing a
backlight driver on top of a LED device:
https://patchwork.kernel.org/patch/7293991/
https://patchwork.kernel.org/patch/7294001/
https://patchwork.kernel.org/patch/7293981/

The discussion stopped because Tomi lacked the time to work on it.

changes in v3:
- dt binding: don't limit the brightness range to 0-255. Use the range of
  the underlying LEDs. as a side-effect, all LEDs must now have the same
  range
- driver: Adapt to dt binding update.
- driver: rework probe() for clarity and remove the remaining goto.

changes in v2:
- handle more than one LED.
- don't make the backlight device a child of the LED controller.
- make brightness-levels and default-brightness-level optionnal
- removed the option to use a GPIO enable.
- removed the option to use a regulator. It should be handled by the LED core
- don't make any change to the LED core (not needed anymore)

Jean-Jacques Hiblot (2):
  leds: Add managed API to get a LED from a device driver
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../bindings/leds/backlight/led-backlight.txt |  28 ++
 drivers/leds/led-class.c                      |  92 ++++++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1
