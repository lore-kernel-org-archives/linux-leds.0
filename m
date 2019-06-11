From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [GIT PULL v2] Immutable branch between LEDs, MFD and REGULATOR
Date: Wed, 12 Jun 2019 00:12:17 +0200
Message-ID: <20190611221217.12335-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers

for you to fetch changes up to 11e1bbc116a75d4a93122ea0a3b2be814922d864:

  leds: lm36274: Introduce the TI LM36274 LED driver (2019-06-07 20:40:07 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
TI LMU LED support rework and introduction of two new drivers
with DT bindings:

- leds-lm3697
- leds-lm36274

----------------------------------------------------------------
Dan Murphy (11):
      dt-bindings: mfd: LMU: Add the ramp up/down property
      dt-bindings: mfd: LMU: Add ti,brightness-resolution
      leds: TI LMU: Add common code for TI LMU devices
      dt-bindings: ti-lmu: Modify dt bindings for the LM3697
      mfd: ti-lmu: Remove support for LM3697
      leds: lm3697: Introduce the lm3697 driver
      dt-bindings: mfd: Add lm36274 bindings to ti-lmu
      mfd: ti-lmu: Add LM36274 support to the ti-lmu
      regulator: lm363x: Add support for LM36274
      dt-bindings: leds: Add LED bindings for the LM36274
      leds: lm36274: Introduce the TI LM36274 LED driver

 .../devicetree/bindings/leds/leds-lm36274.txt      |  85 +++++
 .../devicetree/bindings/leds/leds-lm3697.txt       |  73 ++++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  88 +++--
 drivers/leds/Kconfig                               |  25 ++
 drivers/leds/Makefile                              |   3 +
 drivers/leds/leds-lm36274.c                        | 172 +++++++++
 drivers/leds/leds-lm3697.c                         | 395 +++++++++++++++++++++
 drivers/leds/leds-ti-lmu-common.c                  | 156 ++++++++
 drivers/mfd/Kconfig                                |   5 +-
 drivers/mfd/ti-lmu.c                               |  23 +-
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/lm363x-regulator.c               |  78 +++-
 include/linux/leds-ti-lmu-common.h                 |  47 +++
 include/linux/mfd/ti-lmu-register.h                |  63 ++--
 include/linux/mfd/ti-lmu.h                         |   5 +-
 15 files changed, 1135 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm36274.c
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h
