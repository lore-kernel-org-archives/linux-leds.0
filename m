From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 0/1] Introduce support for mlxreg LED driver
Date: Wed, 26 Jul 2017 22:29:06 +0000
Message-ID: <1501108147-17007-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41789 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751078AbdGZUcA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jul 2017 16:32:00 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, =jacek.anaszewski@gmail.com, pavel@ucw.cz, Vadim Pasternak <vadimp@mellanox.com>

This patch introduces LED driver, based on regmap interface.
This patch depends on previously sent:
[patch v2 1/2] mfd: Add Mellanox regmap core driver
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (1):
  leds: add driver for support Mellanox regmap LEDs for BMC

 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  10 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 295 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
