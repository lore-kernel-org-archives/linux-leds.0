From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 04/57] leds: Improve asynchronous path of setting
 brightness
Date: Tue, 11 Aug 2015 11:37:17 +0200
Message-ID: <1439285890-27329-5-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

led_set_brightness_async function didn't set brightness in an
asynchronous way in all cases. It was mistakenly assuming that all
LED subsystem drivers used work queue in their brightness_set op,
whereas only half of them did that. Modify the function to assure
setting brightness asynchronously in all cases by using existing
set_brightness_delayed work queue. The work queue is now made using
led_set_brightness_sync for setting brightness.

All these modification change the initial purpose of the work queue,
which was used for setting brightness only if blink timer was active.
In order to keep this functionality LED_BLINK_DISABLE flag is being
introduced, as well as a 'new_brightness_value' field is being added
to the struct led_classdev. Aforementioned improvements entail changes
in the led_brightness_set function.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c |   13 ++++++++-----
 drivers/leds/led-core.c  |   20 ++++++++++++++++----
 drivers/leds/leds.h      |   23 ++++++++++++++++++-----
 include/linux/leds.h     |    2 ++
 4 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2875e6a..853bd95 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -121,10 +121,10 @@ static void led_timer_function(unsigned long data)
 	brightness = led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
-		if (led_cdev->delayed_set_value) {
+		if (led_cdev->new_brightness_value) {
 			led_cdev->blink_brightness =
-					led_cdev->delayed_set_value;
-			led_cdev->delayed_set_value = 0;
+					led_cdev->new_brightness_value;
+			led_cdev->new_brightness_value = 0;
 		}
 		brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
@@ -161,9 +161,12 @@ static void set_brightness_delayed(struct work_struct *ws)
 	struct led_classdev *led_cdev =
 		container_of(ws, struct led_classdev, set_brightness_work);
 
-	led_stop_software_blink(led_cdev);
+	if (led_cdev->flags & LED_BLINK_DISABLE) {
+		led_stop_software_blink(led_cdev);
+		led_cdev->flags &= ~LED_BLINK_DISABLE;
+	}
 
-	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
+	led_set_brightness_sync(led_cdev, led_cdev->delayed_set_value);
 }
 
 /**
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 192071d..3ea32ab 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -119,11 +119,23 @@ void led_set_brightness(struct led_classdev *led_cdev,
 {
 	int ret = 0;
 
-	/* delay brightness if soft-blink is active */
+	/*
+	 * In case blinking is on delay brightness setting
+	 * until the next timer tick.
+	 */
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
-		led_cdev->delayed_set_value = brightness;
-		if (brightness == LED_OFF)
-			schedule_work(&led_cdev->set_brightness_work);
+		led_cdev->new_brightness_value = brightness;
+
+		/* New brightness will be set on next timer tick. */
+		if (brightness != LED_OFF)
+			return;
+		/*
+		 * If need to disable soft blinking delegate this to the
+		 * work queue task to avoid problems in case we are
+		 * called from hard irq context.
+		 */
+		led_cdev->flags |= LED_BLINK_DISABLE;
+		led_set_brightness_async(led_cdev, brightness);
 		return;
 	}
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 1c026c9..f700400 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -17,13 +17,26 @@
 #include <linux/leds.h>
 
 static inline void led_set_brightness_async(struct led_classdev *led_cdev,
-					enum led_brightness value)
+					    enum led_brightness value)
 {
-	value = min(value, led_cdev->max_brightness);
-	led_cdev->brightness = value;
+	int ret;
+	/*
+	 * Drivers that implement brightness_set op in the old manner also
+	 * don't set LED_BRIGHTNESS_BLOCKING flag. They use work queue
+	 * internally in case they set brightness in a blocking way, thus we
+	 * avoid scheduling another work queue task by the LED core.
+	 */
+	if (led_cdev->brightness_set &&
+	   !(led_cdev->flags & LED_BRIGHTNESS_BLOCKING)) {
+		ret = led_set_brightness_sync(led_cdev, value);
+		if (ret < 0)
+			dev_err(led_cdev->dev,
+				"cannot set led brightness %d\n", ret);
+		return;
+	}
 
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness_set(led_cdev, value);
+	led_cdev->delayed_set_value = value;
+	schedule_work(&led_cdev->set_brightness_work);
 }
 
 static inline int led_get_brightness(struct led_classdev *led_cdev)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0c3098ea..a004e84 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -49,6 +49,7 @@ struct led_classdev {
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
 #define LED_BRIGHTNESS_BLOCKING	(1 << 24)
+#define LED_BLINK_DISABLE	(1 << 25)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
@@ -91,6 +92,7 @@ struct led_classdev {
 
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
+	int			new_brightness_value;
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
-- 
1.7.9.5
