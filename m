From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: core: avoid error message when a USB LED device is
 unplugged
Date: Tue, 19 Jan 2016 21:42:00 +0100
Message-ID: <569E9F98.3070802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37995 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933124AbcASUmM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jan 2016 15:42:12 -0500
Received: by mail-wm0-f51.google.com with SMTP id b14so190767693wmb.1
        for <linux-leds@vger.kernel.org>; Tue, 19 Jan 2016 12:42:12 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

When a USB LED device is unplugged the remove call chain calls
led_classdev_unregister which tries to switch the LED off.
As the device has been removed already this results in a ENODEV
error message in dmesg.
Avoid this error message by ignoring ENODEV in calls from
led_classdev_unregister if the LED device is flagged as pluggable.

Therefore a new flag LED_HW_PLUGGABLE was introduced which should be set by
all LED drivers handling pluggable LED devices (mainly USB LED devices).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-class.c | 2 ++
 drivers/leds/led-core.c  | 5 ++++-
 include/linux/leds.h     | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 14139c3..aa84e5b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -245,6 +245,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&led_cdev->trigger_lock);
 #endif
 
+	led_cdev->flags |= LED_UNREGISTERING;
+
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 19e1e60..ad684b6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -98,7 +98,10 @@ static void set_brightness_delayed(struct work_struct *ws)
 						led_cdev->delayed_set_value);
 	else
 		ret = -ENOTSUPP;
-	if (ret < 0)
+	if (ret < 0 &&
+	    /* LED HW might have been unplugged, therefore don't warn */
+	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
+	    (led_cdev->flags & LED_HW_PLUGGABLE)))
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 4429887..24413a8 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -39,6 +39,7 @@ struct led_classdev {
 
 	/* Lower 16 bits reflect status */
 #define LED_SUSPENDED		(1 << 0)
+#define LED_UNREGISTERING	(1 << 1)
 	/* Upper 16 bits reflect control information */
 #define LED_CORE_SUSPENDRESUME	(1 << 16)
 #define LED_BLINK_ONESHOT	(1 << 17)
@@ -48,6 +49,7 @@ struct led_classdev {
 #define LED_BLINK_DISABLE	(1 << 21)
 #define LED_SYSFS_DISABLE	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_HW_PLUGGABLE	(1 << 24)
 
 	/* Set LED brightness level */
 	/* Must not sleep. If no non-blocking version can be provided
-- 
2.7.0
