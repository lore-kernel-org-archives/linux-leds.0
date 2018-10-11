From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/9] TI LMU common Framework
Date: Thu, 11 Oct 2018 11:51:14 -0500
Message-ID: <20181011165123.32198-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

All

I have updated the patch set and addressed some of the comments.
Thanks to Pavel, he found the lm3639 back light driver that is similar
enough to the LM3632 device.  So I removed that device from this patch series.

I am in the process of adding the LM3632 to the LM3639 back light driver as well
as adding additional improvements to that driver.

Dan

Dan Murphy (8):
  dt-bindings: ti-lmu: Remove LM3697
  mfd: ti-lmu: Remove support for LM3697
  dt-bindings: leds: Add bindings for lm3697 driver
  leds: lm3697: Introduce the lm3697 driver
  dt-bindings: ti-lmu: Remove LM3633
  mfd: ti-lmu: Remove support for LM3633
  dt-bindings: leds: Add support for the LM3633
  leds: lm3633: Introduce the lm3633 driver

Pavel Machek (1):
  leds: add TI LMU backlight driver

 .../devicetree/bindings/leds/leds-lm3633.txt  | 102 ++++
 .../devicetree/bindings/leds/leds-lm3697.txt  |  98 +++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  72 ---
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   3 +
 drivers/leds/leds-lm3633.c                    | 556 ++++++++++++++++++
 drivers/leds/leds-lm3697.c                    | 381 ++++++++++++
 drivers/leds/ti-lmu-led-common.c              | 138 +++++
 drivers/mfd/Kconfig                           |   2 +-
 drivers/mfd/ti-lmu.c                          |  38 --
 include/linux/mfd/ti-lmu-register.h           |  44 --
 include/linux/mfd/ti-lmu.h                    |   1 -
 include/linux/ti-lmu-led-common.h             |  59 ++
 13 files changed, 1360 insertions(+), 156 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 drivers/leds/leds-lm3633.c
 create mode 100644 drivers/leds/leds-lm3697.c
 create mode 100644 drivers/leds/ti-lmu-led-common.c
 create mode 100644 include/linux/ti-lmu-led-common.h

-- 
2.19.0
