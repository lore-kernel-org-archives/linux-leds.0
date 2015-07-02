From: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/4] Allow to use leds-ns2 with n090401 boards
Date: Thu,  2 Jul 2015 19:56:39 +0200
Message-ID: <1435859803-19583-1-git-send-email-simon.guinot@sequanux.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hello,

This patch series allows to use the leds-ns2 driver with the n090401
boards (Seagate NAS 4-Bay), based on an Armada-370 SoC.

Here is the list changes:

- Allow to configure the LED mode mapping.
- Handle can_sleep GPIOs. On n090401, the LEDs are connected to an I2C
  GPIO expander.
- Make leds-ns2 depends on MACH_ARMADA_370.

Changes for v2:
- Fix gpio_{get,set}_*_cansleep() usage while holding a spinlock:
  Holding a spinlock at this places was not needed.
- Add Acked-by from Jacek Anaszewski for patch 4.

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
 drivers/leds/leds-ns2.c                            | 169 ++++++++++++---------
 include/dt-bindings/leds/leds-ns2.h                |   8 +
 include/linux/platform_data/leds-kirkwood-ns2.h    |  14 ++
 10 files changed, 165 insertions(+), 72 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-ns2.h

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
