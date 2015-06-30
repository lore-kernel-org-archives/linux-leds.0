From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v2 4/5] leds: max77693: remove work queue
Date: Tue, 30 Jun 2015 15:59:29 +0200
Message-ID: <1435672770-4261-4-git-send-email-j.anaszewski@samsung.com>
References: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1435672770-4261-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@
List-Id: linux-leds@vger.kernel.org

Commit 483a3122 ("leds: Use set_brightness_work for brightness_set
ops that can sleep") removed from LED subsystem drivers the
responsibility of using work queues internally.
Modify the driver to benefit from this modification.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-max77693.c |   55 ++++++------------------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index b8b0eec..797ab5b 100644
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
+static void max77693_led_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness value)
 {
-	int ret;
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct max77693_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct max77693_led_device *led = sub_led_to_led(sub_led);
+	int fled_id = sub_led->fled_id, ret;
 
 	mutex_lock(&led->lock);
 
@@ -493,43 +494,6 @@ static int __max77693_led_brightness_set(struct max77693_led_device *led,
 			ret);
 unlock:
 	mutex_unlock(&led->lock);
-	return ret;
-}
-
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
 }
 
 static int max77693_led_flash_brightness_set(
@@ -931,15 +895,12 @@ static void max77693_init_fled_cdev(struct max77693_sub_led *sub_led,
 	led_cdev->name = led_cfg->label[fled_id];
 
 	led_cdev->brightness_set = max77693_led_brightness_set;
-	led_cdev->brightness_set_sync = max77693_led_brightness_set_sync;
 	led_cdev->max_brightness = (led->iout_joint ?
 					led_cfg->iout_torch_max[FLED1] +
 					led_cfg->iout_torch_max[FLED2] :
 					led_cfg->iout_torch_max[fled_id]) /
 				   TORCH_IOUT_STEP;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
-	INIT_WORK(&sub_led->work_brightness_set,
-			max77693_led_brightness_set_work);
 
 	max77693_init_flash_settings(sub_led, led_cfg);
 
@@ -1061,13 +1022,11 @@ static int max77693_led_remove(struct platform_device *pdev)
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
