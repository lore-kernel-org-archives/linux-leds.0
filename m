From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: core: add support for RGB LED's
Date: Sun, 24 Jan 2016 17:09:17 +0100
Message-ID: <56A4F72D.8080300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35583 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcAXQJ2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 24 Jan 2016 11:09:28 -0500
Received: by mail-wm0-f48.google.com with SMTP id r129so37574656wmr.0
        for <linux-leds@vger.kernel.org>; Sun, 24 Jan 2016 08:09:27 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

This patch adds support for RGB LED's to the core.
To use this extension a driver must add LED_DEV_CAP_RGB to the
led_classdev flags. The callbacks to be implemented by the driver
are the same as before, just enum led_brightness is used as
<00000000><RRRRRRRR><GGGGGGGG><BBBBBBB> now.
A new sysfs property "rgb" allows to set the color from userspace.

The RGB extension is fully compatible with the current
brightness-based API incl. triggers.

What still needs to be done:
update Documentation/leds/leds-class.txt

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-class.c |  69 +++++++++++++++++++++++++++
 drivers/leds/led-core.c  | 121 ++++++++++++++++++++++++++++++++++++++++-------
 drivers/leds/leds.h      |  16 +++++++
 include/linux/leds.h     |   3 ++
 4 files changed, 193 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..ed5fc05 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -64,6 +64,46 @@ unlock:
 }
 static DEVICE_ATTR_RW(brightness);
 
+static ssize_t rgb_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "0x%06x\n", led_get_rgb_val(led_cdev));
+}
+
+static ssize_t rgb_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	unsigned long state;
+	ssize_t ret;
+
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		goto unlock;
+
+	if (state > LED_WHITE) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	led_set_rgb(led_cdev, state);
+
+	ret = size;
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
+}
+static DEVICE_ATTR_RW(rgb);
+
 static ssize_t max_brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -90,10 +130,19 @@ static struct attribute *led_class_attrs[] = {
 	NULL,
 };
 
+static struct attribute *led_rgb_attrs[] = {
+	&dev_attr_rgb.attr,
+	NULL,
+};
+
 static const struct attribute_group led_group = {
 	.attrs = led_class_attrs,
 };
 
+static const struct attribute_group led_rgb_group = {
+	.attrs = led_rgb_attrs,
+};
+
 static const struct attribute_group *led_groups[] = {
 	&led_group,
 #ifdef CONFIG_LEDS_TRIGGERS
@@ -102,6 +151,11 @@ static const struct attribute_group *led_groups[] = {
 	NULL,
 };
 
+static const struct attribute_group *led_rgb_groups[] = {
+	&led_rgb_group,
+	NULL,
+};
+
 /**
  * led_classdev_suspend - suspend an led_classdev.
  * @led_cdev: the led_classdev to suspend.
@@ -190,6 +244,21 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	char name[64];
 	int ret;
 
+	/* FLASH is not supported for RGB LEDs so far
+	 * and RGB enforces max_brightness = LED_FULL.
+	 * Initialize the color as white.
+	 */
+	if (led_is_rgb(led_cdev)) {
+		if (led_cdev->flags & LED_DEV_CAP_FLASH) {
+			dev_err(parent,
+				"RGB and FLASH mode are mutually exclusive\n");
+			return -EINVAL;
+		}
+		led_cdev->max_brightness = LED_FULL;
+		led_cdev->rgb_val = LED_WHITE;
+		led_cdev->groups = led_rgb_groups;
+	}
+
 	ret = led_classdev_next_name(led_cdev->name, name, sizeof(name));
 	if (ret < 0)
 		return ret;
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ad684b6..522d863 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -25,6 +25,61 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
+struct led_color { u8 red, green, blue; };
+
+static inline struct led_color val_to_led_color(u32 rgb)
+{
+	struct led_color col = {
+		.red = (rgb >> 16) & 0xff,
+		.green = (rgb >> 8) & 0xff,
+		.blue = rgb & 0xff
+	};
+	return col;
+}
+
+static inline u32 led_color_to_val(struct led_color col)
+{
+	return (col.red << 16) + (col.green << 8) + col.blue;
+}
+
+static void scale_led_color(struct led_color *col, u32 val1, u32 val2)
+{
+	col->red = DIV_ROUND_CLOSEST(col->red * val1, val2);
+	col->green = DIV_ROUND_CLOSEST(col->green * val1, val2);
+	col->blue = DIV_ROUND_CLOSEST(col->blue * val1, val2);
+}
+
+static void led_set_rgb_raw(struct led_classdev *cdev, u32 rgb,
+			    int update_mode)
+{
+	struct led_color col = val_to_led_color(rgb);
+	u8 max_raw;
+
+	max_raw = max(col.red, col.green);
+	max_raw = max(max_raw, col.blue);
+
+	if (update_mode & LED_UPDATE_BRIGHTNESS)
+		cdev->brightness = max_raw;
+
+	if (update_mode & LED_UPDATE_COLOR) {
+		if (!max_raw)
+			cdev->rgb_val = LED_WHITE;
+		else {
+			scale_led_color(&col, LED_FULL, max_raw);
+			cdev->rgb_val = led_color_to_val(col);
+		}
+	}
+}
+
+static u32 led_get_rgb_raw(struct led_classdev *cdev, u32 rgb, u32 brightness)
+{
+	struct led_color col = val_to_led_color(rgb);
+
+	scale_led_color(&col, brightness, LED_FULL);
+
+	return led_color_to_val(col);
+}
+
 static void led_timer_function(unsigned long data)
 {
 	struct led_classdev *led_cdev = (void *)data;
@@ -83,6 +138,7 @@ static void set_brightness_delayed(struct work_struct *ws)
 {
 	struct led_classdev *led_cdev =
 		container_of(ws, struct led_classdev, set_brightness_work);
+	enum led_brightness new_val;
 	int ret = 0;
 
 	if (led_cdev->flags & LED_BLINK_DISABLE) {
@@ -91,11 +147,16 @@ static void set_brightness_delayed(struct work_struct *ws)
 		led_cdev->flags &= ~LED_BLINK_DISABLE;
 	}
 
+	if (led_is_rgb(led_cdev))
+		new_val = led_get_rgb_raw(led_cdev, led_cdev->delayed_rgb_value,
+					  led_cdev->delayed_set_value);
+	else
+		new_val = led_cdev->delayed_set_value;
+
 	if (led_cdev->brightness_set)
-		led_cdev->brightness_set(led_cdev, led_cdev->delayed_set_value);
+		led_cdev->brightness_set(led_cdev, new_val);
 	else if (led_cdev->brightness_set_blocking)
-		ret = led_cdev->brightness_set_blocking(led_cdev,
-						led_cdev->delayed_set_value);
+		ret = led_cdev->brightness_set_blocking(led_cdev, new_val);
 	else
 		ret = -ENOTSUPP;
 	if (ret < 0 &&
@@ -232,17 +293,32 @@ void led_set_brightness(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL_GPL(led_set_brightness);
 
+void led_set_rgb(struct led_classdev *led_cdev, u32 rgb_val)
+{
+	if (!led_is_rgb(led_cdev) || (led_cdev->flags & LED_SUSPENDED))
+		return;
+
+	/* set color only, don't touch brightness */
+	led_set_rgb_raw(led_cdev, rgb_val, LED_UPDATE_COLOR);
+	led_set_brightness_nopm(led_cdev, led_cdev->brightness);
+}
+EXPORT_SYMBOL_GPL(led_set_rgb);
+
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
 	if (led_cdev->brightness_set) {
+		if (led_is_rgb(led_cdev))
+			value = led_get_rgb_raw(led_cdev, led_cdev->rgb_val,
+						value);
 		led_cdev->brightness_set(led_cdev, value);
 		return;
 	}
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
 	led_cdev->delayed_set_value = value;
+	led_cdev->delayed_rgb_value = led_cdev->rgb_val;
 	schedule_work(&led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
@@ -270,26 +346,39 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	if (led_cdev->brightness_set_blocking)
-		return led_cdev->brightness_set_blocking(led_cdev,
-							 led_cdev->brightness);
-	return -ENOTSUPP;
+	if (!led_cdev->brightness_set_blocking)
+		return -ENOTSUPP;
+
+	if (led_is_rgb(led_cdev))
+		value = led_get_rgb_raw(led_cdev, led_cdev->rgb_val,
+					led_cdev->brightness);
+	else
+		value = led_cdev->brightness;
+
+	return led_cdev->brightness_set_blocking(led_cdev, value);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
 int led_update_brightness(struct led_classdev *led_cdev)
 {
-	int ret = 0;
+	int ret;
 
-	if (led_cdev->brightness_get) {
-		ret = led_cdev->brightness_get(led_cdev);
-		if (ret >= 0) {
-			led_cdev->brightness = ret;
-			return 0;
-		}
-	}
+	if (!led_cdev->brightness_get)
+		return 0;
+
+	ret = led_cdev->brightness_get(led_cdev);
+	if (ret < 0)
+		return ret;
+
+	if (led_is_rgb(led_cdev))
+		/* Updating the color is not supported because it might
+		 * result in biased colors if the brightness is low.
+		 */
+		led_set_rgb_raw(led_cdev, ret, LED_UPDATE_BRIGHTNESS);
+	else
+		led_cdev->brightness = ret;
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(led_update_brightness);
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index db3f20d..e037d7e 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -16,17 +16,33 @@
 #include <linux/rwsem.h>
 #include <linux/leds.h>
 
+#define LED_UPDATE_COLOR	BIT(0)
+#define LED_UPDATE_BRIGHTNESS	BIT(1)
+
+#define LED_WHITE		0xffffff
+
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
 }
 
+static inline u32 led_get_rgb_val(struct led_classdev *led_cdev)
+{
+	return led_cdev->rgb_val;
+}
+
+static inline bool led_is_rgb(struct led_classdev *led_cdev)
+{
+	return (led_cdev->flags & LED_DEV_CAP_RGB) != 0;
+}
+
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 				enum led_brightness value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 				enum led_brightness value);
+void led_set_rgb(struct led_classdev *led_cdev, u32 rgb_val);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f203a8f..e224b4b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -35,6 +35,7 @@ struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
 	enum led_brightness	 max_brightness;
+	u32			 rgb_val;
 	int			 flags;
 
 	/* Lower 16 bits reflect status */
@@ -50,6 +51,7 @@ struct led_classdev {
 #define LED_SYSFS_DISABLE	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 #define LED_HW_PLUGGABLE	(1 << 24)
+#define LED_DEV_CAP_RGB		(1 << 25)
 
 	/* Set LED brightness level
 	 * Must not sleep. Use brightness_set_blocking for drivers
@@ -91,6 +93,7 @@ struct led_classdev {
 
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
+	u32			delayed_rgb_value;
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
-- 
2.7.0
