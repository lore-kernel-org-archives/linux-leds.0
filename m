From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-menf21bmc.c: Use devm_led_class_register
Date: Sat, 17 Oct 2015 01:47:55 +0530
Message-ID: <1445026675-2171-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34838 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932325AbbJPUNo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 16 Oct 2015 16:13:44 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Anreas Werner <andreas.werner@men.de>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>

Use resource-managed function devm_led_classdev_register instead
of led_classdev_register, consequently remove redundant
menf21bmc_led_remove function.
Also drop the unneeded label err_free_leds.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-menf21bmc.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 4b9eea8..dec2a6e 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -87,36 +87,20 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
 		leds[i].cdev.name = leds[i].name;
 		leds[i].cdev.brightness_set = menf21bmc_led_set;
 		leds[i].i2c_client = i2c_client;
-		ret = led_classdev_register(&pdev->dev, &leds[i].cdev);
-		if (ret < 0)
-			goto err_free_leds;
+		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to register LED device\n");
+			return ret;
+		}
 	}
 	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");
 
 	return 0;
 
-err_free_leds:
-	dev_err(&pdev->dev, "failed to register LED device\n");
-
-	for (i = i - 1; i >= 0; i--)
-		led_classdev_unregister(&leds[i].cdev);
-
-	return ret;
-}
-
-static int menf21bmc_led_remove(struct platform_device *pdev)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(leds); i++)
-		led_classdev_unregister(&leds[i].cdev);
-
-	return 0;
 }
 
 static struct platform_driver menf21bmc_led = {
 	.probe		= menf21bmc_led_probe,
-	.remove		= menf21bmc_led_remove,
 	.driver		= {
 		.name		= "menf21bmc_led",
 	},
-- 
1.9.1
