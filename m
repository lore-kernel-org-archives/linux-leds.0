From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 00/10] Introduce Juniper I2CS FPGA driver
Date: Fri,  7 Oct 2016 18:20:59 +0300
Message-ID: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Add Juniper's I2CS FPGA driver. Those FPGAs
are present in Juniper's PTX series of routers.

The MFD driver provices i2c/gpio/leds/hwmon devices.

There are full device tree binding documents for the
master mfd driver and for all slave drivers.

This patchset is against mainline as of today: v4.8-9431-g3477d16
and is dependent on the "Juniper prerequisites" and
"Juniper infrastructure" patchsets sent earlier.

Avirup Banerjee (1):
  hwmon: Add driver for Fan Tray on Juniper I2CS FGPA

Georgi Vlaev (8):
  mfd: Add Juniper I2CS MFD driver
  mfd: dt-bindings: Add bindings for the Juniper I2CS MFD
  i2c/muxes: Juniper I2CS RE mux
  i2c: i2c-mux-i2cs: Add device tree bindings
  gpio: gpio-i2cs: Document bindings of I2CS FPGA GPIO block
  leds: i2cs: Add I2CS FPGA leds driver
  leds: Add binding for Juniper's I2CS FPGA
  hwmon: i2cs-fan: Add hwmon dts binding documentation

Guenter Roeck (1):
  gpio: i2cs: Juniper I2CS to GPIO pin mapping driver

 .../devicetree/bindings/gpio/jnx,gpio-i2cs.txt     |  43 ++
 .../devicetree/bindings/hwmon/i2cs-fan.txt         |  19 +
 .../devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt   |  27 ++
 .../devicetree/bindings/leds/leds-i2cs.txt         |  34 ++
 Documentation/devicetree/bindings/mfd/jnx-i2cs.txt |  68 +++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-jnx-i2cs.c                       | 523 +++++++++++++++++++++
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/jnx-fan.c                            | 471 +++++++++++++++++++
 drivers/i2c/muxes/Kconfig                          |  10 +
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-i2cs.c                   | 155 ++++++
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-jnx-i2cs.c                       | 219 +++++++++
 drivers/mfd/Kconfig                                |  17 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/jnx-i2cs-core.c                        | 118 +++++
 include/linux/mfd/jnx-i2cs-core.h                  |  96 ++++
 include/linux/platform_data/jnx-i2cs-fan.h         |  13 +
 22 files changed, 1849 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/jnx,gpio-i2cs.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-i2cs.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/jnx-i2cs.txt
 create mode 100644 drivers/gpio/gpio-jnx-i2cs.c
 create mode 100644 drivers/hwmon/jnx-fan.c
 create mode 100644 drivers/i2c/muxes/i2c-mux-i2cs.c
 create mode 100644 drivers/leds/leds-jnx-i2cs.c
 create mode 100644 drivers/mfd/jnx-i2cs-core.c
 create mode 100644 include/linux/mfd/jnx-i2cs-core.h
 create mode 100644 include/linux/platform_data/jnx-i2cs-fan.h

-- 
1.9.1
