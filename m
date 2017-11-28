From: Craig McQueen <craig.mcqueen@innerrange.com>
Subject: [PATCH] led-triggers: allow writing 'default' to sysfs trigger attr
Date: Tue, 28 Nov 2017 17:38:20 +1100
Message-ID: <20171128063820.87534-1-craig.mcqueen@innerrange.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 122-143-132.dsl.connexus.net.au ([203.122.143.132]:20911 "EHLO
        remote.innerrange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751133AbdK1GoW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Nov 2017 01:44:22 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Craig McQueen <craig.mcqueen@innerrange.com>

It calls led_trigger_set_default() to set the LED to its default
trigger.
---
 drivers/leds/led-triggers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 431123b048a2..f090a7806017 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -49,6 +49,11 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
 		goto unlock;
 	}
 
+	if (sysfs_streq(buf, "default")) {
+		led_trigger_set_default(led_cdev);
+		goto unlock;
+	}
+
 	down_read(&triggers_list_lock);
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (sysfs_streq(buf, trig->name)) {
-- 
2.15.0
