From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: =?UTF-8?q?=5BGIT=20PULL=5D=20LED=20updates=20for=204=2E8?=
Date: Mon, 25 Jul 2016 09:45:09 +0200
Message-ID: <1469432709-9402-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57289 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbcGYHpX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Jul 2016 03:45:23 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, afd@ti.com, hns@goldelico.com, tony.makkiel@daqri.com, zajec5@gmail.com, hkallweit1@gmail.com, linz@li-pro.net, preid@electromag.com.au

Hi Linus,

Please pull LED updates for 4.8 merge cycle.

There are interactions with the code outside LED subsystem,
which shouldn't cause any conflicts:
- update of drivers/Makefile
- update of disk activity trigger name in a number dts files

The following changes since commit 33688abb2802ff3a230bd2441f765477b94c=
c89e:

  Linux 4.7-rc4 (2016-06-19 21:30:02 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds=
=2Egit tags/leds_for_4.8

for you to fetch changes up to 5706c01fcfb313cef7aed6a283b43c5452cf8336=
:

  leds: is31fl32xx: define complete i2c_device_id table (2016-07-19 13:=
58:42 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
New LED class driver:
- LED driver for TI LP3952 6-Channel Color LED

LED core improvements:
- Only descend into leds directory when CONFIG_NEW_LEDS is set
- Add no-op gpio_led_register_device when LED subsystem is disabled
- MAINTAINERS: Add file patterns for led device tree bindings

LED Trigger core improvements:
- return error if invalid trigger name is provided via sysfs

LED class drivers improvements
- is31fl32xx: define complete i2c_device_id table
- is31fl32xx: fix typo in id and match table names
- leds-gpio: Set of_node for created LED devices
- pca9532: Add device tree support

Conversion of IDE trigger to common disk trigger:
- leds: convert IDE trigger to common disk trigger
- leds: documentation: 'ide-disk' to 'disk-activity'
- unicore32: use the new LED disk activity trigger
- parisc: use the new LED disk activity trigger
- mips: use the new LED disk activity trigger
- arm: use the new LED disk activity trigger
- powerpc: use the new LED disk activity trigger

----------------------------------------------------------------

Andrew F. Davis (2):
      leds: Add no-op gpio_led_register_device when LED subsystem is di=
sabled
      leds: Only descend into leds directory when CONFIG_NEW_LEDS is se=
t

Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for led device tree bindings

H. Nikolaus Schaller (2):
      leds: is31fl32xx: fix typo in id and match table names
      leds: is31fl32xx: define complete i2c_device_id table

Heiner Kallweit (1):
      leds: triggers: return error if invalid trigger name is provided =
via sysfs

Phil Reid (1):
      leds: pca9532: Add device tree support

Rafa=C5=82 Mi=C5=82ecki (1):
      leds: leds-gpio: Set of_node for created LED devices

Stephan Linz (7):
      leds: convert IDE trigger to common disk trigger
      leds: documentation: 'ide-disk' to 'disk-activity'
      powerpc: use the new LED disk activity trigger
      arm: use the new LED disk activity trigger
      mips: use the new LED disk activity trigger
      parisc: use the new LED disk activity trigger
      unicore32: use the new LED disk activity trigger

Tony Makkiel (1):
      leds: LED driver for TI LP3952 6-Channel Color LED

 Documentation/devicetree/bindings/leds/common.txt  |    4 +-
 .../devicetree/bindings/leds/leds-gpio.txt         |    4 +-
 .../devicetree/bindings/leds/leds-pca9532.txt      |   39 +++
 Documentation/laptops/asus-laptop.txt              |    2 +-
 Documentation/leds/leds-class.txt                  |    2 +-
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/am57xx-beagle-x15.dts            |    2 +-
 arch/arm/boot/dts/kirkwood-ns2lite.dts             |    2 +-
 arch/arm/boot/dts/kirkwood-topkick.dts             |    2 +-
 arch/arm/configs/collie_defconfig                  |    2 +-
 arch/arm/configs/ixp4xx_defconfig                  |    2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c           |    2 +-
 arch/arm/mach-omap1/board-osk.c                    |    2 +-
 arch/arm/mach-pxa/spitz.c                          |    2 +-
 arch/mips/configs/malta_qemu_32r6_defconfig        |    2 +-
 arch/mips/configs/maltaaprp_defconfig              |    2 +-
 arch/mips/configs/maltasmvp_eva_defconfig          |    2 +-
 arch/mips/configs/maltaup_defconfig                |    2 +-
 arch/mips/configs/rbtx49xx_defconfig               |    2 +-
 arch/mips/txx9/generic/setup.c                     |    2 +-
 arch/mips/txx9/rbtx4939/setup.c                    |    2 +-
 arch/parisc/configs/generic-32bit_defconfig        |    2 +-
 arch/parisc/configs/generic-64bit_defconfig        |    2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts              |    2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts              |    2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts              |    2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts              |    2 +-
 arch/powerpc/configs/pmac32_defconfig              |    2 +-
 arch/powerpc/configs/ppc6xx_defconfig              |    2 +-
 arch/unicore32/configs/unicore32_defconfig         |    2 +-
 arch/unicore32/kernel/gpio.c                       |    2 +-
 drivers/Makefile                                   |    2 +-
 drivers/ata/libata-core.c                          |    4 +
 drivers/ide/ide-disk.c                             |    2 +-
 drivers/leds/Kconfig                               |   14 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/led-triggers.c                        |    2 +
 drivers/leds/leds-gpio.c                           |    5 +-
 drivers/leds/leds-hp6xx.c                          |    2 +-
 drivers/leds/leds-is31fl32xx.c                     |   24 +-
 drivers/leds/leds-lp3952.c                         |  301 ++++++++++++=
++++++++
 drivers/leds/leds-pca9532.c                        |   75 ++++-
 drivers/leds/trigger/Kconfig                       |    8 +-
 drivers/leds/trigger/Makefile                      |    2 +-
 .../trigger/{ledtrig-ide-disk.c =3D> ledtrig-disk.c} |   19 +-
 drivers/macintosh/Kconfig                          |   13 +-
 drivers/macintosh/via-pmu-led.c                    |    4 +-
 include/dt-bindings/leds/leds-pca9532.h            |   18 ++
 include/linux/leds-lp3952.h                        |  125 ++++++++
 include/linux/leds-pca9532.h                       |    9 +-
 include/linux/leds.h                               |   14 +-
 51 files changed, 669 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532=
=2Etxt
 create mode 100644 drivers/leds/leds-lp3952.c
 rename drivers/leds/trigger/{ledtrig-ide-disk.c =3D> ledtrig-disk.c} (=
55%)
 create mode 100644 include/dt-bindings/leds/leds-pca9532.h
 create mode 100644 include/linux/leds-lp3952.h
