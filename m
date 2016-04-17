From: Martin Dummer <martin.dummer@gmx.net>
Subject: [PATCH] drivers/leds/leds-ss4200: add depend on x86 arch
Date: Sun, 17 Apr 2016 13:27:52 +0200
Message-ID: <1460892472-7228-1-git-send-email-martin.dummer@gmx.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:50085 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751385AbcDQL2q (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 17 Apr 2016 07:28:46 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: Martin Dummer <martin.dummer@gmx.net>, linux-leds@vger.kernel.org

There is only one x86 hardware where the driver leds-ss4200 applies to.
Add kconfig dependency to x86 architecture, fix help text whitespace.

Signed-off-by: Martin Dummer <martin.dummer@gmx.net>
---
 drivers/leds/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 2251478..5ae2834 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -413,10 +413,11 @@ config LEDS_INTEL_SS4200
 	tristate "LED driver for Intel NAS SS4200 series"
 	depends on LEDS_CLASS
 	depends on PCI && DMI
+	depends on X86
 	help
 	  This option enables support for the Intel SS4200 series of
-	  Network Attached Storage servers.  You may control the hard
-	  drive or power LEDs on the front panel.  Using this driver
+	  Network Attached Storage servers. You may control the hard
+	  drive or power LEDs on the front panel. Using this driver
 	  can stop the front LED from blinking after startup.
 
 config LEDS_LT3593
-- 
2.7.3
