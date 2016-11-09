From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2] leds: Add mutex protection in brightness_show()
Date: Wed, 09 Nov 2016 13:15:25 +0100
Message-ID: <1478693725-29893-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56460 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750938AbcKIMQ2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2016 07:16:28 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>

Initially the claim about no need for lock in brightness_show()
was valid as the function was just returning unchanged
LED brightness.

After the addition of led_update_brightness() this is no longer
true, as the function can change the brightness if a LED class
driver implements brightness_get op. It can lead to races between
led_update_brightness() and led_set_brightness().

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Lunn <andrew@lunn.ch>
---
Changes since v1:
- added led_sysfs_is_disabled() check
- moved sprintf under mutex protection

 drivers/leds/led-class.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b12f861..e472407 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -29,11 +29,23 @@ static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	int ret;
 
-	/* no lock needed for this */
-	led_update_brightness(led_cdev);
+	mutex_lock(&led_cdev->led_access);
+
+	if (led_sysfs_is_disabled(led_cdev)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = led_update_brightness(led_cdev);
+	if (ret < 0)
+		goto unlock;
 
-	return sprintf(buf, "%u\n", led_cdev->brightness);
+	ret = sprintf(buf, "%u\n", led_cdev->brightness);
+unlock:
+	mutex_unlock(&led_cdev->led_access);
+	return ret;
 }
 
 static ssize_t brightness_store(struct device *dev,
-- 
1.9.1
