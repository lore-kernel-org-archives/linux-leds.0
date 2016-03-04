From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 5/5] leds: core: add support for RGB LED's
Date: Fri, 4 Mar 2016 22:16:55 +0100
Message-ID: <56D9FB47.1000309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Export a function to convert HSV color values to RGB.
It's intended to be called by drivers for RGB LEDs.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- move hsv -> rgb conversion to separate file
- remove flag LED_DEV_CAP_RGB
v3:
- call led_hsv_to_rgb only if LED_DEV_CAP_HSV is set
  This is needed in cases when we have monochrome and color LEDs
  as well in a system.
v4:
- Export led_hsv_to_rgb and let the device driver call it instead
  of doing the conversion in the core
v5:
- don't ignore led_cdev->brightness_get silently if LED_DEV_CAP_RGB
  is set but warn
v6:
- no changes
v7:
- remove "for now" in WARN_ON comment
- move position of WARN_ON
---
 drivers/leds/led-class.c    |  6 ++++++
 drivers/leds/led-rgb-core.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/leds.h        |  8 ++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 8a3748a..adcd8f6 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -205,6 +205,12 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
+	/*
+	 * Reading back the color is not supported as multiple
+	 * HSV -> RGB -> HSV conversions may distort the color due to
+	 * rounding issues in the conversion algorithm
+	 */
+	WARN_ON(led_cdev->flags & LED_DEV_CAP_RGB && led_cdev->brightness_get);
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
diff --git a/drivers/leds/led-rgb-core.c b/drivers/leds/led-rgb-core.c
index cbd8b35..cdb7ba6 100644
--- a/drivers/leds/led-rgb-core.c
+++ b/drivers/leds/led-rgb-core.c
@@ -37,3 +37,39 @@ enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
 	return brightness |
 	       min(value & LED_BRIGHTNESS_MASK, led_cdev->max_brightness);
 }
+
+enum led_brightness led_hsv_to_rgb(enum led_brightness hsv)
+{
+	int h = min_t(int, (hsv >> 16) & 0xff, 251);
+	int s = (hsv >> 8) & 0xff;
+	int v = hsv & 0xff;
+	int f, p, q, t, r, g, b;
+
+	if (!v)
+		return 0;
+	if (!s)
+		return (v << 16) + (v << 8) + v;
+
+	f = DIV_ROUND_CLOSEST((h % 42) * 255, 42);
+	p = v - DIV_ROUND_CLOSEST(s * v, 255);
+	q = v - DIV_ROUND_CLOSEST(f * s * v, 255 * 255);
+	t = v - DIV_ROUND_CLOSEST((255 - f) * s * v, 255 * 255);
+
+	switch (h / 42) {
+	case 0:
+		r = v; g = t; b = p; break;
+	case 1:
+		r = q; g = v; b = p; break;
+	case 2:
+		r = p; g = v; b = t; break;
+	case 3:
+		r = p; g = q; b = v; break;
+	case 4:
+		r = t; g = p; b = v; break;
+	case 5:
+		r = v; g = p; b = q; break;
+	}
+
+	return (r << 16) + (g << 8) + b;
+}
+EXPORT_SYMBOL_GPL(led_hsv_to_rgb);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 58e8299..58e22e6 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -226,6 +226,14 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
 	return led_cdev->flags & LED_SYSFS_DISABLE;
 }
 
+/**
+ * led_hsv_to_rgb - convert a hsv color value to rgb color model
+ * @hsv: the hsv value to convert
+ *
+ * Returns: the resulting rgb value
+ */
+enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
+
 /*
  * LED Triggers
  */
-- 
2.7.1
