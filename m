From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 4/5] leds: leds-mc13783: Remove unnecessary cleaning of registers on exit
Date: Sat, 21 Dec 2013 08:31:36 +0400
Message-ID: <1387600296-22602-4-git-send-email-shc_work@mail.ru>
References: <1387600296-22602-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp23.mail.ru ([94.100.176.176]:42763 "EHLO smtp23.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754334Ab3LUEbt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 20 Dec 2013 23:31:49 -0500
In-Reply-To: <1387600296-22602-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>

LED core switches each LED to OFF-state on exit, so there is no need
for resetting registers.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/leds-mc13783.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 47e7a4e..95b3dfb 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -210,7 +210,6 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 static int mc13xxx_led_remove(struct platform_device *pdev)
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
-	struct mc13xxx *mcdev = leds->master;
 	int i;
 
 	for (i = 0; i < leds->num_leds; i++) {
@@ -218,9 +217,6 @@ static int mc13xxx_led_remove(struct platform_device *pdev)
 		cancel_work_sync(&leds->led[i].work);
 	}
 
-	for (i = 0; i < leds->devtype->num_regs; i++)
-		mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i, 0);
-
 	return 0;
 }
 
-- 
1.8.3.2
