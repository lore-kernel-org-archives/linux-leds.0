From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 06/36] leds: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Thu, 20 Aug 2015 16:43:36 +0200
Message-ID: <1440081846-11697-7-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Ingi Kim <ingi2.kim@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

This patch removes brightness_set_sync op as well as SET_BRIGHTNESS_ASYNC
and SET_BRIGHTNESS sync flags. led_set_brightness now calls
led_set_brightness_nosleep rather then choosing between sync and async op
basing on the flags defined by the driver. Now if a user wants to make
sure that brightness will be set synchronously they have to use
led_set_brightness_sync API.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ingi Kim <ingi2.kim@samsung.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@users.sourceforge.net>
---
 drivers/leds/led-class-flash.c |    7 -------
 drivers/leds/led-class.c       |    2 --
 drivers/leds/led-core.c        |   24 ++++--------------------
 drivers/leds/leds-aat1290.c    |   12 ------------
 drivers/leds/leds-ktd2692.c    |   12 ------------
 drivers/leds/leds-max77693.c   |   12 ------------
 include/linux/leds.h           |   14 +++-----------
 7 files changed, 7 insertions(+), 76 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3b25734..68c3f36 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -298,9 +298,6 @@ int led_classdev_flash_register(struct device *parent,
 	led_cdev = &fled_cdev->led_cdev;
 
 	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
-		if (!led_cdev->brightness_set_sync)
-			return -EINVAL;
-
 		ops = fled_cdev->ops;
 		if (!ops || !ops->strobe_set)
 			return -EINVAL;
@@ -316,10 +313,6 @@ int led_classdev_flash_register(struct device *parent,
 	if (ret < 0)
 		return ret;
 
-	/* Setting a torch brightness needs to have immediate effect */
-	led_cdev->flags &= ~SET_BRIGHTNESS_ASYNC;
-	led_cdev->flags |= SET_BRIGHTNESS_SYNC;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(led_classdev_flash_register);
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 241059d..8e9ed00 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -285,8 +285,6 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness = LED_FULL;
 
-	led_cdev->flags |= SET_BRIGHTNESS_ASYNC;
-
 	led_update_brightness(led_cdev);
 
 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 956c8d8..dc10c54 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -139,8 +139,6 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 void led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	int ret = 0;
-
 	/*
 	 * In case blinking is on delay brightness setting
 	 * until the next timer tick.
@@ -158,20 +156,9 @@ void led_set_brightness(struct led_classdev *led_cdev,
 		 */
 		led_cdev->flags |= LED_BLINK_DISABLE;
 		led_set_brightness_async(led_cdev, brightness);
-		return;
+	} else {
+		led_set_brightness_nosleep(led_cdev, brightness);
 	}
-
-	if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
-		led_set_brightness_async(led_cdev, brightness);
-		return;
-	} else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
-		ret = led_set_brightness_sync(led_cdev, brightness);
-	else
-		ret = -EINVAL;
-
-	if (ret < 0)
-		dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n",
-			ret);
 }
 EXPORT_SYMBOL(led_set_brightness);
 
@@ -185,12 +172,9 @@ int led_set_brightness_sync(struct led_classdev *led_cdev,
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	if (led_cdev->brightness_set_sync)
-		ret = led_cdev->brightness_set_sync(led_cdev,
-							led_cdev->brightness);
-	else if (led_cdev->brightness_set_blocking)
+	if (led_cdev->brightness_set_blocking)
 		led_cdev->brightness_set_blocking(led_cdev,
-							led_cdev->brightness);
+						  led_cdev->brightness);
 	else if (led_cdev->brightness_set)
 		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
 	else
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index fd7c25f..0ecaf76 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -180,17 +180,6 @@ static void aat1290_led_brightness_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work_brightness_set);
 }
 
-static int aat1290_led_brightness_set_sync(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
-
-	aat1290_brightness_set(led, brightness);
-
-	return 0;
-}
-
 static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 					 bool state)
 
@@ -510,7 +499,6 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	/* Initialize LED Flash class device */
 	led_cdev->brightness_set = aat1290_led_brightness_set;
-	led_cdev->brightness_set_sync = aat1290_led_brightness_set_sync;
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 	INIT_WORK(&led->work_brightness_set, aat1290_brightness_set_work);
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 2ae8c4d..7f6758d 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -194,17 +194,6 @@ static void ktd2692_led_brightness_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work_brightness_set);
 }
 
-static int ktd2692_led_brightness_set_sync(struct led_classdev *led_cdev,
-					   enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
-
-	ktd2692_brightness_set(led, brightness);
-
-	return 0;
-}
-
 static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 					bool state)
 {
@@ -382,7 +371,6 @@ static int ktd2692_probe(struct platform_device *pdev)
 
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->brightness_set = ktd2692_led_brightness_set;
-	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
 	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
 	mutex_init(&led->lock);
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index b8b0eec..0eade1ff 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -510,17 +510,6 @@ static void max77693_led_brightness_set_work(
 
 /* LED subsystem callbacks */
 
-static int max77693_led_brightness_set_sync(
-				struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct max77693_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
-	struct max77693_led_device *led = sub_led_to_led(sub_led);
-
-	return __max77693_led_brightness_set(led, sub_led->fled_id, value);
-}
-
 static void max77693_led_brightness_set(
 				struct led_classdev *led_cdev,
 				enum led_brightness value)
@@ -931,7 +920,6 @@ static void max77693_init_fled_cdev(struct max77693_sub_led *sub_led,
 	led_cdev->name = led_cfg->label[fled_id];
 
 	led_cdev->brightness_set = max77693_led_brightness_set;
-	led_cdev->brightness_set_sync = max77693_led_brightness_set_sync;
 	led_cdev->max_brightness = (led->iout_joint ?
 					led_cfg->iout_torch_max[FLED1] +
 					led_cfg->iout_torch_max[FLED2] :
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 8fefe72..804cbe1 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -45,10 +45,8 @@ struct led_classdev {
 #define LED_BLINK_ONESHOT_STOP	(1 << 18)
 #define LED_BLINK_INVERT	(1 << 19)
 #define LED_SYSFS_DISABLE	(1 << 20)
-#define SET_BRIGHTNESS_ASYNC	(1 << 21)
-#define SET_BRIGHTNESS_SYNC	(1 << 22)
-#define LED_DEV_CAP_FLASH	(1 << 23)
-#define LED_BLINK_DISABLE	(1 << 24)
+#define LED_DEV_CAP_FLASH	(1 << 21)
+#define LED_BLINK_DISABLE	(1 << 22)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
@@ -60,12 +58,6 @@ struct led_classdev {
 	 */
 	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
 				       enum led_brightness brightness);
-	/*
-	 * Set LED brightness level immediately - it can block the caller for
-	 * the time required for accessing a LED device register.
-	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
@@ -164,7 +156,7 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  *
  * Set an LED's brightness, and, if necessary, cancel the
  * software blink timer that implements blinking when the
- * hardware doesn't.
+ * hardware doesn't. This function is guaranteed not to sleep.
  */
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
-- 
1.7.9.5
