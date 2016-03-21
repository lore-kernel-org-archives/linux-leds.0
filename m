From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 2/3] leds: triggers: add led_trigger_range_event for RGB
 triggers
Date: Mon, 21 Mar 2016 12:58:38 +0100
Message-ID: <56EFE1EE.2090907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36741 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754399AbcCUL7P (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Mar 2016 07:59:15 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Add led_trigger_range_event() and supporting struct led_rgb_range
allowing to map a value within a value range to a color within a
color range.
Simple example would be to map a temperature with in a range to a
color between green and red.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- moved the actual mapping to a helper in led-rgb-core.c
- adjusted commit message
- renamed struct led_trigger_range to led_rgb_range
---
 drivers/leds/led-rgb-core.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h        | 25 +++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/leds/led-rgb-core.c b/drivers/leds/led-rgb-core.c
index 63459e3..4ef24b5 100644
--- a/drivers/leds/led-rgb-core.c
+++ b/drivers/leds/led-rgb-core.c
@@ -73,3 +73,43 @@ enum led_brightness led_hsv_to_rgb(enum led_brightness hsv)
 	return (r << 16) + (g << 8) + b;
 }
 EXPORT_SYMBOL_GPL(led_hsv_to_rgb);
+
+static inline int led_range_interpolate(int value,
+					const struct led_rgb_range *range,
+					int x_start, int x_end)
+{
+	return x_start + DIV_ROUND_CLOSEST((value - range->start) *
+	       (x_end - x_start), range->end - range->start);
+}
+
+enum led_brightness led_val_to_rgb_range(const struct led_rgb_range *range,
+					 int value)
+{
+	int h, s, v, hs, he, ss, se, vs, ve, hdiff;
+
+	if (WARN_ON(range->start >= range->end))
+		return LED_OFF;
+
+	hs = range->color_start >> 16 & 0xff;
+	he = range->color_end >> 16 & 0xff;
+	ss = range->color_start >> 8 & 0xff;
+	se = range->color_end >> 8 & 0xff;
+	vs = range->color_start & 0xff;
+	ve = range->color_end & 0xff;
+	hdiff = (252 + he - hs) % 252;
+
+	/* on color circle, choose shortest way from start to end */
+	if (hdiff <= 126 && he < hs)
+		he += 252;
+	else if (hdiff > 126 && he > hs)
+		hs += 252;
+
+	value = clamp(value, range->start, range->end);
+
+	h = led_range_interpolate(value, range, hs, he) % 252;
+	s = led_range_interpolate(value, range, ss, se);
+	v = led_range_interpolate(value, range, vs, ve);
+
+	return LED_SET_HUE_SAT | h << 16 | s << 8 | v;
+}
+EXPORT_SYMBOL_GPL(led_val_to_rgb_range);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 07eb074..0bbc4eb 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -234,6 +234,23 @@ static inline bool led_sysfs_is_disabled(struct led_classdev *led_cdev)
  */
 enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
 
+struct led_rgb_range {
+	int start;
+	int end;
+	/* HSV color model */
+	u32 color_start;
+	u32 color_end;
+};
+
+#if IS_ENABLED(CONFIG_LEDS_CLASS_RGB)
+enum led_brightness led_val_to_rgb_range(const struct led_rgb_range *range,
+					 int value);
+#else
+static inline enum led_brightness led_val_to_rgb_range(
+					const struct led_rgb_range *range,
+					int value) { return LED_OFF; }
+#endif /* CONFIG_LEDS_CLASS_RGB */
+
 /*
  * LED Triggers
  */
@@ -342,6 +359,14 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 
 #endif /* CONFIG_LEDS_TRIGGERS */
 
+static inline void led_trigger_range_event(struct led_trigger *trigger,
+					   const struct led_rgb_range *range,
+					   int value)
+{
+	enum led_brightness brightness = led_val_to_rgb_range(range, value);
+	led_trigger_event(trigger, brightness);
+}
+
 /* Trigger specific functions */
 #ifdef CONFIG_LEDS_TRIGGER_IDE_DISK
 extern void ledtrig_ide_activity(void);
-- 
2.7.3
