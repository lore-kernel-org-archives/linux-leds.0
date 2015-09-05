From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-hp6xx: Use devm_led_classdev_register
Date: Sun,  6 Sep 2015 01:23:37 +0530
Message-ID: <1441482817-23400-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34300 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752022AbbIETuQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2015 15:50:16 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Muhammad Falak R Wani <falakreyaz@gmail.com>

Use resource-managed function devm_led_classdev_register
instead of led_classdev_register to simplify error path.
An unnecessary check of ret is replaced with a direct return
Also, remove redundant hp6xxled_remove.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-hp6xx.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 0b84c01..3b38ff0 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -59,28 +59,15 @@ static int hp6xxled_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = led_classdev_register(&pdev->dev, &hp6xx_red_led);
+	ret = devm_led_classdev_register(&pdev->dev, &hp6xx_red_led);
 	if (ret < 0)
 		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &hp6xx_green_led);
-	if (ret < 0)
-		led_classdev_unregister(&hp6xx_red_led);
-
-	return ret;
-}
-
-static int hp6xxled_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&hp6xx_red_led);
-	led_classdev_unregister(&hp6xx_green_led);
-
-	return 0;
+	return  devm_led_classdev_register(&pdev->dev, &hp6xx_green_led);
 }
 
 static struct platform_driver hp6xxled_driver = {
 	.probe		= hp6xxled_probe,
-	.remove		= hp6xxled_remove,
 	.driver		= {
 		.name		= "hp6xx-led",
 	},
-- 
1.9.1
