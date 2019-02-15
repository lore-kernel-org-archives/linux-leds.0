From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 0/8] leds: Add AXP20X CHGLED
Date: Fri, 15 Feb 2019 13:50:05 +0200
Message-ID: <20190215115013.11098-1-stefan@olimex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC
        DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Allwinner
        sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
List-Id: linux-leds@vger.kernel.org

This series add support for CHGLED pin found on most of
X-Powers PMICs.

Changes for v2:
- use mutex when accessing hardware registers
- fixed LED naming style
- fixed some typos
- fix variable types when showing attributes
- remove useless private data
- fix binding documentation
- add device consumers

Stefan Mavrodiev (8):
  leds: Add support for AXP20X CHGLED
  mfd: axp20x: Add axp20x-led cell
  dt-bindings: leds: Add binding for axp20x-led device driver
  arm64: dts: allwinner: axp803: add charge led node
  arm64: dts: allwinner: Enable AXP803 CHGLED for Olimex boards
  arm: dts: axpxx: add charge led node
  ARM: dts: sun7i: Enable AXP209 CHGLED for Olimex boards
  ARM: dts: sun8i: a33: Enable AXP223 CHGLED for A33-OLinuXino

 .../devicetree/bindings/leds/leds-axp20x.txt  |  74 +++++
 arch/arm/boot/dts/axp209.dtsi                 |   5 +
 arch/arm/boot/dts/axp22x.dtsi                 |   5 +
 arch/arm/boot/dts/axp81x.dtsi                 |   5 +
 .../arm/boot/dts/sun7i-a20-olimex-som-evb.dts |   6 +
 .../boot/dts/sun7i-a20-olimex-som204-evb.dts  |   6 +
 .../boot/dts/sun7i-a20-olinuxino-lime2.dts    |   6 +
 .../boot/dts/sun7i-a20-olinuxino-micro.dts    |   6 +
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts     |   6 +
 arch/arm64/boot/dts/allwinner/axp803.dtsi     |   5 +
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |   6 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |   6 +
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-axp20x.c                    | 291 ++++++++++++++++++
 drivers/mfd/axp20x.c                          |  24 +-
 16 files changed, 461 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.txt
 create mode 100644 drivers/leds/leds-axp20x.c

-- 
2.17.1
