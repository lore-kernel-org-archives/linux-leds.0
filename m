From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 1/2] leds: use hrtimer for blinking
Date: Wed, 22 Apr 2015 20:04:25 +0300
Message-ID: <5537D499.4090901@list.ru>
References: <5537D423.1040909@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5537D423.1040909@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org


Normal timer has a jiffy resolution, usually 10ms.
But leds trigger timer control allows to set the delays with 1ms granularity.
In order to make this to really work we need to use hrtimer.

CC: Bryan Wu <cooloney@gmail.com>
CC: Richard Purdie <rpurdie@rpsys.net>
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class.c |   19 ++++++++++++-------
 drivers/leds/led-core.c  |    9 +++++----
 include/linux/leds.h     |    4 ++--
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 795ec99..f95ce912 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -102,20 +102,21 @@ static const struct attribute_group *led_groups[] = {
 	NULL,
 };

-static void led_timer_function(unsigned long data)
+static enum hrtimer_restart led_timer_function(struct hrtimer *timer)
 {
-	struct led_classdev *led_cdev = (void *)data;
+	struct led_classdev *led_cdev = container_of(timer,
+			     struct led_classdev, blink_timer);
 	unsigned long brightness;
 	unsigned long delay;

 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
 		led_set_brightness_async(led_cdev, LED_OFF);
-		return;
+		return HRTIMER_NORESTART;
 	}

 	if (led_cdev->flags & LED_BLINK_ONESHOT_STOP) {
 		led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
-		return;
+		return HRTIMER_NORESTART;
 	}

 	brightness = led_get_brightness(led_cdev);
@@ -148,7 +149,10 @@ static void led_timer_function(unsigned long data)
 		}
 	}

-	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
+	hrtimer_forward(&led_cdev->blink_timer,
+			hrtimer_get_expires(&led_cdev->blink_timer),
+			ms_to_ktime(delay));
+	return HRTIMER_RESTART;
 }

 static void set_brightness_delayed(struct work_struct *ws)
@@ -243,8 +247,9 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)

 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);

-	setup_timer(&led_cdev->blink_timer, led_timer_function,
-		    (unsigned long)led_cdev);
+	hrtimer_init(&led_cdev->blink_timer, CLOCK_MONOTONIC,
+		     HRTIMER_MODE_REL);
+	led_cdev->blink_timer.function = led_timer_function;

 #ifdef CONFIG_LEDS_TRIGGERS
 	led_trigger_set_default(led_cdev);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 9886dac..2937259 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -52,7 +52,8 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 		return;
 	}

-	mod_timer(&led_cdev->blink_timer, jiffies + 1);
+	hrtimer_start(&led_cdev->blink_timer, ktime_set(0, 0),
+		      HRTIMER_MODE_REL);
 }


@@ -76,7 +77,7 @@ void led_blink_set(struct led_classdev *led_cdev,
 		   unsigned long *delay_on,
 		   unsigned long *delay_off)
 {
-	del_timer_sync(&led_cdev->blink_timer);
+	hrtimer_cancel(&led_cdev->blink_timer);

 	led_cdev->flags &= ~LED_BLINK_ONESHOT;
 	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
@@ -91,7 +92,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 			   int invert)
 {
 	if ((led_cdev->flags & LED_BLINK_ONESHOT) &&
-	     timer_pending(&led_cdev->blink_timer))
+	     hrtimer_active(&led_cdev->blink_timer))
 		return;

 	led_cdev->flags |= LED_BLINK_ONESHOT;
@@ -108,7 +109,7 @@ EXPORT_SYMBOL(led_blink_set_oneshot);

 void led_stop_software_blink(struct led_classdev *led_cdev)
 {
-	del_timer_sync(&led_cdev->blink_timer);
+	hrtimer_cancel(&led_cdev->blink_timer);
 	led_cdev->blink_delay_on = 0;
 	led_cdev->blink_delay_off = 0;
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f70f84f..68f5a23 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -16,7 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/spinlock.h>
-#include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/workqueue.h>

 struct device;
@@ -81,7 +81,7 @@ struct led_classdev {
 	const char		*default_trigger;	/* Trigger to use */

 	unsigned long		 blink_delay_on, blink_delay_off;
-	struct timer_list	 blink_timer;
+	struct hrtimer		 blink_timer;
 	int			 blink_brightness;
 	void			(*flash_resume)(struct led_classdev *led_cdev);

-- 
1.7.9.5
