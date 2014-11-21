From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] leds: lp8860: Fix module dependency
Date: Fri, 21 Nov 2014 21:48:26 +0800
Message-ID: <1416577706.16072.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:60920 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbaKUNsb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 21 Nov 2014 08:48:31 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so4964477pad.10
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2014 05:48:30 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Dan Murphy <dmurphy@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

The driver should select REGMAP_I2C rather than depend on it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/leds/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b3c0d8a..59f4228 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -249,7 +249,8 @@ config LEDS_LP8788
 
 config LEDS_LP8860
 	tristate "LED support for the TI LP8860 4 channel LED driver"
-	depends on LEDS_CLASS && REGMAP_I2C
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the TI LP8860 4 channel
 	  LED driver.
-- 
1.9.1
