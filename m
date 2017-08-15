From: Paulo Costa <me@paulo.costa.nom.br>
Subject: [RFC] ledtrig-dither: A Poor man's adjustable LED brightness.
Date: Tue, 15 Aug 2017 18:35:41 -0300
Message-ID: <20170815213541.26985-1-me@paulo.costa.nom.br>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37882 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751119AbdHOVgE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2017 17:36:04 -0400
Received: by mail-qk0-f193.google.com with SMTP id x77so1852509qka.4
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2017 14:36:04 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Paulo Costa <me@paulo.costa.nom.br>

While many LED drivers support adjustable brightness levels, usually
via PWM hardware, most can only be set to ON or OFF.

Well, I wish I could adjust the brightness of every led.
What if we can fake PWMs with kernel timers?

This led trigger tries to do that, in hacky way:
- Assign 'dither' to myled/trigger
- A new led device 'myled:dither' is created
- The brightness of myled will quickly switch between 0 and max_brightness, with the time average value defined by 'myled:dither/brightness'
- Human is fooled and thinks the brightness is adjustable.

There are a number of issues in that:
- The underlying LED has to be fast, since it will be ajusted many times per second.
  E.g., GPIO leds are OK, USB Keyboard capslock led aren't.
- kernel timers have low time resolution (dependent on HZ), so:
  - Timing variances has to be accounter for and compensated.
  - Since the the smallest between time_on and time_off is limited to a jiffie,
    blinking slows down and flickering becomes visible when brightness is near-zero and near-max.
  - Setting kernel to 1000Hz is much better than 100Hz

Despite being hacky, it works surprisingly well. You can see a demo on https://youtu.be/PIyMW8uwOmE

A better integration that bypasses using a trigger and a new led would be even better, but I'm leaving that in the future.
---
 drivers/leds/trigger/Kconfig          |   9 ++
 drivers/leds/trigger/Makefile         |   1 +
 drivers/leds/trigger/ledtrig-dither.c | 202 ++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-dither.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 3f9ddb9f..5a23ab7a 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -127,3 +127,12 @@ config LEDS_TRIGGER_PANIC
 	  If unsure, say Y.
 
 endif # LEDS_TRIGGERS
+
+config LEDS_TRIGGER_DITHER
+	tristate "LED Dithering Trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  The poor man's PWM led. It uses kernel timers to quickly switch leds ON
+	  and OFF, simulating adjustable brightness. Some flickering may be visible,
+	  but the overall effect is convincing.
+	  If unsure, say Y.
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index a72c43cf..5a4d7039 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
+obj-$(CONFIG_LEDS_TRIGGER_DITHER)	+= ledtrig-dither.o
diff --git a/drivers/leds/trigger/ledtrig-dither.c b/drivers/leds/trigger/ledtrig-dither.c
new file mode 100644
index 00000000..cf8d8baf
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-dither.c
@@ -0,0 +1,202 @@
+/*
+ * Dithering LED trigger
+ *
+ * Author: Paulo Costa <me@paulo.costa.nom.br>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/slab.h>
+#include <linux/printk.h>
+#include <linux/ktime.h>
+#include <linux/timer.h>
+#include "../leds.h"
+
+#define WRAPPER_LED_SUFIX ":dither"
+
+// The target blink period.
+// But since timers have a pretty low resolution, the actual blink period is likely to be bigger
+#define DITHER_MIN_PERIOD_MS 20
+// And this is the maximum period we can tolerate
+#define DITHER_MAX_PERIOD_MS 1000
+
+struct ledtrig_dither_data {
+	struct led_classdev *actual_led;
+	struct led_classdev wrapper_led;
+	struct timer_list timer;
+	ktime_t updated_at;
+	enum led_brightness target_value;
+	enum led_brightness actual_value;
+
+	int error;
+
+    int min_time_on;
+    int min_time_off;
+	int max_time_on;
+    int max_time_off;
+	int min_error;
+	int max_error;
+};
+
+static inline struct ledtrig_dither_data * led_to_data(struct led_classdev *led)
+{
+	return container_of(led, struct ledtrig_dither_data, wrapper_led);
+}
+
+static void dither_update_error(struct ledtrig_dither_data* dither)
+{
+	ktime_t now = ktime_get();
+	int elapsed =  ktime_to_us(ktime_sub(now, dither->updated_at));
+
+	dither->updated_at = now;
+
+	dither->error += elapsed * (dither->actual_value - dither->target_value);
+	if (dither->error < dither->min_error) {
+		dither->error = dither->min_error;
+	} else if (dither->error > dither->max_error) {
+		dither->error = dither->max_error;
+	}
+}
+
+
+static void dither_update_brightness(struct ledtrig_dither_data* dither)
+{
+	int error_speed;
+	int timeout;
+	if ((dither->error < 0) || ( (dither->error == 0) && (dither->target_value > dither->wrapper_led.max_brightness / 2) ) ) {
+		led_set_brightness_nosleep(dither->actual_led, dither->actual_led->max_brightness);
+		dither->actual_value = dither->wrapper_led.max_brightness;
+	} else {
+		led_set_brightness_nosleep(dither->actual_led, LED_OFF);
+		dither->actual_value = LED_OFF;
+	}
+
+	//Calculate how long it takes to cross error=0, and schedules the timer accordingly
+	error_speed = dither->target_value - dither->actual_value;
+	if (error_speed == 0) {
+		// We're stable, no need to reschedule the timer until the value has changed.
+		return;
+	} else {
+		timeout = DIV_ROUND_UP(dither->error, error_speed);
+
+		//We don't want to blink too fast and waster CPU -- Ensures a minimum time before calling the timer.
+		if (dither->actual_value && (dither->min_time_on >= dither->min_time_off) && (timeout < dither->min_time_on)) {
+			timeout = dither->min_time_on;
+		}
+		if (!dither->actual_value && (dither->min_time_off >= dither->min_time_on) && (timeout < dither->min_time_off)) {
+			timeout = dither->min_time_off;
+		}
+
+		mod_timer(&dither->timer, jiffies + usecs_to_jiffies(timeout));
+	}
+}
+
+static void dither_set(struct led_classdev *led, enum led_brightness value)
+{
+	struct ledtrig_dither_data *dither = led_to_data(led);
+
+	del_timer_sync(&dither->timer);
+
+	dither->min_time_on  = 1000 * DITHER_MIN_PERIOD_MS * value / led->max_brightness;
+	dither->min_time_off = 1000 * DITHER_MIN_PERIOD_MS * (led->max_brightness - value) / led->max_brightness;
+
+	dither->max_time_on  = 1000 * DITHER_MAX_PERIOD_MS * value / led->max_brightness;
+	dither->max_time_off = 1000 * DITHER_MAX_PERIOD_MS * (led->max_brightness - value) / led->max_brightness;
+	dither->max_error = dither->max_time_on  * (led->max_brightness - value);
+	dither->min_error = dither->max_time_off * -value;
+
+	dither_update_error(dither);
+	dither->target_value = value;
+	dither_update_brightness(dither);
+}
+
+static void dither_timer(unsigned long data)
+{
+	struct ledtrig_dither_data* dither = (struct ledtrig_dither_data*)data;
+	dither_update_error(dither);
+	dither_update_brightness(dither);
+}
+
+static void ledtrig_dither_activate(struct led_classdev *led)
+{
+	char* wrapper_name;
+	struct ledtrig_dither_data* dither_data;
+
+	wrapper_name = kzalloc(strlen(led->name) + strlen(WRAPPER_LED_SUFIX) + 1, GFP_KERNEL);
+	if (!wrapper_name)
+		goto err_wrapper_name;
+	strcpy(wrapper_name, led->name);
+	strcat(wrapper_name, WRAPPER_LED_SUFIX);
+
+	dither_data = kzalloc(sizeof(*dither_data), GFP_KERNEL);
+	if (!dither_data)
+		goto err_dither_data;
+	dither_data->actual_led = led;
+	dither_data->wrapper_led.name = wrapper_name;
+	dither_data->wrapper_led.brightness_set = dither_set;
+	dither_data->wrapper_led.max_brightness = LED_FULL;
+	dither_data->wrapper_led.flags = LED_CORE_SUSPENDRESUME;
+
+	if (led_classdev_register(led->dev, &dither_data->wrapper_led))
+		goto err_register_wrapper;
+
+	setup_timer(&dither_data->timer, dither_timer, (unsigned long)dither_data);
+
+	led->trigger_data = dither_data;
+	led->activated = true;
+
+	dither_data->updated_at = ktime_get();
+	dither_data->error = 0;
+	dither_set(&dither_data->wrapper_led, 0);
+	return;
+
+err_register_wrapper:
+	kfree(dither_data);
+err_dither_data:
+	kfree(wrapper_name);
+err_wrapper_name:
+	return;
+}
+
+static void ledtrig_dither_deactivate(struct led_classdev *led)
+{
+	struct ledtrig_dither_data *dither_data = led->trigger_data;
+
+	if (led->activated) {
+		led_classdev_unregister(&dither_data->wrapper_led);
+		del_timer_sync(&dither_data->timer);
+		kfree(dither_data->wrapper_led.name);
+		kfree(dither_data);
+		led->activated = false;
+	}
+}
+
+static struct led_trigger ledtrig_dither = {
+	.name = "dither",
+	.activate = ledtrig_dither_activate,
+	.deactivate = ledtrig_dither_deactivate
+};
+
+static int __init ledtrig_dither_init(void)
+{
+	led_trigger_register(&ledtrig_dither);
+	return 0;
+}
+module_init(ledtrig_dither_init);
+
+static void __exit ledtrig_dither_exit(void)
+{
+	led_trigger_unregister(&ledtrig_dither);
+}
+module_exit(ledtrig_dither_exit);
+
+MODULE_DESCRIPTION("LED Trigger for fake brightness adjustment via dithering");
+MODULE_AUTHOR("Paulo Costa");
+MODULE_LICENSE("GPL");
-- 
2.11.0
