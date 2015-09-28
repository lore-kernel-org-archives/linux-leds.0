From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2 11/12] leds: ktd2692: Remove work queue
Date: Mon, 28 Sep 2015 15:07:20 +0200
Message-ID: <1443445641-9529-12-git-send-email-j.anaszewski@samsung.com>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38265 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933584AbbI1NIB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2015 09:08:01 -0400
In-reply-to: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, rpurdie@rpsys.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Ingi Kim <ingi2.kim@samsung.com>

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ingi Kim <ingi2.kim@samsung.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-ktd2692.c |   41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index e37de14..abd04bf 100644
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
+static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
+				       enum led_brightness brightness)
 {
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
+
 	mutex_lock(&led->lock);
 
 	if (brightness == LED_OFF) {
@@ -174,33 +175,6 @@ static void ktd2692_brightness_set(struct ktd2692_context *led,
 
 	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
 	mutex_unlock(&led->lock);
-}
-
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
 
 	return 0;
 }
@@ -381,12 +355,10 @@ static int ktd2692_probe(struct platform_device *pdev)
 	fled_cdev->ops = &flash_ops;
 
 	led_cdev->max_brightness = led_cfg.max_brightness;
-	led_cdev->brightness_set = ktd2692_led_brightness_set;
-	led_cdev->brightness_set_blocking = ktd2692_led_brightness_set_sync;
+	led_cdev->brightness_set_blocking = ktd2692_led_brightness_set;
 	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
 
 	platform_set_drvdata(pdev, led);
 
@@ -408,7 +380,6 @@ static int ktd2692_remove(struct platform_device *pdev)
 	int ret;
 
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);
-- 
1.7.9.5
