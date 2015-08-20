From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 01/36] leds: Add brightness_set_blocking op
Date: Thu, 20 Aug 2015 16:43:31 +0200
Message-ID: <1440081846-11697-2-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

This patch adds a new brightness_set_blocking op to the LED subsystem.
The op is intended for drivers that set brightness in a blocking way,
i.e. they either can sleep or use delays while setting brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c |    3 +++
 include/linux/leds.h     |    6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ca51d58..93a2414 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -267,6 +267,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
 				led_cdev->name, dev_name(led_cdev->dev));
 
+	WARN_ON(led_cdev->brightness_set &&
+		led_cdev->brightness_set_blocking);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..85fad6b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -54,6 +54,12 @@ struct led_classdev {
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
 	/*
+	 * Intended for drivers that either can sleep or use delays while
+	 * setting brightness.
+	 */
+	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
+				       enum led_brightness brightness);
+	/*
 	 * Set LED brightness level immediately - it can block the caller for
 	 * the time required for accessing a LED device register.
 	 */
-- 
1.7.9.5
