From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 1/2] leds: ledtrig-heartbeat: Make top brightness adjustable
Date: Wed, 05 Oct 2016 12:03:31 +0200
Message-ID: <1475661812-26215-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

LED class heartbeat trigger allowed only for blinking with max_brightness
value. This patch adds more flexibility by exploiting part of LED core
software blink infrastructure.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index c9f3862..9cc3e97 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -59,26 +59,26 @@ static void led_heartbeat_function(unsigned long data)
 		delay = msecs_to_jiffies(70);
 		heartbeat_data->phase++;
 		if (!heartbeat_data->invert)
-			brightness = led_cdev->max_brightness;
+			brightness = led_cdev->blink_brightness;
 		break;
 	case 1:
 		delay = heartbeat_data->period / 4 - msecs_to_jiffies(70);
 		heartbeat_data->phase++;
 		if (heartbeat_data->invert)
-			brightness = led_cdev->max_brightness;
+			brightness = led_cdev->blink_brightness;
 		break;
 	case 2:
 		delay = msecs_to_jiffies(70);
 		heartbeat_data->phase++;
 		if (!heartbeat_data->invert)
-			brightness = led_cdev->max_brightness;
+			brightness = led_cdev->blink_brightness;
 		break;
 	default:
 		delay = heartbeat_data->period - heartbeat_data->period / 4 -
 			msecs_to_jiffies(70);
 		heartbeat_data->phase = 0;
 		if (heartbeat_data->invert)
-			brightness = led_cdev->max_brightness;
+			brightness = led_cdev->blink_brightness;
 		break;
 	}
 
@@ -133,7 +133,10 @@ static void heartbeat_trig_activate(struct led_classdev *led_cdev)
 	setup_timer(&heartbeat_data->timer,
 		    led_heartbeat_function, (unsigned long) led_cdev);
 	heartbeat_data->phase = 0;
+	if (!led_cdev->blink_brightness)
+		led_cdev->blink_brightness = led_cdev->max_brightness;
 	led_heartbeat_function(heartbeat_data->timer.data);
+	led_cdev->flags |= LED_BLINK_SW;
 	led_cdev->activated = true;
 }
 
@@ -145,6 +148,7 @@ static void heartbeat_trig_deactivate(struct led_classdev *led_cdev)
 		del_timer_sync(&heartbeat_data->timer);
 		device_remove_file(led_cdev->dev, &dev_attr_invert);
 		kfree(heartbeat_data);
+		led_cdev->flags &= ~LED_BLINK_SW;
 		led_cdev->activated = false;
 	}
 }
-- 
1.9.1
