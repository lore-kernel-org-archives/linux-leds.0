From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: triggers: simplify led_trigger_store
Date: Tue, 8 Mar 2016 23:08:36 +0100
Message-ID: <56DF4D64.4050908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:38357 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750787AbcCHWIs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 17:08:48 -0500
Received: by mail-wm0-f42.google.com with SMTP id l68so46580397wml.1
        for <linux-leds@vger.kernel.org>; Tue, 08 Mar 2016 14:08:47 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

led_trigger_store can be significantly simplified by using sysfs_streq().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index e1e9334..2181581 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -34,9 +34,7 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
-	char trigger_name[TRIG_NAME_MAX];
 	struct led_trigger *trig;
-	size_t len;
 	int ret = count;
 
 	mutex_lock(&led_cdev->led_access);
@@ -46,21 +44,14 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		goto unlock;
 	}
 
-	trigger_name[sizeof(trigger_name) - 1] = '\0';
-	strncpy(trigger_name, buf, sizeof(trigger_name) - 1);
-	len = strlen(trigger_name);
-
-	if (len && trigger_name[len - 1] == '\n')
-		trigger_name[len - 1] = '\0';
-
-	if (!strcmp(trigger_name, "none")) {
+	if (sysfs_streq(buf, "none")) {
 		led_trigger_remove(led_cdev);
 		goto unlock;
 	}
 
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (!strcmp(trigger_name, trig->name)) {
+		if (sysfs_streq(buf, trig->name)) {
 			down_write(&led_cdev->trigger_lock);
 			led_trigger_set(led_cdev, trig);
 			up_write(&led_cdev->trigger_lock);
-- 
2.7.1
