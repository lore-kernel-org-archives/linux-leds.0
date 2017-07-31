From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v3 0/1] Introduce support for mlxreg LED driver
Date: Mon, 31 Jul 2017 16:21:30 +0000
Message-ID: <1501518091-100730-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:39316 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752113AbdGaOYo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Jul 2017 10:24:44 -0400
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
 drivers/leds/leds-mlxreg.c | 299 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
