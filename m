From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: [PATCH 0/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Tue, 21 Jun 2016 09:29:12 +0200
Message-ID: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>
List-Id: linux-leds@vger.kernel.org

Hello,

This series add a new driver for On Semiconductor NCP5623, a 3-channel I2C
LED driver. It is used in our design to drive a RGB LED.

The first patch introduces the device tree binding, while the second patch
adds the driver itself.

Best regards,
Florian

Florian Vaussard (2):
  leds: ncp5623: Add device tree binding documentation
  leds: Add driver for NCP5623 3-channel I2C LED driver

 .../devicetree/bindings/leds/leds-ncp5623.txt      |  44 ++++
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ncp5623.c                        | 265 +++++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt
 create mode 100644 drivers/leds/leds-ncp5623.c

-- 
2.5.0
