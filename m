From: =?ISO-8859-1?Q?Rapha=EBl?= Teysseyre <rteysseyre@gmail.com>
Subject: [PATCH] leds: Add arbitrary pattern trigger
Date: Mon, 16 Mar 2015 11:06:50 +0100
Message-ID: <1426500410.11707.6.camel@localhost>
References: <1424334377.11286.3.camel@localhost>
	 <CAK5ve-KTmkh4XBLAEhvUFme+qmTb9hFKxQnvisxySw1skTLr1w@mail.gmail.com>
	 <20150310080042.GA27585@amd> <BLU172-W3716E59BC9E98F60F424C4AC180@phx.gbl>
	 <20150310192226.GB11260@amd> <1426086614.59115.14.camel@localhost>
	 <20150311190255.GA20247@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:33851 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbCPKIy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Mar 2015 06:08:54 -0400
In-Reply-To: <20150311190255.GA20247@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bryan Wu <cooloney@gmail.com>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi all,

=46ollowing our discussion about [PATCH RFC] leds: Add status code trig=
ger,
here is a patch allowing arbitrary patterns. This is intended for
embedded systems without screen or network access to show a status (or
error) code to a human.

It's been tested on an ARM architecture (Xilinx Zynq 7010 SoC,
which CPU is a dual ARM Cortex-A9), with a non-mainline
kernel (xilinx-v2014.4, based of a 3.17.0 kernel).
Unfortunately, I don't have other hardware to test it on.
It compiles fine in a 3.19.0-rc1 source tree.
Additional testing and comments would be appreciated.




Add a new led trigger supporting arbitrary patterns.
This is useful for embedded systems with no screen or network access.

Export two sysfs attributes: "pattern", and "repeat".

When "repeat"=3D-1, repeat the pattern indefinitely. Otherwise,
repeat it the specified number of times. "pattern" specifies
the pattern as comma separated couples of "brightness duration"
values. See detailed documentation in patch.

Signed-off-by: Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
---
 Documentation/leds/ledtrig-pattern.txt |   80 +++++++
 drivers/leds/trigger/Kconfig           |   10 +
 drivers/leds/trigger/Makefile          |    1 +
 drivers/leds/trigger/ledtrig-pattern.c |  388 ++++++++++++++++++++++++=
++++++++
 4 files changed, 479 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/leds/ledtrig-pattern.txt
 create mode 100644 drivers/leds/trigger/ledtrig-pattern.c

diff --git a/Documentation/leds/ledtrig-pattern.txt b/Documentation/led=
s/ledtrig-pattern.txt
new file mode 100644
index 0000000..68d11d2
--- /dev/null
+++ b/Documentation/leds/ledtrig-pattern.txt
@@ -0,0 +1,80 @@
+LED Pattern Trigger
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This is a LED trigger allowing arbitrary pattern execution. It can do =
gradual
+dimming. This trigger can be configured to repeat the pattern a number=
 of
+times or indefinitely. This is intended as a way of communication for =
embedded
+systems with no screen.
+
+The trigger can be activated from user space on led class devices as s=
hown
+below:
+
+  echo pattern > trigger
+
+This adds the following sysfs attributes to the LED:
+
+  pattern - specifies the pattern. See syntax below.
+
+  repeat - number of times the pattern must be repeated.
+	writing -1 to this file will make the pattern
+	repeat indefinitely.
+
+The pattern will be restarted each time a new value is written to
+the pattern or repeat attribute. When dimming, the LED brightness
+is set every 50 ms.
+
+pattern syntax:
+The pattern is specified in the pattern attribute with an array of com=
ma-
+separated "brightness/length in miliseconds" values. The two component=
s
+of each value are to be separated by a space.
+
+For example, assuming the driven LED supports
+intensity value from 0 to 255:
+
+  echo 0 1000, 255 2000 > pattern
+
+Will make the LED go gradually from zero-intensity to max (255) intens=
ity
+in 1000 milliseconds, then back to zero intensity in 2000 milliseconds=
:
+
+LED brightness
+    ^
+255-|       / \            / \            /
+    |      /    \         /    \         /
+    |     /       \      /       \      /
+    |    /          \   /          \   /
+  0-|   /             \/             \/
+    +---0----1----2----3----4----5----6------------> time (s)
+
+
+
+To make the LED go instantly from one brigntess value to another,
+use zero-time lengths. For example:
+
+  echo 0 1000, 0 0, 255 2000, 255 0 > pattern
+
+Will make the LED stay off for one second, then stay at max brightness
+for two seconds:
+
+LED brightness
+    ^
+255-|        +---------+    +---------+
+    |        |         |    |         |
+    |        |         |    |         |
+    |        |         |    |         |
+  0-|   -----+         +----+         +----
+    +---0----1----2----3----4----5----6------------> time (s)
+
+
+
+Patterns with less than two values, no value with time length > 50
+milliseconds, or no two values with differing brightnesses will
+result in the LED being set at the brightness of the first value,
+or zero if the pattern contains no value.
+
+Patterns with invalid syntax are silently swallowed and will result
+in undefined behavior of the LED brightness.
+
+Because sysfs is used to define the pattern, patterns that need more t=
han
+PAGE_SIZE characters to describe aren't supported. PAGE_SIZE is system
+dependent.
+
diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfi=
g
index 49794b4..ce27bdb 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -108,4 +108,14 @@ config LEDS_TRIGGER_CAMERA
 	  This enables direct flash/torch on/off by the driver, kernel space.
 	  If unsure, say Y.
=20
+config LEDS_TRIGGER_PATTERN
+	tristate "LED Pattern Trigger"
+	depends on LEDS_TRIGGERS
+	help
+	  This allows LEDs blinking with an arbitrary pattern. Can be useful
+	  on embedded systems with no screen to give out a status code to
+	  a human.
+
+	  If unsure, say N
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makef=
ile
index 1abf48d..a739429 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_LEDS_TRIGGER_CPU)		+=3D ledtrig-cpu.o
 obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+=3D ledtrig-default-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+=3D ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+=3D ledtrig-camera.o
+obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+=3D ledtrig-pattern.o
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trig=
ger/ledtrig-pattern.c
new file mode 100644
index 0000000..da290b3
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -0,0 +1,388 @@
+/*
+ * Arbitrary pattern trigger
+ *
+ * Copyright 2015, Epsiline
+ *
+ * Author : Rapha=C3=ABl Teysseyre <rteysseyre@gmail.com>
+ *
+ * Idea discussed with Pavel Machek <pavel@ucw.cz> on
+ * <linux-leds@vger.kernel.org> (march 2015, thread title
+ * [PATCH RFC] leds: Add status code trigger)
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include "../leds.h"
+
+struct pattern_step {
+	int brightness;
+	int time_ms;
+};
+
+struct pattern_trig_data {
+	struct pattern_step *steps; /* Array describing the pattern */
+	struct mutex lock;
+	char is_sane;
+	struct pattern_step *curr;
+	struct pattern_step *next;
+	int time_ms; /* Time in current step */
+	int nsteps;  /* Number of steps */
+	int repeat;  /* < 0 means repeat indefinitely */
+	struct timer_list timer; /* Used for scheduling updates to
+				    the led brightness */
+};
+
+#define MAX_NSTEPS (PAGE_SIZE/4)
+/* The "pattern" attribute contains at most PAGE_SIZE characters.
+   Each line in this attribute is at least 4 characters long
+   (a 1-digit number for the led brighntess, a space,
+   a 1-digit number for the time, a semi-colon).
+   Therefore, there is at most PAGE_SIZE/4 steps. */
+
+#define UPDATE_INTERVAL 50
+/* When doing gradual dimming, the led brightness
+   will be updated every UPDATE_INTERVAL milliseconds */
+
+#define PATTERN_SEPARATOR ","
+
+static int pattern_trig_initialize_data(struct pattern_trig_data *data=
)
+{
+	mutex_init(&data->lock);
+	mutex_lock(&data->lock);
+
+	data->is_sane =3D 0;
+	data->steps =3D kzalloc(MAX_NSTEPS*sizeof(struct pattern_step),
+			GFP_KERNEL);
+	if (!data->steps)
+		return -ENOMEM;
+
+	data->curr =3D NULL;
+	data->next =3D NULL;
+	data->time_ms =3D 0;
+	data->nsteps =3D 0;
+	data->repeat =3D -1;
+	init_timer(&data->timer);
+
+	mutex_unlock(&data->lock);
+	return 0;
+}
+
+static void pattern_trig_clear_data(struct pattern_trig_data *data)
+{
+	data->is_sane =3D 0;
+	kfree(data->steps);
+}
+
+/*
+ *  is_sane : pattern checking.
+ *  A pattern satisfaying these three conditions is reported as sane :
+ *    - At least two steps
+ *    - At least one step with time >=3D UPDATE_INTERVAL
+ *    - At least two steps with differing brightnesses
+ *  When @data isn't sane, a sensible brightness
+ *  default is suggested in @brightness
+ *
+ * DO NOT call pattern_trig_update on a not-sane pattern,
+ * you'll be punished with an infinite loop in the kernel.
+ */
+static int is_sane(struct pattern_trig_data *data, int *brightness)
+{
+	int i;
+	char stept_ok =3D 0;
+	char stepb_ok =3D 0;
+
+	*brightness =3D 0;
+	if (data->nsteps < 1)
+		return 0;
+
+	*brightness =3D data->steps[0].brightness;
+	if (data->nsteps < 2)
+		return 0;
+
+	for (i =3D 0; i < data->nsteps; i++) {
+		if (data->steps[i].time_ms >=3D UPDATE_INTERVAL) {
+			if (stepb_ok)
+				return 1;
+			stept_ok =3D 1;
+		}
+		if (data->steps[i].brightness !=3D data->steps[0].brightness) {
+			if (stept_ok)
+				return 1;
+			stepb_ok =3D 1;
+		}
+	}
+
+	return 0;
+}
+
+static void reset_pattern(struct pattern_trig_data *data,
+			struct led_classdev *led_cdev)
+{
+	int brightness;
+
+	del_timer_sync(&data->timer);
+
+	if (is_sane(data, &brightness)) {
+		data->curr =3D data->steps;
+		data->next =3D data->steps + 1;
+		data->time_ms =3D 0;
+		data->is_sane =3D 1;
+
+		data->timer.expires =3D jiffies;
+		add_timer(&data->timer);
+	} else
+		led_set_brightness(led_cdev, brightness);
+}
+
+/* --- Sysfs handling --- */
+
+static ssize_t pattern_trig_show_repeat(
+	struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", data->repeat);
+}
+
+static ssize_t pattern_trig_store_repeat(
+	struct device *dev, struct device_attribute *attr,
+	const char *buf, size_t count)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+	long res;
+	int err;
+
+	err =3D kstrtol(buf, 10, &res);
+	if (err)
+		return err;
+
+	data->repeat =3D res < 0 ? -1 : res;
+	reset_pattern(data, led_cdev);
+
+	return count;
+}
+
+DEVICE_ATTR(repeat, S_IRUGO | S_IWUSR,
+	pattern_trig_show_repeat, pattern_trig_store_repeat);
+
+static ssize_t pattern_trig_show_pattern(
+	struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+	ssize_t count =3D 0;
+	int i;
+
+	if (!data->steps || !data->nsteps)
+		return 0;
+
+	for (i =3D 0; i < data->nsteps; i++)
+		count +=3D scnprintf(buf + count, PAGE_SIZE - count,
+				"%d %d" PATTERN_SEPARATOR,
+				data->steps[i].brightness,
+				data->steps[i].time_ms);
+	buf[count - 1] =3D '\n';
+	buf[count] =3D '\0';
+
+	return count + 1;
+}
+
+static ssize_t pattern_trig_store_pattern(
+	struct device *dev, struct device_attribute *attr,
+	const char *buf, size_t count)
+{
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+	int cr =3D 0; /* Characters read on one conversion */
+	int tcr =3D 0; /* Total characters read */
+	int ccount; /* Number of successful conversions */
+
+	mutex_lock(&data->lock);
+	data->is_sane =3D 0;
+
+	for (data->nsteps =3D 0; data->nsteps < MAX_NSTEPS; data->nsteps++) {
+		cr =3D 0;
+		ccount =3D sscanf(buf + tcr, "%d %d " PATTERN_SEPARATOR "%n",
+			&data->steps[data->nsteps].brightness,
+			&data->steps[data->nsteps].time_ms, &cr);
+
+		if (!cr) { /* Invalid syntax or end of pattern */
+			if (ccount =3D=3D 2)
+				data->nsteps++;
+			mutex_unlock(&data->lock);
+			reset_pattern(data, led_cdev);
+			return count;
+		}
+
+		tcr +=3D cr;
+	}
+
+	/* Shouldn't reach that */
+	WARN(1, "MAX_NSTEP too small. Please report\n");
+	mutex_unlock(&data->lock);
+	return count;
+}
+
+DEVICE_ATTR(pattern, S_IRUGO | S_IWUSR,
+	pattern_trig_show_pattern, pattern_trig_store_pattern);
+
+static int pattern_trig_create_sysfs_files(struct device *dev)
+{
+	int err;
+
+	err =3D device_create_file(dev, &dev_attr_repeat);
+	if (err)
+		return err;
+
+	err =3D device_create_file(dev, &dev_attr_pattern);
+	if (err)
+		device_remove_file(dev, &dev_attr_repeat);
+
+	return err;
+}
+
+static void pattern_trig_remove_sysfs_files(struct device *dev)
+{
+	device_remove_file(dev, &dev_attr_pattern);
+	device_remove_file(dev, &dev_attr_repeat);
+}
+
+/* --- Led intensity updating --- */
+
+static int compute_brightness(struct pattern_trig_data *data)
+{
+	if (data->time_ms =3D=3D 0)
+		return data->curr->brightness;
+
+	if (data->curr->time_ms =3D=3D 0)
+		return data->next->brightness;
+
+	return data->curr->brightness + data->time_ms
+		* (data->next->brightness - data->curr->brightness)
+		/ data->curr->time_ms;
+}
+
+static void update_to_next_step(struct pattern_trig_data *data)
+{
+	data->curr =3D data->next;
+	if (data->curr =3D=3D data->steps)
+		data->repeat--;
+
+	if (data->next =3D=3D data->steps + data->nsteps - 1)
+		data->next =3D data->steps;
+	else
+		data->next++;
+
+	data->time_ms =3D 0;
+}
+
+static void pattern_trig_update(unsigned long led_cdev_ptr)
+{
+	struct led_classdev *led_cdev =3D (struct led_classdev *) led_cdev_pt=
r;
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+
+	mutex_lock(&data->lock);
+
+	if (!data->is_sane || !data->repeat) {
+		mutex_unlock(&data->lock);
+		return;
+	}
+
+	if (data->time_ms > data->curr->time_ms)
+		update_to_next_step(data);
+
+	/* is_sane() checked that there is at least
+	   one step with time_ms >=3D UPDATE_INTERVAL
+	   so we won't go in an infinite loop */
+	while (data->curr->time_ms < UPDATE_INTERVAL)
+		update_to_next_step(data);
+
+	if (data->next->brightness =3D=3D data->curr->brightness) {
+		/* Constant brightness for this step */
+		led_set_brightness(led_cdev, data->curr->brightness);
+		mod_timer(&data->timer, jiffies
+			+ msecs_to_jiffies(data->curr->time_ms));
+		update_to_next_step(data);
+	} else {
+		/* Gradual dimming */
+		led_set_brightness(led_cdev, compute_brightness(data));
+		data->time_ms +=3D UPDATE_INTERVAL;
+		mod_timer(&data->timer, jiffies
+			+ msecs_to_jiffies(UPDATE_INTERVAL));
+	}
+
+	mutex_unlock(&data->lock);
+}
+
+/* --- Trigger activation --- */
+
+static void pattern_trig_activate(struct led_classdev *led_cdev)
+{
+	struct pattern_trig_data *data =3D NULL;
+	int err;
+
+	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return;
+
+	err =3D pattern_trig_initialize_data(data);
+	if (err) {
+		kfree(data);
+		return;
+	}
+
+	led_cdev->trigger_data =3D data;
+	setup_timer(&data->timer, pattern_trig_update,
+		(unsigned long) led_cdev);
+	pattern_trig_create_sysfs_files(led_cdev->dev);
+}
+
+static void pattern_trig_deactivate(struct led_classdev *led_cdev)
+{
+	struct pattern_trig_data *data =3D led_cdev->trigger_data;
+
+	if (data) {
+		pattern_trig_remove_sysfs_files(led_cdev->dev);
+		del_timer_sync(&data->timer);
+		led_set_brightness(led_cdev, LED_OFF);
+		pattern_trig_clear_data(data);
+		kfree(data);
+		led_cdev->trigger_data =3D NULL;
+	}
+}
+
+static struct led_trigger pattern_led_trigger =3D {
+	.name =3D "pattern",
+	.activate =3D pattern_trig_activate,
+	.deactivate =3D pattern_trig_deactivate,
+};
+
+/* --- Module loading/unloading --- */
+
+static int __init pattern_trig_init(void)
+{
+	return led_trigger_register(&pattern_led_trigger);
+}
+
+static void __exit pattern_trig_exit(void)
+{
+	led_trigger_unregister(&pattern_led_trigger);
+}
+
+module_init(pattern_trig_init);
+module_exit(pattern_trig_exit);
+
+MODULE_AUTHOR("Raphael Teysseyre <rteysseyre@gmail.com");
+MODULE_DESCRIPTION("Statuscode LED trigger");
+MODULE_LICENSE("GPL");
--=20
1.7.1
