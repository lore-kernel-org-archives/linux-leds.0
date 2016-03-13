From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/3] leds: triggers: add led_trigger_range_event for RGB
 triggers
Date: Sun, 13 Mar 2016 18:14:56 +0100
Message-ID: <56E5A010.9080907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34095 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbcCMRSl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 13 Mar 2016 13:18:41 -0400
Received: by mail-wm0-f65.google.com with SMTP id p65so11130508wmp.1
        for <linux-leds@vger.kernel.org>; Sun, 13 Mar 2016 10:18:40 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Add led_trigger_range_event() and supporting struct led_trigger_range
allowing to map a value within a value range to a color within a
color range.
Simple example would be to map a temperature with in a range to a
color between green and red.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h        | 14 ++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 3ccf88b..5cab10b 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -195,6 +195,9 @@ int led_trigger_register(struct led_trigger *trig)
 	struct led_classdev *led_cdev;
 	struct led_trigger *_trig;
 
+	if (trig->range && trig->range->start >= trig->range->end)
+		return -EINVAL;
+
 	rwlock_init(&trig->leddev_list_lock);
 	INIT_LIST_HEAD(&trig->led_cdevs);
 
@@ -294,6 +297,45 @@ void led_trigger_event(struct led_trigger *trig,
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
+static inline int led_trigger_interpolate(int value,
+					  const struct led_trigger_range *range,
+					  int x_start, int x_end)
+{
+		return x_start + DIV_ROUND_CLOSEST((value - range->start) *
+		       (x_end - x_start), range->end - range->start);
+}
+
+void led_trigger_range_event(struct led_trigger *trig, int value)
+{
+	int h, s, v, hs, he, ss, se, vs, ve, hdiff;
+
+	if (!trig->range)
+		return;
+
+	hs = trig->range->color_start >> 16 & 0xff;
+	he = trig->range->color_end >> 16 & 0xff;
+	ss = trig->range->color_start >> 8 & 0xff;
+	se = trig->range->color_end >> 8 & 0xff;
+	vs = trig->range->color_start & 0xff;
+	ve = trig->range->color_end & 0xff;
+	hdiff = (252 + he - hs) % 252;
+
+	/* on color circle, choose shortest way from start to end */
+	if (hdiff <= 126 && he < hs)
+		he += 252;
+	else if (hdiff > 126 && he > hs)
+		hs += 252;
+
+	value = clamp(value, trig->range->start, trig->range->end);
+
+	h = led_trigger_interpolate(value, trig->range, hs, he) % 252;
+	s = led_trigger_interpolate(value, trig->range, ss, se);
+	v = led_trigger_interpolate(value, trig->range, vs, ve);
+
+	led_trigger_event(trig, LED_SET_HUE_SAT | h << 16 | s << 8 | v);
+}
+EXPORT_SYMBOL_GPL(led_trigger_range_event);
+
 static void led_trigger_blink_setup(struct led_trigger *trig,
 			     unsigned long *delay_on,
 			     unsigned long *delay_off,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 07eb074..263640e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -241,6 +241,14 @@ enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
 #define DEFINE_LED_TRIGGER(x)		static struct led_trigger *x;
 #define DEFINE_LED_TRIGGER_GLOBAL(x)	struct led_trigger *x;
 
+struct led_trigger_range {
+	int start;
+	int end;
+	/* HSV color model */
+	u32 color_start;
+	u32 color_end;
+};
+
 #ifdef CONFIG_LEDS_TRIGGERS
 
 #define TRIG_NAME_MAX 50
@@ -251,6 +259,9 @@ struct led_trigger {
 	u8		flags;
 #define LED_TRIG_CAP_RGB	BIT(0)
 
+	/* optional element for usage with led_trigger_range_event */
+	const struct led_trigger_range *range;
+
 	void		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
@@ -278,6 +289,7 @@ extern void led_trigger_register_simple(const char *name,
 extern void led_trigger_unregister_simple(struct led_trigger *trigger);
 extern void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event);
+extern void led_trigger_range_event(struct led_trigger *trigger, int value);
 extern void led_trigger_blink(struct led_trigger *trigger,
 			      unsigned long *delay_on,
 			      unsigned long *delay_off);
@@ -324,6 +336,8 @@ static inline void led_trigger_register_simple(const char *name,
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event) {}
+static inline void led_trigger_range_event(struct led_trigger *trigger,
+					   int value) {}
 static inline void led_trigger_blink(struct led_trigger *trigger,
 				      unsigned long *delay_on,
 				      unsigned long *delay_off) {}
-- 
2.7.2
