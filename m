From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH] leds: leds-ipaq-micro: Use devm_led_classdev_register
Date: Sun,  6 Sep 2015 01:25:42 +0530
Message-ID: <1441482942-23447-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33739 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbbIETvN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2015 15:51:13 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Muhammad Falak R Wani <falakreyaz@gmail.com>

Use of resource-managed function devm_led_classdev_register
instead of led_classdev_register is preferred, consequently
remove redundant function micro_leds_remove. Also some coding
style issues are fixed, only two remain, which are left alone
to aid better readability.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-ipaq-micro.c | 47 ++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 3776f51..0b0b4ff 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -16,9 +16,9 @@
 #define LED_YELLOW	0x00
 #define LED_GREEN	0x01
 
-#define LED_EN          (1 << 4)        /* LED ON/OFF 0:off, 1:on                       */
-#define LED_AUTOSTOP    (1 << 5)        /* LED ON/OFF auto stop set 0:disable, 1:enable */
-#define LED_ALWAYS      (1 << 6)        /* LED Interrupt Mask 0:No mask, 1:mask         */
+#define LED_EN	      (1 << 4)	/* LED ON/OFF 0:off, 1:on      */
+#define LED_AUTOSTOP  (1 << 5)  /* LED ON/OFF auto stop set 0:disable,1:enable*/
+#define LED_ALWAYS    (1 << 6)  /* LED Interrupt Mask 0:No mask, 1:mask*/
 
 static void micro_leds_brightness_set(struct led_classdev *led_cdev,
 				      enum led_brightness value)
@@ -27,14 +27,14 @@ static void micro_leds_brightness_set(struct led_classdev *led_cdev,
 	/*
 	 * In this message:
 	 * Byte 0 = LED color: 0 = yellow, 1 = green
-	 *          yellow LED is always ~30 blinks per minute
+	 *	  yellow LED is always ~30 blinks per minute
 	 * Byte 1 = duration (flags?) appears to be ignored
 	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
-	 *          1 = 1/10 second
-	 *          0 = 256/10 second
+	 *	  1 = 1/10 second
+	 *	  0 = 256/10 second
 	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
-	 *          1 = 1/10 second
-	 *          0 = 256/10 seconds
+	 *	  1 = 1/10 second
+	 *	  0 = 256/10 seconds
 	 */
 	struct ipaq_micro_msg msg = {
 		.id = MSG_NOTIFY_LED,
@@ -64,14 +64,14 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
 	/*
 	 * In this message:
 	 * Byte 0 = LED color: 0 = yellow, 1 = green
-	 *          yellow LED is always ~30 blinks per minute
+	 *	  yellow LED is always ~30 blinks per minute
 	 * Byte 1 = duration (flags?) appears to be ignored
 	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
-	 *          1 = 1/10 second
-	 *          0 = 256/10 second
+	 *	  1 = 1/10 second
+	 *	  0 = 256/10 second
 	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
-	 *          1 = 1/10 second
-	 *          0 = 256/10 seconds
+	 *	  1 = 1/10 second
+	 *	  0 = 256/10 seconds
 	 */
 	struct ipaq_micro_msg msg = {
 		.id = MSG_NOTIFY_LED,
@@ -79,14 +79,14 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
 	};
 
 	msg.tx_data[0] = LED_GREEN;
-        if (*delay_on > IPAQ_LED_MAX_DUTY ||
+	if (*delay_on > IPAQ_LED_MAX_DUTY ||
 	    *delay_off > IPAQ_LED_MAX_DUTY)
-                return -EINVAL;
+		return -EINVAL;
 
-        if (*delay_on == 0 && *delay_off == 0) {
-                *delay_on = 100;
-                *delay_off = 100;
-        }
+	if (*delay_on == 0 && *delay_off == 0) {
+		*delay_on = 100;
+		*delay_off = 100;
+	}
 
 	msg.tx_data[1] = 0;
 	if (*delay_on >= IPAQ_LED_MAX_DUTY)
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
