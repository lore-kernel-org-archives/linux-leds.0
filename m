From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH] leds: fix brightness changing when software blinking is active
Date: Wed, 13 May 2015 17:20:20 +0300
Message-ID: <55535DA4.2010509@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp28.mail.ru ([94.100.181.183]:54128 "EHLO smtp28.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934127AbbEMOU0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 13 May 2015 10:20:26 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>


The following sequence:
echo timer >/sys/class/leds/<name>/trigger
echo 1 >/sys/class/leds/<name>/brightness
should change the ON brightness for blinking.
The function led_set_brightness() was mistakenly initiating the
delayed blink stop procedure, which resulted in no blinking with
the timer trigger still active.

This patch fixes the problem by changing led_set_brightness()
to not initiate the delayed blink stop. The callers that need
a blink stop, were updated to explicitly call led_stop_software_blink().

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: Jacek Anaszewski <j.anaszewski@samsung.com>
CC: Kyungmin Park <kyungmin.park@samsung.com>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c               |    5 +++++
 drivers/leds/led-core.c                |    3 +--
 drivers/leds/trigger/ledtrig-oneshot.c |    1 +
 drivers/leds/trigger/ledtrig-timer.c   |    2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 795ec99..65c2c80 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -121,6 +121,11 @@ static void led_timer_function(unsigned long data)
 	brightness = led_get_brightness(led_cdev);
 	if (!brightness) {
 		/* Time to switch the LED on. */
+		if (led_cdev->delayed_set_value) {
+			led_cdev->blink_brightness =
+					led_cdev->delayed_set_value;
+			led_cdev->delayed_set_value = 0;
+		}
 		brightness = led_cdev->blink_brightness;
 		delay = led_cdev->blink_delay_on;
 	} else {
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 9886dac..3210020 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -119,10 +119,9 @@ void led_set_brightness(struct led_classdev *led_cdev,
 {
 	int ret = 0;

-	/* delay brightness setting if need to stop soft-blink timer */
+	/* delay brightness setting to next soft-blink */
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
 		led_cdev->delayed_set_value = brightness;
-		schedule_work(&led_cdev->set_brightness_work);
 		return;
 	}

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index fbd02cd..c1bff10 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -177,6 +177,7 @@ static void oneshot_trig_deactivate(struct led_classdev *led_cdev)
 	}

 	/* Stop blinking */
+	led_stop_software_blink(led_cdev);
 	led_set_brightness(led_cdev, LED_OFF);
 }

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 8d09327..3577c23 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include "../leds.h"

 static ssize_t led_delay_on_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -103,6 +104,7 @@ static void timer_trig_deactivate(struct led_classdev *led_cdev)
 	}

 	/* Stop blinking */
+	led_stop_software_blink(led_cdev);
 	led_set_brightness(led_cdev, LED_OFF);
 }

-- 
1.7.9.5
