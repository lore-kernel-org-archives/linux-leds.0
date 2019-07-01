From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 0/4] Add a generic driver for LED-based backlight
Date: Mon, 1 Jul 2019 17:14:19 +0200
Message-ID: <20190701151423.30768-1-jjhiblot@ti.com>
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

This series takes it from there and implements the binding that was
discussed in https://patchwork.kernel.org/patch/7293991/. In this new
binding the backlight device is a child of the LED controller instead of
being another platform device that uses a phandle to reference a LED.

Jean-Jacques Hiblot (2):
  leds: of: create a child device if the LED node contains a
    "compatible" string
  devicetree: Update led binding

Tomi Valkeinen (2):
  backlight: add led-backlight driver
  devicetree: Add led-backlight binding

 .../devicetree/bindings/leds/common.txt       |   3 +
 .../video/backlight/led-backlight.txt         |  39 ++++
 drivers/leds/led-class.c                      |  16 ++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 217 ++++++++++++++++++
 include/linux/leds.h                          |  11 +
 7 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1
