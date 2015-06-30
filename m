From: Bryan Wu <cooloney@gmail.com>
Subject: [GIT PULL] LED subsystem updates for 4.2
Date: Tue, 30 Jun 2015 11:24:46 -0700
Message-ID: <CAK5ve-K7j8P9XtK+coL7pig5Y3_8gD3oymhfikXZTS1nk1ToFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

In this cycle, we finished to merge patches for LED Flash class
driver. Other than that we have some bug fixes and new drivers for LED
controllers.

So please consider to pull the following changes since commit
5ebe6afaf0057ac3eaeb98defd5456894b446d22:

  Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git=
 for-next

for you to fetch changes up to b67893206fc0a0e8af87130e67f3d8ae553fc87c=
:

  leds:lp55xx: fix firmware loading error (2015-06-29 10:10:57 -0700)

----------------------------------------------------------------
Andrew Lunn (2):
      leds: tlc591xx: Document binding for the TI 8/16 Channel i2c LED =
driver
      leds: tlc591xx: Driver for the TI 8/16 Channel i2c LED driver

Geert Uytterhoeven (3):
      gpiolib: Add missing dummies for the unified device properties in=
terface
      leds: leds-gpio: Add missing #include <linux/of.h>
      leds: leds-gpio: Allow compile test if !GPIOLIB

Ingi Kim (3):
      of: Add vendor prefix for Kinetic technologies
      leds: ktd2692: add device tree bindings for ktd2692
      leds: Add ktd2692 flash LED driver

Jacek Anaszewski (11):
      leds: gpio: Fix error handling for led name null pointer case
      leds: unify the location of led-trigger API
      leds: Add support for max77693 mfd flash cell
      DT: Add documentation for the Skyworks AAT1290
      leds: Add driver for AAT1290 flash LED controller
      Documentation: leds: Add description of v4l2-flash sub-device
      media: Add registration helpers for V4L2 flash sub-devices
      leds: max77693: add support for V4L2 Flash sub-device
      DT: aat1290: Document handling external strobe sources
      leds: aat1290: add support for V4L2 Flash sub-device
      leds: fix max77693-led build errors

Milo Kim (1):
      leds:lp55xx: fix firmware loading error

Paul Gortmaker (1):
      drivers/leds: don't use module_init in non-modular leds-cobalt-ra=
q.c

Randy Dunlap (1):
      leds: fix aat1290 build errors

Sakari Ailus (1):
      v4l: async: Add a pointer to of_node to struct v4l2_subdev, match=
 it

Sebastian Hesselbarth (1):
      leds: gpio: Fix device teardown on probe deferral

Stas Sergeev (1):
      leds: fix brightness changing when software blinking is active

Toshi Kikuchi (2):
      leds: lp5523: add master_fader support
      Documentation: leds-lp5523: describe master fader attributes

Uwe Kleine-K=C3=B6nig (2):
      leds: ktd2692: pass flags parameter to devm_gpiod_get
      leds: aat1290: pass flags parameter to devm_gpiod_get

=C3=81lvaro Fern=C3=A1ndez Rojas (4):
      leds: add DT binding for BCM6328 LED controller
      leds: add BCM6328 LED driver
      leds: add DT binding for BCM6358 LED controller
      leds: add BCM6358 LED driver

 .../devicetree/bindings/leds/leds-aat1290.txt      |   73 ++
 .../devicetree/bindings/leds/leds-bcm6328.txt      |  309 ++++++
 .../devicetree/bindings/leds/leds-bcm6358.txt      |  145 +++
 .../devicetree/bindings/leds/leds-ktd2692.txt      |   50 +
 .../devicetree/bindings/leds/leds-tlc591xx.txt     |   40 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 Documentation/leds/leds-class-flash.txt            |   51 +
 Documentation/leds/leds-lp5523.txt                 |   30 +
 drivers/leds/Kconfig                               |   57 +-
 drivers/leds/Makefile                              |    6 +
 drivers/leds/led-class.c                           |    5 +
 drivers/leds/led-core.c                            |    5 +-
 drivers/leds/leds-aat1290.c                        |  576 ++++++++++
 drivers/leds/leds-bcm6328.c                        |  413 ++++++++
 drivers/leds/leds-bcm6358.c                        |  243 +++++
 drivers/leds/leds-cobalt-raq.c                     |   15 +-
 drivers/leds/leds-gpio.c                           |   12 +-
 drivers/leds/leds-ktd2692.c                        |  443 ++++++++
 drivers/leds/leds-lp5523.c                         |  148 +++
 drivers/leds/leds-lp55xx-common.c                  |    2 +-
 drivers/leds/leds-max77693.c                       | 1097 ++++++++++++=
++++++++
 drivers/leds/leds-tlc591xx.c                       |  300 ++++++
 drivers/leds/leds.h                                |   24 -
 drivers/media/v4l2-core/Kconfig                    |   11 +
 drivers/media/v4l2-core/Makefile                   |    2 +
 drivers/media/v4l2-core/v4l2-async.c               |   39 +-
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |  710 ++++++++++++=
+
 include/linux/gpio/consumer.h                      |   15 +
 include/linux/leds.h                               |   25 +
 include/media/v4l2-flash-led-class.h               |  148 +++
 include/media/v4l2-subdev.h                        |    2 +
 31 files changed, 4939 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6358=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591x=
x.txt
 create mode 100644 drivers/leds/leds-aat1290.c
 create mode 100644 drivers/leds/leds-bcm6328.c
 create mode 100644 drivers/leds/leds-bcm6358.c
 create mode 100644 drivers/leds/leds-ktd2692.c
 create mode 100644 drivers/leds/leds-max77693.c
 create mode 100644 drivers/leds/leds-tlc591xx.c
 create mode 100644 drivers/media/v4l2-core/v4l2-flash-led-class.c
 create mode 100644 include/media/v4l2-flash-led-class.h
