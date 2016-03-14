From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED subsystem updates for 4.6
Date: Mon, 14 Mar 2016 11:24:57 +0100
Message-ID: <1457951097-27079-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41093 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbcCNKZW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 14 Mar 2016 06:25:22 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, amitoj1606@gmail.com, ao2@ao2.it, drivshin@allworx.com, geert+renesas@glider.be, hkallweit1@gmail.com, stefan.wahren@i2se.com, yongjun_wei@trendmicro.com.cn

Hi Linus,

Please pull LED updates for 4.6 merge cycle.

The following changes since commit b562e44f507e863c6792946e4e1b1449fbbac85d:

  Linux 4.5 (2016-03-13 21:28:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.6

for you to fetch changes up to 7296c33ed12ef13de50e03c76643382123766f96:

  leds: triggers: simplify led_trigger_store (2016-03-14 09:22:23 +0100)

----------------------------------------------------------------
LED core improvements:

- Fix misleading comment after workqueue removal from drivers.

- Avoid error message when a USB LED device is unplugged.

- Add helpers for calling brightness_set(_blocking)

LED triggers:

- Simplify led_trigger_store by using sysfs_streq().

LED class drivers improvements:

- Improve wording and formatting in a comment: lp3944.

- Fix return value check in create_gpio_led(): leds-gpio.

- Use GPIOF_OUT_INIT_LOW instead of hardcoded zero: leds-gpio.

- Use devm_led_classdev_register(): leds-lm3533, leds-lm3533, leds-lp8788,
  leds-wm831x-status, leds-s3c24xx, leds-s3c24xx, leds: max8997.

New LED class driver:

- Add driver for the ISSI IS31FL32xx family of LED controllers.

Device Tree documentation:

- of: Add vendor prefixes for Integrated Silicon Solutions Inc. (issi)
  and Si-En Technology (si-en).

- DT: Add common bindings for Si-En Technology SN3216/18 and IS31FL32xx
  family of LED controllers, since they seem to be the same hardware,
  just rebranded.

----------------------------------------------------------------
Amitoj Kaur Chawla (7):
      leds: lm3533: Use devm_led_classdev_register
      leds: 88pm860x: Use devm_led_classdev_register
      leds: lp8788: Use devm_led_classdev_register
      leds: wm831x-status: Use devm_led_classdev_register
      leds: s3c24xx: Use devm_led_classdev_register
      leds: da903x: Use devm_led_classdev_register
      leds: max8997: Use devm_led_classdev_register

Antonio Ospite (1):
      leds: lp3944: improve wording and formatting in a comment

David Rivshin (4):
      DT: Add vendor prefix for Integrated Silicon Solutions Inc.
      DT: leds: Add binding for the ISSI IS31FL32xx family of LED controllers
      leds: Add driver for the ISSI IS31FL32xx family of LED controllers
      leds: Add SN3218 and SN3216 support to the IS31FL32XX driver

Geert Uytterhoeven (1):
      leds: gpio: Use GPIOF_OUT_INIT_LOW instead of hardcoded zero

Heiner Kallweit (4):
      leds: core: fix misleading comment after workqueue removal from drivers
      leds: core: avoid error message when a USB LED device is unplugged
      leds: core: add helpers for calling brightness_set(_blocking)
      leds: triggers: simplify led_trigger_store

Stefan Wahren (1):
      of: Add vendor prefix for Si-En Technology

Wei Yongjun (1):
      leds: leds-gpio: Fix return value check in create_gpio_led()

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |   52 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    2 +
 drivers/leds/Kconfig                               |    8 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/led-class.c                           |    2 +
 drivers/leds/led-core.c                            |   45 +-
 drivers/leds/led-triggers.c                        |   13 +-
 drivers/leds/leds-88pm860x.c                       |   12 +-
 drivers/leds/leds-da903x.c                         |   12 +-
 drivers/leds/leds-gpio.c                           |    6 +-
 drivers/leds/leds-is31fl32xx.c                     |  508 ++++++++++++++++++++
 drivers/leds/leds-lm3533.c                         |   12 +-
 drivers/leds/leds-lp3944.c                         |    7 +-
 drivers/leds/leds-lp8788.c                         |   14 +-
 drivers/leds/leds-max8997.c                        |   14 +-
 drivers/leds/leds-s3c24xx.c                        |   19 +-
 drivers/leds/leds-wm831x-status.c                  |   13 +-
 include/linux/leds.h                               |    8 +-
 18 files changed, 628 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
 create mode 100644 drivers/leds/leds-is31fl32xx.c
