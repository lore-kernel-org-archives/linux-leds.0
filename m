From: Fida Mohammad <fmthoker@gmail.com>
Subject: [PATCH] leds: leds-net48xx.c: devm_led_classdev_register
Date: Thu, 22 Oct 2015 03:51:58 -0700
Message-ID: <1445511118-12024-1-git-send-email-fmthoker@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35986 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbbJVKwz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 22 Oct 2015 06:52:55 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Muhammad Falak <falakreyaz@gmail.com>, Chris <bootc@bootc.net>, Fida Mohammad <fmthoker@gmail.com>

Use of resource managed function devm_led_classdev_register.
Also remove redundant remove function.

Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
---
 drivers/leds/leds-net48xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index ec3a2e8..148ddb1 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -39,18 +39,12 @@ static struct led_classdev net48xx_error_led = {
 
 static int net48xx_led_probe(struct platform_device *pdev)
 {
-	return led_classdev_register(&pdev->dev, &net48xx_error_led);
+	return devm_led_classdev_register(&pdev->dev, &net48xx_error_led);
 }
 
-static int net48xx_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&net48xx_error_led);
-	return 0;
-}
 
 static struct platform_driver net48xx_led_driver = {
 	.probe		= net48xx_led_probe,
-	.remove		= net48xx_led_remove,
 	.driver		= {
 		.name		= DRVNAME,
 	},
-- 
1.9.1
