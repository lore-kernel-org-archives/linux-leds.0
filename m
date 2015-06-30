From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v2 1/5] leds: Use set_brightness_work for brightness_set
 ops that can sleep
Date: Tue, 30 Jun 2015 15:59:26 +0200
Message-ID: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43436 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752835AbbF3OAi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jun 2015 10:00:38 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

This patch rearranges the core LED subsystem code, so that it
now shifts the responsibility for using work queues from drivers,
in case their brightness_set ops can sleep, onto the LED core
Addition of two flags: LED_BRIGHTNESS_FAST and LED_BLINK_DISABLE
as well as new_brightness_value property to the struct led_classdev
allows for employing existing set_brightness_work to do the job.
The modifications allows also to get rid of brightness_set_sync op,
as flash LED devices can now be handled properly only basing on the
SET_BRIGHTNESS_SYNC flag.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-class.c                  |   18 +++++++----
 drivers/leds/led-core.c                   |   50 +++++++++++++++++------------
 drivers/leds/leds.h                       |   41 +++++++++++++----------
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++---
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 +--
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 +--
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++---
 include/linux/leds.h                      |    9 ++----
 10 files changed, 84 insertions(+), 66 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index beabfbc..07ccaeb 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -109,7 +109,7 @@ static void led_timer_function(unsigned long data)
 	unsigned long delay;
 
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
 
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
@@ -137,7 +137,7 @@ static void led_timer_function(unsigned long data)
 		delay = led_cdev->blink_delay_off;
 	}
 
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
 
 	/* Return in next iteration if led is in one-shot mode and we are in
 	 * the final blink state so that the led is toggled each delay_on +
@@ -161,9 +161,13 @@ static void set_brightness_delayed(struct work_struct *ws)
 	struct led_classdev *led_cdev =
 		container_of(ws, struct led_classdev, set_brightness_work);
 
-	led_stop_software_blink(led_cdev);
+	if (led_cdev->flags & LED_BLINK_DISABLE) {
+		led_stop_software_blink(led_cdev);
+		led_cdev->flags &= ~LED_BLINK_DISABLE;
+		return;
+	}
 
-	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
+	__led_set_brightness(led_cdev, led_cdev->delayed_set_value);
 }
 
 /**
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 549de7e..0e13fb0 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -42,13 +42,14 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 
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
 
@@ -117,27 +118,36 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
 void led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	int ret = 0;
-
-	/* delay brightness if soft-blink is active */
+	/*
+	 * In case blinking is on delay brightness setting
+	 * to the next timer tick.
+	 */
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
-		led_cdev->delayed_set_value = brightness;
-		if (brightness == LED_OFF)
-			schedule_work(&led_cdev->set_brightness_work);
-		return;
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
+	} else {
+		/*
+		 * Don't use work queue if brightness has to be set as quickly
+		 * as possible or if this is fast LED.
+		 */
+		if ((led_cdev->flags & SET_BRIGHTNESS_SYNC) ||
+		    (led_cdev->flags & LED_BRIGHTNESS_FAST)) {
+			__led_set_brightness(led_cdev, brightness);
+			return;
+		}
 	}
 
-	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
-		led_set_brightness_async(led_cdev, brightness);
-		return;
-	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
-		ret = led_set_brightness_sync(led_cdev, brightness);
-	else
-		ret = -EINVAL;
-
-	if (ret < 0)
-		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
-			ret);
+	led_cdev->delayed_set_value = brightness;
+	schedule_work(&led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL(led_set_brightness);
 
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index bc89d7a..dd9dd9b 100644
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
@@ -16,27 +18,15 @@
 #include <linux/rwsem.h>
 #include <linux/leds.h>
 
-static inline void led_set_brightness_async(struct led_classdev *led_cdev,
+static inline void __led_set_brightness(struct led_classdev *led_cdev,
 					enum led_brightness value)
 {
-	value = min(value, led_cdev->max_brightness);
-	led_cdev->brightness = value;
-
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness_set(led_cdev, value);
-}
-
-static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
-					enum led_brightness value)
-{
-	int ret = 0;
-
 	led_cdev->brightness = min(value, led_cdev->max_brightness);
 
-	if (!(led_cdev->flags & LED_SUSPENDED))
-		ret = led_cdev->brightness_set_sync(led_cdev,
-						led_cdev->brightness);
-	return ret;
+	if (led_cdev->flags & LED_SUSPENDED)
+		return;
+
+	led_cdev->brightness_set(led_cdev, led_cdev->brightness);
 }
 
 static inline int led_get_brightness(struct led_classdev *led_cdev)
@@ -44,6 +34,23 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 	return led_cdev->brightness;
 }
 
+static inline void led_set_brightness_nosleep(struct led_classdev *led_cdev,
+					      enum led_brightness value)
+{
+	/*
+	 * Delegate setting brightness to a work queue task only for slow LEDs
+	 * as the FAST ones are guaranteed not to sleep while setting
+	 * brightness.
+	 */
+	if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
+		led_cdev->delayed_set_value = value;
+		schedule_work(&led_cdev->set_brightness_work);
+		return;
+	}
+
+	__led_set_brightness(led_cdev, value);
+}
+
 void led_stop_software_blink(struct led_classdev *led_cdev);
 
 extern struct rw_semaphore leds_list_lock;
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
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b122eea..ea99de9 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -48,17 +48,13 @@ struct led_classdev {
 #define SET_BRIGHTNESS_ASYNC	(1 << 21)
 #define SET_BRIGHTNESS_SYNC	(1 << 22)
 #define LED_DEV_CAP_FLASH	(1 << 23)
+#define LED_BRIGHTNESS_FAST	(1 << 24)
+#define LED_BLINK_DISABLE	(1 << 25)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
-	/*
-	 * Set LED brightness level immediately - it can block the caller for
-	 * the time required for accessing a LED device register.
-	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
@@ -87,6 +83,7 @@ struct led_classdev {
 
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
+	int			new_brightness_value;
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	/* Protects the trigger data below */
-- 
1.7.9.5
