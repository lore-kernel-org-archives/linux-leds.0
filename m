From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 20/57] leds: lp3944: Remove work queue
Date: Tue, 11 Aug 2015 11:37:33 +0200
Message-ID: <1439285890-27329-21-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Antonio Ospite <ospite@studenti.unina.it>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Antonio Ospite <ospite@studenti.unina.it>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-lp3944.c |   30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
index 53144fb..4b90663 100644
--- a/drivers/leds/leds-lp3944.c
+++ b/drivers/leds/leds-lp3944.c
@@ -31,7 +31,6 @@
 #include <linux/slab.h>
 #include <linux/leds.h>
 #include <linux/mutex.h>
-#include <linux/workqueue.h>
 #include <linux/leds-lp3944.h>
 
 /* Read Only Registers */
@@ -68,10 +67,8 @@
 struct lp3944_led_data {
 	u8 id;
 	enum lp3944_type type;
-	enum lp3944_status status;
 	struct led_classdev ldev;
 	struct i2c_client *client;
-	struct work_struct work;
 };
 
 struct lp3944_data {
@@ -275,8 +272,7 @@ static int lp3944_led_set_blink(struct led_classdev *led_cdev,
 	dev_dbg(&led->client->dev, "%s: OK hardware accelerated blink!\n",
 		__func__);
 
-	led->status = LP3944_LED_STATUS_DIM0;
-	schedule_work(&led->work);
+	lp3944_led_set(led, LP3944_LED_STATUS_DIM0);
 
 	return 0;
 }
@@ -289,16 +285,7 @@ static void lp3944_led_set_brightness(struct led_classdev *led_cdev,
 	dev_dbg(&led->client->dev, "%s: %s, %d\n",
 		__func__, led_cdev->name, brightness);
 
-	led->status = !!brightness;
-	schedule_work(&led->work);
-}
-
-static void lp3944_led_work(struct work_struct *work)
-{
-	struct lp3944_led_data *led;
-
-	led = container_of(work, struct lp3944_led_data, work);
-	lp3944_led_set(led, led->status);
+	lp3944_led_set(led, !!brightness);
 }
 
 static int lp3944_configure(struct i2c_client *client,
@@ -318,14 +305,13 @@ static int lp3944_configure(struct i2c_client *client,
 		case LP3944_LED_TYPE_LED:
 		case LP3944_LED_TYPE_LED_INVERTED:
 			led->type = pled->type;
-			led->status = pled->status;
 			led->ldev.name = pled->name;
 			led->ldev.max_brightness = 1;
 			led->ldev.brightness_set = lp3944_led_set_brightness;
 			led->ldev.blink_set = lp3944_led_set_blink;
-			led->ldev.flags = LED_CORE_SUSPENDRESUME;
+			led->ldev.flags = LED_CORE_SUSPENDRESUME |
+					  LED_BRIGHTNESS_BLOCKING;
 
-			INIT_WORK(&led->work, lp3944_led_work);
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
@@ -336,14 +322,14 @@ static int lp3944_configure(struct i2c_client *client,
 
 			/* to expose the default value to userspace */
 			led->ldev.brightness =
-					(enum led_brightness) led->status;
+					(enum led_brightness) pled->status;
 
 			/* Set the default led status */
-			err = lp3944_led_set(led, led->status);
+			err = lp3944_led_set(led, pled->status);
 			if (err < 0) {
 				dev_err(&client->dev,
 					"%s couldn't set STATUS %d\n",
-					led->ldev.name, led->status);
+					led->ldev.name, pled->status);
 				goto exit;
 			}
 			break;
@@ -364,7 +350,6 @@ exit:
 			case LP3944_LED_TYPE_LED:
 			case LP3944_LED_TYPE_LED_INVERTED:
 				led_classdev_unregister(&data->leds[i].ldev);
-				cancel_work_sync(&data->leds[i].work);
 				break;
 
 			case LP3944_LED_TYPE_NONE:
@@ -424,7 +409,6 @@ static int lp3944_remove(struct i2c_client *client)
 		case LP3944_LED_TYPE_LED:
 		case LP3944_LED_TYPE_LED_INVERTED:
 			led_classdev_unregister(&data->leds[i].ldev);
-			cancel_work_sync(&data->leds[i].work);
 			break;
 
 		case LP3944_LED_TYPE_NONE:
-- 
1.7.9.5
