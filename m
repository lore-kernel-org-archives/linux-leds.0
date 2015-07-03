From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v3 5/7] leds: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Fri, 03 Jul 2015 15:10:50 +0200
Message-ID: <1435929052-8736-6-git-send-email-j.anaszewski@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41484 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755284AbbGCNOy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2015 09:14:54 -0400
In-reply-to: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@epfl.ch, raph@

This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS sync flags.
led_set_brightness now calls led_set_brightness_nosleep rather then
choosing between sync and async op basing on the flags defined by the
driver. Caller can use led_set_brightness_sync API to make sure that
brightness_set op will be called synchronously.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-class-flash.c |    7 -----
 drivers/leds/led-class.c       |    2 --
 drivers/leds/led-core.c        |   17 ++-----------
 drivers/leds/leds-aat1290.c    |   50 +++++++++---------------------------
 drivers/leds/leds-ktd2692.c    |   41 ++++--------------------------
 drivers/leds/leds-max77693.c   |   55 +++++-----------------------------------
 include/linux/leds.h           |   30 +++++-----------------
 7 files changed, 33 insertions(+), 169 deletions(-)

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
index 964750a..d8d7a76 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -280,8 +280,6 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness = LED_FULL;
 
-	led_cdev->flags |= SET_BRIGHTNESS_ASYNC;
-
 	led_update_brightness(led_cdev);
 
 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 428f04c..5f869fa 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -118,8 +118,6 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
 void led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	int ret = 0;
-
 	/*
 	 * In case blinking is on delay brightness setting
 	 * until the next timer tick.
@@ -137,20 +135,9 @@ void led_set_brightness(struct led_classdev *led_cdev,
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
 
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 1ac525b..318bcf0 100644
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
+static void aat1290_led_brightness_set(struct led_classdev *led_cdev,
 					enum led_brightness brightness)
 {
+	struct led_classdev_flash *fled_cdev = led_cdev_to_fled_cdev(led_cdev);
+	struct aat1290_led *led = fled_cdev_to_led(fled_cdev);
+
 	mutex_lock(&led->lock);
 
 	if (brightness == 0) {
@@ -160,37 +168,6 @@ static void aat1290_brightness_set(struct aat1290_led *led,
 	mutex_unlock(&led->lock);
 }
 
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
-
-	return 0;
-}
-
 static int aat1290_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 					 bool state)
 
@@ -510,10 +487,8 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	/* Initialize LED Flash class device */
 	led_cdev->brightness_set = aat1290_led_brightness_set;
-	led_cdev->brightness_set_sync = aat1290_led_brightness_set_sync;
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
-	INIT_WORK(&led->work_brightness_set, aat1290_brightness_set_work);
 
 	aat1290_init_flash_timeout(led, &led_cfg);
 
@@ -548,7 +523,6 @@ static int aat1290_led_remove(struct platform_device *pdev)
 
 	v4l2_flash_release(led->v4l2_flash);
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	mutex_destroy(&led->lock);
 
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 2ae8c4d..1e92656 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -18,7 +18,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/workqueue.h>
 
 /* Value related the movie mode */
 #define KTD2692_MOVIE_MODE_CURRENT_LEVELS	16
@@ -82,7 +81,6 @@ struct ktd2692_context {
 	/* secures access to the device */
 	struct mutex lock;
 	struct regulator *regulator;
-	struct work_struct work_brightness_set;
 
 	struct gpio_desc *aux_gpio;
 	struct gpio_desc *ctrl_gpio;
@@ -158,9 +156,12 @@ static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
 	ktd2692_expresswire_end(led);
 }
 
-static void ktd2692_brightness_set(struct ktd2692_context *led,
-				   enum led_brightness brightness)
+static void ktd2692_led_brightness_set(struct led_classdev *led_cdev,
+				       enum led_brightness brightness)
 {
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
 	mutex_lock(&led->lock);
 
 	if (brightness == LED_OFF) {
@@ -176,35 +177,6 @@ static void ktd2692_brightness_set(struct ktd2692_context *led,
 	mutex_unlock(&led->lock);
 }
 
-static void ktd2692_brightness_set_work(struct work_struct *work)
-{
-	struct ktd2692_context *led =
-		container_of(work, struct ktd2692_context, work_brightness_set);
-
-	ktd2692_brightness_set(led, led->torch_brightness);
-}
-
-static void ktd2692_led_brightness_set(struct led_classdev *led_cdev,
-				       enum led_brightness brightness)
-{
-	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
-
-	led->torch_brightness = brightness;
-	schedule_work(&led->work_brightness_set);
-}
-
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
@@ -382,11 +354,9 @@ static int ktd2692_probe(struct platform_device *pdev)
 
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->brightness_set = ktd2692_led_brightness_set;
-	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
 	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
 
 	platform_set_drvdata(pdev, led);
 
@@ -408,7 +378,6 @@ static int ktd2692_remove(struct platform_device *pdev)
 	int ret;
 
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);
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
diff --git a/include/linux/leds.h b/include/linux/leds.h
index a982626..efe564b 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -45,22 +45,14 @@ struct led_classdev {
 #define LED_BLINK_ONESHOT_STOP	(1 << 18)
 #define LED_BLINK_INVERT	(1 << 19)
 #define LED_SYSFS_DISABLE	(1 << 20)
-#define SET_BRIGHTNESS_ASYNC	(1 << 21)
-#define SET_BRIGHTNESS_SYNC	(1 << 22)
-#define LED_DEV_CAP_FLASH	(1 << 23)
-#define LED_BLINK_DISABLE	(1 << 24)
-#define LED_BRIGHTNESS_FAST	(1 << 25)
+#define LED_DEV_CAP_FLASH	(1 << 21)
+#define LED_BLINK_DISABLE	(1 << 22)
+#define LED_BRIGHTNESS_FAST	(1 << 23)
 
 	/* Set LED brightness level */
 	/* Must not sleep, use a workqueue if needed */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
-	/*
-	 * Set LED brightness level immediately - it can block the caller for
-	 * the time required for accessing a LED device register.
-	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
@@ -159,7 +151,7 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
  *
  * Set an LED's brightness, and, if necessary, cancel the
  * software blink timer that implements blinking when the
- * hardware doesn't.
+ * hardware doesn't. This function is guaranteed not to sleep.
  */
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
@@ -173,23 +165,15 @@ extern void led_set_brightness(struct led_classdev *led_cdev,
  * the caller for the time required for accessing device register,
  * and it can sleep.
  */
-static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
+static inline void led_set_brightness_sync(struct led_classdev *led_cdev,
 					  enum led_brightness value)
 {
-	int ret = 0;
-
 	led_cdev->brightness = min(value, led_cdev->max_brightness);
 
 	if (led_cdev->flags & LED_SUSPENDED)
-		return 0;
-
-	if (led_cdev->brightness_set_sync)
-		ret = led_cdev->brightness_set_sync(led_cdev,
-						    led_cdev->brightness);
-	else
-		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
+		return;
 
-	return 0;
+	led_cdev->brightness_set(led_cdev, led_cdev->brightness);
 }
 
 /**
-- 
1.7.9.5
