From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v5 0/1] Introduce support for mlxreg LED driver
Date: Tue, 29 Aug 2017 18:01:21 +0000
Message-ID: <1504029682-192447-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, gregkh@linuxfoundation.org
Cc: linux-leds@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, pavel@ucw.cz, platform-driver-x86@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-leds@vger.kernel.org

This patch introduces LED driver, based on regmap interface.
This patch depends on previously sent:
[patch v4 1/2] mfd: Add Mellanox regmap core driver
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (1):
  leds: add driver for support Mellanox regmap LEDs for BMC

 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  10 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 317 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 329 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
