From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 08/13] leds: Replace ARCH_KIRKWOOD dependency
Date: Sun, 29 Jun 2014 22:59:57 +0200
Message-ID: <1404075603-31838-11-git-send-email-andrew@lunn.ch>
References: <1404075603-31838-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:38832 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752940AbaF2VE4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 29 Jun 2014 17:04:56 -0400
In-Reply-To: <1404075603-31838-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, rmk+kernel@arm.linux.org.uk, Andrew Lunn <andrew@lunn.ch>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

mach-kirkwood has been removed, now that kirkwood SoC lives in
mach-mvebu. Use MACH_KIRKWOOD which will be set when kirkwood is built
as part of mach-mvebu.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a1b044e7eaad..2d7c380f79ce 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -411,7 +411,7 @@ config LEDS_MC13783
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for the dual-GPIO LED found on the
@@ -421,7 +421,7 @@ config LEDS_NS2
 config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for LEDs found on the LaCie 2Big
-- 
2.0.0
