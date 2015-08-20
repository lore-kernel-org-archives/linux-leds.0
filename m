From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 02/36] leds: Add led_set_brightness_sync to the public
 LED subsystem API
Date: Thu, 20 Aug 2015 16:43:32 +0200
Message-ID: <1440081846-11697-3-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

led_set_brightness_sync function was visible only internally to the
LED subsystem. It is now being made publicly available since it has
become apparent that this is a caller who should decide whether
brightness is to be set in a synchronous or an asynchronous way.

The function is modified to use brightness_set_blocking or
brightness_set op, depending on which of them is implemented, in case
brightness_set_sync op wasn't been provided.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-core.c |   25 +++++++++++++++++++++++++
 drivers/leds/leds.h     |   13 -------------
 include/linux/leds.h    |   15 +++++++++++++++
 3 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 549de7e..3f3b71d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -141,6 +141,31 @@ void led_set_brightness(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL(led_set_brightness);
 
+int led_set_brightness_sync(struct led_classdev *led_cdev,
+			    enum led_brightness value)
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
+							led_cdev->brightness);
+	else if (led_cdev->brightness_set_blocking)
+		led_cdev->brightness_set_blocking(led_cdev,
+							led_cdev->brightness);
+	else if (led_cdev->brightness_set)
+		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
+	else
+		ret = -EINVAL;
+
+	return ret;
+}
+EXPORT_SYMBOL(led_set_brightness_sync);
+
 int led_update_brightness(struct led_classdev *led_cdev)
 {
 	int ret = 0;
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
index 85fad6b..2377e0f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -166,6 +166,21 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
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
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_set_brightness_sync(struct led_classdev *led_cdev,
+				   enum led_brightness value);
+
 /**
  * led_update_brightness - update LED brightness
  * @led_cdev: the LED to query
-- 
1.7.9.5
