From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/7] LMU Common code intro
Date: Tue, 30 Apr 2019 14:17:23 -0500
Message-ID: <20190430191730.19450-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

I have added the Reviewed-by for dt bindings as well as made the Kconfig change
pointed out for the common code flag

Dan

Dan Murphy (7):
  dt-bindings: mfd: LMU: Fix lm3632 dt binding example
  dt-bindings: mfd: LMU: Add the ramp up/down property
  dt-bindings: mfd: LMU: Add ti,brightness-resolution
  leds: TI LMU: Add common code for TI LMU devices
  dt-bindings: ti-lmu: Modify dt bindings for the LM3697
  mfd: ti-lmu: Remove support for LM3697
  leds: lm3697: Introduce the lm3697 driver

 .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
 drivers/leds/Kconfig                          |  15 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
 drivers/leds/ti-lmu-led-common.c              | 155 +++++++
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mfd/ti-lmu.c                          |  17 -
 include/linux/mfd/ti-lmu-register.h           |  44 --
 include/linux/mfd/ti-lmu.h                    |   1 -
 include/linux/ti-lmu-led-common.h             |  47 +++
 11 files changed, 712 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/ti-lmu-led-common.c
 create mode 100644 include/linux/ti-lmu-led-common.h

-- 
2.21.0.5.gaeb582a983
