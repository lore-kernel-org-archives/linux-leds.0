From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 11/51] leds: blinkm: Remove work queue
Date: Fri, 17 Jul 2015 10:46:57 +0200
Message-ID: <1437122857-6765-12-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jan-Simon Moeller <dl9pf@gmx.de>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
---
 drivers/leds/leds-blinkm.c |   66 ++++----------------------------------------
 1 file changed, 5 insertions(+), 61 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index d0452b0..8543775 100644
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
 
@@ -506,23 +464,12 @@ static int blinkm_led_common_set(struct led_classdev *led_cdev,
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
 
@@ -669,7 +616,6 @@ static int blinkm_probe(struct i2c_client *client,
 		led[i]->id = i;
 		led[i]->led_cdev.max_brightness = 255;
 		led[i]->led_cdev.flags = LED_CORE_SUSPENDRESUME;
-		atomic_set(&led[i]->active, 0);
 		switch (i) {
 		case RED:
 			snprintf(blinkm_led_name, sizeof(blinkm_led_name),
@@ -746,10 +692,8 @@ static int blinkm_remove(struct i2c_client *client)
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
