From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 2/5] leds: Improve and export led_update_brightness
 function
Date: Fri, 11 Apr 2014 16:56:53 +0200
Message-ID: <1397228216-6657-3-git-send-email-j.anaszewski@samsung.com>
References: <1397228216-6657-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1397228216-6657-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: s.nawrocki@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

led_update_brightness helper function used to be exploited
only locally in the led-class.c module, where its result was
being passed to the brightness_show sysfs callback. With the
introduction of v4l2-flash subdevice the same functionality
became required for reading current brightness from a LED
device. This patch adds checking brightness_get callback
error code and adds the function to the LED subsystem
public API.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/led-class.c |    6 ------
 drivers/leds/led-core.c  |   16 ++++++++++++++++
 include/linux/leds.h     |   10 ++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 58f16c3..7f285d7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -24,12 +24,6 @@
 
 static struct class *leds_class;
 
-static void led_update_brightness(struct led_classdev *led_cdev)
-{
-	if (led_cdev->brightness_get)
-		led_cdev->brightness = led_cdev->brightness_get(led_cdev);
-}
-
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 71b40d3..376166c 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -126,3 +126,19 @@ void led_set_brightness(struct led_classdev *led_cdev,
 	__led_set_brightness(led_cdev, brightness);
 }
 EXPORT_SYMBOL(led_set_brightness);
+
+int led_update_brightness(struct led_classdev *led_cdev)
+{
+	int ret = 0;
+
+	if (led_cdev->brightness_get) {
+		ret = led_cdev->brightness_get(led_cdev);
+		if (ret >= 0) {
+			led_cdev->brightness = ret;
+			return 0;
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(led_update_brightness);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a794817..d085c21 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -174,6 +174,16 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  */
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
+/**
+ * led_update_brightness - update LED brightness
+ * @led_cdev: the LED to query
+ *
+ * Get an LED's current brightness and update led_cdev->brightness
+ * member with the obtained value.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_update_brightness(struct led_classdev *led_cdev);
 
 /**
  * led_sysfs_is_locked
-- 
1.7.9.5
