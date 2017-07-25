From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/1] Introduce support for mlxreg LED driver
Date: Tue, 25 Jul 2017 16:54:22 +0000
Message-ID: <1501001663-22209-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:44100 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752355AbdGYO53 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2017 10:57:29 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

This patch introduces LED driver, based on regmap interface.
This patch depends on previously sent:
[patch v1 1/2] mfd: Add Mellanox regmap core driver
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (1):
  leds: add driver for support Mellanox regmap LEDs for BMC

 MAINTAINERS                |   1 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 345 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
