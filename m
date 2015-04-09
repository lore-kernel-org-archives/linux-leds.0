From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] leds: Fix regression related to led-trigger API location change
Date: Thu, 09 Apr 2015 14:55:33 +0200
Message-ID: <1428584133-27892-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44927 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751177AbbDIMzw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 08:55:52 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NMJ0066QIL20W90@mailout4.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 09 Apr 2015 21:55:50 +0900 (KST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, Jacek Anaszewski <j.anaszewski@samsung.com>

Patch fe4d2d05 ("leds: unify the location of led-trigger API") is
causing a build break when led-triggers are turned off in the config.
This patch fixes the issue and changes no-op declarations of affected
functions to inlines instead of macros.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
---
 include/linux/leds.h |   37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0579708..0b9780e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -223,24 +223,6 @@ struct led_trigger {
 	struct list_head  next_trig;
 };
 
-#ifdef CONFIG_LEDS_TRIGGERS
-void led_trigger_set_default(struct led_classdev *led_cdev);
-void led_trigger_set(struct led_classdev *led_cdev,
-			struct led_trigger *trigger);
-void led_trigger_remove(struct led_classdev *led_cdev);
-
-static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
-{
-	return led_cdev->trigger_data;
-}
-
-#else
-#define led_trigger_set_default(x) do {} while (0)
-#define led_trigger_set(x, y) do {} while (0)
-#define led_trigger_remove(x) do {} while (0)
-#define led_get_trigger_data(x) (NULL)
-#endif
-
 ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 			const char *buf, size_t count);
 ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
@@ -262,6 +244,16 @@ extern void led_trigger_blink_oneshot(struct led_trigger *trigger,
 				      unsigned long *delay_on,
 				      unsigned long *delay_off,
 				      int invert);
+void led_trigger_set_default(struct led_classdev *led_cdev);
+void led_trigger_set(struct led_classdev *led_cdev,
+			struct led_trigger *trigger);
+void led_trigger_remove(struct led_classdev *led_cdev);
+
+static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
+{
+	return led_cdev->trigger_data;
+}
+
 /**
  * led_trigger_rename_static - rename a trigger
  * @name: the new trigger name
@@ -291,6 +283,15 @@ static inline void led_trigger_register_simple(const char *name,
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event) {}
+static inline void led_trigger_set_default(struct led_classdev *led_cdev) {}
+static inline void led_trigger_set(struct led_classdev *led_cdev,
+				struct led_trigger *trigger) {}
+static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
+static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_LEDS_TRIGGERS */
 
 /* Trigger specific functions */
-- 
1.7.9.5
