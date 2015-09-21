From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 4/5] leds: aat1290: Remove work queue
Date: Mon, 21 Sep 2015 16:29:29 +0200
Message-ID: <1442845770-17800-5-git-send-email-j.anaszewski@samsung.com>
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
 drivers/leds/leds-aat1290.c |   50 +++++++++++--------------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 4bff3b5..d802fbb 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -20,7 +20,6 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define AAT1290_MOVIE_MODE_CURRENT_ADDR	17
@@ -82,8 +81,6 @@ struct aat1290_led {
 
 	/* brightness cache */
 	unsigned int torch_brightness;
-	/* assures led-triggers compatibility */
-	struct work_struct work_brightness_set;
 };
 
 static struct aat1290_led *fled_cdev_to_led(
@@ -92,6 +89,12 @@ static struct aat1290_led *fled_cdev_to_led(
 	return container_of(fled_cdev, struct aat1290_led, fled_cdev);
 }
 
+static struct led_classdev_flash *led_cdev_to_fled_cdev(
+				struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct led_classdev_flash, led_cdev);
+}
+
 static void aat1290_as2cwire_write(struct aat1290_led *led, int addr, int value)
 {
 	int i;
@@ -134,9 +137,14 @@ static void aat1290_set_flash_safety_timer(struct aat1290_led *led,
 							flash_tm_reg);
 }
 
-static void aat1290_brightness_set(struct aat1290_led *led,
+/* LED subsystem callbacks */
+
+static int aat1290_led_brightness_set(struct led_classdev *led_cdev,
 					enum led_brightness brightness)
 {
+	struct led_classdev_flash *fled_cdev = led_cdev_to_fled_cdev(led_cdev);
+	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
+
 	mutex_lock(&led->lock);
 
 	if (brightness == 0) {
@@ -158,35 +166,6 @@ static void aat1290_brightness_set(struct aat1290_led *led,
 	}
 
 	mutex_unlock(&led->lock);
-}
-
-/* LED subsystem callbacks */
-
-static void aat1290_brightness_set_work(struct work_struct *work)
-{
-	struct aat1290_led *led =
-		container_of(work, struct aat1290_led, work_brightness_set);
-
-	aat1290_brightness_set(led, led->torch_brightness);
-}
-
-static void aat1290_led_brightness_set(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
-
-	led->torch_brightness = brightness;
-	schedule_work(&led->work_brightness_set);
-}
-
-static int aat1290_led_brightness_set_sync(struct led_classdev *led_cdev,
-					enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
-
-	aat1290_brightness_set(led, brightness);
 
 	return 0;
 }
@@ -509,11 +488,9 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	mutex_init(&led->lock);
 
 	/* Initialize LED Flash class device */
-	led_cdev->brightness_set = aat1290_led_brightness_set;
-	led_cdev->brightness_set_blocking = aat1290_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = aat1290_led_brightness_set;
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
-	INIT_WORK(&led->work_brightness_set, aat1290_brightness_set_work);
 
 	aat1290_init_flash_timeout(led, &led_cfg);
 
@@ -548,7 +525,6 @@ static int aat1290_led_remove(struct platform_device *pdev)
 
 	v4l2_flash_release(led->v4l2_flash);
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	mutex_destroy(&led->lock);
 
-- 
1.7.9.5
