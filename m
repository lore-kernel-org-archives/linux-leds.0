From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 3/3] leds: triggers: heartbeat: add RGB version of the trigger
Date: Sun, 13 Mar 2016 18:18:18 +0100
Message-ID: <56E5A0DA.1000700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34109 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbcCMRSn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 13 Mar 2016 13:18:43 -0400
Received: by mail-wm0-f66.google.com with SMTP id p65so11130585wmp.1
        for <linux-leds@vger.kernel.org>; Sun, 13 Mar 2016 10:18:42 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Add a RGB version of the heartbeat trigger (heartbeat-rgb). This version of
the trigger can only be used with LED devices supporting the RGB extension.

It maps the load [0 .. num_online_cpus] to a color between green and red.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 64 +++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 410c39c..510a3c9 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -22,6 +22,7 @@
 #include "../leds.h"
 
 static int panic_heartbeats;
+static struct led_trigger heartbeat_led_rgb_trigger;
 
 struct heartbeat_trig_data {
 	unsigned int phase;
@@ -30,6 +31,14 @@ struct heartbeat_trig_data {
 	unsigned int invert;
 };
 
+static struct led_trigger_range led_heartbeat_range = {
+	.start = 0,
+	/* default, overridden by module init function */
+	.end = 4 * FIXED_1,
+	.color_start = 0x54ffff, /* GREEN */
+	.color_end = 0x00ffff, /* RED */
+};
+
 static void led_heartbeat_function(unsigned long data)
 {
 	struct led_classdev *led_cdev = (struct led_classdev *) data;
@@ -85,6 +94,15 @@ static void led_heartbeat_function(unsigned long data)
 	mod_timer(&heartbeat_data->timer, jiffies + delay);
 }
 
+static void led_heartbeat_rgb_function(unsigned long data)
+{
+	struct led_classdev *led_cdev = (struct led_classdev *) data;
+	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
+
+	led_trigger_range_event(&heartbeat_led_rgb_trigger, avenrun[0]);
+	mod_timer(&heartbeat_data->timer, jiffies + msecs_to_jiffies(500));
+}
+
 static ssize_t led_invert_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -136,6 +154,22 @@ static void heartbeat_trig_activate(struct led_classdev *led_cdev)
 	led_cdev->activated = true;
 }
 
+static void heartbeat_trig_rgb_activate(struct led_classdev *led_cdev)
+{
+	struct heartbeat_trig_data *heartbeat_data;
+
+	heartbeat_data = kzalloc(sizeof(*heartbeat_data), GFP_KERNEL);
+	if (!heartbeat_data)
+		return;
+
+	led_cdev->trigger_data = heartbeat_data;
+
+	setup_timer(&heartbeat_data->timer,
+		    led_heartbeat_rgb_function, (unsigned long) led_cdev);
+	led_heartbeat_rgb_function(heartbeat_data->timer.data);
+	led_cdev->activated = true;
+}
+
 static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
 {
 	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
@@ -148,12 +182,31 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
 	}
 }
 
+static void heartbeat_trig_rgb_deactivate(struct led_classdev *led_cdev)
+{
+	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
+
+	if (led_cdev->activated) {
+		del_timer_sync(&heartbeat_data->timer);
+		kfree(heartbeat_data);
+		led_cdev->activated = false;
+	}
+}
+
 static struct led_trigger heartbeat_led_trigger = {
 	.name     = "heartbeat",
 	.activate = heartbeat_trig_activate,
 	.deactivate = heartbeat_trig_deactivate,
 };
 
+static struct led_trigger heartbeat_led_rgb_trigger = {
+	.flags    = LED_TRIG_CAP_RGB,
+	.name     = "heartbeat-rgb",
+	.range    = &led_heartbeat_range,
+	.activate = heartbeat_trig_rgb_activate,
+	.deactivate = heartbeat_trig_rgb_deactivate,
+};
+
 static int heartbeat_reboot_notifier(struct notifier_block *nb,
 				     unsigned long code, void *unused)
 {
@@ -178,9 +231,17 @@ static struct notifier_block heartbeat_panic_nb = {
 
 static int __init heartbeat_trig_init(void)
 {
-	int rc = led_trigger_register(&heartbeat_led_trigger);
+	int rc;
+
+	led_heartbeat_range.end = num_online_cpus() * FIXED_1;
+
+	rc = led_trigger_register(&heartbeat_led_rgb_trigger);
+	if (rc)
+		return rc;
 
+	rc = led_trigger_register(&heartbeat_led_trigger);
 	if (!rc) {
+		led_trigger_unregister(&heartbeat_led_rgb_trigger);
 		atomic_notifier_chain_register(&panic_notifier_list,
 					       &heartbeat_panic_nb);
 		register_reboot_notifier(&heartbeat_reboot_nb);
@@ -194,6 +255,7 @@ static void __exit heartbeat_trig_exit(void)
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					 &heartbeat_panic_nb);
 	led_trigger_unregister(&heartbeat_led_trigger);
+	led_trigger_unregister(&heartbeat_led_rgb_trigger);
 }
 
 module_init(heartbeat_trig_init);
-- 
2.7.2
