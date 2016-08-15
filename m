From: Zach Brown <zach.brown@ni.com>
Subject: [PATCH] leds: do not overflow sysfs buffer in led_trigger_show
Date: Mon, 15 Aug 2016 17:20:14 -0500
Message-ID: <1471299614-10415-1-git-send-email-zach.brown@ni.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from skprod3.natinst.com ([130.164.80.24]:58614 "EHLO ni.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932184AbcHOWjg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 15 Aug 2016 18:39:36 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, nathan.sullivan@ni.com, Zach Brown <zach.brown@ni.com>

From: Nathan Sullivan <nathan.sullivan@ni.com>

Per the documentation, use scnprintf instead of sprintf to ensure there
is never more than PAGE_SIZE bytes of trigger names put into the
buffer.

Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 drivers/leds/led-triggers.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c92702a..8668538 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -81,21 +81,23 @@ ssize_t led_trigger_show(struct device *dev, struct device_attribute *attr,
 	down_read(&led_cdev->trigger_lock);
 
 	if (!led_cdev->trigger)
-		len += sprintf(buf+len, "[none] ");
+		len += scnprintf(buf+len, PAGE_SIZE - len, "[none] ");
 	else
-		len += sprintf(buf+len, "none ");
+		len += scnprintf(buf+len, PAGE_SIZE - len, "none ");
 
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (led_cdev->trigger && !strcmp(led_cdev->trigger->name,
 							trig->name))
-			len += sprintf(buf+len, "[%s] ", trig->name);
+			len += scnprintf(buf+len, PAGE_SIZE - len, "[%s] ",
+					 trig->name);
 		else
-			len += sprintf(buf+len, "%s ", trig->name);
+			len += scnprintf(buf+len, PAGE_SIZE - len, "%s ",
+					 trig->name);
 	}
 	up_read(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
 
-	len += sprintf(len+buf, "\n");
+	len += scnprintf(len+buf, PAGE_SIZE - len, "\n");
 	return len;
 }
 EXPORT_SYMBOL_GPL(led_trigger_show);
-- 
2.7.4
