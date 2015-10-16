From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-net48xx: Use devm_led_classdev_register
Date: Sat, 17 Oct 2015 05:02:57 +0530
Message-ID: <1445038377-11547-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:32798 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492AbbJPX2X (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 16 Oct 2015 19:28:23 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Chris Boot <bootc@bootc.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>

Use devm_led_classdev_register instead of led_classdev_register,
removing the redundant net48xx_led_remove function.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-net48xx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index ec3a2e8..0d214c2 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -39,18 +39,11 @@ static struct led_classdev net48xx_error_led = {
 
 static int net48xx_led_probe(struct platform_device *pdev)
 {
-	return led_classdev_register(&pdev->dev, &net48xx_error_led);
-}
-
-static int net48xx_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&net48xx_error_led);
-	return 0;
+	return devm_led_classdev_register(&pdev->dev, &net48xx_error_led);
 }
 
 static struct platform_driver net48xx_led_driver = {
 	.probe		= net48xx_led_probe,
-	.remove		= net48xx_led_remove,
 	.driver		= {
 		.name		= DRVNAME,
 	},
-- 
1.9.1
