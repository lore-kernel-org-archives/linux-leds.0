From: David Lin <dtwlin@google.com>
Subject: [PATCH 3/3] led: ledtrig-transient: add support for hrtimer
Date: Sun, 30 Apr 2017 14:37:01 -0700
Message-ID: <20170430213701.12297-4-dtwlin@google.com>
References: <20170430213701.12297-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34997 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1950734AbdD3VhY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2017 17:37:24 -0400
Received: by mail-pf0-f180.google.com with SMTP id v14so68331583pfd.2
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2017 14:37:24 -0700 (PDT)
In-Reply-To: <20170430213701.12297-1-dtwlin@google.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: corbet@lwn.net, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>

This patch adds a hrtimer to ledtrig-transient so that when driver is
registered with LED_BRIGHTNESS_FAST, the hrtimer is used for the better
time accuracy in handling the duration.

Signed-off-by: David Lin <dtwlin@google.com>
---
 drivers/leds/trigger/ledtrig-transient.c | 59 +++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 7e6011bd3646..63be54772596 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -24,15 +24,18 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/leds.h>
 #include "../leds.h"
 
 struct transient_trig_data {
+	struct led_classdev *led_cdev;
 	int activate;
 	int state;
 	int restore_state;
 	unsigned long duration;
 	struct timer_list timer;
+	struct hrtimer hrtimer;
 };
 
 static void transient_timer_function(unsigned long data)
@@ -44,6 +47,54 @@ static void transient_timer_function(unsigned long data)
 	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
 }
 
+static enum hrtimer_restart transient_hrtimer_function(struct hrtimer *timer)
+{
+	struct transient_trig_data *transient_data =
+		container_of(timer, struct transient_trig_data, hrtimer);
+
+	transient_timer_function((unsigned long)transient_data->led_cdev);
+
+	return HRTIMER_NORESTART;
+}
+
+static inline void transient_timer_setup(struct led_classdev *led_cdev)
+{
+	struct transient_trig_data *tdata = led_cdev->trigger_data;
+
+	if (led_cdev->flags & LED_BRIGHTNESS_FAST) {
+		tdata->led_cdev = led_cdev;
+		hrtimer_init(&tdata->hrtimer, CLOCK_MONOTONIC,
+			     HRTIMER_MODE_REL);
+		tdata->hrtimer.function = transient_hrtimer_function;
+	} else {
+		setup_timer(&tdata->timer, transient_timer_function,
+			    (unsigned long)led_cdev);
+	}
+}
+
+static inline void transient_timer_start(struct led_classdev *led_cdev)
+{
+	struct transient_trig_data *tdata = led_cdev->trigger_data;
+
+	if (led_cdev->flags & LED_BRIGHTNESS_FAST) {
+		hrtimer_start(&tdata->hrtimer, ms_to_ktime(tdata->duration),
+			      HRTIMER_MODE_REL);
+	} else {
+		mod_timer(&tdata->timer,
+			  jiffies + msecs_to_jiffies(tdata->duration));
+	}
+}
+
+static inline void transient_timer_cancel(struct led_classdev *led_cdev)
+{
+	struct transient_trig_data *tdata = led_cdev->trigger_data;
+
+	if (led_cdev->flags & LED_BRIGHTNESS_FAST)
+		hrtimer_cancel(&tdata->hrtimer);
+	else
+		del_timer_sync(&tdata->timer);
+}
+
 static ssize_t transient_activate_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -70,7 +121,7 @@ static ssize_t transient_activate_store(struct device *dev,
 
 	/* cancel the running timer */
 	if (state == 0 && transient_data->activate == 1) {
-		del_timer(&transient_data->timer);
+		transient_timer_cancel(led_cdev);
 		transient_data->activate = state;
 		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
@@ -84,8 +135,7 @@ static ssize_t transient_activate_store(struct device *dev,
 		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =
 		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
-		mod_timer(&transient_data->timer,
-			  jiffies + msecs_to_jiffies(transient_data->duration));
+		transient_timer_start(led_cdev);
 	}
 
 	/* state == 0 && transient_data->activate == 0
@@ -182,8 +232,7 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
 	if (rc)
 		goto err_out_state;
 
-	setup_timer(&tdata->timer, transient_timer_function,
-		    (unsigned long) led_cdev);
+	transient_timer_setup(led_cdev);
 	led_cdev->activated = true;
 
 	return;
-- 
2.13.0.rc0.306.g87b477812d-goog
