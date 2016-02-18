From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 2/4] leds: core: add color LED sysfs extension
Date: Thu, 18 Feb 2016 22:29:40 +0100
Message-ID: <56C637C4.1030102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35659 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757175AbcBRVbY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 18 Feb 2016 16:31:24 -0500
Received: by mail-wm0-f54.google.com with SMTP id c200so48274177wme.0
        for <linux-leds@vger.kernel.org>; Thu, 18 Feb 2016 13:31:23 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Extend brightness sysfs property handling to deal with monochrome
and color mode as well.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- split from patch 1
v3:
- moved one change (led_is_off) to patch 1
---
 drivers/leds/led-class.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ffebaf7..be7ecb7 100644
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
@@ -49,7 +52,7 @@ static ssize_t brightness_store(struct device *dev,
 		goto unlock;
 	}
 
-	ret = kstrtoul(buf, 10, &state);
+	ret = kstrtoul(buf, 0, &state);
 	if (ret)
 		goto unlock;
 
-- 
2.7.1
