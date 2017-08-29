From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v4 0/2] Introduce support for mlxreg mfd core and I2C drivers
Date: Tue, 29 Aug 2017 18:00:14 +0000
Message-ID: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-leds@vger.kernel.org

This patchset adds support for the Mellanox BMC card equipped with the
programmable devices controlling hardware.
The support includes:
- signal handling for chassis, ASIC, CPU events;
- LED control;
- exposing sysfs interface for reset control, reset monitoring and mux
  selection for the access to remote devices at the host side.

Vadim Pasternak (2):
  mfd: Add Mellanox regmap core driver
  mfd: Add Mellanox regmap I2C driver

 .../bindings/mfd/mellanox,mlxreg-core.txt          | 367 +++++++++
 MAINTAINERS                                        |   8 +
 drivers/mfd/Kconfig                                |  28 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/mlxreg-core.c                          | 839 +++++++++++++++++++++
 drivers/mfd/mlxreg-i2c.c                           | 183 +++++
 include/linux/platform_data/mlxreg.h               | 138 ++++
 7 files changed, 1565 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
 create mode 100644 drivers/mfd/mlxreg-core.c
 create mode 100644 drivers/mfd/mlxreg-i2c.c
 create mode 100644 include/linux/platform_data/mlxreg.h

-- 
2.1.4
