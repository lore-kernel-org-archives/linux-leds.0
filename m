From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [GIT PULL] LED updates for 4.7
Date: Mon, 16 May 2016 10:40:49 +0200
Message-ID: <1463388049-20613-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, ezequiel@vanguardiasur.com.ar, martin.dummer@gmx.net, dan.carpenter@oracle.com, boris.brezillon@free-electrons.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 4.7 merge cycle.

In this merge cycle we had an interaction with MTD subsystem, that
included converting drivers/mtd/nand/nand_base.c to use newly introduced
MTD (NAND/NOR) LED trigger instead of implementing it on its own.

Related MTD patches are intended to be merged through the LED tree,
before MTD tree is merged, since further MTD development is based on
those modifications.

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next

for you to fetch changes up to 80d6737b27bbdf645a815c136606836b435f0268:

  leds: gpio: Support the "panic-indicator" firmware property (2016-05-06 10:26:07 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LEDs:
- Introduce a kernel panic LED trigger

- Introduce a MTD (NAND/NOR) trigger

- led-tca6507: silence an uninitialized variable warning

- ledtrig-ide-disk: Move ide_blink_delay to ledtrig_ide_activity()

- leds-ss4200: Add depend on x86 arch

- leds-ss4200: add DMI data for FSC SCALEO Home Server

- leds-triggers: Allow to switch the trigger to "panic" on a kernel panic

- devicetree: leds: Introduce "panic-indicator" optional property

- leds-gpio: Support the "panic-indicator" firmware property

MTD:
- Uninline mtd_write_oob and move it to mtdcore.c

- Remove the "nand-disk" LED trigger

- Hook I/O activity to the MTD LED trigger

----------------------------------------------------------------
Dan Carpenter (1):
      leds: tca6507: silence an uninitialized variable warning

Ezequiel Garcia (8):
      leds: trigger: Introduce a kernel panic LED trigger
      mtd: Uninline mtd_write_oob and move it to mtdcore.c
      leds: trigger: Introduce a MTD (NAND/NOR) trigger
      mtd: nand: Remove the "nand-disk" LED trigger
      mtd: Hook I/O activity to the MTD LED trigger
      leds: triggers: Allow to switch the trigger to "panic" on a kernel panic
      devicetree: leds: Introduce "panic-indicator" optional property
      leds: gpio: Support the "panic-indicator" firmware property

Jacek Anaszewski (1):
      leds: ledtrig-ide-disk: Move ide_blink_delay to ledtrig_ide_activity()

Martin Dummer (2):
      leds: ss4200: Add depend on x86 arch
      leds: ss4200: add DMI data for FSC SCALEO Home Server

 Documentation/devicetree/bindings/leds/common.txt  |    3 +
 .../devicetree/bindings/leds/leds-gpio.txt         |    2 +
 drivers/leds/Kconfig                               |    5 +-
 drivers/leds/led-triggers.c                        |    2 +-
 drivers/leds/leds-gpio.c                           |    4 +
 drivers/leds/leds-ss4200.c                         |   13 ++++
 drivers/leds/leds-tca6507.c                        |    2 +
 drivers/leds/leds.h                                |    1 +
 drivers/leds/trigger/Kconfig                       |   18 +++++
 drivers/leds/trigger/Makefile                      |    2 +
 drivers/leds/trigger/ledtrig-ide-disk.c            |    3 +-
 drivers/leds/trigger/ledtrig-mtd.c                 |   45 ++++++++++++
 drivers/leds/trigger/ledtrig-panic.c               |   77 ++++++++++++++++++++
 drivers/mtd/mtdcore.c                              |   19 +++++
 drivers/mtd/nand/nand_base.c                       |   29 +-------
 include/linux/leds.h                               |    8 ++
 include/linux/mtd/mtd.h                            |   12 +--
 17 files changed, 202 insertions(+), 43 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
 create mode 100644 drivers/leds/trigger/ledtrig-panic.c
