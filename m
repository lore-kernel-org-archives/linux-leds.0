From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v9 0/3] Add ktd2692 Flash LED driver using LED Flash class
Date: Tue, 12 May 2015 17:37:54 +0900
Message-ID: <1431419877-28339-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27093 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413AbbELIiW (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 04:38:22 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: sakari.ailus@iki.fi, j.anaszewski@samsung.com, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

This patch adds ktd2692 Flash LED driver with LED Flash class

Change in v9:
	- Fix style of description with existing drivers
	- Follow binding rule

Change in v8:
	- Add led-max-microamp mandatory property for LEDs current
	  base on Jacek's patch [1]
	  patch [1] [PATCH v6] DT: leds: Improve description of
	  flash LEDs related properties
	- Fix brightness calculation by max-microamp properties

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

 .../devicetree/bindings/leds/leds-ktd2692.txt      |  50 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-ktd2692.c                        | 443 +++++++++++++++++++++
 5 files changed, 504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
 create mode 100644 drivers/leds/leds-ktd2692.c

-- 
2.0.5
