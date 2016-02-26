From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4 2/4] leds: core: add color LED sysfs extension
Date: Fri, 26 Feb 2016 21:59:12 +0100
Message-ID: <56D0BCA0.6040606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35847 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755205AbcBZU71 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 26 Feb 2016 15:59:27 -0500
Received: by mail-wm0-f68.google.com with SMTP id a4so11073627wme.3
        for <linux-leds@vger.kernel.org>; Fri, 26 Feb 2016 12:59:26 -0800 (PST)
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
v4:
- changed printf format string to %#.6x
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
+		return sprintf(buf, "%#.6x\n", led_cdev->brightness);
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
