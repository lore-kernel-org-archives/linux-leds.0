From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v3 3/5] leds: leds-mc13783: Use proper "max_brightness" value fo LEDs
Date: Sat,  1 Feb 2014 10:36:30 +0400
Message-ID: <1391236591-16540-3-git-send-email-shc_work@mail.ru>
References: <1391236591-16540-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fallback4.mail.ru ([94.100.176.42]:42469 "EHLO
	fallback4.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaBAGhq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 1 Feb 2014 01:37:46 -0500
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [94.100.177.91])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id A03EB1D9917
	for <linux-leds@vger.kernel.org>; Sat,  1 Feb 2014 10:36:56 +0400 (MSK)
In-Reply-To: <1391236591-16540-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>

Instead of using maximum value of 255 and shift it to appropriate
LED duty cycle, this patch introduce a helper to use proper maximum
value for each LED.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/leds/leds-mc13783.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index c8bd8a8..2360eca 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -44,11 +44,21 @@ struct mc13xxx_leds {
 	struct mc13xxx_led		led[0];
 };
 
+static unsigned int mc13xxx_max_brightness(int id)
+{
+	if (id >= MC13783_LED_MD && id <= MC13783_LED_KP)
+		return 0x0f;
+	else if (id >= MC13783_LED_R1 && id <= MC13783_LED_B3)
+		return 0x1f;
+
+	return 0x3f;
+}
+
 static void mc13xxx_led_work(struct work_struct *work)
 {
 	struct mc13xxx_led *led = container_of(work, struct mc13xxx_led, work);
 	struct mc13xxx_leds *leds = led->leds;
-	unsigned int reg, mask, value, bank, off, shift;
+	unsigned int reg, bank, off, shift;
 
 	switch (led->id) {
 	case MC13783_LED_MD:
@@ -56,8 +66,6 @@ static void mc13xxx_led_work(struct work_struct *work)
 	case MC13783_LED_KP:
 		reg = 2;
 		shift = 9 + (led->id - MC13783_LED_MD) * 4;
-		mask = 0x0f;
-		value = led->new_brightness >> 4;
 		break;
 	case MC13783_LED_R1:
 	case MC13783_LED_G1:
@@ -72,16 +80,12 @@ static void mc13xxx_led_work(struct work_struct *work)
 		bank = off / 3;
 		reg = 3 + bank;
 		shift = (off - bank * 3) * 5 + 6;
-		value = led->new_brightness >> 3;
-		mask = 0x1f;
 		break;
 	case MC13892_LED_MD:
 	case MC13892_LED_AD:
 	case MC13892_LED_KP:
 		reg = (led->id - MC13892_LED_MD) / 2;
 		shift = 3 + (led->id - MC13892_LED_MD) * 12;
-		mask = 0x3f;
-		value = led->new_brightness >> 2;
 		break;
 	case MC13892_LED_R:
 	case MC13892_LED_G:
@@ -90,22 +94,19 @@ static void mc13xxx_led_work(struct work_struct *work)
 		bank = off / 2;
 		reg = 2 + bank;
 		shift = (off - bank * 2) * 12 + 3;
-		value = led->new_brightness >> 2;
-		mask = 0x3f;
 		break;
 	case MC34708_LED_R:
 	case MC34708_LED_G:
 		reg = 0;
 		shift = 3 + (led->id - MC34708_LED_R) * 12;
-		value = led->new_brightness >> 2;
-		mask = 0x3f;
 		break;
 	default:
 		BUG();
 	}
 
 	mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + reg,
-			mask << shift, value << shift);
+			mc13xxx_max_brightness(led->id) << shift,
+			led->new_brightness << shift);
 }
 
 static void mc13xxx_led_set(struct led_classdev *led_cdev,
@@ -185,7 +186,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].cdev.default_trigger = trig;
 		leds->led[i].cdev.flags = LED_CORE_SUSPENDRESUME;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
-		leds->led[i].cdev.brightness = LED_OFF;
+		leds->led[i].cdev.max_brightness = mc13xxx_max_brightness(id);
 
 		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
 
-- 
1.8.3.2
