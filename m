From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 0/9] Support TI LMU devices
Date: Thu, 26 Nov 2015 15:56:56 +0900
Message-ID: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38814 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751198AbbKZG5g (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Nov 2015 01:57:36 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>

TI Lighting Management Unit drivers support lighting devices below.

         Enable pin  Backlight  HW fault monitoring  LEDs   Regulators
         ----------  ---------  -------------------  ----  ------------
LM3532       o           o               x            x         x
LM3631       o           o               x            x    5 regulators
LM3632       o           o               x            x    3 regulators
LM3633       o           o               o            o         x
LM3695       o           o               x            x         x
LM3697       o           o               o            x         x

This patch-set consists of several parts below.

  DT bindings        : Binding information for each module
  LMU MFD            : Device registration and HW enable pin control
  LMU fault monitor  : HW fault monitoring for open and short circuit
  LMU backlight      : Consolidated LMU backlight driver
  LM3633 LED         : LED subsystem and dimming pattern generation
                       supported
  LM363X regulator   : LM3631 and LM3632 regulator driver for the
                       display bias

Updates from v1
---------------
  * DT bindings
    mfd       : Describe complete DT properties.
    backlight : Move backlight properties into leds/backlight/.
                Use common LED properties like 'led-sources' and 'label'.
    hwmon     : LMU fault monitoring driver is not HWMON any more.
                So related properties are moved into 'ti-lmu' binding.
    leds      : Use LED common properties like 'led-sources' and 'label'.

  * MFD
    Remove LMU helpers for I2C register access. Each driver uses regmap
    helpers instead.

  * LMU fault monitoring driver
    In v1, it was HWMON driver but HWMON subsystem maintainer suggested
    moving it into MFD because it has no sensor data like temperature or
    voltage. Device attributes were replaced with debugfs files because
    monitoring should be processed for debug purpose only.

  * Backlight
    Six separate driver code was consolidated.
    Driver control code is implemented in 'ti-lmu-backlight-core.c'.
    Device specific data is defined in 'ti-lmu-backlight-data.c'.
    194 lines are saved in v2. The text segment is decreased by removing
    duplicate instructions.

    Lines of code:
      v1: 1420 (8 files)
      v2: 1226 (3 files)

    Size:
      v1:
      text  data  bss  filename
     12202   720   40  drivers/video/backlight/built-in.o
      v2:
      text  data  bss  filename
      6883   712   41  drivers/video/backlight/built-in.o

  * LED
    Use single device attribute for LED dimming operation.
    Max brightness is determined by DT property, 'led-max-microamp'.
    Remove brightness workqueue.

  * Regulator
    Use 'of_match' in regulator_desc instead of calling of_regulator_match.
    Remove unnecessary OF device ID because MFD core registers a platform
    device based on the compatible string.

Milo Kim (9):
  Documentation: dt-bindings: mfd: add TI LMU device binding information
  Documentation: dt-bindings: leds: backlight: add TI LMU backlight
    binding information
  Documentation: dt-bindings: leds: add LM3633 LED binding information
  Documentation: dt-bindings: regulator: add LM363x regulator binding
    information
  mfd: add TI LMU driver
  mfd: add TI LMU hardware fault monitoring driver
  backlight: add TI LMU backlight driver
  leds: add LM3633 driver
  regulator: add LM363X driver

 .../ABI/testing/debugfs-ti-lmu-fault-monitor       |  32 +
 Documentation/ABI/testing/sysfs-class-led-lm3633   |  97 +++
 .../bindings/leds/backlight/ti-lmu-backlight.txt   |  65 ++
 .../devicetree/bindings/leds/leds-lm3633.txt       |  24 +
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   | 243 ++++++
 .../bindings/regulator/lm363x-regulator.txt        |  34 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-lm3633.c                         | 840 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  22 +
 drivers/mfd/Makefile                               |   3 +
 drivers/mfd/ti-lmu-fault-monitor.c                 | 405 ++++++++++
 drivers/mfd/ti-lmu.c                               | 259 +++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/lm363x-regulator.c               | 309 ++++++++
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   3 +
 drivers/video/backlight/ti-lmu-backlight-core.c    | 649 ++++++++++++++++
 drivers/video/backlight/ti-lmu-backlight-data.c    | 287 +++++++
 include/linux/mfd/ti-lmu-backlight.h               | 290 +++++++
 include/linux/mfd/ti-lmu-register.h                | 280 +++++++
 include/linux/mfd/ti-lmu.h                         |  87 +++
 23 files changed, 3957 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-ti-lmu-fault-monitor
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lm3633
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti-lmu-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti-lmu.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
 create mode 100644 drivers/leds/leds-lm3633.c
 create mode 100644 drivers/mfd/ti-lmu-fault-monitor.c
 create mode 100644 drivers/mfd/ti-lmu.c
 create mode 100644 drivers/regulator/lm363x-regulator.c
 create mode 100644 drivers/video/backlight/ti-lmu-backlight-core.c
 create mode 100644 drivers/video/backlight/ti-lmu-backlight-data.c
 create mode 100644 include/linux/mfd/ti-lmu-backlight.h
 create mode 100644 include/linux/mfd/ti-lmu-register.h
 create mode 100644 include/linux/mfd/ti-lmu.h

-- 
1.9.1
