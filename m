From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 15/36] leds: blinkm: Remove work queue
Date: Thu, 20 Aug 2015 16:43:45 +0200
Message-ID: <1440081846-11697-16-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jan-Simon Moeller <dl9pf@gmx.de>, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-blinkm.c |   87 +++++++++-----------------------------------
 1 file changed, 17 insertions(+), 70 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d0452b0..617fe97 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -39,16 +39,9 @@ struct blinkm_led {
 	struct i2c_client *i2c_client;
 	struct led_classdev led_cdev;
 	int id;
-	atomic_t active;
-};
-
-struct blinkm_work {
-	struct blinkm_led *blinkm_led;
-	struct work_struct work;
 };
 
 #define cdev_to_blmled(c)          container_of(c, struct blinkm_led, led_cdev)
-#define work_to_blmwork(c)         container_of(c, struct blinkm_work, work)
 
 struct blinkm_data {
 	struct i2c_client *i2c_client;
@@ -439,65 +432,30 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
 	return 0;
 }
 
-static void led_work(struct work_struct *work)
-{
-	int ret;
-	struct blinkm_led *led;
-	struct blinkm_data *data;
-	struct blinkm_work *blm_work = work_to_blmwork(work);
-
-	led = blm_work->blinkm_led;
-	data = i2c_get_clientdata(led->i2c_client);
-	ret = blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
-	atomic_dec(&led->active);
-	dev_dbg(&led->i2c_client->dev,
-			"# DONE # next_red = %d, next_green = %d,"
-			" next_blue = %d, active = %d\n",
-			data->next_red, data->next_green,
-			data->next_blue, atomic_read(&led->active));
-	kfree(blm_work);
-}
-
 static int blinkm_led_common_set(struct led_classdev *led_cdev,
 				 enum led_brightness value, int color)
 {
 	/* led_brightness is 0, 127 or 255 - we just use it here as-is */
 	struct blinkm_led *led = cdev_to_blmled(led_cdev);
 	struct blinkm_data *data = i2c_get_clientdata(led->i2c_client);
-	struct blinkm_work *bl_work;
 
 	switch (color) {
 	case RED:
 		/* bail out if there's no change */
 		if (data->next_red == (u8) value)
 			return 0;
-		/* we assume a quite fast sequence here ([off]->on->off)
-		 * think of network led trigger - we cannot blink that fast, so
-		 * in case we already have a off->on->off transition queued up,
-		 * we refuse to queue up more.
-		 * Revisit: fast-changing brightness. */
-		if (atomic_read(&led->active) > 1)
-			return 0;
 		data->next_red = (u8) value;
 		break;
 	case GREEN:
 		/* bail out if there's no change */
 		if (data->next_green == (u8) value)
 			return 0;
-		/* we assume a quite fast sequence here ([off]->on->off)
-		 * Revisit: fast-changing brightness. */
-		if (atomic_read(&led->active) > 1)
-			return 0;
 		data->next_green = (u8) value;
 		break;
 	case BLUE:
 		/* bail out if there's no change */
 		if (data->next_blue == (u8) value)
 			return 0;
-		/* we assume a quite fast sequence here ([off]->on->off)
-		 * Revisit: fast-changing brightness. */
-		if (atomic_read(&led->active) > 1)
-			return 0;
 		data->next_blue = (u8) value;
 		break;
 
@@ -506,42 +464,31 @@ static int blinkm_led_common_set(struct led_classdev *led_cdev,
 		return -EINVAL;
 	}
 
-	bl_work = kzalloc(sizeof(*bl_work), GFP_ATOMIC);
-	if (!bl_work)
-		return -ENOMEM;
-
-	atomic_inc(&led->active);
+	blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
 	dev_dbg(&led->i2c_client->dev,
-			"#TO_SCHED# next_red = %d, next_green = %d,"
-			" next_blue = %d, active = %d\n",
+			"# DONE # next_red = %d, next_green = %d,"
+			" next_blue = %d\n",
 			data->next_red, data->next_green,
-			data->next_blue, atomic_read(&led->active));
-
-	/* a fresh work _item_ for each change */
-	bl_work->blinkm_led = led;
-	INIT_WORK(&bl_work->work, led_work);
-	/* queue work in own queue for easy sync on exit*/
-	schedule_work(&bl_work->work);
-
+			data->next_blue);
 	return 0;
 }
 
-static void blinkm_led_red_set(struct led_classdev *led_cdev,
+static int blinkm_led_red_set(struct led_classdev *led_cdev,
 			       enum led_brightness value)
 {
-	blinkm_led_common_set(led_cdev, value, RED);
+	return blinkm_led_common_set(led_cdev, value, RED);
 }
 
-static void blinkm_led_green_set(struct led_classdev *led_cdev,
+static int blinkm_led_green_set(struct led_classdev *led_cdev,
 				 enum led_brightness value)
 {
-	blinkm_led_common_set(led_cdev, value, GREEN);
+	return blinkm_led_common_set(led_cdev, value, GREEN);
 }
 
-static void blinkm_led_blue_set(struct led_classdev *led_cdev,
+static int blinkm_led_blue_set(struct led_classdev *led_cdev,
 				enum led_brightness value)
 {
-	blinkm_led_common_set(led_cdev, value, BLUE);
+	return blinkm_led_common_set(led_cdev, value, BLUE);
 }
 
 static void blinkm_init_hw(struct i2c_client *client)
@@ -669,7 +616,6 @@ static int blinkm_probe(struct i2c_client *client,
 		led[i]->id = i;
 		led[i]->led_cdev.max_brightness = 255;
 		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME;
-		atomic_set(&led[i]->active, 0);
 		switch (i) {
 		case RED:
 			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
@@ -677,7 +623,8 @@ static int blinkm_probe(struct i2c_client *client,
 					 client->adapter->nr,
 					 client->addr);
 			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set = blinkm_led_red_set;
+			led[i]->led_cdev.brightness_set_blocking =
+							blinkm_led_red_set;
 			err = led_classdev_register(&client->dev,
 						    &led[i]->led_cdev);
 			if (err < 0) {
@@ -693,7 +640,8 @@ static int blinkm_probe(struct i2c_client *client,
 					 client->adapter->nr,
 					 client->addr);
 			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set = blinkm_led_green_set;
+			led[i]->led_cdev.brightness_set_blocking =
+							blinkm_led_green_set;
 			err = led_classdev_register(&client->dev,
 						    &led[i]->led_cdev);
 			if (err < 0) {
@@ -709,7 +657,8 @@ static int blinkm_probe(struct i2c_client *client,
 					 client->adapter->nr,
 					 client->addr);
 			led[i]->led_cdev.name = blinkm_led_name;
-			led[i]->led_cdev.brightness_set = blinkm_led_blue_set;
+			led[i]->led_cdev.brightness_set_blocking =
+							blinkm_led_blue_set;
 			err = led_classdev_register(&client->dev,
 						    &led[i]->led_cdev);
 			if (err < 0) {
@@ -746,10 +695,8 @@ static int blinkm_remove(struct i2c_client *client)
 	int i;
 
 	/* make sure no workqueue entries are pending */
-	for (i = 0; i < 3; i++) {
-		flush_scheduled_work();
+	for (i = 0; i < 3; i++)
 		led_classdev_unregister(&data->blinkm_leds[i].led_cdev);
-	}
 
 	/* reset rgb */
 	data->next_red = 0x00;
-- 
1.7.9.5
