From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 14/36] leds: bd2802: Remove work queue
Date: Thu, 20 Aug 2015 16:43:44 +0200
Message-ID: <1440081846-11697-15-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Kim Kyuwon <q1.kim@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Kim Kyuwon <q1.kim@samsung.com>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-bd2802.c |   39 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 6078c15d..6b4de76 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -72,7 +72,6 @@ struct bd2802_led {
 	struct bd2802_led_platform_data	*pdata;
 	struct i2c_client		*client;
 	struct rw_semaphore		rwsem;
-	struct work_struct		work;
 
 	struct led_state		led[2];
 
@@ -518,29 +517,22 @@ static struct device_attribute *bd2802_attributes[] = {
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
-static void bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
+static int bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
 					enum led_brightness value)	\
 {									\
 	struct bd2802_led *led =					\
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
+	return 0;							\
 }									\
 static int bd2802_set_##name##_blink(struct led_classdev *led_cdev,	\
 		unsigned long *delay_on, unsigned long *delay_off)	\
@@ -552,7 +544,7 @@ static int bd2802_set_##name##_blink(struct led_classdev *led_cdev,	\
 	led->led_id = id;						\
 	led->color = clr;						\
 	led->state = BD2802_BLINK;					\
-	schedule_work(&led->work);					\
+	bd2802_turn_on(led, led->led_id, led->color, BD2802_BLINK);	\
 	return 0;							\
 }
 
@@ -567,11 +559,9 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 {
 	int ret;
 
-	INIT_WORK(&led->work, bd2802_led_work);
-
 	led->cdev_led1r.name = "led1_R";
 	led->cdev_led1r.brightness = LED_OFF;
-	led->cdev_led1r.brightness_set = bd2802_set_led1r_brightness;
+	led->cdev_led1r.brightness_set_blocking = bd2802_set_led1r_brightness;
 	led->cdev_led1r.blink_set = bd2802_set_led1r_blink;
 
 	ret = led_classdev_register(&led->client->dev, &led->cdev_led1r);
@@ -583,7 +573,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 
 	led->cdev_led1g.name = "led1_G";
 	led->cdev_led1g.brightness = LED_OFF;
-	led->cdev_led1g.brightness_set = bd2802_set_led1g_brightness;
+	led->cdev_led1g.brightness_set_blocking = bd2802_set_led1g_brightness;
 	led->cdev_led1g.blink_set = bd2802_set_led1g_blink;
 
 	ret = led_classdev_register(&led->client->dev, &led->cdev_led1g);
@@ -595,7 +585,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 
 	led->cdev_led1b.name = "led1_B";
 	led->cdev_led1b.brightness = LED_OFF;
-	led->cdev_led1b.brightness_set = bd2802_set_led1b_brightness;
+	led->cdev_led1b.brightness_set_blocking = bd2802_set_led1b_brightness;
 	led->cdev_led1b.blink_set = bd2802_set_led1b_blink;
 
 	ret = led_classdev_register(&led->client->dev, &led->cdev_led1b);
@@ -607,7 +597,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 
 	led->cdev_led2r.name = "led2_R";
 	led->cdev_led2r.brightness = LED_OFF;
-	led->cdev_led2r.brightness_set = bd2802_set_led2r_brightness;
+	led->cdev_led2r.brightness_set_blocking = bd2802_set_led2r_brightness;
 	led->cdev_led2r.blink_set = bd2802_set_led2r_blink;
 
 	ret = led_classdev_register(&led->client->dev, &led->cdev_led2r);
@@ -619,7 +609,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 
 	led->cdev_led2g.name = "led2_G";
 	led->cdev_led2g.brightness = LED_OFF;
-	led->cdev_led2g.brightness_set = bd2802_set_led2g_brightness;
+	led->cdev_led2g.brightness_set_blocking = bd2802_set_led2g_brightness;
 	led->cdev_led2g.blink_set = bd2802_set_led2g_blink;
 
 	ret = led_classdev_register(&led->client->dev, &led->cdev_led2g);
@@ -631,7 +621,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 
 	led->cdev_led2b.name = "led2_B";
 	led->cdev_led2b.brightness = LED_OFF;
-	led->cdev_led2b.brightness_set = bd2802_set_led2b_brightness;
+	led->cdev_led2b.brightness_set_blocking = bd2802_set_led2b_brightness;
 	led->cdev_led2b.blink_set = bd2802_set_led2b_blink;
 	led->cdev_led2b.flags |= LED_CORE_SUSPENDRESUME;
 
@@ -661,7 +651,6 @@ failed_unregister_led1_R:
 
 static void bd2802_unregister_led_classdev(struct bd2802_led *led)
 {
-	cancel_work_sync(&led->work);
 	led_classdev_unregister(&led->cdev_led2b);
 	led_classdev_unregister(&led->cdev_led2g);
 	led_classdev_unregister(&led->cdev_led2r);
-- 
1.7.9.5
