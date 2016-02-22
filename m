From: Evan McClain <aeroevan@gmail.com>
Subject: [PATCH 3/3] leds: chromeos: Use devm_led_classdev_register.
Date: Mon, 22 Feb 2016 10:01:00 -0500
Message-ID: <1456153260-3022-3-git-send-email-aeroevan@gmail.com>
References: <1456153260-3022-1-git-send-email-aeroevan@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:34617 "EHLO
	mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752820AbcBVPBz (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Feb 2016 10:01:55 -0500
Received: by mail-qk0-f182.google.com with SMTP id x1so56440431qkc.1
        for <linux-leds@vger.kernel.org>; Mon, 22 Feb 2016 07:01:54 -0800 (PST)
In-Reply-To: <1456153260-3022-1-git-send-email-aeroevan@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Simon Que <sque@chromium.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Evan McClain <aeroevan@gmail.com>

Also use managed devm_kzalloc.

Signed-off-by: Evan McClain <aeroevan@gmail.com>
---
 drivers/leds/leds-chromeos-keyboard.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
index 6a6ff75..4e56ede 100644
--- a/drivers/leds/leds-chromeos-keyboard.c
+++ b/drivers/leds/leds-chromeos-keyboard.c
@@ -69,7 +69,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	cdev = kzalloc(sizeof(struct led_classdev), GFP_KERNEL);
+	cdev = devm_kzalloc(&pdev->dev, sizeof(struct led_classdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
 	cdev->name = "chromeos::kbd_backlight";
@@ -78,15 +78,12 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	cdev->brightness = cdev->max_brightness;
 	cdev->flags |= LED_CORE_SUSPENDRESUME;
 
-	ret = led_classdev_register(&pdev->dev, cdev);
+	ret = devm_led_classdev_register(&pdev->dev, cdev);
 	if (ret)
-		goto err;
+		return ret;
 
 	platform_set_drvdata(pdev, cdev);
 	return 0;
-err:
-	kfree(cdev);
-	return ret;
 }
 
 static int keyboard_led_remove(struct platform_device *pdev)
@@ -94,7 +91,6 @@ static int keyboard_led_remove(struct platform_device *pdev)
 	struct led_classdev *cdev = platform_get_drvdata(pdev);
 
 	platform_set_drvdata(pdev, NULL);
-	kfree(cdev);
 	return 0;
 }
 
-- 
2.5.0
