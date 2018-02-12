From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v6 0/1] Introduce smlxreg LED driver
Date: Mon, 12 Feb 2018 20:15:29 +0000
Message-ID: <1518466530-132967-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42208 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751176AbeBLSTI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Feb 2018 13:19:08 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

This patch introduces LED driver, based on regmap interface.
This patch depends on:
include/linux/platform_data/mlxreg.h?h=next-20180209 from
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (1):
  leds: add driver for support Mellanox regmap LEDs for BMC and x86
    platform

 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  10 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 311 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
