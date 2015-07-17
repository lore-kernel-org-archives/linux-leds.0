From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 20/51] leds: pca963x: Remove work queue
Date: Fri, 17 Jul 2015 10:47:06 +0200
Message-ID: <1437122857-6765-21-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>
---
 drivers/leds/leds-pca963x.c |   56 +++++++------------------------------------
 1 file changed, 8 insertions(+), 48 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index bee3e1a..92819c5 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -32,7 +32,6 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/workqueue.h>
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_data/leds-pca963x.h>
@@ -96,11 +95,6 @@ static const struct i2c_device_id pca963x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
 
-enum pca963x_cmd {
-	BRIGHTNESS_SET,
-	BLINK_SET,
-};
-
 struct pca963x_led;
 
 struct pca963x {
@@ -112,17 +106,16 @@ struct pca963x {
 
 struct pca963x_led {
 	struct pca963x *chip;
-	struct work_struct work;
 	enum led_brightness brightness;
 	struct led_classdev led_cdev;
 	int led_num; /* 0 .. 15 potentially */
-	enum pca963x_cmd cmd;
 	char name[32];
 	u8 gdc;
 	u8 gfrq;
 };
 
-static void pca963x_brightness_work(struct pca963x_led *pca963x)
+static void pca963x_brightness(struct pca963x_led *pca963x,
+			       enum led_brightness brightness)
 {
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base
 		+ (pca963x->led_num / 4);
@@ -132,7 +125,7 @@ static void pca963x_brightness_work(struct pca963x_led *pca963x)
 
 	mutex_lock(&pca963x->chip->mutex);
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
-	switch (pca963x->brightness) {
+	switch (brightness) {
 	case LED_FULL:
 		i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
 			(ledout & ~mask) | (PCA963X_LED_ON << shift));
@@ -152,7 +145,7 @@ static void pca963x_brightness_work(struct pca963x_led *pca963x)
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
-static void pca963x_blink_work(struct pca963x_led *pca963x)
+static void pca963x_blink(struct pca963x_led *pca963x)
 {
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base +
 		(pca963x->led_num / 4);
@@ -180,21 +173,6 @@ static void pca963x_blink_work(struct pca963x_led *pca963x)
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
-static void pca963x_work(struct work_struct *work)
-{
-	struct pca963x_led *pca963x = container_of(work,
-		struct pca963x_led, work);
-
-	switch (pca963x->cmd) {
-	case BRIGHTNESS_SET:
-		pca963x_brightness_work(pca963x);
-		break;
-	case BLINK_SET:
-		pca963x_blink_work(pca963x);
-		break;
-	}
-}
-
 static void pca963x_led_set(struct led_classdev *led_cdev,
 	enum led_brightness value)
 {
@@ -202,14 +180,7 @@ static void pca963x_led_set(struct led_classdev *led_cdev,
 
 	pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
 
-	pca963x->cmd = BRIGHTNESS_SET;
-	pca963x->brightness = value;
-
-	/*
-	 * Must use workqueue for the actual I/O since I2C operations
-	 * can sleep.
-	 */
-	schedule_work(&pca963x->work);
+	pca963x_brightness(pca963x, value);
 }
 
 static int pca963x_blink_set(struct led_classdev *led_cdev,
@@ -254,15 +225,10 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	 */
 	gfrq = (period * 24 / 1000) - 1;
 
-	pca963x->cmd = BLINK_SET;
 	pca963x->gdc = gdc;
 	pca963x->gfrq = gfrq;
 
-	/*
-	 * Must use workqueue for the actual I/O since I2C operations
-	 * can sleep.
-	 */
-	schedule_work(&pca963x->work);
+	pca963x_blink(pca963x);
 
 	*delay_on = time_on;
 	*delay_off = time_off;
@@ -413,8 +379,6 @@ static int pca963x_probe(struct i2c_client *client,
 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
 			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
 
-		INIT_WORK(&pca963x[i].work, pca963x_work);
-
 		err = led_classdev_register(&client->dev, &pca963x[i].led_cdev);
 		if (err < 0)
 			goto exit;
@@ -434,10 +398,8 @@ static int pca963x_probe(struct i2c_client *client,
 	return 0;
 
 exit:
-	while (i--) {
+	while (i--)
 		led_classdev_unregister(&pca963x[i].led_cdev);
-		cancel_work_sync(&pca963x[i].work);
-	}
 
 	return err;
 }
@@ -447,10 +409,8 @@ static int pca963x_remove(struct i2c_client *client)
 	struct pca963x *pca963x = i2c_get_clientdata(client);
 	int i;
 
-	for (i = 0; i < pca963x->chipdef->n_leds; i++) {
+	for (i = 0; i < pca963x->chipdef->n_leds; i++)
 		led_classdev_unregister(&pca963x->leds[i].led_cdev);
-		cancel_work_sync(&pca963x->leds[i].work);
-	}
 
 	return 0;
 }
-- 
1.7.9.5
