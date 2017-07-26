From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 0/2] Introduce support for mlxreg mfd core and I2C drivers
Date: Wed, 26 Jul 2017 22:28:12 +0000
Message-ID: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41661 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751024AbdGZUbo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Jul 2017 16:31:44 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, jacek.anaszewski@gmail.com, Vadim Pasternak <vadimp@mellanox.com>

This patchset adds support for the Mellanox BMC card equipped with the
programmable devices controlling hardware.
The support includes:
- signal handling for chassis, ASIC, CPU events;
- LED control;
- exposing sysfs interface for reset control, reset monitoring and mux
  selection for the access to remote devices at the host side.

It contains:
 - Introduction of Mellanox mlxreg-core drivers, which is bus independent
   and could work over register map of the programmable device (for
   example CPLD) attached to different buses, supported by register
   mapping.
 - I2C driver mlxreg-i2c, which creates register mapping for I2C access
   to the programmable devices with I2C interface. It allows control for
   devices with one and two bytes address space.

Vadim Pasternak (2):
  mfd: Add Mellanox regmap core driver
  mfd: Add Mellanox regmap I2C driver

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    8 +
 drivers/mfd/Kconfig                                |   28 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/mlxreg-core.c                          | 1257 ++++++++++++++++++++
 drivers/mfd/mlxreg-i2c.c                           |  183 +++
 include/linux/platform_data/mlxreg.h               |   87 ++
 7 files changed, 1566 insertions(+)
 create mode 100644 drivers/mfd/mlxreg-core.c
 create mode 100644 drivers/mfd/mlxreg-i2c.c
 create mode 100644 include/linux/platform_data/mlxreg.h

-- 
2.1.4
