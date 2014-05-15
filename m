From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH RFC 07/11] leds: Remove ARCH_KIRKWOOD dependency
Date: Thu, 15 May 2014 16:23:52 +0200
Message-ID: <1400163836-9831-12-git-send-email-andrew@lunn.ch>
References: <1400163836-9831-1-git-send-email-andrew@lunn.ch>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:44705 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174AbaEOO1k (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 15 May 2014 10:27:40 -0400
In-Reply-To: <1400163836-9831-1-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux ARM <linux-arm-kernel@lists.infradead.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

mach-kirkwood has been removed, now that kirkwood lives in mach-mvebu.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6de9dfbf61c1..01ebebfcc891 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -421,7 +421,7 @@ config LEDS_MC13783
 config LEDS_NS2
 	tristate "LED support for Network Space v2 GPIO LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for the dual-GPIO LED found on the
@@ -431,7 +431,7 @@ config LEDS_NS2
 config LEDS_NETXBIG
 	tristate "LED support for Big Network series LEDs"
 	depends on LEDS_CLASS
-	depends on ARCH_KIRKWOOD || MACH_KIRKWOOD
+	depends on MACH_KIRKWOOD
 	default y
 	help
 	  This option enable support for LEDs found on the LaCie 2Big
-- 
2.0.0.rc2
