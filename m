From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH] leds: Allow drivers to update the core, and generate events on changes
Date: Tue, 27 Dec 2016 20:11:36 +0100
Message-ID: <20161227191136.4516-1-gabriele.mzt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: linux-leds@vger.kernel.org

Similarily to commit 325253a6b2de ("backlight: Allow drivers to update
the core, and generate events on changes"), inform userspace about
brightness changes and allow drivers to request updates of the
brightness value.

Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
This is exactly like 325253a6b2de, but for the led subsystem. The only thing
I'm not entirely sure of is that uevents are sent even if the brightness
doesn't change, but this is how it's done in 325253a6b2de.

 drivers/leds/led-class.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  7 +++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 326ee6e925a2..248ee0fca683 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -25,6 +25,27 @@
 
 static struct class *leds_class;
 
+static void brightness_generate_event(struct led_classdev *led_cdev,
+				      enum led_brightness_update_reason reason)
+{
+	char *envp[2];
+
+	switch (reason) {
+	case LED_BRIGHTNESS_UPDATE_SYSFS:
+		envp[0] = "SOURCE=sysfs";
+		break;
+	case LED_BRIGHTNESS_UPDATE_HOTKEY:
+		envp[0] = "SOURCE=hotkey";
+		break;
+	default:
+		envp[0] = "SOURCE=unknown";
+		break;
+	}
+	envp[1] = NULL;
+	kobject_uevent_env(&led_cdev->dev->kobj, KOBJ_CHANGE, envp);
+	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness");
+}
+
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -58,6 +79,8 @@ static ssize_t brightness_store(struct device *dev,
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 
+	brightness_generate_event(led_cdev, LED_BRIGHTNESS_UPDATE_SYSFS);
+
 	ret = size;
 unlock:
 	mutex_unlock(&led_cdev->led_access);
@@ -129,6 +152,25 @@ void led_classdev_resume(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_classdev_resume);
 
+/**
+ * led_brightness_force_update - tell the backlight subsystem that hardware
+ *   state has changed
+ * @led_cdev: the led device to update
+ *
+ * Updates the internal state of the backlight in response to a hardware event,
+ * and generate a uevent to notify userspace
+ */
+void led_brightness_force_update(struct led_classdev *led_cdev,
+				 enum led_brightness_update_reason reason)
+{
+	mutex_lock(&led_cdev->led_access);
+	if (led_cdev->brightness_get)
+		led_cdev->brightness = led_cdev->brightness_get(led_cdev);
+	mutex_unlock(&led_cdev->led_access);
+	brightness_generate_event(led_cdev, reason);
+}
+EXPORT_SYMBOL(led_brightness_force_update);
+
 #ifdef CONFIG_PM_SLEEP
 static int led_suspend(struct device *dev)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 569cb531094c..8d3faaf14ff1 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -31,6 +31,11 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+enum led_brightness_update_reason {
+	LED_BRIGHTNESS_UPDATE_HOTKEY,
+	LED_BRIGHTNESS_UPDATE_SYSFS,
+};
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -123,6 +128,8 @@ extern void devm_led_classdev_unregister(struct device *parent,
 					 struct led_classdev *led_cdev);
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
+extern void led_brightness_force_update(struct led_classdev *led_cdev,
+				enum led_brightness_update_reason reason);
 
 /**
  * led_blink_set - set blinking with software fallback
-- 
2.11.0
