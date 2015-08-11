From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 08/57] leds: ktd2692: Remove work queue
Date: Tue, 11 Aug 2015 11:37:21 +0200
Message-ID: <1439285890-27329-9-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/leds/leds-ktd2692.c |   32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 7f6758d..fc7f253 100644
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
@@ -176,24 +177,6 @@ static void ktd2692_brightness_set(struct ktd2692_context *led,
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
 static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 					bool state)
 {
@@ -371,10 +354,10 @@ static int ktd2692_probe(struct platform_device *pdev)
 
 	led_cdev->max_brightness = led_cfg.max_brightness;
 	led_cdev->brightness_set = ktd2692_led_brightness_set;
-	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
+	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH |
+			   LED_BRIGHTNESS_BLOCKING;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
 
 	platform_set_drvdata(pdev, led);
 
@@ -396,7 +379,6 @@ static int ktd2692_remove(struct platform_device *pdev)
 	int ret;
 
 	led_classdev_flash_unregister(&led->fled_cdev);
-	cancel_work_sync(&led->work_brightness_set);
 
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);
-- 
1.7.9.5
