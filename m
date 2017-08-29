From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/3] drivers/platform: replace module x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Tue, 29 Aug 2017 18:02:22 +0000
Message-ID: <1504029745-192558-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:55094 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752683AbdH2QFX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Aug 2017 12:05:23 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org, jiri@resnulli.us, pavel@ucw.cz, Vadim Pasternak <vadimp@mellanox.com>

The patchset modifies x86/mlxcpld-hotplug.c for making it architecture
independent, renames to mlxreg-hotplug and moves it from
drivers/platform/x86 folder to new drivers/platform/mellanox folder.
This modification also introduces regmap interface for mlxreg-hotplug
driver to allow hotplug event functionality over programmable devices
logic, when these devices can be attached to different interfaces types,
like I2C, LPC, SPI.
Module include/linux/platform_data/mlxcpld-hotplug.h is removed and new
module include/linux/platform_data/mlxreg.h is to be used instead.
Driver drivers/platform/x86/mlx-platform.c is updated according to new
interface.
Relevant Makefile and Kconfig are updated.

This patchset depends on previously sent:
[patch v4 1/2] mfd: Add Mellanox regmap core driver
because it includes include/linux/platform_data/mlxreg.h from this patch.

Vadim Pasternak (3):
  platform/mellanox: Introduce Mellanox hardware platform hotplug driver
  platform/x86: mlx-platform: modify hotplug device activation
  platform/x86: mlxcpld-hotplug: driver removing

 MAINTAINERS                                   |  12 +-
 drivers/platform/Kconfig                      |   2 +
 drivers/platform/Makefile                     |   1 +
 drivers/platform/mellanox/Kconfig             |  25 +
 drivers/platform/mellanox/Makefile            |   1 +
 drivers/platform/mellanox/mlxreg-hotplug.c    | 712 ++++++++++++++++++++++++++
 drivers/platform/x86/Kconfig                  |   9 -
 drivers/platform/x86/Makefile                 |   1 -
 drivers/platform/x86/mlx-platform.c           | 225 ++++++--
 drivers/platform/x86/mlxcpld-hotplug.c        | 515 -------------------
 include/linux/platform_data/mlxcpld-hotplug.h |  99 ----
 11 files changed, 918 insertions(+), 684 deletions(-)
 create mode 100644 drivers/platform/mellanox/Kconfig
 create mode 100644 drivers/platform/mellanox/Makefile
 create mode 100644 drivers/platform/mellanox/mlxreg-hotplug.c
 delete mode 100644 drivers/platform/x86/mlxcpld-hotplug.c
 delete mode 100644 include/linux/platform_data/mlxcpld-hotplug.h

-- 
2.1.4
