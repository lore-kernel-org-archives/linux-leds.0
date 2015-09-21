From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 3/5] leds: max77693: Remove work queue
Date: Mon, 21 Sep 2015 16:29:28 +0200
Message-ID: <1442845770-17800-4-git-send-email-j.anaszewski@samsung.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-max77693.c |   57 +++++++-----------------------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index f69bcb4..28f3d05 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -19,7 +19,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define MODE_OFF		0
@@ -61,8 +60,6 @@ struct max77693_sub_led {
 	int fled_id;
 	/* corresponding LED Flash class device */
 	struct led_classdev_flash fled_cdev;
-	/* assures led-triggers compatibility */
-	struct work_struct work_brightness_set;
 	/* V4L2 Flash device */
 	struct v4l2_flash *v4l2_flash;
 
@@ -462,10 +459,14 @@ static int max77693_setup(struct max77693_led_device *led,
 	return max77693_set_mode_reg(led, MODE_OFF);
 }
 
-static int __max77693_led_brightness_set(struct max77693_led_device *led,
-					int fled_id, enum led_brightness value)
+/* LED subsystem callbacks */
+static int max77693_led_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness value)
 {
-	int ret;
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct max77693_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct max77693_led_device *led = sub_led_to_led(sub_led);
+	int fled_id = sub_led->fled_id, ret;
 
 	mutex_lock(&led->lock);
 
@@ -493,43 +494,8 @@ static int __max77693_led_brightness_set(struct max77693_led_device *led,
 			ret);
 unlock:
 	mutex_unlock(&led->lock);
-	return ret;
-}
 
-static void max77693_led_brightness_set_work(
-					struct work_struct *work)
-{
-	struct max77693_sub_led *sub_led =
-			container_of(work, struct max77693_sub_led,
-					work_brightness_set);
-	struct max77693_led_device *led = sub_led_to_led(sub_led);
-
-	__max77693_led_brightness_set(led, sub_led->fled_id,
-				sub_led->torch_brightness);
-}
-
-/* LED subsystem callbacks */
-
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
-static void max77693_led_brightness_set(
-				struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct max77693_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
-
-	sub_led->torch_brightness = value;
-	schedule_work(&sub_led->work_brightness_set);
+	return ret;
 }
 
 static int max77693_led_flash_brightness_set(
@@ -930,16 +896,13 @@ static void max77693_init_fled_cdev(struct max77693_sub_led *sub_led,
 
 	led_cdev->name = led_cfg->label[fled_id];
 
-	led_cdev->brightness_set = max77693_led_brightness_set;
-	led_cdev->brightness_set_blocking = max77693_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = max77693_led_brightness_set;
 	led_cdev->max_brightness = (led->iout_joint ?
 					led_cfg->iout_torch_max[FLED1] +
 					led_cfg->iout_torch_max[FLED2] :
 					led_cfg->iout_torch_max[fled_id]) /
 				   TORCH_IOUT_STEP;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
-	INIT_WORK(&sub_led->work_brightness_set,
-			max77693_led_brightness_set_work);
 
 	max77693_init_flash_settings(sub_led, led_cfg);
 
@@ -1061,13 +1024,11 @@ static int max77693_led_remove(struct platform_device *pdev)
 	if (led->iout_joint || max77693_fled_used(led, FLED1)) {
 		v4l2_flash_release(sub_leds[FLED1].v4l2_flash);
 		led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
-		cancel_work_sync(&sub_leds[FLED1].work_brightness_set);
 	}
 
 	if (!led->iout_joint && max77693_fled_used(led, FLED2)) {
 		v4l2_flash_release(sub_leds[FLED2].v4l2_flash);
 		led_classdev_flash_unregister(&sub_leds[FLED2].fled_cdev);
-		cancel_work_sync(&sub_leds[FLED2].work_brightness_set);
 	}
 
 	mutex_destroy(&led->lock);
-- 
1.7.9.5
