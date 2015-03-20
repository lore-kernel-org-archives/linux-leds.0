From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v3 0/3] Add ktd2692 Flash LED driver using LED Flash class
Date: Fri, 20 Mar 2015 14:31:03 +0900
Message-ID: <1426829466-13559-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch adds ktd2692 Flash LED driver with LED Flash class

Change in v3:
	- Clean up the code
	- Add aux gpio pin to control Flash LED

Change in v2:
	- Introduction of LED Flash class as Jacek's comment
	- Supplement of binding documentation
	- Rename gpio control pin and remove unused pin
	- Add regulator for the Flash LED

Ingi Kim (3):
  of: Add vendor prefix for Kinetic technologies
  leds: ktd2692: add device tree bindings for ktd2692
  leds: Add ktd2692 flash LED driver

 .../devicetree/bindings/leds/leds-ktd2692.txt      |  34 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ktd2692.c                        | 438 +++++++++++++++++++++
 5 files changed, 483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
 create mode 100644 drivers/leds/leds-ktd2692.c

-- 
2.0.5
