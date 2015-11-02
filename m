From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: =?UTF-8?q?=5BGIT=20PULL=5D=20LED=20subsystem=20updates=20for=204=2E4?=
Date: Mon, 02 Nov 2015 14:27:46 +0100
Message-ID: <1446470866-26021-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42649 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752213AbbKBN2A (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2015 08:28:00 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, falakreyaz@gmail.com, ralf@linux-mips.org, jiri.prchal@aksignal.cz, simon.guinot@sequanux.org, noltari@gmail.com, hs@denx.de, fmthoker@gmail.com, ingi2.kim@samsung.com, Julia.Lawall@lip6.fr

Hi Linus,

Please pull LED updates for 4.4 merge cycle.

The following changes since commit 91ca3ce1b61f9bd86dcb31378e565e4cdcac=
1e1c:

  Linux 4.3-rc7 (2015-10-28 12:12:17 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds=
=2Egit tags/leds_for_4.4

for you to fetch changes up to 861497527cda51cb27118cc9a726797401b5cfff=
:

  leds: 88pm860x: add missing of_node_put (2015-10-28 12:12:30 +0100)

----------------------------------------------------------------
- Move the out-of-LED-tree led-sead3 driver to the LED subsystem.

- Add 'invert' sysfs attribute to the heartbeat trigger.

- Add Device Tree support to the leds-netxbig driver and add
  related DT nodes to the kirkwood-netxbig.dtsi and kirkwood-net5big.dt=
s
  files. Remove static LED setup from the related board files.

- Remove redundant brightness conversion operation from leds-netxbig.

- Improve leds-bcm6328 driver: improve default-state handling, add more
  init configuration options, print invalid LED instead of warning only
  about maximum LED value.

- Add a shutdown function for setting gpio-leds into off state
  when shutting down.

- Fix DT flash timeout property naming in leds-aat1290.txt.

- Switch to using devm prefixed version of led_classdev_register()
  (leds-cobalt-qube, leds-hp6xx, leds-ot200, leds-ipaq-micro,
   leds-netxbig, leds-locomo, leds-menf21bmc, leds-net48xx,
   leds-wrap).

- Add missing of_note_put (leds-powernv, leds-bcm6358, leds-bcm6328,
  leds-88pm860x.c).

- Coding style fixes and cleanups: led-class/led-core, leds-ipaq-micro.

----------------------------------------------------------------

Thanks,
Jacek Anaszewski

=46ida Mohammad (2):
      leds: leds-locomo.c: Use devm_led_classdev_register
      leds: leds-wrap.c: Use devm_led_classdev_register

Heiko Schocher (1):
      leds: leds-gpio: add shutdown function

Ingi Kim (1):
      leds: aat1290: Fix property naming of flash-timeout-us

Jacek Anaszewski (1):
      leds: core: Move LED core callbacks out of led-class.c

Jiri Prchal (1):
      leds: triggers: add invert to heartbeat

Julia Lawall (4):
      powerpc/powernv: add missing of_node_put
      leds: bcm6358: add missing of_node_put
      leds: bcm6328: add missing of_node_put
      leds: 88pm860x: add missing of_node_put

Muhammad Falak R Wani (6):
      leds: leds-hp6xx: Use devm_led_classdev_register
      leds: leds-ot200: Use devm_led_classdev_register
      leds: leds-ipaq-micro: Use devm_led_classdev_register
      leds: leds-ipaq-micro: Fix coding style issues
      leds: leds-menf21bmc.c: Use devm_led_class_register
      leds: leds-net48xx: Use devm_led_classdev_register

Ralf Baechle (1):
      LED/MIPS: Move SEAD3 LED driver to where it belongs.

Simon Guinot (5):
      leds: netxbig: add device tree binding
      ARM: Kirkwood: add LED DT entries for netxbig boards
      ARM: mvebu: remove static LED setup for netxbig boards
      leds: netxbig: convert to use the devm_ functions
      leds: netxbig: set led_classdev max_brightness

Vaishali Thakkar (1):
      leds: leds-cobalt-qube: Use devm_led_classdev_register

=C3=81lvaro Fern=C3=A1ndez Rojas (4):
      leds-bcm6328: print invalid LED
      leds-bcm6328: simplify and improve default-state handling
      leds-bcm6328: add more init configuration options
      Documentation: leds: update DT bindings for leds-bcm6328

 .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |   22 ++
 .../devicetree/bindings/leds/leds-aat1290.txt      |    8 +-
 .../devicetree/bindings/leds/leds-bcm6328.txt      |   10 +
 .../devicetree/bindings/leds/leds-netxbig.txt      |   92 ++++++
 arch/arm/boot/dts/kirkwood-net5big.dts             |   60 ++++
 arch/arm/boot/dts/kirkwood-netxbig.dtsi            |   80 +++++
 arch/arm/mach-mvebu/Kconfig                        |    7 -
 arch/arm/mach-mvebu/Makefile                       |    1 -
 arch/arm/mach-mvebu/board.h                        |   21 --
 arch/arm/mach-mvebu/kirkwood.c                     |    4 -
 arch/arm/mach-mvebu/netxbig.c                      |  191 -----------
 arch/mips/mti-sead3/Makefile                       |    2 -
 drivers/leds/Kconfig                               |   10 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/led-class.c                           |   69 +---
 drivers/leds/led-core.c                            |   73 +++++
 drivers/leds/leds-88pm860x.c                       |    1 +
 drivers/leds/leds-bcm6328.c                        |   45 ++-
 drivers/leds/leds-bcm6358.c                        |    4 +-
 drivers/leds/leds-cobalt-qube.c                    |   23 +-
 drivers/leds/leds-gpio.c                           |   13 +
 drivers/leds/leds-hp6xx.c                          |   17 +-
 drivers/leds/leds-ipaq-micro.c                     |   27 +-
 drivers/leds/leds-locomo.c                         |   15 +-
 drivers/leds/leds-menf21bmc.c                      |   26 +-
 drivers/leds/leds-net48xx.c                        |    9 +-
 drivers/leds/leds-netxbig.c                        |  336 ++++++++++++=
+++-----
 drivers/leds/leds-ot200.c                          |   21 +-
 drivers/leds/leds-powernv.c                        |    8 +-
 {arch/mips/mti-sead3 =3D> drivers/leds}/leds-sead3.c |    1 +
 drivers/leds/leds-wrap.c                           |   28 +-
 drivers/leds/leds.h                                |    1 +
 drivers/leds/trigger/ledtrig-heartbeat.c           |   47 ++-
 include/dt-bindings/leds/leds-netxbig.h            |   18 ++
 .../linux/platform_data/leds-kirkwood-netxbig.h    |    1 +
 35 files changed, 760 insertions(+), 532 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio=
-ext.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig=
=2Etxt
 delete mode 100644 arch/arm/mach-mvebu/board.h
 delete mode 100644 arch/arm/mach-mvebu/netxbig.c
 rename {arch/mips/mti-sead3 =3D> drivers/leds}/leds-sead3.c (99%)
 create mode 100644 include/dt-bindings/leds/leds-netxbig.h
