From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED subsystem updates for 4.3
Date: Mon, 31 Aug 2015 14:08:06 +0200
Message-ID: <1441022886-9594-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42815 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752999AbbHaMIf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 31 Aug 2015 08:08:35 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

In this merge window we'd like to announce a change on the list of
LED subsystem maintainers - Bryan Wu decided to step back and handed
over the maintainership to me (Jacek Anaszewski), which entailed
an update of LED subsystem git tree URL.


The following changes since commit c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b:

  Linux 4.2-rc8 (2015-08-23 20:52:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.3

for you to fetch changes up to 4d59ed85451befda203d72462f1b7ead0fde3267:

  leds: Export OF module alias information in missing drivers (2015-08-28 14:06:30 +0200)

----------------------------------------------------------------
Besides the changes in MAINTAINERS we have:

- optimizations and improvements to existing LED class drivers
- improvements to the common LEDs DT documentation
- modifications of kirkwood-* dts files, to be in sync with patches for
  leds-ns2 driver, that move LEDs mode mapping outside of the driver

----------------------------------------------------------------
Axel Lin (2):
      leds: lp8860: Constify reg_default tables
      leds: tlc591xx: Remove redundant I2C_FUNC_SMBUS_BYTE_DATA functionality check

Bjorn Andersson (1):
      leds: syscon: Correct check for syscon_node_to_regmap() errors

Geert Uytterhoeven (2):
      leds: Allow compile test of GPIO consumers if !GPIOLIB
      leds: Allow compile test of LEDS_AAT1290 and LEDS_KTD2692 if !GPIOLIB

Jacek Anaszewski (2):
      DT: leds: Improve description of flash LEDs related properties
      MAINTAINERS: Change LED subsystem git tree URL

Javier Martinez Canillas (1):
      leds: Export OF module alias information in missing drivers

Krzysztof Kozlowski (1):
      leds: Drop owner assignment from i2c_driver

Milo Kim (1):
      leds:lp55xx: use the private data instead of updating I2C device platform data

Ricardo Ribalda Delgado (1):
      leds/led-class: Add missing put_device()

Simon Guinot (2):
      leds: leds-ns2: handle can_sleep GPIOs
      leds: leds-ns2: depends on MACH_ARMADA_370

Vaishali Thakkar (1):
      leds: leds-fsg: Use devm_led_classdev_register

Vincent Donnefort (2):
      leds: leds-ns2: move LED modes mapping outside of the driver
      ARM: Kirkwood: add modes-map property to ns2-leds nodes

 Documentation/devicetree/bindings/leds/common.txt  |   27 ++--
 .../devicetree/bindings/leds/leds-ns2.txt          |    9 ++
 MAINTAINERS                                        |    3 +-
 arch/arm/boot/dts/kirkwood-d2net.dts               |    5 +
 arch/arm/boot/dts/kirkwood-is2.dts                 |    5 +
 arch/arm/boot/dts/kirkwood-ns2.dts                 |    5 +
 arch/arm/boot/dts/kirkwood-ns2max.dts              |    5 +
 arch/arm/boot/dts/kirkwood-ns2mini.dts             |    5 +
 drivers/leds/Kconfig                               |   19 ++-
 drivers/leds/led-class.c                           |    7 +-
 drivers/leds/leds-fsg.c                            |   52 ++----
 drivers/leds/leds-lm3530.c                         |    1 -
 drivers/leds/leds-lm355x.c                         |    1 -
 drivers/leds/leds-lm3642.c                         |    1 -
 drivers/leds/leds-lp5521.c                         |   11 +-
 drivers/leds/leds-lp5523.c                         |   11 +-
 drivers/leds/leds-lp5562.c                         |   11 +-
 drivers/leds/leds-lp55xx-common.c                  |   13 +-
 drivers/leds/leds-lp55xx-common.h                  |    4 +-
 drivers/leds/leds-lp8501.c                         |   11 +-
 drivers/leds/leds-lp8860.c                         |    4 +-
 drivers/leds/leds-ns2.c                            |  169 ++++++++++++--------
 drivers/leds/leds-pca955x.c                        |    1 -
 drivers/leds/leds-pca963x.c                        |    2 +-
 drivers/leds/leds-syscon.c                         |    4 +-
 drivers/leds/leds-tca6507.c                        |    2 +-
 drivers/leds/leds-tlc591xx.c                       |    4 -
 drivers/leds/trigger/Kconfig                       |    2 +-
 include/dt-bindings/leds/leds-ns2.h                |    8 +
 include/linux/platform_data/leds-kirkwood-ns2.h    |   14 ++
 30 files changed, 240 insertions(+), 176 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-ns2.h
