From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH v2 1/2] leds: leds-ipaq-micro: Use devm_led_classdev_register
Date: Mon,  7 Sep 2015 19:43:23 +0530
Message-ID: <1441635204-3634-2-git-send-email-falakreyaz@gmail.com>
References: <1441635204-3634-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:32782 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699AbbIGOKA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:10:00 -0400
In-Reply-To: <1441635204-3634-1-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>

Use of resource-managed function devm_led_classdev_register
instead of led_classdev_register is preferred, consequently
remove redundant function micro_leds_remove.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-ipaq-micro.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 3776f51..1206215 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -111,7 +111,7 @@ static int micro_leds_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = led_classdev_register(&pdev->dev, &micro_led);
+	ret = devm_led_classdev_register(&pdev->dev, &micro_led);
 	if (ret) {
 		dev_err(&pdev->dev, "registering led failed: %d\n", ret);
 		return ret;
@@ -121,18 +121,11 @@ static int micro_leds_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int micro_leds_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&micro_led);
-	return 0;
-}
-
 static struct platform_driver micro_leds_device_driver = {
 	.driver = {
 		.name    = "ipaq-micro-leds",
 	},
 	.probe   = micro_leds_probe,
-	.remove  = micro_leds_remove,
 };
 module_platform_driver(micro_leds_device_driver);
 
-- 
1.9.1
