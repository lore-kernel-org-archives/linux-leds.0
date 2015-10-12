From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v2 0/3] Add RT5033 Flash LED driver
Date: Mon, 12 Oct 2015 22:12:55 +0900
Message-ID: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch supports flash led of RT5033 PMIC.

Changes since v2:
 - Split MFC code from rt5033 flash led patch
 - Fix typo error
 - Change naming of mfd register back again
 - Fix compile error

Ingi Kim (3):
  leds: rt5033: Add DT binding for RT5033
  mfd: rt5033: Add RT5033 Flash led sub device
  leds: rt5033: Add RT5033 Flash led device driver

 .../devicetree/bindings/leds/leds-rt5033.txt       |  38 ++++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-rt5033.c                         | 223 +++++++++++++++++++++
 drivers/mfd/rt5033.c                               |   6 +-
 include/linux/mfd/rt5033-private.h                 |  49 +++++
 include/linux/mfd/rt5033.h                         |  22 +-
 7 files changed, 344 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
 create mode 100644 drivers/leds/leds-rt5033.c

-- 
2.0.5
