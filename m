From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 01/51] leds: Add led_set_brightness_sync to the public LED
 subsystem API
Date: Fri, 17 Jul 2015 10:46:47 +0200
Message-ID: <1437122857-6765-2-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58419 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbbGQIrw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:47:52 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>

led_set_brightness_sync function was visible only internally to the
LED subsystem. It is now being made publicly available since it has
become apparent that this is a caller who should decide whether
brightness is to be set in a synchronous or an asynchronous way.
The function is modified to use brightness_set op as the second
option if brightness_set_sync is not implemented. Eventually all
LED subsystem drivers will be modfified to set brightness only in
a synchronous way with use of brightness_set op and brightness_set_sync
op will be removed. LED core will take care of calling brightness_set
op asynchronously if needed.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds.h  |   13 -------------
 include/linux/leds.h |   29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bc89d7a..1c026c9 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -26,19 +26,6 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 		led_cdev->brightness_set(led_cdev, value);
 }
 
-static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
-					enum led_brightness value)
-{
-	int ret = 0;
-
-	led_cdev->brightness = min(value, led_cdev->max_brightness);
-
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		ret = led_cdev->brightness_set_sync(led_cdev,
-						led_cdev->brightness);
-	return ret;
-}
-
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..31d9ebf 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -160,6 +160,35 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  */
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
+
+/**
+ * led_set_brightness_sync - set LED brightness synchronously
+ * @led_cdev: the LED to set
+ * @brightness: the brightness to set it to
+ *
+ * Set an LED's brightness immediately. This function will block
+ * the caller for the time required for accessing device register,
+ * and it can sleep.
+ */
+static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
+					  enum led_brightness value)
+{
+	int ret = 0;
+
+	led_cdev->brightness = min(value, led_cdev->max_brightness);
+
+	if (led_cdev->flags & LED_SUSPENDED)
+		return 0;
+
+	if (led_cdev->brightness_set_sync)
+		ret = led_cdev->brightness_set_sync(led_cdev,
+						    led_cdev->brightness);
+	else
+		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
+
+	return ret;
+}
+
 /**
  * led_update_brightness - update LED brightness
  * @led_cdev: the LED to query
-- 
1.7.9.5
