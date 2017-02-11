From: Willy Tarreau <w@1wt.eu>
Subject: [PATCH] leds/trigger/activity: add a system activity LED trigger
Date: Sun, 12 Feb 2017 00:41:54 +0100
Message-ID: <1486856514-9634-1-git-send-email-w@1wt.eu>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:36120 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750778AbdBKXmd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 11 Feb 2017 18:42:33 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Willy Tarreau <w@1wt.eu>

The "activity" trigger was inspired by the heartbeat one, but aims at
providing instant indication of the immediate CPU usage. Under idle
condition, it flashes 10ms every second. At 100% usage, it flashes
90ms every 100ms. The blinking frequency increases from 1 to 10 Hz
until either the load is high enough to saturate one CPU core or 50%
load is reached on a single-core system. Then past this point only the
duty cycle increases from 10 to 90%.

This results in a very visible activity reporting allowing one to
immediately tell whether a machine is under load or not, making it
quite suitable to be used in clusters.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 drivers/leds/trigger/Kconfig            |   9 +
 drivers/leds/trigger/Makefile           |   1 +
 drivers/leds/trigger/ledtrig-activity.c | 290 ++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-activity.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 3f9ddb9..8432d9e 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -77,6 +77,15 @@ config LEDS_TRIGGER_CPU
 
 	  If unsure, say N.
 
+config LEDS_TRIGGER_ACTIVITY
+	tristate "LED activity Trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  This allows LEDs to be controlled by a immediate CPU usage.
+	  The flash frequency and duty cycle varies from faint flashes to
+	  intense brightness depending on the instant CPU load.
+	  If unsure, say Y.
+
 config LEDS_TRIGGER_GPIO
 	tristate "LED GPIO Trigger"
 	depends on LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index a72c43c..e572ce57 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
 obj-$(CONFIG_LEDS_TRIGGER_BACKLIGHT)	+= ledtrig-backlight.o
 obj-$(CONFIG_LEDS_TRIGGER_GPIO)		+= ledtrig-gpio.o
 obj-$(CONFIG_LEDS_TRIGGER_CPU)		+= ledtrig-cpu.o
+obj-$(CONFIG_LEDS_TRIGGER_ACTIVITY)	+= ledtrig-activity.o
 obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
new file mode 100644
index 0000000..9acdc56
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -0,0 +1,290 @@
+/*
+ * Activity LED trigger
+ *
+ * Copyright (C) 2017 Willy Tarreau <w@1wt.eu>
+ * Partially based on Atsushi Nemoto's ledtrig-heartbeat.c.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/kernel_stat.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/sched.h>
+#include <linux/leds.h>
+#include <linux/reboot.h>
+#include <linux/suspend.h>
+#include "../leds.h"
+
+static int panic_detected;
+
+struct activity_data {
+	struct timer_list timer;
+	u64 last_idle;
+	u64 last_boot;
+	int time_left;
+	int state;
+	int invert;
+};
+
+static void led_activity_function(unsigned long data)
+{
+	struct led_classdev *led_cdev = (struct led_classdev *)data;
+	struct activity_data *activity_data = led_cdev->trigger_data;
+	struct timespec boot_time;
+	unsigned int target;
+	unsigned int usage;
+	int delay;
+	u64 curr_idle;
+	u64 curr_boot;
+	u32 diff_idle;
+	u32 diff_boot;
+	int cpus;
+	int i;
+
+	if (unlikely(panic_detected)) {
+		/* full brightness in case of panic */
+		led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
+		return;
+	}
+
+	get_monotonic_boottime(&boot_time);
+
+	cpus = 0;
+	curr_idle = 0;
+	for_each_possible_cpu(i) {
+		curr_idle += (__force u64)kcpustat_cpu(i).cpustat[CPUTIME_IDLE];
+		curr_idle += (__force u64)kcpustat_cpu(i).cpustat[CPUTIME_IOWAIT];
+		cpus++;
+	}
+
+	curr_boot = div_s64(timespec_to_ns(&boot_time), NSEC_PER_SEC / HZ) * cpus;
+	curr_idle = cputime64_to_jiffies64(curr_idle);
+	diff_boot = curr_boot - activity_data->last_boot;
+	diff_idle = curr_idle - activity_data->last_idle;
+
+	activity_data->last_boot = curr_boot;
+	activity_data->last_idle = curr_idle;
+
+	if (diff_boot <= 0)
+		usage = 0;
+	else if (diff_idle <= diff_boot)
+		usage = 100 - 100 * diff_idle / diff_boot;
+	else
+		usage = 100;
+
+	/*
+	 * Now we know the total boot_time multiplied by the number of CPUs, and
+	 * the total idle+wait time for all CPUs. We'll compare how they evolved
+	 * since last call. The % of overall CPU usage is :
+	 *
+	 *      1 - delta_idle / delta_boot
+	 *
+	 * What we want is that when the CPU usage is zero, the LED must blink
+	 * slowly with very faint flashes that are detectable but not disturbing
+	 * (typically 10ms every second, or 10ms ON, 990ms OFF). Then we want
+	 * blinking frequency to increase up to the point where the load is
+	 * enough to saturate one core in multi-core systems or 50% in single
+	 * core systems. At this point it should reach 10 Hz with a 10/90 duty
+	 * cycle (10ms ON, 90ms OFF). After this point, the blinking frequency
+	 * remains stable (10 Hz) and only the duty cycle increases to report
+	 * the activity, up to the point where we have 90ms ON, 10ms OFF when
+	 * all cores are saturated. It's important that the LED never stays in
+	 * a steady state so that it's easy to distinguish an idle or saturated
+	 * machine from a hung one.
+	 *
+	 * This gives us :
+	 *   - a target CPU usage of min(50%, 100%/#CPU) for a 10% duty cycle
+	 *     (10ms ON, 90ms OFF)
+	 *   - below target :
+	 *      ON_ms  = 10
+	 *      OFF_ms = 90 + (1 - usage/target) * 900
+	 *   - above target :
+	 *      ON_ms  = 10 + (usage-target)/(100%-target) * 80
+	 *      OFF_ms = 90 - (usage-target)/(100%-target) * 80
+	 *
+	 * In order to keep a good responsiveness, we cap the sleep time to
+	 * 100 ms and keep track of the sleep time left. This allows us to
+	 * quickly change it if needed.
+	 */
+
+	activity_data->time_left -= 100;
+	if (activity_data->time_left <= 0) {
+		activity_data->time_left = 0;
+		activity_data->state = !activity_data->state;
+		led_set_brightness_nosleep(led_cdev,
+			(activity_data->state ^ activity_data->invert) ?
+			led_cdev->max_brightness : LED_OFF);
+	}
+
+	target = (cpus > 1) ? (100 / cpus) : 50;
+
+	if (usage < target)
+		delay = activity_data->state ?
+			10 :                        /* ON  */
+			990 - 900 * usage / target; /* OFF */
+	else
+		delay = activity_data->state ?
+			10 + 80 * (usage - target) / (100 - target) : /* ON  */
+			90 - 80 * (usage - target) / (100 - target);  /* OFF */
+
+
+	if (!activity_data->time_left || delay <= activity_data->time_left)
+		activity_data->time_left = delay;
+
+	delay = min_t(int, activity_data->time_left, 100);
+	mod_timer(&activity_data->timer, jiffies + msecs_to_jiffies(delay));
+}
+
+static ssize_t led_invert_show(struct device *dev,
+                               struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct activity_data *activity_data = led_cdev->trigger_data;
+
+	return sprintf(buf, "%u\n", activity_data->invert);
+}
+
+static ssize_t led_invert_store(struct device *dev,
+                                struct device_attribute *attr,
+                                const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct activity_data *activity_data = led_cdev->trigger_data;
+	unsigned long state;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	activity_data->invert = !!state;
+
+	return size;
+}
+
+static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
+
+static void activity_activate(struct led_classdev *led_cdev)
+{
+	struct activity_data *activity_data;
+	int rc;
+
+	activity_data = kzalloc(sizeof(*activity_data), GFP_KERNEL);
+	if (!activity_data)
+		return;
+
+	led_cdev->trigger_data = activity_data;
+	rc = device_create_file(led_cdev->dev, &dev_attr_invert);
+	if (rc) {
+		kfree(led_cdev->trigger_data);
+		return;
+	}
+
+	setup_timer(&activity_data->timer,
+		    led_activity_function, (unsigned long)led_cdev);
+	led_activity_function(activity_data->timer.data);
+	led_cdev->activated = true;
+}
+
+static void activity_deactivate(struct led_classdev *led_cdev)
+{
+	struct activity_data *activity_data = led_cdev->trigger_data;
+
+	if (led_cdev->activated) {
+		del_timer_sync(&activity_data->timer);
+		device_remove_file(led_cdev->dev, &dev_attr_invert);
+		kfree(activity_data);
+		led_cdev->activated = false;
+	}
+}
+
+static struct led_trigger activity_led_trigger = {
+	.name       = "activity",
+	.activate   = activity_activate,
+	.deactivate = activity_deactivate,
+};
+
+static int activity_pm_notifier(struct notifier_block *nb,
+                                unsigned long pm_event, void *unused)
+{
+	int rc;
+
+	switch (pm_event) {
+	case PM_SUSPEND_PREPARE:
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+		led_trigger_unregister(&activity_led_trigger);
+		break;
+	case PM_POST_SUSPEND:
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		rc = led_trigger_register(&activity_led_trigger);
+		if (rc)
+			pr_err("could not re-register activity trigger\n");
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_DONE;
+}
+
+static int activity_reboot_notifier(struct notifier_block *nb,
+                                    unsigned long code, void *unused)
+{
+	led_trigger_unregister(&activity_led_trigger);
+	return NOTIFY_DONE;
+}
+
+static int activity_panic_notifier(struct notifier_block *nb,
+                                   unsigned long code, void *unused)
+{
+	panic_detected = 1;
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block activity_pm_nb = {
+	.notifier_call = activity_pm_notifier,
+};
+
+static struct notifier_block activity_reboot_nb = {
+	.notifier_call = activity_reboot_notifier,
+};
+
+static struct notifier_block activity_panic_nb = {
+	.notifier_call = activity_panic_notifier,
+};
+
+static int __init activity_init(void)
+{
+	int rc = led_trigger_register(&activity_led_trigger);
+
+	if (!rc) {
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &activity_panic_nb);
+		register_reboot_notifier(&activity_reboot_nb);
+		register_pm_notifier(&activity_pm_nb);
+	}
+	return rc;
+}
+
+static void __exit activity_exit(void)
+{
+	unregister_pm_notifier(&activity_pm_nb);
+	unregister_reboot_notifier(&activity_reboot_nb);
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &activity_panic_nb);
+	led_trigger_unregister(&activity_led_trigger);
+}
+
+module_init(activity_init);
+module_exit(activity_exit);
+
+MODULE_AUTHOR("Willy Tarreau <w@1wt.eu>");
+MODULE_DESCRIPTION("Activity LED trigger");
+MODULE_LICENSE("GPL");
-- 
2.8.0.rc2.1.gbe9624a
