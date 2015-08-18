From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: [PATCH v2] leds: leds-fsg: Use devm_led_classdev_register
Date: Tue, 18 Aug 2015 19:50:16 +0530
Message-ID: <20150818142016.GA2549@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36084 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753027AbbHROUX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 10:20:23 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Use resource-managed function devm_led_classdev_register instead
of led_classdev_register to make the error-path simpler.

To be compatible with the change, various gotos are replced with
direct returns and unneeded labels are dropped. Also, remove
fsg_led_remove as it is now redundant.

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
Changes since v1:
	- Fix build errors
---
 drivers/leds/leds-fsg.c | 52 ++++++++++++-------------------------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-fsg.c b/drivers/leds/leds-fsg.c
index 2b4dc73..257a813 100644
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
+		return ret;
 
 	return ret;
 }
 
-static int fsg_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&fsg_wlan_led);
-	led_classdev_unregister(&fsg_wan_led);
-	led_classdev_unregister(&fsg_sata_led);
-	led_classdev_unregister(&fsg_usb_led);
-	led_classdev_unregister(&fsg_sync_led);
-	led_classdev_unregister(&fsg_ring_led);
-
-	return 0;
-}
-
-
 static struct platform_driver fsg_led_driver = {
 	.probe		= fsg_led_probe,
-	.remove		= fsg_led_remove,
 	.driver		= {
 		.name		= "fsg-led",
 	},
-- 
1.9.1
