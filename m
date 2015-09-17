From: Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH v4 0/3] Add DT support for netxbig LEDs
Date: Thu, 17 Sep 2015 17:59:28 +0200
Message-ID: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:58254 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751868AbbIQP7h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 17 Sep 2015 11:59:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hello,

This patch series adds DT support for the LEDs found on the Kirkwood-based
LaCie boards 2Big and 5Big Network v2.

Changes for v2:
- Check timer mode value retrieved from DT.
- In netxbig_leds_get_of_pdata, don't use unsigned long variables to get
  timer delay values from DT with function of_property_read_u32_index.
  Instead, use a temporary u32 variable. This allows to silence a static
  checker warning.
- Make timer property optional in the binding documentation. It is now
  aligned with the driver code.

Changes for v3:
- Fix pointer usage with the temporary u32 variable while calling
  of_property_read_u32_index.

Changes for v4:
- In DT binding document netxbig-gpio-ext.txt, detail byte order for
  registers and latch mechanism for "enable-gpio".
- In leds-netxbig.c, add some error messages.
- In leds-netxbig.c, fix some "sizeof" style issues.
- In leds-netxbig.c, in netxbig_leds_get_of_pdata(), move the
  of_property_read_string() calls after the error-prone checks.
- Add some Acked-by.

Jacek,

I did not convert the bright-max DT property into led-max-microamp.
The reason is that I can't translate the bright-max values into
microamperes. Therefore, it looks more consistent to keep the same
naming prefix for the bright-addr and bright-max DT properties.

Thanks,

Simon

Simon Guinot (3):
  leds: netxbig: add device tree binding
  ARM: Kirkwood: add LED DT entries for netxbig boards
  ARM: mvebu: remove static LED setup for netxbig boards

 .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
 .../devicetree/bindings/leds/leds-netxbig.txt      |  92 ++++++++
 arch/arm/boot/dts/kirkwood-net5big.dts             |  60 +++++
 arch/arm/boot/dts/kirkwood-netxbig.dtsi            |  80 +++++++
 arch/arm/mach-mvebu/Kconfig                        |   7 -
 arch/arm/mach-mvebu/Makefile                       |   1 -
 arch/arm/mach-mvebu/board.h                        |  21 --
 arch/arm/mach-mvebu/kirkwood.c                     |   4 -
 arch/arm/mach-mvebu/netxbig.c                      | 191 ---------------
 drivers/leds/leds-netxbig.c                        | 258 +++++++++++++++++++--
 include/dt-bindings/leds/leds-netxbig.h            |  18 ++
 11 files changed, 509 insertions(+), 245 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
 delete mode 100644 arch/arm/mach-mvebu/board.h
 delete mode 100644 arch/arm/mach-mvebu/netxbig.c
 create mode 100644 include/dt-bindings/leds/leds-netxbig.h

-- 
2.1.4
