From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 3/5] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Wed, 16 Sep 2015 12:47:42 +0200
Message-ID: <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

The initial purpose of brightness_set_sync op, introduced along with
the LED flash class extension, was to add a means for setting torch LED
brightness as soon as possible, which couldn't have been guaranteed by
brightness_set op. This patch renames the op to brightness_set_blocking,
which describes its purpose in a more generic way, and is beneficial
in view of the prospective changes in the core related to using
LED core's set_brightness_work for setting brightness for LED class
drivers that can sleep or use delays while setting brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/led-class-flash.c |    2 +-
 drivers/leds/leds-aat1290.c    |    2 +-
 drivers/leds/leds-ktd2692.c    |    2 +-
 drivers/leds/leds-max77693.c   |    2 +-
 drivers/leds/leds.h            |    2 +-
 include/linux/leds.h           |    9 +++------
 6 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3b25734..300a2c9 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -298,7 +298,7 @@ int led_classdev_flash_register(struct device *parent,
 	led_cdev = &fled_cdev->led_cdev;
 
 	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
-		if (!led_cdev->brightness_set_sync)
+		if (!led_cdev->brightness_set_blocking)
 			return -EINVAL;
 
 		ops = fled_cdev->ops;
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index fd7c25f..4bff3b5 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -510,7 +510,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	/* Initialize LED Flash class device */
 	led_cdev->brightness_set = aat1290_led_brightness_set;
-	led_cdev->brightness_set_sync = aat1290_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = aat1290_led_brightness_set_sync;
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 	INIT_WORK(&led->work_brightness_set, aat1290_brightness_set_work);
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 2ae8c4d..4c14bed 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -382,7 +382,7 @@ static int ktd2692_probe(struct platform_device *pdev)
 
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->brightness_set = ktd2692_led_brightness_set;
-	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = ktd2692_led_brightness_set_sync;
 	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
 	mutex_init(&led->lock);
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index b8b0eec..f69bcb4 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -931,7 +931,7 @@ static void max77693_init_fled_cdev(struct max77693_sub_led *sub_led,
 	led_cdev->name = led_cfg->label[fled_id];
 
 	led_cdev->brightness_set = max77693_led_brightness_set;
-	led_cdev->brightness_set_sync = max77693_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = max77693_led_brightness_set_sync;
 	led_cdev->max_brightness = (led->iout_joint ?
 					led_cfg->iout_torch_max[FLED1] +
 					led_cfg->iout_torch_max[FLED2] :
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 4238fbc..cf6d448 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -34,7 +34,7 @@ static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
 	led_cdev->brightness = min(value, led_cdev->max_brightness);
 
 	if (!(led_cdev->flags & LED_SUSPENDED))
-		ret = led_cdev->brightness_set_sync(led_cdev,
+		ret = led_cdev->brightness_set_blocking(led_cdev,
 						led_cdev->brightness);
 	return ret;
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 188352c..9f850e6 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -55,12 +55,9 @@ struct led_classdev {
 	/* Must not sleep, use a workqueue if needed */
 	void		(*brightness_set)(struct led_classdev *led_cdev,
 					  enum led_brightness brightness);
-	/*
-	 * Set LED brightness level immediately - it can block the caller for
-	 * the time required for accessing a LED device register.
-	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
+	/* Can sleep or use delays */
+	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
+				       enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
-- 
1.7.9.5
