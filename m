From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] led/ledtrig-heartbeat: Convert timers to use
Date: Wed, 4 Oct 2017 17:49:34 -0700
Message-ID: <20171005004934.GA23081@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:48207 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752137AbdJEAtg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Oct 2017 20:49:36 -0400
Received: by mail-pf0-f176.google.com with SMTP id n24so7121581pfk.5
        for <linux-leds@vger.kernel.org>; Wed, 04 Oct 2017 17:49:36 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Zhang Bo <bo.zhang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Ingo Molnar <mingo@kernel.org>, linux-leds@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

Instead of using .data directly, convert to from_timer. Since the
trigger_data is allocated separately, the led_cdev must be explicitly
tracked for the callback.

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Zhang Bo <bo.zhang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
This requires commit 686fef928bba ("timer: Prepare to change timer
callback argument type") in v4.14-rc3, but should be otherwise
stand-alone.
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index e95ea65380c8..f0896de410b8 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -25,19 +25,23 @@
 static int panic_heartbeats;
 
 struct heartbeat_trig_data {
+	struct led_classdev *led_cdev;
 	unsigned int phase;
 	unsigned int period;
 	struct timer_list timer;
 	unsigned int invert;
 };
 
-static void led_heartbeat_function(unsigned long data)
+static void led_heartbeat_function(struct timer_list *t)
 {
-	struct led_classdev *led_cdev = (struct led_classdev *) data;
-	struct heartbeat_trig_data *heartbeat_data = led_cdev->trigger_data;
+	struct heartbeat_trig_data *heartbeat_data =
+		from_timer(heartbeat_data, t, timer);
+	struct led_classdev *led_cdev;
 	unsigned long brightness = LED_OFF;
 	unsigned long delay = 0;
 
+	led_cdev = heartbeat_data->led_cdev;
+
 	if (unlikely(panic_heartbeats)) {
 		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
@@ -127,18 +131,18 @@ static void heartbeat_trig_activate(struct led_classdev *led_cdev)
 		return;
 
 	led_cdev->trigger_data = heartbeat_data;
+	heartbeat_data->led_cdev = led_cdev;
 	rc = device_create_file(led_cdev->dev, &dev_attr_invert);
 	if (rc) {
 		kfree(led_cdev->trigger_data);
 		return;
 	}
 
-	setup_timer(&heartbeat_data->timer,
-		    led_heartbeat_function, (unsigned long) led_cdev);
+	timer_setup(&heartbeat_data->timer, led_heartbeat_function, 0);
 	heartbeat_data->phase = 0;
 	if (!led_cdev->blink_brightness)
 		led_cdev->blink_brightness = led_cdev->max_brightness;
-	led_heartbeat_function(heartbeat_data->timer.data);
+	led_heartbeat_function(&heartbeat_data->timer);
 	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
 	led_cdev->activated = true;
 }
-- 
2.7.4


-- 
Kees Cook
Pixel Security
