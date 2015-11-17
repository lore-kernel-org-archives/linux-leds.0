From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v5 0/2] Add RT5033 Flash LED driver
Date: Tue, 17 Nov 2015 18:04:18 +0900
Message-ID: <1447751060-27856-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This is a fifth version of the patch set to support RT5033 Flash Led.
It is based on RFC [1] from Jacek's patch set.

Changes since v5:
 - Rebase on Jacek's devel branch
   git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 - Remove work queue from driver.
 - Change brightness_set_sync ops to brightness_set_blocking ops.
 - Remove "iout_torch_max" and "iout_flash_max" values in rt5033_led struct.
 - Add missed case for distinguishing between setting brightness.
   for iout_joint case and for individual LEDs.
 - Add missed mutex_lock.
 - Remove guard to check dev->of_node.
 - Change type of value to const __be32 to get return value of of_find_property.

Changes since v4:
 - Use of_node_put() when DT parse miss
 - Move struct(rt5033_led) from include/linux/mfd/rt5033.h
   to local driver/leds/leds-rt5033.c
 - Remove MODULE_DEVICE_TABLE
 - Add interface to handle two LEDs.

Changes since v3:
 - Use mutex and work queue
 - Split brightness set func (sync / async)
 - Add flash API (flash_brightness_set)
 - Move struct(rt5033_led_config_data) to local area
 - Code clean

Changes since v2:
 - Split MFC code from rt5033 flash led patch
 - Fix typo error
 - Change naming of mfd register back again
 - Fix compile error

Original cover letter:
 This patch supports flash led of RT5033 PMIC.

[1] https://lkml.org/lkml/2015/8/20/426

Ingi Kim (2):
  leds: rt5033: Add DT binding for RT5033
  leds: rt5033: Add RT5033 Flash led device driver

 .../devicetree/bindings/leds/leds-rt5033.txt       |  46 ++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-rt5033.c                         | 522 +++++++++++++++++++++
 include/linux/mfd/rt5033-private.h                 |  51 ++
 5 files changed, 628 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
 create mode 100644 drivers/leds/leds-rt5033.c

-- 
2.0.5
