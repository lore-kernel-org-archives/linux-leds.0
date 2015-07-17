From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 19/51] leds: pca955x: Remove work queue
Date: Fri, 17 Jul 2015 10:47:05 +0200
Message-ID: <1437122857-6765-20-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Nate Case <ncase@xes-inc.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Nate Case <ncase@xes-inc.com>
---
 drivers/leds/leds-pca955x.c |   37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index c3a08b6..3150d59 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -47,7 +47,6 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/workqueue.h>
 #include <linux/slab.h>
 
 /* LED select registers determine the source that drives LED outputs */
@@ -110,8 +109,6 @@ struct pca955x {
 
 struct pca955x_led {
 	struct pca955x	*pca955x;
-	struct work_struct	work;
-	enum led_brightness	brightness;
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
@@ -193,7 +190,8 @@ static u8 pca955x_read_ls(struct i2c_client *client, int n)
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
 }
 
-static void pca955x_led_work(struct work_struct *work)
+static void pca955x_led_set(struct led_classdev *led_cdev,
+			    enum led_brightness value)
 {
 	struct pca955x_led *pca955x_led;
 	struct pca955x *pca955x;
@@ -201,7 +199,7 @@ static void pca955x_led_work(struct work_struct *work)
 	int chip_ls;	/* which LSx to use (0-3 potentially) */
 	int ls_led;	/* which set of bits within LSx to use (0-3) */
 
-	pca955x_led = container_of(work, struct pca955x_led, work);
+	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
 	pca955x = pca955x_led->pca955x;
 
 	chip_ls = pca955x_led->led_num / 4;
@@ -211,7 +209,7 @@ static void pca955x_led_work(struct work_struct *work)
 
 	ls = pca955x_read_ls(pca955x->client, chip_ls);
 
-	switch (pca955x_led->brightness) {
+	switch (value) {
 	case LED_FULL:
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
 		break;
@@ -230,7 +228,7 @@ static void pca955x_led_work(struct work_struct *work)
 		 * just turning off for all other values.
 		 */
 		pca955x_write_pwm(pca955x->client, 1,
-				255 - pca955x_led->brightness);
+				255 - value);
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
 		break;
 	}
@@ -240,21 +238,6 @@ static void pca955x_led_work(struct work_struct *work)
 	mutex_unlock(&pca955x->lock);
 }
 
-static void pca955x_led_set(struct led_classdev *led_cdev, enum led_brightness value)
-{
-	struct pca955x_led *pca955x;
-
-	pca955x = container_of(led_cdev, struct pca955x_led, led_cdev);
-
-	pca955x->brightness = value;
-
-	/*
-	 * Must use workqueue for the actual I/O since I2C operations
-	 * can sleep.
-	 */
-	schedule_work(&pca955x->work);
-}
-
 static int pca955x_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -330,8 +313,6 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led->led_cdev.name = pca955x_led->name;
 		pca955x_led->led_cdev.brightness_set = pca955x_led_set;
 
-		INIT_WORK(&pca955x_led->work, pca955x_led_work);
-
 		err = led_classdev_register(&client->dev,
 					&pca955x_led->led_cdev);
 		if (err < 0)
@@ -355,10 +336,8 @@ static int pca955x_probe(struct i2c_client *client,
 	return 0;
 
 exit:
-	while (i--) {
+	while (i--)
 		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-		cancel_work_sync(&pca955x->leds[i].work);
-	}
 
 	return err;
 }
@@ -368,10 +347,8 @@ static int pca955x_remove(struct i2c_client *client)
 	struct pca955x *pca955x = i2c_get_clientdata(client);
 	int i;
 
-	for (i = 0; i < pca955x->chipdef->bits; i++) {
+	for (i = 0; i < pca955x->chipdef->bits; i++)
 		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-		cancel_work_sync(&pca955x->leds[i].work);
-	}
 
 	return 0;
 }
-- 
1.7.9.5
