From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 4/4] leds: core: add support for RGB LED's
Date: Thu, 18 Feb 2016 22:31:06 +0100
Message-ID: <56C6381A.7060209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:33708 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757146AbcBRVb1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2016 16:31:27 -0500
Received: by mail-wm0-f53.google.com with SMTP id g62so43714797wme.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Feb 2016 13:31:26 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Add support for RGB LED's. Flag LED_DEV_CAP_HSV is used to instruct
the core to convert HSV to RGB on output.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- move hsv -> rgb conversion to separate file
- remove flag LED_DEV_CAP_RGB
v3:
- call led_hsv_to_rgb only if LED_DEV_CAP_HSV is set
  This is needed in cases when we have monochrome and color LEDs
  as well in a system.
---
 drivers/leds/led-color-core.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/leds/led-core.c       | 17 ++++++++++++++++-
 drivers/leds/leds.h           |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-color-core.c b/drivers/leds/led-color-core.c
index b101f73..467beeb 100644
--- a/drivers/leds/led-color-core.c
+++ b/drivers/leds/led-color-core.c
@@ -31,3 +31,38 @@ enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
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
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 525d566..255bdd7 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -31,6 +31,11 @@ static int __led_set_brightness(struct led_classdev *led_cdev,
 	if (!led_cdev->brightness_set)
 		return -ENOTSUPP;
 
+#if IS_ENABLED(CONFIG_LEDS_COLOR)
+	if (led_cdev->flags & LED_DEV_CAP_HSV)
+		value = led_hsv_to_rgb(value);
+#endif
+
 	led_cdev->brightness_set(led_cdev, value);
 
 	return 0;
@@ -42,6 +47,11 @@ static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
 	if (!led_cdev->brightness_set_blocking)
 		return -ENOTSUPP;
 
+#if IS_ENABLED(CONFIG_LEDS_COLOR)
+	if (led_cdev->flags & LED_DEV_CAP_HSV)
+		value = led_hsv_to_rgb(value);
+#endif
+
 	return led_cdev->brightness_set_blocking(led_cdev, value);
 }
 
@@ -294,7 +304,12 @@ int led_update_brightness(struct led_classdev *led_cdev)
 {
 	int ret = 0;
 
-	if (led_cdev->brightness_get) {
+	/*
+	 * for now reading back the color is not supported as multiple
+	 * HSV -> RGB -> HSV conversions may distort the color due to
+	 * rounding issues in the conversion algorithm
+	 */
+	if (led_cdev->brightness_get && !(led_cdev->flags & LED_DEV_CAP_HSV)) {
 		ret = led_cdev->brightness_get(led_cdev);
 		if (ret >= 0) {
 			led_cdev->brightness = ret;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 094707f..763f19a 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -37,6 +37,7 @@ void led_set_brightness_nosleep(struct led_classdev *led_cdev,
 #if IS_ENABLED(CONFIG_LEDS_COLOR)
 enum led_brightness led_confine_brightness(struct led_classdev *led_cdev,
 					    enum led_brightness value);
+enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
 #else
 static inline enum led_brightness led_confine_brightness(
 		struct led_classdev *led_cdev, enum led_brightness value)
-- 
2.7.1
