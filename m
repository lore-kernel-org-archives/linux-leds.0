From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v5 2/4] leds: core: add color LED sysfs extension
Date: Tue, 1 Mar 2016 22:28:00 +0100
Message-ID: <56D60960.1020504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

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
v5:
- no changes
---
 drivers/leds/led-class.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 007a5b3..8a3748a 100644
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
