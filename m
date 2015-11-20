From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v7] leds: ipaq-micro: Implement brightness_set_blocking op
Date: Fri, 20 Nov 2015 16:57:50 +0100
Message-ID: <1448035070-4871-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41259 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752989AbbKTP56 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 20 Nov 2015 10:57:58 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY402VXLF0KTOB0@mailout2.samsung.com> for
 linux-leds@vger.kernel.org; Sat, 21 Nov 2015 00:57:56 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

Since brightness setting can sleep for this driver, implement
brightness_set_blocking op, instead of brightness_set.
It makes this driver compatible with LED triggers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
Changes from v6:
- adjust micro_leds_brightness_set() return type to match
  brightness_set_blocking op return type

 drivers/leds/leds-ipaq-micro.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index fa262b6..02f1733 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -20,7 +20,7 @@
 #define LED_AUTOSTOP (1 << 5) /* LED ON/OFF auto stop set 0:disable, 1:enable */
 #define LED_ALWAYS   (1 << 6) /* LED Interrupt Mask 0:No mask, 1:mask         */
 
-static void micro_leds_brightness_set(struct led_classdev *led_cdev,
+static int micro_leds_brightness_set(struct led_classdev *led_cdev,
 				      enum led_brightness value)
 {
 	struct ipaq_micro *micro = dev_get_drvdata(led_cdev->dev->parent->parent);
@@ -50,7 +50,7 @@ static void micro_leds_brightness_set(struct led_classdev *led_cdev,
 		msg.tx_data[2] = 1;
 		msg.tx_data[3] = 0; /* Duty cycle 256 */
 	}
-	ipaq_micro_tx_msg_sync(micro, &msg);
+	return ipaq_micro_tx_msg_sync(micro, &msg);
 }
 
 /* Maximum duty cycle in ms 256/10 sec = 25600 ms */
@@ -102,7 +102,7 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
 
 static struct led_classdev micro_led = {
 	.name			= "led-ipaq-micro",
-	.brightness_set		= micro_leds_brightness_set,
+	.brightness_set_blocking = micro_leds_brightness_set,
 	.blink_set		= micro_leds_blink_set,
 	.flags			= LED_CORE_SUSPENDRESUME,
 };
-- 
1.7.9.5
