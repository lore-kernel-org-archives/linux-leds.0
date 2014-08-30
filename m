From: Andrew Lunn <andrew@lunn.ch>
Subject: [Patch v3] 4/7] leds: Remove ARCH_KIRKWOOD dependency
Date: Sat, 30 Aug 2014 18:46:09 +0200
Message-ID: <1409417172-6846-5-git-send-email-andrew@lunn.ch>
References: <1409417172-6846-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:42034 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751713AbaH3QxC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 30 Aug 2014 12:53:02 -0400
In-Reply-To: <1409417172-6846-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Lunn <andrew@lunn.ch>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

mach-kirkwood has been removed, now that kirkwood lives in mach-mvebu.
Use MACH_KIRKWOOD which will be set when kirkwood is built as part of
mach-mvebu.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8c96e2ddf43b..f6ef7bb2dc11 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -410,7 +410,7 @@ config LEDS_MC13783
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for the dual-GPIO LED found on the
@@ -420,7 +420,7 @@ config LEDS_NS2
 config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for LEDs found on the LaCie 2Big
-- 
2.1.0
