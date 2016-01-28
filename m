From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/3] leds: add SN3218 LED driver
Date: Thu, 28 Jan 2016 20:41:04 +0000
Message-ID: <1454013667-25889-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: linux-leds@vger.kernel.org

This patch series implements support for the Si-En SN3218
18 Channel LED Driver through I2C. This implemention only write
data over I2C und get the platform data via DT.

The driver has been tested on a Raspberry Pi B.

Stefan Wahren (3):
  of: Add vendor prefix for Si-En Technology
  DT: add binding for SN3218 LED driver
  leds: add SN3218 LED driver

 .../devicetree/bindings/leds/leds-sn3218.txt       |   41 ++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/leds/Kconfig                               |    8 +
 drivers/leds/Makefile                              |    1 +
 drivers/leds/leds-sn3218.c                         |  254 ++++++++++++++++++++
 5 files changed, 305 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
 create mode 100644 drivers/leds/leds-sn3218.c

-- 
1.7.9.5
