From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 10/51] leds: bd2802: Remove work queue
Date: Fri, 17 Jul 2015 10:46:56 +0200
Message-ID: <1437122857-6765-11-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Kim Kyuwon <q1.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Kim Kyuwon <q1.kim@samsung.com>
---
 drivers/leds/leds-bd2802.c |   24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 6078c15d..19113c0 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -72,7 +72,6 @@ struct bd2802_led {
 	struct bd2802_led_platform_data	*pdata;
 	struct i2c_client		*client;
 	struct rw_semaphore		rwsem;
-	struct work_struct		work;
 
 	struct led_state		led[2];
 
@@ -518,16 +517,6 @@ static struct device_attribute *bd2802_attributes[] = {
 	&bd2802_rgb_current_attr,
 };
 
-static void bd2802_led_work(struct work_struct *work)
-{
-	struct bd2802_led *led = container_of(work, struct bd2802_led, work);
-
-	if (led->state)
-		bd2802_turn_on(led, led->led_id, led->color, led->state);
-	else
-		bd2802_turn_off(led, led->led_id, led->color);
-}
-
 #define BD2802_CONTROL_RGBS(name, id, clr)				\
 static void bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
 					enum led_brightness value)	\
@@ -536,11 +525,13 @@ static void bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
 		container_of(led_cdev, struct bd2802_led, cdev_##name);	\
 	led->led_id = id;						\
 	led->color = clr;						\
-	if (value == LED_OFF)						\
+	if (value == LED_OFF) {						\
 		led->state = BD2802_OFF;				\
-	else								\
+		bd2802_turn_off(led, led->led_id, led->color);		\
+	} else {							\
 		led->state = BD2802_ON;					\
-	schedule_work(&led->work);					\
+		bd2802_turn_on(led, led->led_id, led->color, BD2802_ON);\
+	}								\
 }									\
 static int bd2802_set_##name##_blink(struct led_classdev *led_cdev,	\
 		unsigned long *delay_on, unsigned long *delay_off)	\
@@ -552,7 +543,7 @@ static int bd2802_set_##name##_blink(struct led_classdev *led_cdev,	\
 	led->led_id = id;						\
 	led->color = clr;						\
 	led->state = BD2802_BLINK;					\
-	schedule_work(&led->work);					\
+	bd2802_turn_on(led, led->led_id, led->color, BD2802_BLINK);	\
 	return 0;							\
 }
 
@@ -567,8 +558,6 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 {
 	int ret;
 
-	INIT_WORK(&led->work, bd2802_led_work);
-
 	led->cdev_led1r.name = "led1_R";
 	led->cdev_led1r.brightness = LED_OFF;
 	led->cdev_led1r.brightness_set = bd2802_set_led1r_brightness;
@@ -661,7 +650,6 @@ failed_unregister_led1_R:
 
 static void bd2802_unregister_led_classdev(struct bd2802_led *led)
 {
-	cancel_work_sync(&led->work);
 	led_classdev_unregister(&led->cdev_led2b);
 	led_classdev_unregister(&led->cdev_led2g);
 	led_classdev_unregister(&led->cdev_led2r);
-- 
1.7.9.5
