From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] led/led-class: Handle LEDs with the same name
Date: Wed, 11 Feb 2015 13:26:12 +0100
Message-ID: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35546 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbbBKM0R (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 11 Feb 2015 07:26:17 -0500
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
 drivers/leds/led-class.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index dbeebac..b60f942 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -208,6 +208,13 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
 	.resume         = led_resume,
 };
 
+static int match_child(struct device *dev, void *data)
+{
+	if (!dev_name(dev))
+		return 0;
+	return !strcmp(dev_name(dev), (char *)data);
+}
+
 /**
  * led_classdev_register - register a new object of led_classdev class.
  * @parent: The device to register.
@@ -215,9 +222,28 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
  */
 int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 {
+	char *name;
+	char *temp_name = NULL;
+	int i = 0;
+
+	do {
+		if (i == 0)
+			name = (char *)led_cdev->name;
+		else {
+			kfree(temp_name);
+			temp_name = kasprintf(GFP_KERNEL, "%s_%d",
+					      led_cdev->name, i);
+			if (!temp_name)
+				return -ENOMEM;
+			name = temp_name;
+		}
+
+		i++;
+	} while (device_find_child(parent, name, match_child));
+
 	led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
-					led_cdev, led_cdev->groups,
-					"%s", led_cdev->name);
+					led_cdev, led_cdev->groups, name);
+	kfree(temp_name);
 	if (IS_ERR(led_cdev->dev))
 		return PTR_ERR(led_cdev->dev);
 
-- 
2.1.4
