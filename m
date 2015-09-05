From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-ot200: Use devm_led_classdev_register
Date: Sat,  5 Sep 2015 19:53:27 +0530
Message-ID: <1441463007-15638-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36443 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751514AbbIEOUO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2015 10:20:14 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Muhammad Falak R Wani <falakreyaz@gmail.com>

Use resource-managed function devm_led_classdev_register
instead of led_classdev_register to make the error path simpler.
The goto is replaced with direct return, unneeded label err is
dropped. Also, remove redundant ot200_led_remove.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-ot200.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
index 39870de..12af112 100644
--- a/drivers/leds/leds-ot200.c
+++ b/drivers/leds/leds-ot200.c
@@ -124,9 +124,9 @@ static int ot200_led_probe(struct platform_device *pdev)
 		leds[i].cdev.name = leds[i].name;
 		leds[i].cdev.brightness_set = ot200_led_brightness_set;
 
-		ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
+		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
 		if (ret < 0)
-			goto err;
+			return ret;
 	}
 
 	leds_front = 0;		/* turn off all front leds */
@@ -135,27 +135,10 @@ static int ot200_led_probe(struct platform_device *pdev)
 	outb(leds_back, 0x5a);
 
 	return 0;
-
-err:
-	for (i = i - 1; i >= 0; i--)
-		led_classdev_unregister(&leds[i].cdev);
-
-	return ret;
-}
-
-static int ot200_led_remove(struct platform_device *pdev)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(leds); i++)
-		led_classdev_unregister(&leds[i].cdev);
-
-	return 0;
 }
 
 static struct platform_driver ot200_led_driver = {
 	.probe		= ot200_led_probe,
-	.remove		= ot200_led_remove,
 	.driver		= {
 		.name	= "leds-ot200",
 	},
-- 
1.9.1
