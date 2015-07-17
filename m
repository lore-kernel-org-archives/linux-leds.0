From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 14/51] leds: pca9532: Remove work queue for LEDs.
Date: Fri, 17 Jul 2015 10:47:00 +0200
Message-ID: <1437122857-6765-15-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56712 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932388AbbGQIsj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 04:48:39 -0400
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-pca9532.c |   20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 5a6363d..85ffc30 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -174,7 +174,9 @@ static void pca9532_set_brightness(struct led_classdev *led_cdev,
 		if (err)
 			return; /* XXX: led api doesn't allow error code? */
 	}
-	schedule_work(&led->work);
+	if (led->state == PCA9532_PWM0)
+		pca9532_setpwm(led->client, 0);
+	pca9532_setled(led);
 }
 
 static int pca9532_set_blink(struct led_classdev *led_cdev,
@@ -198,7 +200,10 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	err = pca9532_calcpwm(client, 0, psc, led_cdev->brightness);
 	if (err)
 		return err;
-	schedule_work(&led->work);
+	if (led->state == PCA9532_PWM0)
+		pca9532_setpwm(led->client, 0);
+	pca9532_setled(led);
+
 	return 0;
 }
 
@@ -233,15 +238,6 @@ static void pca9532_input_work(struct work_struct *work)
 	mutex_unlock(&data->update_lock);
 }
 
-static void pca9532_led_work(struct work_struct *work)
-{
-	struct pca9532_led *led;
-	led = container_of(work, struct pca9532_led, work);
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, 0);
-	pca9532_setled(led);
-}
-
 #ifdef CONFIG_LEDS_PCA9532_GPIO
 static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
 {
@@ -307,7 +303,6 @@ static int pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
 			break;
 		case PCA9532_TYPE_LED:
 			led_classdev_unregister(&data->leds[i].ldev);
-			cancel_work_sync(&data->leds[i].work);
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
 			if (data->idev != NULL) {
@@ -361,7 +356,6 @@ static int pca9532_configure(struct i2c_client *client,
 			led->ldev.brightness = LED_OFF;
 			led->ldev.brightness_set = pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
-			INIT_WORK(&led->work, pca9532_led_work);
 			err = led_classdev_register(&client->dev, &led->ldev);
 			if (err < 0) {
 				dev_err(&client->dev,
-- 
1.7.9.5
