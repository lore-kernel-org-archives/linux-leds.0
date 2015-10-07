From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v3 02/10] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Wed, 07 Oct 2015 11:10:40 +0200
Message-ID: <1444209048-29415-3-git-send-email-j.anaszewski@samsung.com>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

The initial purpose of brightness_set_sync op, introduced along with
the LED flash class extension, was to add a means for setting torch LED
brightness as soon as possible, which couldn't have been guaranteed by
brightness_set op. This patch renames the op to brightness_set_blocking,
which describes its purpose in a more generic way. It is beneficial
in view of the prospective changes in the LED core, aiming at removing
the need for using work queues in LED class drivers that can sleep
or use delays while setting brightness.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/led-class-flash.c |    2 +-
 drivers/leds/leds-aat1290.c    |    2 +-
 drivers/leds/leds-ktd2692.c    |    2 +-
 drivers/leds/leds-max77693.c   |    2 +-
 drivers/leds/leds.h            |    2 +-
 include/linux/leds.h           |    4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

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
index ac77d36..c56f9a9 100644
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
index feca07b..e37de14 100644
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
index afbb140..9f7240b 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -932,7 +932,7 @@ static void max77693_init_fled_cdev(struct max77693_sub_led *sub_led,
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
index 84521e5..b47eff5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -59,8 +59,8 @@ struct led_classdev {
 	 * Set LED brightness level immediately - it can block the caller for
 	 * the time required for accessing a LED device register.
 	 */
-	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
-					enum led_brightness brightness);
+	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
+				       enum led_brightness brightness);
 	/* Get LED brightness level */
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
-- 
1.7.9.5
