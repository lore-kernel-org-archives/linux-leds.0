From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 02/57] leds: Add LED_BRIGHTNESS_BLOCKING flag
Date: Tue, 11 Aug 2015 11:37:15 +0200
Message-ID: <1439285890-27329-3-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

This patch adds LED_BRIGHTNESS_BLOCKING flag to the LED core to make it
capable of discerning between drivers that implement brightness_set op
in the old manner, i.e. the ones which use work queue internally, and
drivers that implement brightness_set op in the new manner, i.e. they
are aware that brightness_set op will be called from a work queue task
by the LED core.
In the new approach all drivers that implement brightness_set op should
also set LED_BRIGHTNESS_BLOCKING flag.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c |    3 +++
 include/linux/leds.h     |    1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ca51d58..2875e6a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -279,6 +279,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness = LED_FULL;
 
+	WARN_ON((led_cdev->flags & LED_BRIGHTNESS_BLOCKING) &&
+		!led_cdev->brightness_set);
+
 	led_cdev->flags |= SET_BRIGHTNESS_ASYNC;
 
 	led_update_brightness(led_cdev);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index c32f1b8..ac9efe1 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -48,6 +48,7 @@ struct led_classdev {
 #define SET_BRIGHTNESS_ASYNC	(1 << 21)
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_BRIGHTNESS_BLOCKING	(1 << 24)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
-- 
1.7.9.5
