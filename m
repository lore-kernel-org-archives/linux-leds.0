From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 0/6] LM36274 Introduction
Date: Tue, 7 May 2019 15:11:53 -0500
Message-ID: <20190507201159.13940-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

This is patch set v4 for the LM36274.  There were no changes made
to this patch set except to rebase this on top of the latest TI LMU common code
patchset.

This patch set was rebased on the series at:
https://lore.kernel.org/patchwork/project/lkml/list/?series=393071

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
 drivers/leds/Kconfig                          |   7 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
 drivers/mfd/Kconfig                           |   5 +-
 drivers/mfd/ti-lmu.c                          |  14 ++
 drivers/regulator/Kconfig                     |   2 +-
 drivers/regulator/lm363x-regulator.c          |  56 +++++-
 include/linux/mfd/ti-lmu-register.h           |  23 +++
 include/linux/mfd/ti-lmu.h                    |   4 +
 11 files changed, 416 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt
 create mode 100644 drivers/leds/leds-lm36274.c

-- 
2.21.0.5.gaeb582a983
