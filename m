From: Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH 0/4] Allow to use leds-ns2 with n090401 boards
Date: Wed,  4 Mar 2015 15:52:15 +0100
Message-ID: <1425480739-2373-1-git-send-email-simon.guinot@sequanux.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:34725 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757870AbbCDOwW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 4 Mar 2015 09:52:22 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello,

This patch series allows to use the leds-ns2 driver with the n090401
boards (Seagate NAS 4-Bay), based on an Armada-370 SoC.

Here is the list changes:

- Allow to configure the LED mode mapping.
- Handle can_sleep GPIOs. On n090401, the LEDs are connected to an I2C
  GPIO expander.
- Make leds-ns2 depends on MACH_ARMADA_370.

Simon

Simon Guinot (2):
  leds: leds-ns2: handle can_sleep GPIOs
  leds: leds-ns2: depends on MACH_ARMADA_370

Vincent Donnefort (2):
  leds: leds-ns2: move LED modes mapping outside of the driver
  ARM: Kirkwood: add modes-map property to ns2-leds nodes

 .../devicetree/bindings/leds/leds-ns2.txt          |   9 ++
 arch/arm/boot/dts/kirkwood-d2net.dts               |   5 +
 arch/arm/boot/dts/kirkwood-is2.dts                 |   5 +
 arch/arm/boot/dts/kirkwood-ns2.dts                 |   5 +
 arch/arm/boot/dts/kirkwood-ns2max.dts              |   5 +
 arch/arm/boot/dts/kirkwood-ns2mini.dts             |   5 +
 drivers/leds/Kconfig                               |  12 +-
 drivers/leds/leds-ns2.c                            | 156 +++++++++++++--------
 include/dt-bindings/leds/leds-ns2.h                |   8 ++
 include/linux/platform_data/leds-kirkwood-ns2.h    |  14 ++
 10 files changed, 159 insertions(+), 65 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-ns2.h

-- 
2.1.1
