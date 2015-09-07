From: Muhammad Falak R Wani <falakreyaz@gmail.com>
Subject: [PATCH v3 2/2] leds: leds-ipaq-micro: Fix coding style issues
Date: Mon,  7 Sep 2015 21:58:29 +0530
Message-ID: <1441643309-7807-1-git-send-email-falakreyaz@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:32794 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238AbbIGQXv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 12:23:51 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Muhammad Falak R Wani <falakreyaz@gmail.com>

Spaces at the starting of a line are removed, indentation using
tab, instead of space. Also, line width of more than 80 characters
is also taken care of.
Two warnings are left alone to aid better readability.

Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
---
 drivers/leds/leds-ipaq-micro.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
index 1206215..fa262b6 100644
--- a/drivers/leds/leds-ipaq-micro.c
+++ b/drivers/leds/leds-ipaq-micro.c
@@ -16,9 +16,9 @@
 #define LED_YELLOW	0x00
 #define LED_GREEN	0x01
 
-#define LED_EN          (1 << 4)        /* LED ON/OFF 0:off, 1:on                       */
-#define LED_AUTOSTOP    (1 << 5)        /* LED ON/OFF auto stop set 0:disable, 1:enable */
-#define LED_ALWAYS      (1 << 6)        /* LED Interrupt Mask 0:No mask, 1:mask         */
+#define LED_EN       (1 << 4) /* LED ON/OFF 0:off, 1:on                       */
+#define LED_AUTOSTOP (1 << 5) /* LED ON/OFF auto stop set 0:disable, 1:enable */
+#define LED_ALWAYS   (1 << 6) /* LED Interrupt Mask 0:No mask, 1:mask         */
 
 static void micro_leds_brightness_set(struct led_classdev *led_cdev,
 				      enum led_brightness value)
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
-- 
1.9.1
