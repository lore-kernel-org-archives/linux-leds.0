From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v7 0/2] Introduce mlxreg LED driver
Date: Thu, 15 Feb 2018 08:15:23 +0000
Message-ID: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:57802 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754554AbeBOGTC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Feb 2018 01:19:02 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

This patch:
- Fixes text in Kconfig.
- Introduces LED driver, based on regmap interface.

Vadim Pasternak (2):
  leds: fix Kconfig text for MLXCPLD and SYSCON
  leds: add driver for support Mellanox regmap LEDs for BMC and x86
    platform

 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  16 ++-
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mlxreg.c | 311 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 326 insertions(+), 3 deletions(-)
 create mode 100644 drivers/leds/leds-mlxreg.c

-- 
2.1.4
