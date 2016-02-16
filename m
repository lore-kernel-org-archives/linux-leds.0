From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] leds: core: add helpers for calling
 brightness_set(_blocking)
Date: Tue, 16 Feb 2016 20:21:56 +0100
Message-ID: <56C376D4.4080808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36209 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755874AbcBPTal (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Feb 2016 14:30:41 -0500
Received: by mail-wm0-f46.google.com with SMTP id g62so124843353wme.1
        for <linux-leds@vger.kernel.org>; Tue, 16 Feb 2016 11:30:41 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

Add helpers for calling brightness_set(_blocking) allowing to
simplify the code and make it better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- changed helper names
---
 drivers/leds/led-core.c | 40 ++++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ad684b6..3495d5d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -25,6 +25,26 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
+static int __led_set_brightness(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	if (!led_cdev->brightness_set)
+		return -ENOTSUPP;
+
+	led_cdev->brightness_set(led_cdev, value);
+
+	return 0;
+}
+
+static int __led_set_brightness_blocking(struct led_classdev *led_cdev,
+					 enum led_brightness value)
+{
+	if (!led_cdev->brightness_set_blocking)
+		return -ENOTSUPP;
+
+	return led_cdev->brightness_set_blocking(led_cdev, value);
+}
+
 static void led_timer_function(unsigned long data)
 {
 	struct led_classdev *led_cdev = (void *)data;
@@ -91,13 +111,10 @@ static void set_brightness_delayed(struct work_struct *ws)
 		led_cdev->flags &= ~LED_BLINK_DISABLE;
 	}
 
-	if (led_cdev->brightness_set)
-		led_cdev->brightness_set(led_cdev, led_cdev->delayed_set_value);
-	else if (led_cdev->brightness_set_blocking)
-		ret = led_cdev->brightness_set_blocking(led_cdev,
-						led_cdev->delayed_set_value);
-	else
-		ret = -ENOTSUPP;
+	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
+	if (ret == -ENOTSUPP)
+		ret = __led_set_brightness_blocking(led_cdev,
+					led_cdev->delayed_set_value);
 	if (ret < 0 &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
@@ -236,10 +253,8 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
-	if (led_cdev->brightness_set) {
-		led_cdev->brightness_set(led_cdev, value);
+	if (!__led_set_brightness(led_cdev, value))
 		return;
-	}
 
 	/* If brightness setting can sleep, delegate it to a work queue task */
 	led_cdev->delayed_set_value = value;
@@ -270,10 +285,7 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	if (led_cdev->brightness_set_blocking)
-		return led_cdev->brightness_set_blocking(led_cdev,
-							 led_cdev->brightness);
-	return -ENOTSUPP;
+	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
-- 
2.7.1
