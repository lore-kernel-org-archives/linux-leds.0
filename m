From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 1/3] leds: triggers: add support for RGB triggers
Date: Mon, 21 Mar 2016 12:57:59 +0100
Message-ID: <56EFE1C7.50705@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34691 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754037AbcCUL7N (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Mar 2016 07:59:13 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Add basic support for RGB triggers. Triggers with flag LED_TRIG_CAP_RGB
set are available to RGB LED devices only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- renamed check to led_trigger_is_supported()
- removed unrelated other change
---
 drivers/leds/led-triggers.c | 11 +++++++++++
 include/linux/leds.h        |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 2181581..f01d6c0 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -30,6 +30,13 @@ static LIST_HEAD(trigger_list);
 
  /* Used by LED Class */
 
+static inline bool led_trigger_is_supported(struct led_trigger *trig,
+					    struct led_classdev *led_cdev)
+{
+	return !(trig->flags & LED_TRIG_CAP_RGB) ||
+	       led_cdev->flags & LED_DEV_CAP_RGB;
+}
+
 ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
@@ -52,6 +59,8 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (sysfs_streq(buf, trig->name)) {
+			if (!led_trigger_is_supported(trig, led_cdev))
+				break;
 			down_write(&led_cdev->trigger_lock);
 			led_trigger_set(led_cdev, trig);
 			up_write(&led_cdev->trigger_lock);
@@ -84,6 +93,8 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 		len += sprintf(buf+len, "none ");
 
 	list_for_each_entry(trig, &trigger_list, next_trig) {
+		if (!led_trigger_is_supported(trig, led_cdev))
+			continue;
 		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
 							trig->name))
 			len += sprintf(buf+len, "[%s] ", trig->name);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 58e22e6..07eb074 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -248,6 +248,9 @@ enum led_brightness led_hsv_to_rgb(enum led_brightness hsv);
 struct led_trigger {
 	/* Trigger Properties */
 	const char	 *name;
+	u8		flags;
+#define LED_TRIG_CAP_RGB	BIT(0)
+
 	void		(*activate)(struct led_classdev *led_cdev);
 	void		(*deactivate)(struct led_classdev *led_cdev);
 
-- 
2.7.3
