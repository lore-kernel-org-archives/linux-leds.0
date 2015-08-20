From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 04/36] leds: Add an internal led_set_brightness_nosleep
 function
Date: Thu, 20 Aug 2015 16:43:34 +0200
Message-ID: <1440081846-11697-5-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

This patch adds led_set_brightness_nosleep function. It guarantees setting
LED brightness in a non-blocking way.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-core.c |   21 +++++++++++++++++++++
 drivers/leds/leds.h     |    4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index b69271f..0200407 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -114,6 +114,27 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_stop_software_blink);
 
+void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	int ret;
+
+	/*
+	 * Drivers that implement brightness_set op are guaranteed
+	 * not to sleep while setting brightness.
+	 */
+	if (led_cdev->brightness_set) {
+		ret = led_set_brightness_sync(led_cdev, value);
+		if (ret < 0)
+			dev_err(led_cdev->dev,
+				"cannot set led brightness %d\n", ret);
+		return;
+	}
+
+	led_set_brightness_async(led_cdev, value);
+}
+EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
+
 void led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index ca38f6a..cd251be 100644
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
@@ -28,6 +30,8 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 	return led_cdev->brightness;
 }
 
+void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+				enum led_brightness value);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 
 extern struct rw_semaphore leds_list_lock;
-- 
1.7.9.5
