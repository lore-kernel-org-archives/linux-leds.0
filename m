From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v7 0/3] Add ktd2692 Flash LED driver using LED Flash class
Date: Thu, 23 Apr 2015 22:18:02 +0900
Message-ID: <1429795085-22171-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch adds ktd2692 Flash LED driver with LED Flash class

Change in v7:
	- Add flash-max-microamp property for Flash LED
	- Change gpio-legacy interface to gpio consumer interface

Change in v6 resend:
	- Adjust indent using checkpatch.pl script with strict option

Change in v6:
	- Change goto label to if-else
	- Change DT binding style for LED device binding

Change in v5:
	- Clean up the code
	- Fix help message of Kconfig
	- Fix issue related with regulator and mutex usage
	- Remove tab spaces in bindings

Change in v4:
	- Clean up the code
	- Modify binding documentation of ktd2692

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

 .../devicetree/bindings/leds/leds-ktd2692.txt      |  47 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ktd2692.c                        | 435 +++++++++++++++++++++
 5 files changed, 493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
 create mode 100644 drivers/leds/leds-ktd2692.c

-- 
2.0.5
