From: Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358
Date: Sat,  2 Jan 2016 14:05:49 +0100
Message-ID: <1451739949-14263-1-git-send-email-vegard.nossum@oracle.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:46747 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751389AbcABNGG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 2 Jan 2016 08:06:06 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Ran into this on UML:

drivers/built-in.o: In function `bcm6328_leds_probe':
drivers/leds/leds-bcm6328.c:340: undefined reference to `devm_ioremap_resource'
drivers/built-in.o: In function `bcm6358_leds_probe':
drivers/leds/leds-bcm6358.c:173: undefined reference to `devm_ioremap_resource'
collect2: error: ld returned 1 exit status

devm_ioremap_resource() is defined only when HAS_IOMEM is selected.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b1ab8bd..7f940c2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -52,6 +52,7 @@ config LEDS_AAT1290
 config LEDS_BCM6328
 	tristate "LED Support for Broadcom BCM6328"
 	depends on LEDS_CLASS
+	depends on HAS_IOMEM
 	depends on OF
 	help
 	  This option enables support for LEDs connected to the BCM6328
@@ -60,6 +61,7 @@ config LEDS_BCM6328
 config LEDS_BCM6358
 	tristate "LED Support for Broadcom BCM6358"
 	depends on LEDS_CLASS
+	depends on HAS_IOMEM
 	depends on OF
 	help
 	  This option enables support for LEDs connected to the BCM6358
-- 
1.9.1
