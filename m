From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL] LED updates for 4.19-rc1
Date: Mon, 13 Aug 2018 21:47:23 +0200
Message-ID: <1534189643-6449-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, arnd@arndb.de, colin.king@canonical.com, daniel@zonque.org, dmurphy@ti.com, elviskitone@gmail.com, mchehab+samsung@kernel.org, rafdev@dinapo.li, u.kleine-koenig@pengutronix.de, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 4.19-rc1.

LED triggers improvements make the biggest part of this pull request.
The most striking ones, that allowed for nice cleanups in the triggers are:
	- centralized handling of creation and removal of trigger sysfs
	  attributes via attribute group
        - addition of module_led_trigger() helper

The other things that need to be mentioned:

New features and improvements to existing LED class drivers:
	- lt3593: add DT support, switch to gpiod interface
	- lm3692x: support LED sync configuration, change OF calls to fwnode calls
	- apu: modify PC Engines apu/apu2 driver to support apu3

Change in the drivers/net/can/led.c:
	- mark led trigger as broken since it's in the way for the further
          cleanups. It implements a subset of the netdev trigger and an Ack
	  is needed from someone who can actually test and confirm that the netdev
	  trigger works for can devices.

Thanks,
Jacek Anaszewski

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-4.19-rc1

for you to fetch changes up to 2224f2ff9670b899983ff1b42d85530e889cfea1:

  leds: ns2: Change unsigned to unsigned int (2018-08-06 23:03:12 +0200)

----------------------------------------------------------------
LED updates for 4.19-rc1
----------------------------------------------------------------

Arnd Bergmann (1):
      leds: ledtrig-activity: use ktime_get_boot_ns()

Colin Ian King (1):
      leds: max8997: use mode when calling max8997_led_set_mode

Dan Murphy (4):
      leds: lm3692x: Update license header to SPDX
      leds: lm3692x: Change DT calls to fwnode calls
      dt: bindings: lm3692x: Update binding for LED sync control
      leds: lm3692x: Support LED sync configuration

Daniel Mack (5):
      dt-bindings: leds: Add bindings for lltc,lt3593
      leds: lt3593: merge functions and clean up code
      leds: lt3593: switch to gpiod interface
      leds: lt3593: Add device tree probing glue
      leds: lt3593: update email address and switch to SPDX license header

Kitone Elvis Peter (1):
      leds: ns2: Change unsigned to unsigned int

Mauro Carvalho Chehab (1):
      devicectree: bindings: fix location of leds common file

Raffaello D. Di Napoli (1):
      leds: Modify PC Engines apu/apu2 driver to support apu3

Uwe Kleine-König (18):
      leds: triggers: don't depend on LEDS_TRIGGERS twice
      can: mark led trigger as broken
      leds: triggers: make the MODULE_LICENSE string match the actual license
      leds: triggers: let struct led_trigger::activate() return an error code
      leds: triggers: add device attribute support
      leds: triggers: handle .trigger_data and .activated() in the core
      leds: triggers: define module_led_trigger helper
      leds: triggers: new function led_set_trigger_data()
      leds: netdev trigger: simplifications from core changes
      leds: timer trigger: simplifications from core changes
      leds: transient trigger: simplifications from core changes
      leds: oneshot trigger: simplifications from core changes
      leds: heartbeat trigger: simplifications from core changes
      leds: default-on trigger: make use of module_led_trigger()
      leds: activity trigger: simplifications from core changes
      leds: backlight trigger: simplifications from core changes
      leds: gpio trigger: simplifications from core changes
      usb: simplify usbport trigger

 Documentation/devicetree/bindings/leds/common.txt  |   2 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |   5 +-
 .../devicetree/bindings/leds/leds-lt3593.txt       |  32 ++++
 drivers/leds/Kconfig                               |   5 +-
 drivers/leds/led-triggers.c                        |  39 ++++-
 drivers/leds/leds-apu.c                            |  44 ++++-
 drivers/leds/leds-lm3692x.c                        | 181 ++++++++++++++------
 drivers/leds/leds-lt3593.c                         | 190 ++++++++++++---------
 drivers/leds/leds-max8997.c                        |   2 +-
 drivers/leds/leds-ns2.c                            |   4 +-
 drivers/leds/trigger/Kconfig                       |  15 +-
 drivers/leds/trigger/ledtrig-activity.c            |  51 +++---
 drivers/leds/trigger/ledtrig-backlight.c           |  64 +++----
 drivers/leds/trigger/ledtrig-camera.c              |   3 +-
 drivers/leds/trigger/ledtrig-default-on.c          |  20 +--
 drivers/leds/trigger/ledtrig-gpio.c                |  92 +++-------
 drivers/leds/trigger/ledtrig-heartbeat.c           |  49 +++---
 drivers/leds/trigger/ledtrig-netdev.c              | 101 ++++-------
 drivers/leds/trigger/ledtrig-oneshot.c             |  91 +++-------
 drivers/leds/trigger/ledtrig-timer.c               |  58 ++-----
 drivers/leds/trigger/ledtrig-transient.c           | 102 ++++-------
 drivers/net/can/Kconfig                            |   6 +
 drivers/tty/vt/keyboard.c                          |   4 +-
 drivers/usb/core/ledtrig-usbport.c                 |  34 ++--
 include/linux/leds.h                               |  36 +++-
 net/bluetooth/leds.c                               |   6 +-
 net/mac80211/led.c                                 |  20 ++-
 net/rfkill/core.c                                  |   4 +-
 28 files changed, 641 insertions(+), 619 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt
