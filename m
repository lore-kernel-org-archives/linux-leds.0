From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/2] driver: leds: is31fl319x dimmable LED driver
Date: Wed,  6 Jul 2016 12:02:42 +0200
Message-ID: <cover.1467799364.git.hns@goldelico.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:26873 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbcGFKCt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jul 2016 06:02:49 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org

Changes V2:
* suggested by David Rifshin
	* add more "compatible" strings for other chip variants/brands
	* renumber output <reg> values to expect a range of 1..9
	* fixes for typos and DT example, Kconfig message
	* fix location in Makefile and Kconfig
	* remove some dead/not implemented code
	* use of_property_read_string for better error handling
	* coding style improvements
	* use devm_led_classdev_register and simplify error path
* suggested by Jacek Anaszewski
	* fix more typos & writing style
	* separate bindings document into a second patch
	* max current property renamed and define uA instead of mA
	* debugging message improvements
	* remove platform data and header file completely and therefore require DT
	* use regmap to handle caching and locking + i2c serialization
* suggested by Rob Herring
	* bindings documentation style improvements

V1: 2016-04-18 20:43:18:
This patch adds a driver for the is31fl3196/99 dimmable dual/triple rgb
controller chips from ISSI.

H. Nikolaus Schaller (2):
  drivers: led: is31fl319x: 1/3/6/9-channel light effect led driver
  Bindings documentation for ISSI is31fl319x driver

 .../devicetree/bindings/leds/is31fl319x.txt        |  52 +++
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-is31fl319x.c                     | 354 +++++++++++++++++++++
 4 files changed, 415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
 create mode 100644 drivers/leds/leds-is31fl319x.c

-- 
2.7.3
