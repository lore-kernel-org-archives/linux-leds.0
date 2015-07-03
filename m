From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 4/7] leds: Improve setting brightness in a non sleeping
 way
Date: Fri, 03 Jul 2015 15:10:49 +0200
Message-ID: <1435929052-8736-5-git-send-email-j.anaszewski@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48350 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754849AbbGCNPH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:15:07 -0400
In-reply-to: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

This patch replaces led_set_brightness_async with
led_set_brightness_nosleep in all places where the most
vital was setting brightness in a non sleeping way but
not necessarily asynchronously, which is not needed for
fast drivers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-class.c                  |    4 ++--
 drivers/leds/led-core.c                   |    5 +++--
 drivers/leds/trigger/ledtrig-backlight.c  |    8 ++++----
 drivers/leds/trigger/ledtrig-default-on.c |    2 +-
 drivers/leds/trigger/ledtrig-gpio.c       |    6 +++---
 drivers/leds/trigger/ledtrig-heartbeat.c  |    4 ++--
 drivers/leds/trigger/ledtrig-oneshot.c    |    4 ++--
 drivers/leds/trigger/ledtrig-transient.c  |    8 ++++----
 8 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b8decf7..964750a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -109,7 +109,7 @@ static void led_timer_function(unsigned long data)
 	unsigned long delay;
 
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
-		led_set_brightness_async(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
 
@@ -137,7 +137,7 @@ static void led_timer_function(unsigned long data)
 		delay = led_cdev->blink_delay_off;
 	}
 
-	led_set_brightness_async(led_cdev, brightness);
+	led_set_brightness_nosleep(led_cdev, brightness);
 
 	/* Return in next iteration if led is in one-shot mode and we are in
 	 * the final blink state so that the led is toggled each delay_on +
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 16fe995..428f04c 100644
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
