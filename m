From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2] led/led-class: Handle LEDs with the same name
Date: Fri, 20 Feb 2015 00:01:38 +0100
Message-ID: <1424386898-19021-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:41980 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595AbbBSXBn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Feb 2015 18:01:43 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

The current code expected that every LED had an unique name. This is a
legit expectation when the device tree can no be modified or extended.
But with device tree overlays this requirement can be easily broken.

This patch finds out if the name is already in use and adds the suffix
_1, _2... if not.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v2: Suggested by Bryan Wu <cooloney@gmail.com>

-move name search to separated function
-Iterate on class
 drivers/leds/led-class.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 795ec99..5c6505a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -212,6 +212,29 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
 	.resume         = led_resume,
 };
 
+static int match_name(struct device *dev, const void *data)
+{
+	if (!dev_name(dev))
+		return 0;
+	return !strcmp(dev_name(dev), (char *)data);
+}
+
+static char *led_classdev_next_name(const char *init_name)
+{
+	char *name = (char *) init_name;
+	int i = 0;
+
+	while (class_find_device(leds_class, NULL, name, match_name)) {
+		if (name != init_name)
+			kfree(name);
+		name = kasprintf(GFP_KERNEL, "%s_%d", init_name, ++i);
+		if (!name)
+			return NULL;
+	}
+
+	return name;
+}
+
 /**
  * led_classdev_register - register a new object of led_classdev class.
  * @parent: The device to register.
@@ -219,12 +242,23 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
  */
 int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 {
+	char *name = led_classdev_next_name(led_cdev->name);
+
+	if (!name)
+		return -ENOMEM;
+
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-					led_cdev, led_cdev->groups,
-					"%s", led_cdev->name);
+					led_cdev, led_cdev->groups, name);
+	if (name != led_cdev->name)
+		kfree(name);
+
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
 
+	if (name != led_cdev->name)
+		dev_info(parent, "Led %s renamed to %s due to name collision",
+				led_cdev->name, dev_name(led_cdev->dev));
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
-- 
2.1.4
