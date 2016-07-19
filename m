From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 0/2] driver: leds: is31fl319x dimmable LED driver
Date: Tue, 19 Jul 2016 11:40:03 +0200
Message-ID: <cover.1468921204.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, drivshin.allworx@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

Changes V5 suggested by Jacek Anaszewski:
* update macros/function for audio gain
* mention PWM in bindings

2016-07-19 10:03:40: Changes V4 (mostly fixed by Andrey Utkin):
* Fix struct is31fl319x_driver alignment
* Rework chip matching as suggested by Jacek Anaszewski
* Enhance macro-constants names
* Traverse cdef.num_leds, not MAX_LEDS
* Fix some checkpatch --strict notices
* Fixup for MAX_LEDS -> cdef->num_leds
* Fix lots of review notices
    - macrodef for bits shift
     - drop dev_err() on parse_dt() fail (thus inside parse_dt() every
       failure must give a proper message)
     - of_node_put() where needed
     - rework is31fl319x_microamp_to_cs()
     - destroy mutex properly
* remove note that it is based on tca6507 driver (has deviated completely) (fixed by hns)
* reject if any led current < current_min (fixed by hns)
* simplify helper function is31fl319x_microamp_to_cs and round down (fixed by hns)
* Drop extra empty line in Documentation/devicetree/bindings/leds/is31fl319x.txt
* remove led-max-microamps global property in bindings documentation (fixed by hns)

2016-07-08 21:49:42: Changes V3 (mostly done by Andrey Utkin):
* general coding style improvements
* added a mutex to properly serialize multiple calls to set_backlight
* use regmap defaults (suggested by Jacek Anaszewski)
* improve DT parsing (suggested by Jacek Anaszewski)
* define dependency on REGMAP_I2C
* minor code improvements

2016-07-06 12:02:47: Changes V2:
* suggested by David Rivshin
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
  led: is31fl319x: 1/3/6/9-channel light effect led driver
  Bindings documentation for ISSI is31fl319x driver

 .../devicetree/bindings/leds/is31fl319x.txt        |  59 +++
 drivers/leds/Kconfig                               |  12 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-is31fl319x.c                     | 448 +++++++++++++++++++++
 4 files changed, 520 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
 create mode 100644 drivers/leds/leds-is31fl319x.c

-- 
2.7.3
