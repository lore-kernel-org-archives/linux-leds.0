From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] leds: core: use deferred probing if default trigger isn't
 available yet
Date: Fri, 24 Feb 2017 07:41:48 +0100
Message-ID: <001fb4b9-a83f-7b01-efb5-9fde715b35a1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33885 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdBXGmE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2017 01:42:04 -0500
Received: by mail-wm0-f65.google.com with SMTP id m70so1434724wma.1
        for <linux-leds@vger.kernel.org>; Thu, 23 Feb 2017 22:42:03 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

When registering a LED device we have the option to set a default trigger.
Depending on load order of drivers this trigger may not be available yet.
(affected LED device in my case: a DT-configured GPIO LED)
So far if the default trigger can't be found this error is silently
ignored.

Let's change this to return EPROBE_DEFER if the default trigger can't be
found. This gives the system the chance to probe the LED device later
once the trigger is available.

In addition in led_trigger_set_default break out of the loop when trigger
has been found.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- in led_trigger_set_default break out of loop when trigger has been found
---
 drivers/leds/led-class.c    |  6 +++++-
 drivers/leds/led-triggers.c | 12 +++++++++---
 include/linux/leds.h        |  5 +++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f2b0a80a..efe4f5a3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -295,7 +295,11 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	led_init_core(led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
-	led_trigger_set_default(led_cdev);
+	ret = led_trigger_set_default(led_cdev);
+	if (ret) {
+		led_classdev_unregister(led_cdev);
+		return ret;
+	}
 #endif
 
 	dev_dbg(parent, "Registered led device: %s\n",
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 431123b0..572ede29 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -157,21 +157,27 @@ void led_trigger_remove(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);
 
-void led_trigger_set_default(struct led_classdev *led_cdev)
+int led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
+	int ret = -EPROBE_DEFER;
 
 	if (!led_cdev->default_trigger)
-		return;
+		return 0;
 
 	down_read(&triggers_list_lock);
 	down_write(&led_cdev->trigger_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(led_cdev->default_trigger, trig->name))
+		if (!strcmp(led_cdev->default_trigger, trig->name)) {
 			led_trigger_set(led_cdev, trig);
+			ret = 0;
+			break;
+		}
 	}
 	up_write(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 38c0bd7c..3e36ce31 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -280,7 +280,7 @@ extern void led_trigger_blink_oneshot(struct led_trigger *trigger,
 				      unsigned long *delay_on,
 				      unsigned long *delay_off,
 				      int invert);
-extern void led_trigger_set_default(struct led_classdev *led_cdev);
+extern int led_trigger_set_default(struct led_classdev *led_cdev);
 extern void led_trigger_set(struct led_classdev *led_cdev,
 			struct led_trigger *trigger);
 extern void led_trigger_remove(struct led_classdev *led_cdev);
@@ -326,7 +326,8 @@ static inline void led_trigger_blink_oneshot(struct led_trigger *trigger,
 				      unsigned long *delay_on,
 				      unsigned long *delay_off,
 				      int invert) {}
-static inline void led_trigger_set_default(struct led_classdev *led_cdev) {}
+static inline int led_trigger_set_default(struct led_classdev *led_cdev)
+							{ return 0; }
 static inline void led_trigger_set(struct led_classdev *led_cdev,
 				struct led_trigger *trigger) {}
 static inline void led_trigger_remove(struct led_classdev *led_cdev) {}
-- 
2.11.1
