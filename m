From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-fsg: Use devm_led_class_register
Date: Sat, 17 Oct 2015 04:43:17 +0530
Message-ID: <1445037197-8038-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anreas Werner <andreas.werner@men.de>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>
List-Id: linux-leds@vger.kernel.org

Use resource-managed function devm_led_classdev_register, remove
redundant function fsg_led_remove.
Drop unneeded gotos to make the _init code flow clean.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-fsg.c | 52 ++++++++++++-------------------------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index 2b4dc73..cb01f5e 100644
--- a/drivers/leds/leds-fsg.c
+++ b/drivers/leds/leds-fsg.c
@@ -156,63 +156,35 @@ static int fsg_led_probe(struct platform_device *pdev)
 	latch_value = 0xffff;
 	*latch_address = latch_value;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_wlan_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_wlan_led);
 	if (ret < 0)
-		goto failwlan;
+		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_wan_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_wan_led);
 	if (ret < 0)
-		goto failwan;
+		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_sata_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_sata_led);
 	if (ret < 0)
-		goto failsata;
+		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_usb_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_usb_led);
 	if (ret < 0)
-		goto failusb;
+		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_sync_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_sync_led);
 	if (ret < 0)
-		goto failsync;
+		return ret;
 
-	ret = led_classdev_register(&pdev->dev, &fsg_ring_led);
+	ret = devm_led_classdev_register(&pdev->dev, &fsg_ring_led);
 	if (ret < 0)
-		goto failring;
-
-	return ret;
-
- failring:
-	led_classdev_unregister(&fsg_sync_led);
- failsync:
-	led_classdev_unregister(&fsg_usb_led);
- failusb:
-	led_classdev_unregister(&fsg_sata_led);
- failsata:
-	led_classdev_unregister(&fsg_wan_led);
- failwan:
-	led_classdev_unregister(&fsg_wlan_led);
- failwlan:
-
-	return ret;
-}
-
-static int fsg_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&fsg_wlan_led);
-	led_classdev_unregister(&fsg_wan_led);
-	led_classdev_unregister(&fsg_sata_led);
-	led_classdev_unregister(&fsg_usb_led);
-	led_classdev_unregister(&fsg_sync_led);
-	led_classdev_unregister(&fsg_ring_led);
+		return ret;
 
 	return 0;
 }
 
-
 static struct platform_driver fsg_led_driver = {
 	.probe		= fsg_led_probe,
-	.remove		= fsg_led_remove,
 	.driver		= {
 		.name		= "fsg-led",
 	},
-- 
1.9.1
