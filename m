From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 03/51] leds: Add an internal led_set_brightness_nosleep
 function
Date: Fri, 17 Jul 2015 10:46:49 +0200
Message-ID: <1437122857-6765-4-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

This patch adds led_set_brightness_nosleep function as well
as LED_BRIGHTNESS_FAST flag. The flag, when set by a driver
means that its brightness_set op is guaranteed not to sleep.
Basing on this information the function decides whether
brightness should be set in an asynchronous or synchronous
way.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds.h  |   18 ++++++++++++++++++
 include/linux/leds.h |    3 ++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index ca38f6a..6c56142 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -2,8 +2,10 @@
  * LED Core
  *
  * Copyright 2005 Openedhand Ltd.
+ * Copyright 2014, 2015 Samsung Electronics Co., Ltd.
  *
  * Author: Richard Purdie <rpurdie@openedhand.com>
+ * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -23,6 +25,22 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 	schedule_work(&led_cdev->set_brightness_work);
 }
 
+static inline void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+					      enum led_brightness value)
+{
+	if (led_cdev->flags & LED_BRIGHTNESS_FAST) {
+		led_set_brightness_sync(led_cdev, value);
+		return;
+	}
+
+	/*
+	 * Delegate setting brightness to a work queue task only for slow
+	 * LEDs as the FAST ones are guaranteed not to sleep while setting
+	 * brightness.
+	 */
+	led_set_brightness_async(led_cdev, value);
+}
+
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a72ab56..2fdfc13 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,9 +49,10 @@ struct led_classdev {
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 #define LED_BLINK_DISABLE	(1 << 24)
+#define LED_BRIGHTNESS_FAST	(1 << 25)
 
 	/* Set LED brightness level */
-	/* Must not sleep, use a workqueue if needed */
+	/* Must not sleep if the driver sets LED_BRIGHTNESS_FAST flag */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
 	/*
-- 
1.7.9.5
