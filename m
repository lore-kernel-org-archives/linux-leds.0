From: David Lin <dtwlin@google.com>
Subject: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Sun, 23 Apr 2017 21:42:54 -0700
Message-ID: <20170424044254.145192-1-dtwlin@google.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36727 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164671AbdDXEnm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2017 00:43:42 -0400
Received: by mail-io0-f172.google.com with SMTP id p80so58899572iop.3
        for <linux-leds@vger.kernel.org>; Sun, 23 Apr 2017 21:43:41 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: robh@kernel.org, romlem@google.com, joelaf@google.com, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, David Lin <dtwlin@google.com>

This patch replaces the kernel timer used by led transient trigger as an
one-shot timer with an hrtimer. As Android is moving away from the
obsoleted timed_output to ledtrig-transient for the vibrator HAL,
ledtrig-transient needs to be able to handle the "duration" property to
millisecond precision as modern haptic actuators can be driven in
precisely one cycle (~1 ms) in order to provide a crisp and subtle
feedback.

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>
Cc: Rom Lemarchand <romlem@google.com>
Cc: Joel Fernandes <joelaf@google.com>
Cc: stable@vger.kernel.org
Signed-off-by: David Lin <dtwlin@google.com>
---
 drivers/leds/trigger/ledtrig-transient.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 7e6011bd3646..94bb3bfc46e9 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -23,25 +23,28 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/slab.h>
-#include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/leds.h>
 #include "../leds.h"
 
 struct transient_trig_data {
+	struct led_classdev *led_cdev;
 	int activate;
 	int state;
 	int restore_state;
 	unsigned long duration;
-	struct timer_list timer;
+	struct hrtimer timer;
 };
 
-static void transient_timer_function(unsigned long data)
+static enum hrtimer_restart transient_timer_function(struct hrtimer *timer)
 {
-	struct led_classdev *led_cdev = (struct led_classdev *) data;
-	struct transient_trig_data *transient_data = led_cdev->trigger_data;
+	struct transient_trig_data *transient_data =
+		container_of(timer, struct transient_trig_data, timer);
 
 	transient_data->activate = 0;
-	led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
+	led_set_brightness_nosleep(transient_data->led_cdev,
+				   transient_data->restore_state);
+	return HRTIMER_NORESTART;
 }
 
 static ssize_t transient_activate_show(struct device *dev,
@@ -70,7 +73,7 @@ static ssize_t transient_activate_store(struct device *dev,
 
 	/* cancel the running timer */
 	if (state == 0 && transient_data->activate == 1) {
-		del_timer(&transient_data->timer);
+		hrtimer_cancel(&transient_data->timer);
 		transient_data->activate = state;
 		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
@@ -84,8 +87,9 @@ static ssize_t transient_activate_store(struct device *dev,
 		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =
 		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
-		mod_timer(&transient_data->timer,
-			  jiffies + msecs_to_jiffies(transient_data->duration));
+		hrtimer_start(&transient_data->timer,
+			      ms_to_ktime(transient_data->duration),
+			      HRTIMER_MODE_REL);
 	}
 
 	/* state == 0 && transient_data->activate == 0
@@ -168,6 +172,7 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
 			"unable to allocate transient trigger\n");
 		return;
 	}
+	tdata->led_cdev = led_cdev;
 	led_cdev->trigger_data = tdata;
 
 	rc = device_create_file(led_cdev->dev, &dev_attr_activate);
@@ -182,8 +187,8 @@ static void transient_trig_activate(struct led_classdev *led_cdev)
 	if (rc)
 		goto err_out_state;
 
-	setup_timer(&tdata->timer, transient_timer_function,
-		    (unsigned long) led_cdev);
+	hrtimer_init(&tdata->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	tdata->timer.function = transient_timer_function;
 	led_cdev->activated = true;
 
 	return;
@@ -203,7 +208,7 @@ static void transient_trig_deactivate(struct led_classdev *led_cdev)
 	struct transient_trig_data *transient_data = led_cdev->trigger_data;
 
 	if (led_cdev->activated) {
-		del_timer_sync(&transient_data->timer);
+		hrtimer_cancel(&transient_data->timer);
 		led_set_brightness_nosleep(led_cdev,
 					transient_data->restore_state);
 		device_remove_file(led_cdev->dev, &dev_attr_activate);
-- 
2.12.2.816.g2cccc81164-goog
