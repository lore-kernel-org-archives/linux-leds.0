From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v5 0/2] Introduce support for mlxreg mfd core driver
Date: Thu, 14 Sep 2017 06:48:56 +0000
Message-ID: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:56222 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750760AbdINEwD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2017 00:52:03 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org
Cc: pavel@ucw.cz, devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>

This patch adds support for the Mellanox BMC card equipped with the
programmable devices controlling hardware.
The support includes:
- signal handling for chassis, ASIC, CPU events;
- LED control;
- exposing sysfs interface for reset control, reset monitoring and mux
  selection for the access to remote devices at the host side.
- device tree binding documentation;

This patch depends on previously sent:
[patch v3 1/3] platform/mellanox: Introduce Mellanox hardware
 platform hotplug driver
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (2):
  mfd: Add Mellanox regmap core driver
  dt-bindings: mfd: Add Device Tree bindings for Mellanox programmable
    devices

 .../bindings/mfd/mellanox,mlxreg-core.txt          | 165 ++++
 MAINTAINERS                                        |   6 +
 drivers/mfd/Kconfig                                |  14 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/mlxreg-core.c                          | 843 +++++++++++++++++++++
 5 files changed, 1029 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
 create mode 100644 drivers/mfd/mlxreg-core.c

-- 
2.1.4
