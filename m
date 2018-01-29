From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.16-rc1
Date: Mon, 29 Jan 2018 22:34:36 +0100
Message-ID: <1517261676-4352-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, arnd@arndb.de, ben.whitten@gmail.com, dmurphy@ti.com, fabio.estevam@nxp.com, geert+renesas@glider.be, shuahkh@osg.samsung.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 4.16-rc1.

New LED class driver:
  - Introduce LM3692x dual string driver

New LED trigger:
  - Introduce a NETDEV trigger

leds-lp8860:
  - Various fixes to align with LED framework
  - Add regulator enable during init
  - DT support related improvements

Minor fixes and cleanups to the LED class drivers:
  - leds-pwm
  - ledtrig-activity
  - leds-blinkm
  - leds-as3645a
  - ledtrig-transient


The following changes since commit b2cd1df66037e7c4697c7e40496bf7e4a5e16a2d:

  Linux 4.15-rc7 (2018-01-07 14:22:41 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds_for_4.16-rc1

for you to fetch changes up to 6a836631e303cec7fd9469ae53a4d97d0360eb38:

  leds: ledtrig-transient: Add SPDX license identifiers (2018-01-11 21:24:17 +0100)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 4.16-rc1
----------------------------------------------------------------
Arnd Bergmann (1):
      leds: blinkm: avoid uninitialized data use

Ben Whitten (1):
      leds: trigger: Introduce a NETDEV trigger

Dan Murphy (12):
      leds: lp8860: Fix linuxdoc format for structure
      leds: lp8860: Add regulator enable during init
      dt: bindings: lm3692x: Add bindings for lm3692x LED driver
      leds: lm3692x: Introduce LM3692x dual string driver
      leds: as3645a: Fix quoted string split warning
      leds: as3645a: Fix line over 80 characters
      dt: bindings: lp8860: Update bindings for lp8860
      dt: bindings: lp8860: Update DT label binding
      leds: lp8860: Update the dt parsing for LED labeling
      dt: bindings: lp8860: Add trigger binding to the lp8860
      leds: lp8860: Add DT parsing to retrieve the trigger node
      leds: lp8860: Various fixes to align with LED framework

Fabio Estevam (1):
      leds: pwm: Remove unneeded header file

Geert Uytterhoeven (1):
      ledtrig-activity: Grammar s/a immediate/an immediate/

Shuah Khan (1):
      leds: ledtrig-transient: Add SPDX license identifiers

 .../ABI/testing/sysfs-class-led-trigger-netdev     |  45 ++
 .../devicetree/bindings/leds/leds-lm3692x.txt      |  49 ++
 .../devicetree/bindings/leds/leds-lp8860.txt       |  32 +-
 drivers/leds/Kconfig                               |   9 +-
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-as3645a.c                        |   7 +-
 drivers/leds/leds-blinkm.c                         |   4 +
 drivers/leds/leds-lm3692x.c                        | 393 ++++++++++++++++
 drivers/leds/leds-lp8860.c                         |  66 ++-
 drivers/leds/leds-pwm.c                            |   1 -
 drivers/leds/trigger/Kconfig                       |   9 +-
 drivers/leds/trigger/Makefile                      |   1 +
 drivers/leds/trigger/ledtrig-netdev.c              | 496 +++++++++++++++++++++
 drivers/leds/trigger/ledtrig-transient.c           |  33 +-
 14 files changed, 1091 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-netdev
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
 create mode 100644 drivers/leds/leds-lm3692x.c
 create mode 100644 drivers/leds/trigger/ledtrig-netdev.c
