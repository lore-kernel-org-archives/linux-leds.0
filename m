From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] leds: Fix build failure seen if LEDS_TRIGGERS is not configured
Date: Thu,  9 Apr 2015 08:42:20 -0700
Message-ID: <1428594140-16832-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38614 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755331AbbDIPmk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 11:42:40 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YgEbH-000mMM-Rc
	for linux-leds@vger.kernel.org; Thu, 09 Apr 2015 15:42:40 +0000
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

Fix:

drivers/leds/led-class.c: In function 'brightness_store':
drivers/leds/led-class.c:57: error:
			implicit declaration of function 'led_trigger_remove'

seen if LEDS_TRIGGERS is not configured.

Fixes: 5a15d172057c ("leds: unify the location of led-trigger API")
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/leds.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0579708..96a669f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -223,7 +223,6 @@ struct led_trigger {
 	struct list_head  next_trig;
 };
 
-#ifdef CONFIG_LEDS_TRIGGERS
 void led_trigger_set_default(struct led_classdev *led_cdev);
 void led_trigger_set(struct led_classdev *led_cdev,
 			struct led_trigger *trigger);
@@ -234,13 +233,6 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 	return led_cdev->trigger_data;
 }
 
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
@@ -282,6 +274,11 @@ extern void led_trigger_rename_static(const char *name,
 
 #else
 
+#define led_trigger_set_default(x) do {} while (0)
+#define led_trigger_set(x, y) do {} while (0)
+#define led_trigger_remove(x) do {} while (0)
+#define led_get_trigger_data(x) (NULL)
+
 /* Trigger has no members */
 struct led_trigger {};
 
-- 
2.1.0
