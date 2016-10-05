From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 2/2] leds: core: Remove delayed_set_value property from struct
 led_classdev
Date: Wed, 05 Oct 2016 12:03:32 +0200
Message-ID: <1475661812-26215-2-git-send-email-j.anaszewski@samsung.com>
References: <1475661812-26215-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42199 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754848AbcJEKDz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Oct 2016 06:03:55 -0400
In-reply-to: <1475661812-26215-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Fabio Baltieri <fabio.baltieri@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>

delayed_set_value property was introduced in the commit
d23a22a74fde ("leds: delay led_set_brightness if stopping soft-blink").
Its aim was to allow calling led_set_brightness() from hard irq context
when soft blinking is enabled. Later LED core refactoring preserved
the property, although in an ineffective way. That bug was harmless
because in the new approach brightness setting is deferred until the
next timer tick when software blinking is enabled.

Since LED brightness is assigned immediately in
led_set_brightness_nosleep() or through struct led_classdev's
blink_brightness while soft blinking is enabled, then
delayed_set_value is no longer required.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Fabio Baltieri <fabio.baltieri@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/led-core.c | 8 ++++----
 include/linux/leds.h    | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 3bce448..2d0c75a 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -107,15 +107,15 @@ static void set_brightness_delayed(struct work_struct *ws)
 	int ret = 0;
 
 	if (led_cdev->flags & LED_BLINK_DISABLE) {
-		led_cdev->delayed_set_value = LED_OFF;
+		led_cdev->brightness = LED_OFF;
 		led_stop_software_blink(led_cdev);
 		led_cdev->flags &= ~LED_BLINK_DISABLE;
 	}
 
-	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
+	ret = __led_set_brightness(led_cdev, led_cdev->brightness);
 	if (ret == -ENOTSUPP)
 		ret = __led_set_brightness_blocking(led_cdev,
-					led_cdev->delayed_set_value);
+					led_cdev->brightness);
 	if (ret < 0 &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
@@ -260,7 +260,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 		return;
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
-	led_cdev->delayed_set_value = value;
+	led_cdev->brightness = value;
 	schedule_work(&led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index ddfcb2d..52993de 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -92,7 +92,6 @@ struct led_classdev {
 	void			(*flash_resume)(struct led_classdev *led_cdev);
 
 	struct work_struct	set_brightness_work;
-	int			delayed_set_value;
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
-- 
1.9.1
