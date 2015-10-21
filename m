From: Fida Mohammad <fmthoker@gmail.com>
Subject: [PATCH] leds: leds-wrap.c: Use devm_led_classdev_register
Date: Wed, 21 Oct 2015 03:58:35 -0700
Message-ID: <1445425115-5415-1-git-send-email-fmthoker@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35439 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754461AbbJUK7k (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 21 Oct 2015 06:59:40 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Muhammad Falak <falakreyaz@gmail.com>
Cc: Kristian Kielhofner <kris@krisk.org>, Fida Mohammad <fmthoker@gmail.com>

Use of resource managed function devm_led_classdev_register to
make initialization path simpler. Also removed redundant remove
function.

Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
---
 drivers/leds/leds-wrap.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 1ba3def..c5ff4b4 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -76,39 +76,21 @@ static int wrap_led_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	ret = led_classdev_register(&pdev->dev, &wrap_power_led);
+	ret = devm_led_classdev_register(&pdev->dev, &wrap_power_led);
 	if (ret < 0)
 		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &wrap_error_led);
+	ret = devm_led_classdev_register(&pdev->dev, &wrap_error_led);
 	if (ret < 0)
-		goto err1;
-
-	ret = led_classdev_register(&pdev->dev, &wrap_extra_led);
-	if (ret < 0)
-		goto err2;
-
-	return ret;
+		return ret;
 
-err2:
-	led_classdev_unregister(&wrap_error_led);
-err1:
-	led_classdev_unregister(&wrap_power_led);
+	return  devm_led_classdev_register(&pdev->dev, &wrap_extra_led);
 
-	return ret;
 }
 
-static int wrap_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&wrap_power_led);
-	led_classdev_unregister(&wrap_error_led);
-	led_classdev_unregister(&wrap_extra_led);
-	return 0;
-}
 
 static struct platform_driver wrap_led_driver = {
 	.probe		= wrap_led_probe,
-	.remove		= wrap_led_remove,
 	.driver		= {
 		.name		= DRVNAME,
 	},
-- 
1.9.1
