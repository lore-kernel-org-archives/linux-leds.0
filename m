From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2 03/12] leds: core: Add two new LED_BLINK_ flags
Date: Mon, 28 Sep 2015 15:07:12 +0200
Message-ID: <1443445641-9529-4-git-send-email-j.anaszewski@samsung.com>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, rpurdie@rpsys.net, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds LED_BLINK_BRIGHTNESS_CHANGE flag to indicate that blink
brightness has changed, and LED_BLINK_DISABLE flag to indicate that
blinking deactivation has been requested. In order to use the flags
led_timer_function and set_brightness_delayed callbacks as well as
led_set_brightness function are being modified. The main goal of these
modifications is to prepare set_brightness_work for extension of the
scope of its responsibilities.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-core.c |   36 ++++++++++++++++++++++++++----------
 include/linux/leds.h    |   10 ++++++----
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ee9309e..7cf5924 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -44,18 +44,18 @@ static void led_timer_function(unsigned long data)
 	brightness = led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
-		if (led_cdev->delayed_set_value) {
-			led_cdev->blink_brightness =
-					led_cdev->delayed_set_value;
-			led_cdev->delayed_set_value = 0;
-		}
 		brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
 	} else {
 		/* Store the current brightness value to be able
 		 * to restore it when the delay_off period is over.
+		 * Do it only if there is no pending blink brightness
+		 * change, to avoid overwriting the new value.
 		 */
-		led_cdev->blink_brightness = brightness;
+		if (!(led_cdev->flags & LED_BLINK_BRIGHTNESS_CHANGE))
+			led_cdev->blink_brightness = brightness;
+		else
+			led_cdev->flags &= ~LED_BLINK_BRIGHTNESS_CHANGE;
 		brightness = LED_OFF;
 		delay = led_cdev->blink_delay_off;
 	}
@@ -84,7 +84,11 @@ static void set_brightness_delayed(struct work_struct *ws)
 	struct led_classdev *led_cdev =
 		container_of(ws, struct led_classdev, set_brightness_work);
 
-	led_stop_software_blink(led_cdev);
+	if (led_cdev->flags & LED_BLINK_DISABLE) {
+		led_cdev->delayed_set_value = LED_OFF;
+		led_stop_software_blink(led_cdev);
+		led_cdev->flags &= ~LED_BLINK_DISABLE;
+	}
 
 	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
 }
@@ -192,11 +196,23 @@ void led_set_brightness(struct led_classdev *led_cdev,
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
+		/*
+		 * If we need to disable soft blinking delegate this to the
+		 * work queue task to avoid problems in case we are called
+		 * from hard irq context.
+		 */
+		if (brightness == LED_OFF) {
+			led_cdev->flags |= LED_BLINK_DISABLE;
 			schedule_work(&led_cdev->set_brightness_work);
+		} else {
+			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
+			led_cdev->blink_brightness = brightness;
+		}
 		return;
 	}
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..84521e5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -44,10 +44,12 @@ struct led_classdev {
 #define LED_BLINK_ONESHOT	(1 << 17)
 #define LED_BLINK_ONESHOT_STOP	(1 << 18)
 #define LED_BLINK_INVERT	(1 << 19)
-#define LED_SYSFS_DISABLE	(1 << 20)
-#define SET_BRIGHTNESS_ASYNC	(1 << 21)
-#define SET_BRIGHTNESS_SYNC	(1 << 22)
-#define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 20)
+#define LED_BLINK_DISABLE	(1 << 21)
+#define LED_SYSFS_DISABLE	(1 << 22)
+#define SET_BRIGHTNESS_ASYNC	(1 << 23)
+#define SET_BRIGHTNESS_SYNC	(1 << 24)
+#define LED_DEV_CAP_FLASH	(1 << 25)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
-- 
1.7.9.5
