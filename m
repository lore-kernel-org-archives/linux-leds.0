From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 05/57] leds: Add an internal led_set_brightness_nosleep
 function
Date: Tue, 11 Aug 2015 11:37:18 +0200
Message-ID: <1439285890-27329-6-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33652 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934116AbbHKJig (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 05:38:36 -0400
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>

This patch adds led_set_brightness_nosleep function. It guarantees setting
LED brightness in a non-blocking way.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/leds.h  |   22 ++++++++++++++++++++++
 include/linux/leds.h |    2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index f700400..308f60f 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -2,8 +2,10 @@
  * LED Core
  *
  * Copyright 2005 Openedhand Ltd.
+ * Copyright 2014, 2015 Samsung Electronics Co., Ltd.
  *
  * Author: Richard Purdie <rpurdie@openedhand.com>
+ * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -39,6 +41,26 @@ static inline void led_set_brightness_async(struct led_classdev *led_cdev,
 	schedule_work(&led_cdev->set_brightness_work);
 }
 
+static inline void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+					      enum led_brightness value)
+{
+	int ret;
+
+	/*
+	 * Drivers that implement brightness_set_nonblocking op are guaranteed
+	 * not to sleep while setting brightness.
+	 */
+	if (led_cdev->brightness_set_nonblocking) {
+		ret = led_set_brightness_sync(led_cdev, value);
+		if (ret < 0)
+			dev_err(led_cdev->dev,
+				"cannot set led brightness %d\n", ret);
+		return;
+	}
+
+	led_set_brightness_async(led_cdev, value);
+}
+
 static inline int led_get_brightness(struct led_classdev *led_cdev)
 {
 	return led_cdev->brightness;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a004e84..9603a73 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -52,7 +52,7 @@ struct led_classdev {
 #define LED_BLINK_DISABLE	(1 << 25)
 
 	/* Set LED brightness level */
-	/* Must not sleep, use a workqueue if needed */
+	/* Intended for drivers that may set brightness in a blocking way. */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
 	/* Intended for drivers that set brightness in a non-blocking way */
-- 
1.7.9.5
