From: Fida Mohammad <fmthoker@gmail.com>
Subject: [PATCH]  leds: leds-hp6xx: Use of devm_classdev_register
Date: Mon, 26 Oct 2015 10:00:28 -0700
Message-ID: <1445878828-32514-1-git-send-email-fmthoker@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35466 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbbJZRBS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 26 Oct 2015 13:01:18 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Muhammad Falak <falakreyaz@gmail.com>, Kristoffer <kristoffer.ericson@gmail.com>, Fida Mohammad <fmthoker@gmail.com>

Use resource managed function devm_classdev_register to make
error path simpler. Also removed the redundant remove function.

Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
---
 drivers/leds/leds-hp6xx.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
index 0b84c01..ffb6d5b 100644
--- a/drivers/leds/leds-hp6xx.c
+++ b/drivers/leds/leds-hp6xx.c
@@ -59,28 +59,17 @@ static int hp6xxled_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = led_classdev_register(&pdev->dev, &hp6xx_red_led);
+	ret = devm_led_classdev_register(&pdev->dev, &hp6xx_red_led);
 	if (ret < 0)
 		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &hp6xx_green_led);
-	if (ret < 0)
-		led_classdev_unregister(&hp6xx_red_led);
+	return devm_led_classdev_register(&pdev->dev, &hp6xx_green_led);
 
-	return ret;
 }
 
-static int hp6xxled_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&hp6xx_red_led);
-	led_classdev_unregister(&hp6xx_green_led);
-
-	return 0;
-}
 
 static struct platform_driver hp6xxled_driver = {
 	.probe		= hp6xxled_probe,
-	.remove		= hp6xxled_remove,
 	.driver		= {
 		.name		= "hp6xx-led",
 	},
-- 
1.9.1
