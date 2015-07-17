From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 15/51] leds: lp3944: Remove work queue
Date: Fri, 17 Jul 2015 10:47:01 +0200
Message-ID: <1437122857-6765-16-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Antonio Ospite <ospite@studenti.unina.it>
---
 drivers/leds/leds-lp3944.c |   15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 53144fb..c5cb4b9 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -31,7 +31,6 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 #include <linux/mutex.h>
-#include <linux/workqueue.h>
 #include <linux/leds-lp3944.h>
 
 /* Read Only Registers */
@@ -71,7 +70,6 @@ struct lp3944_led_data {
 	enum lp3944_status status;
 	struct led_classdev ldev;
 	struct i2c_client *client;
-	struct work_struct work;
 };
 
 struct lp3944_data {
@@ -276,7 +274,7 @@ static int lp3944_led_set_blink(struct led_classdev *led_cdev,
 		__func__);
 
 	led->status = LP3944_LED_STATUS_DIM0;
-	schedule_work(&led->work);
+	lp3944_led_set(led, led->status);
 
 	return 0;
 }
@@ -290,14 +288,6 @@ static void lp3944_led_set_brightness(struct led_classdev *led_cdev,
 		__func__, led_cdev->name, brightness);
 
 	led->status = !!brightness;
-	schedule_work(&led->work);
-}
-
-static void lp3944_led_work(struct work_struct *work)
-{
-	struct lp3944_led_data *led;
-
-	led = container_of(work, struct lp3944_led_data, work);
 	lp3944_led_set(led, led->status);
 }
 
@@ -325,7 +315,6 @@ static int lp3944_configure(struct i2c_client *client,
 			led->ldev.blink_set = lp3944_led_set_blink;
 			led->ldev.flags = LED_CORE_SUSPENDRESUME;
 
-			INIT_WORK(&led->work, lp3944_led_work);
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -364,7 +353,6 @@ exit:
 			case LP3944_LED_TYPE_LED:
 			case LP3944_LED_TYPE_LED_INVERTED:
 				led_classdev_unregister(&data->leds[i].ldev);
-				cancel_work_sync(&data->leds[i].work);
 				break;
 
 			case LP3944_LED_TYPE_NONE:
@@ -424,7 +412,6 @@ static int lp3944_remove(struct i2c_client *client)
 		case LP3944_LED_TYPE_LED:
 		case LP3944_LED_TYPE_LED_INVERTED:
 			led_classdev_unregister(&data->leds[i].ldev);
-			cancel_work_sync(&data->leds[i].work);
 			break;
 
 		case LP3944_LED_TYPE_NONE:
-- 
1.7.9.5
