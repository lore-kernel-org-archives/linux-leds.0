From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] led: core: Use atomic bit-field for the blink-flags
Date: Sun, 23 Oct 2016 21:47:25 +0200
Message-ID: <20161023194726.24388-1-hdegoede@redhat.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35110 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753493AbcJWTrb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Oct 2016 15:47:31 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

All the LED_BLINK* flags are accessed read-modify-write from e.g.
led_set_brightness and led_blink_set_oneshot while both
set_brightness_work and the blink_timer may be running.

If these race then the modify step done by one of them may be lost,
switch the LED_BLINK* flags to a new atomic work_flags bit-field
to avoid this race.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c |  1 +
 drivers/leds/led-core.c  | 59 ++++++++++++++++++++++++++++--------------------
 include/linux/leds.h     | 17 ++++++--------
 3 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3427a65..abd8ebc 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -211,6 +211,7 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 		return -ENODEV;
 	}
 
+	led_cdev->work_flags = 0;
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index e2e5cc7..17a0964 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -19,6 +19,13 @@
 #include <linux/rwsem.h>
 #include "leds.h"
 
+#define LED_BLINK_SW			0
+#define LED_BLINK_ONESHOT		1
+#define LED_BLINK_ONESHOT_STOP		2
+#define LED_BLINK_INVERT		3
+#define LED_BLINK_BRIGHTNESS_CHANGE 	4
+#define LED_BLINK_DISABLE		5
+
 DECLARE_RWSEM(leds_list_lock);
 EXPORT_SYMBOL_GPL(leds_list_lock);
 
@@ -61,12 +68,13 @@ static void led_timer_function(unsigned long data)
 
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
 		led_set_brightness_nosleep(led_cdev, LED_OFF);
-		led_cdev->flags &= ~LED_BLINK_SW;
+		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 		return;
 	}
 
-	if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
-		led_cdev->flags &=  ~(LED_BLINK_ONESHOT_STOP | LED_BLINK_SW);
+	if (test_and_clear_bit(LED_BLINK_ONESHOT_STOP,
+			       &led_cdev->work_flags)) {
+		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 		return;
 	}
 
@@ -81,10 +89,9 @@ static void led_timer_function(unsigned long data)
 		 * Do it only if there is no pending blink brightness
 		 * change, to avoid overwriting the new value.
 		 */
-		if (!(led_cdev->flags & LED_BLINK_BRIGHTNESS_CHANGE))
+		if (!test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
+					&led_cdev->work_flags))
 			led_cdev->blink_brightness = brightness;
-		else
-			led_cdev->flags &= ~LED_BLINK_BRIGHTNESS_CHANGE;
 		brightness = LED_OFF;
 		delay = led_cdev->blink_delay_off;
 	}
@@ -95,13 +102,15 @@ static void led_timer_function(unsigned long data)
 	 * the final blink state so that the led is toggled each delay_on +
 	 * delay_off milliseconds in worst case.
 	 */
-	if (led_cdev->flags & LED_BLINK_ONESHOT) {
-		if (led_cdev->flags & LED_BLINK_INVERT) {
+	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags)) {
+		if (test_bit(LED_BLINK_INVERT, &led_cdev->work_flags)) {
 			if (brightness)
-				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
+				set_bit(LED_BLINK_ONESHOT_STOP,
+					&led_cdev->work_flags);
 		} else {
 			if (!brightness)
-				led_cdev->flags |= LED_BLINK_ONESHOT_STOP;
+				set_bit(LED_BLINK_ONESHOT_STOP,
+					&led_cdev->work_flags);
 		}
 	}
 
@@ -114,10 +123,9 @@ static void set_brightness_delayed(struct work_struct *ws)
 		container_of(ws, struct led_classdev, set_brightness_work);
 	int ret = 0;
 
-	if (led_cdev->flags & LED_BLINK_DISABLE) {
+	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
 		led_cdev->delayed_set_value = LED_OFF;
 		led_stop_software_blink(led_cdev);
-		led_cdev->flags &= ~LED_BLINK_DISABLE;
 	}
 
 	ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
@@ -160,7 +168,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 		return;
 	}
 
-	led_cdev->flags |= LED_BLINK_SW;
+	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
 	mod_timer(&led_cdev->blink_timer, jiffies + 1);
 }
 
@@ -169,7 +177,7 @@ static void led_blink_setup(struct led_classdev *led_cdev,
 		     unsigned long *delay_on,
 		     unsigned long *delay_off)
 {
-	if (!(led_cdev->flags & LED_BLINK_ONESHOT) &&
+	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	    led_cdev->blink_set &&
 	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
 		return;
@@ -196,8 +204,8 @@ void led_blink_set(struct led_classdev *led_cdev,
 {
 	del_timer_sync(&led_cdev->blink_timer);
 
-	led_cdev->flags &= ~LED_BLINK_ONESHOT;
-	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
+	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
+	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
 
 	led_blink_setup(led_cdev, delay_on, delay_off);
 }
@@ -208,17 +216,17 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 			   unsigned long *delay_off,
 			   int invert)
 {
-	if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
+	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
 	     timer_pending(&led_cdev->blink_timer))
 		return;
 
-	led_cdev->flags |= LED_BLINK_ONESHOT;
-	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
+	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
+	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
 
 	if (invert)
-		led_cdev->flags |= LED_BLINK_INVERT;
+		set_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
 	else
-		led_cdev->flags &= ~LED_BLINK_INVERT;
+		clear_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
 
 	led_blink_setup(led_cdev, delay_on, delay_off);
 }
@@ -229,7 +237,7 @@ void led_stop_software_blink(struct led_classdev *led_cdev)
 	del_timer_sync(&led_cdev->blink_timer);
 	led_cdev->blink_delay_on = 0;
 	led_cdev->blink_delay_off = 0;
-	led_cdev->flags &= ~LED_BLINK_SW;
+	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 }
 EXPORT_SYMBOL_GPL(led_stop_software_blink);
 
@@ -240,17 +248,18 @@ void led_set_brightness(struct led_classdev *led_cdev,
 	 * If software blink is active, delay brightness setting
 	 * until the next timer tick.
 	 */
-	if (led_cdev->flags & LED_BLINK_SW) {
+	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
 		/*
 		 * If we need to disable soft blinking delegate this to the
 		 * work queue task to avoid problems in case we are called
 		 * from hard irq context.
 		 */
 		if (brightness == LED_OFF) {
-			led_cdev->flags |= LED_BLINK_DISABLE;
+			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
 			schedule_work(&led_cdev->set_brightness_work);
 		} else {
-			led_cdev->flags |= LED_BLINK_BRIGHTNESS_CHANGE;
+			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
+				&led_cdev->work_flags);
 			led_cdev->blink_brightness = brightness;
 		}
 		return;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index eebcd8c..cff9df7 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -43,16 +43,13 @@ struct led_classdev {
 #define LED_UNREGISTERING	(1 << 1)
 	/* Upper 16 bits reflect control information */
 #define LED_CORE_SUSPENDRESUME	(1 << 16)
-#define LED_BLINK_SW		(1 << 17)
-#define LED_BLINK_ONESHOT	(1 << 18)
-#define LED_BLINK_ONESHOT_STOP	(1 << 19)
-#define LED_BLINK_INVERT	(1 << 20)
-#define LED_BLINK_BRIGHTNESS_CHANGE (1 << 21)
-#define LED_BLINK_DISABLE	(1 << 22)
-#define LED_SYSFS_DISABLE	(1 << 23)
-#define LED_DEV_CAP_FLASH	(1 << 24)
-#define LED_HW_PLUGGABLE	(1 << 25)
-#define LED_PANIC_INDICATOR	(1 << 26)
+#define LED_SYSFS_DISABLE	(1 << 17)
+#define LED_DEV_CAP_FLASH	(1 << 18)
+#define LED_HW_PLUGGABLE	(1 << 19)
+#define LED_PANIC_INDICATOR	(1 << 20)
+
+	/* set_brightness_work / blink_timer flags, atomic, private. */
+	unsigned long		work_flags;
 
 	/* Set LED brightness level
 	 * Must not sleep. Use brightness_set_blocking for drivers
-- 
2.9.3
