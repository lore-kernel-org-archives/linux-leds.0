From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 0/6] LM36274 LMU Introduction
Date: Fri, 5 Apr 2019 09:55:34 -0500
Message-ID: <20190405145540.27703-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

This patch series adds the LM36274 to the TI LMU MFD driver as well as leverages
the TI LMU framework.

This work was done on top of v2 of the TI LMU rework series
https://lore.kernel.org/patchwork/project/lkml/list/?series=389483

I reused the lm363x regulator driver as I did not see it to be feasible to
rewrite a driver that kinda already exists.

Dan

Dan Murphy (6):
  regulator: lm363x: Make the gpio register enable flexible
  dt-bindings: mfd: Add lm36274 bindings to ti-lmu
  mfd: ti-lmu: Add LM36274 support to the ti-lmu
  regulator: lm363x: Add support for LM36274
  dt-bindings: leds: Add LED bindings for the LM36274
  leds: lm36274: Introduce the TI LM36274 LED driver

 .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
 .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
 drivers/leds/Kconfig                          |   9 +-
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
 drivers/mfd/Kconfig                           |   5 +-
 drivers/mfd/ti-lmu.c                          |  14 ++
 drivers/regulator/Kconfig                     |   2 +-
 drivers/regulator/lm363x-regulator.c          |  56 +++++-
 include/linux/mfd/ti-lmu-register.h           |  23 +++
 include/linux/mfd/ti-lmu.h                    |   4 +
 11 files changed, 417 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 drivers/leds/leds-lm36274.c

-- 
2.19.0
