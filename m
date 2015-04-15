From: Bryan Wu <cooloney@gmail.com>
Subject: [GIT PULL] LED subsystem updates for 4.1
Date: Wed, 15 Apr 2015 11:05:39 -0700
Message-ID: <CAK5ve-+nPAFi4u3WCs-pNE5WE5SUFaaadONTZw-1fJTAjWx5cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

In this cycle, we merged some fix and update for LED Flash class
driver. Then the core code of LED Flash class driver is in the kernel
now. Moreover, we also got some bug fixes, code cleanup and new
drivers for LED controllers.

So please consider to pull the following changes since commit
c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git=
 for-next

for you to fetch changes up to ccdc45075aeaaa144af4177b85570eb26c2f5a8b=
:

  leds: Don't treat the LED name as a format string (2015-03-30 14:26:3=
2 -0700)

----------------------------------------------------------------
Bjorn Andersson (1):
      leds: Introduce devres helper for led_classdev_register

Courtney Cavin (2):
      leds: add DT binding for Qualcomm PM8941 WLED block
      leds: add Qualcomm PM8941 WLED driver

Geert Uytterhoeven (1):
      leds: pca963x: Add missing initialiation of struct led_info.flags

Jacek Anaszewski (7):
      leds: flash: remove stray include directive
      leds: flash: Remove synchronized flash strobe feature
      leds: flash: document sysfs interface
      Documentation: leds: Add description of LED Flash class extension
      leds: flash: Fix the size of sysfs_groups array
      dt-binding: leds: Add common LED DT bindings macros
      DT: leds: Add uniqueness requirement for 'label' property.

Masanari Iida (2):
      leds: lp8501: Fix typo in MODULE_DESCRIPTION in leds-lp8501.c
      leds: lp8860: Fix typo in MODULE_DESCRIPTION in leds-lp8860.c

Olliver Schinagl (1):
      leds: Let the binding document example for leds-gpio follow the
gpio bindings

Ricardo Ribalda Delgado (1):
      leds/led-class: Handle LEDs with the same name

Sakari Ailus (2):
      leds: Use log level warn instead of info when telling about a nam=
e clash
      leds: Don't treat the LED name as a format string

Sebastian Andrzej Siewior (1):
      leds: leds-pwm: drop one pwm_get_period() call

Uwe Kleine-K=C3=B6nig (1):
      leds: lp8860: make use of devm_gpiod_get_optional

 Documentation/ABI/testing/sysfs-class-led-flash    |  80 ++++
 Documentation/devicetree/bindings/leds/common.txt  |   6 +-
 .../devicetree/bindings/leds/leds-gpio.txt         |  12 +-
 .../devicetree/bindings/leds/leds-pm8941-wled.txt  |  43 ++
 Documentation/driver-model/devres.txt              |   4 +
 Documentation/leds/leds-class-flash.txt            |  22 ++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/led-class-flash.c                     |  82 ----
 drivers/leds/led-class.c                           |  96 ++++-
 drivers/leds/leds-lp8501.c                         |   2 +-
 drivers/leds/leds-lp8860.c                         |  14 +-
 drivers/leds/leds-pca963x.c                        |   2 +-
 drivers/leds/leds-pm8941-wled.c                    | 435 +++++++++++++=
++++++++
 drivers/leds/leds-pwm.c                            |   3 -
 include/dt-bindings/leds/common.h                  |  21 +
 include/linux/led-class-flash.h                    |  19 +-
 include/linux/leds.h                               |   5 +-
 18 files changed, 735 insertions(+), 120 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-flash
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8941-=
wled.txt
 create mode 100644 Documentation/leds/leds-class-flash.txt
 create mode 100644 drivers/leds/leds-pm8941-wled.c
 create mode 100644 include/dt-bindings/leds/common.h
