From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 37/57] leds: lm355x: Remove work queue
Date: Tue, 11 Aug 2015 11:37:50 +0200
Message-ID: <1439285890-27329-38-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Jacek Anaszewski <j.anaszewski@samsung.com>, Daniel Jeong <daniel.jeong@ti.com>, "G.Shark Jeong" <gshark.jeong@gmail.com>
List-Id: linux-leds@vger.kernel.org

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Daniel Jeong <daniel.jeong@ti.com>
Cc: G.Shark Jeong <gshark.jeong@gmail.com>
---
 drivers/leds/leds-lm355x.c |   61 +++++++++-----------------------------------
 1 file changed, 12 insertions(+), 49 deletions(-)

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 48872997..d2e74e9 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/fs.h>
 #include <linux/regmap.h>
-#include <linux/workqueue.h>
 #include <linux/platform_data/leds-lm355x.h>
 
 enum lm355x_type {
@@ -59,14 +58,6 @@ struct lm355x_chip_data {
 	struct led_classdev cdev_torch;
 	struct led_classdev cdev_indicator;
 
-	struct work_struct work_flash;
-	struct work_struct work_torch;
-	struct work_struct work_indicator;
-
-	u8 br_flash;
-	u8 br_torch;
-	u8 br_indicator;
-
 	struct lm355x_platform_data *pdata;
 	struct regmap *regmap;
 	struct mutex lock;
@@ -316,15 +307,6 @@ out:
 }
 
 /* torch */
-static void lm355x_deferred_torch_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_torch);
-
-	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_torch, MODE_TORCH);
-	mutex_unlock(&chip->lock);
-}
 
 static void lm355x_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
@@ -332,50 +314,35 @@ static void lm355x_torch_brightness_set(struct led_classdev *cdev,
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_torch);
 
-	chip->br_torch = brightness;
-	schedule_work(&chip->work_torch);
-}
-
-/* flash */
-static void lm355x_deferred_strobe_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_flash);
-
 	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_flash, MODE_FLASH);
+	lm355x_control(chip, brightness, MODE_TORCH);
 	mutex_unlock(&chip->lock);
 }
 
+/* flash */
+
 static void lm355x_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_flash);
 
-	chip->br_flash = brightness;
-	schedule_work(&chip->work_flash);
-}
-
-/* indicator */
-static void lm355x_deferred_indicator_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_indicator);
-
 	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_indicator, MODE_INDIC);
+	lm355x_control(chip, brightness, MODE_FLASH);
 	mutex_unlock(&chip->lock);
 }
 
+/* indicator */
+
 static void lm355x_indicator_brightness_set(struct led_classdev *cdev,
 					    enum led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_indicator);
 
-	chip->br_indicator = brightness;
-	schedule_work(&chip->work_indicator);
+	mutex_lock(&chip->lock);
+	lm355x_control(chip, brightness, MODE_INDIC);
+	mutex_unlock(&chip->lock);
 }
 
 /* indicator pattern only for lm3556*/
@@ -479,28 +446,26 @@ static int lm355x_probe(struct i2c_client *client,
 		goto err_out;
 
 	/* flash */
-	INIT_WORK(&chip->work_flash, lm355x_deferred_strobe_brightness_set);
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set = lm355x_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
+	chip->cdev_flash.flags |= LED_BRIGHTNESS_BLOCKING;
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_flash);
 	if (err < 0)
 		goto err_out;
 	/* torch */
-	INIT_WORK(&chip->work_torch, lm355x_deferred_torch_brightness_set);
 	chip->cdev_torch.name = "torch";
 	chip->cdev_torch.max_brightness = 8;
 	chip->cdev_torch.brightness_set = lm355x_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
+	chip->cdev_torch.flags |= LED_BRIGHTNESS_BLOCKING;
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_torch);
 	if (err < 0)
 		goto err_create_torch_file;
 	/* indicator */
-	INIT_WORK(&chip->work_indicator,
-		  lm355x_deferred_indicator_brightness_set);
 	chip->cdev_indicator.name = "indicator";
 	if (id->driver_data == CHIP_LM3554)
 		chip->cdev_indicator.max_brightness = 4;
@@ -510,6 +475,7 @@ static int lm355x_probe(struct i2c_client *client,
 	/* indicator pattern control only for LM3556 */
 	if (id->driver_data == CHIP_LM3556)
 		chip->cdev_indicator.groups = lm355x_indicator_groups;
+	chip->cdev_indicator.flags |= LED_BRIGHTNESS_BLOCKING;
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_indicator);
 	if (err < 0)
@@ -534,11 +500,8 @@ static int lm355x_remove(struct i2c_client *client)
 
 	regmap_write(chip->regmap, preg[REG_OPMODE].regno, 0);
 	led_classdev_unregister(&chip->cdev_indicator);
-	flush_work(&chip->work_indicator);
 	led_classdev_unregister(&chip->cdev_torch);
-	flush_work(&chip->work_torch);
 	led_classdev_unregister(&chip->cdev_flash);
-	flush_work(&chip->work_flash);
 	dev_info(&client->dev, "%s is removed\n", lm355x_name[chip->type]);
 
 	return 0;
-- 
1.7.9.5
