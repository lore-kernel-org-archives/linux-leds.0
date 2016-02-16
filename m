From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 2/4] leds: core: add color LED sysfs extension
Date: Tue, 16 Feb 2016 20:28:36 +0100
Message-ID: <56C37864.20707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35689 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755882AbcBPTao (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Feb 2016 14:30:44 -0500
Received: by mail-wm0-f45.google.com with SMTP id c200so178713171wme.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2016 11:30:44 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Extend brightness sysfs property handling to deal with monochrome
and color mode as well.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- split from patch 1
---
 drivers/leds/led-class.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index aa84e5b..09e0007 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -32,7 +32,10 @@ static ssize_t brightness_show(struct device *dev,
 	/* no lock needed for this */
 	led_update_brightness(led_cdev);
 
-	return sprintf(buf, "%u\n", led_cdev->brightness);
+	if (led_cdev->brightness > LED_FULL)
+		return sprintf(buf, "%#06x\n", led_cdev->brightness);
+	else
+		return sprintf(buf, "%u\n", led_cdev->brightness);
 }
 
 static ssize_t brightness_store(struct device *dev,
@@ -49,11 +52,11 @@ static ssize_t brightness_store(struct device *dev,
 		goto unlock;
 	}
 
-	ret = kstrtoul(buf, 10, &state);
+	ret = kstrtoul(buf, 0, &state);
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (is_off(state))
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 
-- 
2.7.1
