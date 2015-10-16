From: Fida Mohammad <fmthoker@gmail.com>
Subject: [PATCH] leds: leds-locomo.c: Use devm_led_classdev_register
Date: Fri, 16 Oct 2015 14:33:03 -0700
Message-ID: <1445031183-25326-1-git-send-email-fmthoker@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:36340 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772AbbJPVdw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 16 Oct 2015 17:33:52 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fida Mohammad <fmthoker@gmail.com>

Use resource managed function devm_led_classdev_register to make
initialisation path simpler.
Also removed redundant led_classdev_unregister function.

Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
---
 drivers/leds/leds-locomo.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 80ba048..24c4b53 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -59,23 +59,13 @@ static int locomoled_probe(struct locomo_dev *ldev)
 {
 	int ret;
 
-	ret = led_classdev_register(&ldev->dev, &locomo_led0);
+	ret = devm_led_classdev_register(&ldev->dev, &locomo_led0);
 	if (ret < 0)
 		return ret;
 
-	ret = led_classdev_register(&ldev->dev, &locomo_led1);
-	if (ret < 0)
-		led_classdev_unregister(&locomo_led0);
-
-	return ret;
+	return  devm_led_classdev_register(&ldev->dev, &locomo_led1);
 }
 
-static int locomoled_remove(struct locomo_dev *dev)
-{
-	led_classdev_unregister(&locomo_led0);
-	led_classdev_unregister(&locomo_led1);
-	return 0;
-}
 
 static struct locomo_driver locomoled_driver = {
 	.drv = {
@@ -83,7 +73,6 @@ static struct locomo_driver locomoled_driver = {
 	},
 	.devid	= LOCOMO_DEVID_LED,
 	.probe	= locomoled_probe,
-	.remove	= locomoled_remove,
 };
 
 static int __init locomoled_init(void)
-- 
1.9.1
