From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 4/5] leds: core: Add an internal led_set_brightness_nosleep
 function
Date: Wed, 16 Sep 2015 12:47:43 +0200
Message-ID: <1442400464-27367-5-git-send-email-j.anaszewski@samsung.com>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds led_set_brightness_nosleep function, which guarantees
setting LED brightness in a non-blocking way. It also replaces
led_set_brightness_async with led_set_brightness_nosleep in all places
where the most vital was setting brightness in a non sleeping way but
not necessarily asynchronously, which is not needed for non-blocking
drivers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-core.c                   |   29 ++++++++++++++++++++++++-----
 drivers/leds/leds.h                       |    2 ++
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++++----
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 +++---
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 ++--
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 ++--
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++++----
 8 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 1968e24..fe6c2df 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -32,7 +32,7 @@ static void led_timer_function(unsigned long data)
 	unsigned long delay;
 
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
 
@@ -60,7 +60,7 @@ static void led_timer_function(unsigned long data)
 		delay = led_cdev->blink_delay_off;
 	}
 
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
 
 	/* Return in next iteration if led is in one-shot mode and we are in
 	 * the final blink state so that the led is toggled each delay_on +
@@ -110,13 +110,14 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 
 	/* never on - just set to off */
 	if (!delay_on) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
 
 	/* never off - just set to brightness */
 	if (!delay_off) {
-		led_set_brightness_async(led_cdev, led_cdev->blink_brightness);
+		led_set_brightness_nosleep(led_cdev,
+					   led_cdev->blink_brightness);
 		return;
 	}
 
@@ -217,7 +218,7 @@ void led_set_brightness(struct led_classdev *led_cdev,
 	}
 
 	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
-		led_set_brightness_async(led_cdev, brightness);
+		led_set_brightness_nosleep(led_cdev, brightness);
 		return;
 	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
 		ret = led_set_brightness_sync(led_cdev, brightness);
@@ -230,6 +231,24 @@ void led_set_brightness(struct led_classdev *led_cdev,
 }
 EXPORT_SYMBOL(led_set_brightness);
 
+void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+					enum led_brightness value)
+{
+	led_cdev->brightness = min(value, led_cdev->max_brightness);
+
+	if (led_cdev->flags & LED_SUSPENDED)
+		return;
+
+	/* Use brightness_set op if available, it is guaranteed not to sleep */
+	if (led_cdev->brightness_set)
+		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
+
+	/* If brightness setting can sleep, delegate it to a work queue task */
+	led_cdev->delayed_set_value = led_cdev->brightness;
+	schedule_work(&led_cdev->set_brightness_work);
+}
+EXPORT_SYMBOL(led_set_brightness_nosleep);
+
 int led_update_brightness(struct led_classdev *led_cdev)
 {
 	int ret = 0;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index cf6d448..11520eb 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -46,6 +46,8 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 
 void led_init_core(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
+void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+				enum led_brightness value);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 59eca17..1ca1f16 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -51,9 +51,9 @@ static int fb_notifier_callback(struct notifier_block *p,
 
 	if ((n->old_status == UNBLANK) ^ n->invert) {
 		n->brightness = led->brightness;
-		led_set_brightness_async(led, LED_OFF);
+		led_set_brightness_nosleep(led, LED_OFF);
 	} else {
-		led_set_brightness_async(led, n->brightness);
+		led_set_brightness_nosleep(led, n->brightness);
 	}
 
 	n->old_status = new_status;
@@ -89,9 +89,9 @@ static ssize_t bl_trig_invert_store(struct device *dev,
 
 	/* After inverting, we need to update the LED. */
 	if ((n->old_status == BLANK) ^ n->invert)
-		led_set_brightness_async(led, LED_OFF);
+		led_set_brightness_nosleep(led, LED_OFF);
 	else
-		led_set_brightness_async(led, n->brightness);
+		led_set_brightness_nosleep(led, n->brightness);
 
 	return num;
 }
diff --git a/drivers/leds/trigger/ledtrig-default-on.c b/drivers/leds/trigger/ledtrig-default-on.c
index 6f38f88..ff455cb 100644
--- a/drivers/leds/trigger/ledtrig-default-on.c
+++ b/drivers/leds/trigger/ledtrig-default-on.c
@@ -19,7 +19,7 @@
 
 static void defon_trig_activate(struct led_classdev *led_cdev)
 {
-	led_set_brightness_async(led_cdev, led_cdev->max_brightness);
+	led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
 }
 
 static struct led_trigger defon_led_trigger = {
diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 4cc7040..51288a4 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -54,12 +54,12 @@ static void gpio_trig_work(struct work_struct *work)
 
 	if (tmp) {
 		if (gpio_data->desired_brightness)
-			led_set_brightness_async(gpio_data->led,
+			led_set_brightness_nosleep(gpio_data->led,
 					   gpio_data->desired_brightness);
 		else
-			led_set_brightness_async(gpio_data->led, LED_FULL);
+			led_set_brightness_nosleep(gpio_data->led, LED_FULL);
 	} else {
-		led_set_brightness_async(gpio_data->led, LED_OFF);
+		led_set_brightness_nosleep(gpio_data->led, LED_OFF);
 	}
 }
 
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index fea6871..3dc6f0c 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -37,7 +37,7 @@ static void led_heartbeat_function(unsigned long data)
 	unsigned long delay = 0;
 
 	if (unlikely(panic_heartbeats)) {
-		led_set_brightness(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
 
@@ -74,7 +74,7 @@ static void led_heartbeat_function(unsigned long data)
 		break;
 	}
 
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
 	mod_timer(&heartbeat_data->timer, jiffies + delay);
 }
 
diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index fbd02cd..6729317 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -63,9 +63,9 @@ static ssize_t led_invert_store(struct device *dev,
 	oneshot_data->invert = !!state;
 
 	if (oneshot_data->invert)
-		led_set_brightness_async(led_cdev, LED_FULL);
+		led_set_brightness_nosleep(led_cdev, LED_FULL);
 	else
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 
 	return size;
 }
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 3c34de4..1dddd8f 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -41,7 +41,7 @@ static void transient_timer_function(unsigned long data)
 	struct transient_trig_data *transient_data = led_cdev->trigger_data;
 
 	transient_data->activate = 0;
-	led_set_brightness_async(led_cdev, transient_data->restore_state);
+	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
 }
 
 static ssize_t transient_activate_show(struct device *dev,
@@ -72,7 +72,7 @@ static ssize_t transient_activate_store(struct device *dev,
 	if (state == 0 && transient_data->activate == 1) {
 		del_timer(&transient_data->timer);
 		transient_data->activate = state;
-		led_set_brightness_async(led_cdev,
+		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
 		return size;
 	}
@@ -81,7 +81,7 @@ static ssize_t transient_activate_store(struct device *dev,
 	if (state == 1 && transient_data->activate == 0 &&
 	    transient_data->duration != 0) {
 		transient_data->activate = state;
-		led_set_brightness_async(led_cdev, transient_data->state);
+		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =
 		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
 		mod_timer(&transient_data->timer,
@@ -204,7 +204,7 @@ static void transient_trig_deactivate(struct led_classdev *led_cdev)
 
 	if (led_cdev->activated) {
 		del_timer_sync(&transient_data->timer);
-		led_set_brightness_async(led_cdev,
+		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
 		device_remove_file(led_cdev->dev, &dev_attr_activate);
 		device_remove_file(led_cdev->dev, &dev_attr_duration);
-- 
1.7.9.5
