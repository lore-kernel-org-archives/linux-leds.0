From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 36/36] leds: lm355x: Remove work queue
Date: Thu, 20 Aug 2015 16:44:06 +0200
Message-ID: <1440081846-11697-37-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45352 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753915AbbHTOr7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Aug 2015 10:47:59 -0400
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Daniel Jeong <daniel.jeong@ti.com>, "G.Shark Jeong" <gshark.jeong@gmail.com>

Now the core implements the work queue, remove it from the drivers,
and switch to using brightness_set_blocking op.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Daniel Jeong <daniel.jeong@ti.com>
Cc: G.Shark Jeong <gshark.jeong@gmail.com>
---
 drivers/leds/leds-lm355x.c |   85 ++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 59 deletions(-)

diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 48872997..6cb94f9 100644
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
@@ -204,7 +195,7 @@ out:
 }
 
 /* chip control */
-static void lm355x_control(struct lm355x_chip_data *chip,
+static int lm355x_control(struct lm355x_chip_data *chip,
 			   u8 brightness, enum lm355x_mode opmode)
 {
 	int ret;
@@ -301,7 +292,7 @@ static void lm355x_control(struct lm355x_chip_data *chip,
 	case MODE_SHDN:
 		break;
 	default:
-		return;
+		return -EINVAL;
 	}
 	/* operation mode control */
 	ret = regmap_update_bits(chip->regmap, preg[REG_OPMODE].regno,
@@ -309,73 +300,55 @@ static void lm355x_control(struct lm355x_chip_data *chip,
 				 opmode << preg[REG_OPMODE].shift);
 	if (ret < 0)
 		goto out;
-	return;
+	return ret;
 out:
 	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
-	return;
+	return ret;
 }
 
 /* torch */
-static void lm355x_deferred_torch_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_torch);
 
-	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_torch, MODE_TORCH);
-	mutex_unlock(&chip->lock);
-}
-
-static void lm355x_torch_brightness_set(struct led_classdev *cdev,
+static int lm355x_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_torch);
-
-	chip->br_torch = brightness;
-	schedule_work(&chip->work_torch);
-}
-
-/* flash */
-static void lm355x_deferred_strobe_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_flash);
+	int ret;
 
 	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_flash, MODE_FLASH);
+	ret = lm355x_control(chip, brightness, MODE_TORCH);
 	mutex_unlock(&chip->lock);
+	return ret;
 }
 
-static void lm355x_strobe_brightness_set(struct led_classdev *cdev,
+/* flash */
+
+static int lm355x_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_flash);
-
-	chip->br_flash = brightness;
-	schedule_work(&chip->work_flash);
-}
-
-/* indicator */
-static void lm355x_deferred_indicator_brightness_set(struct work_struct *work)
-{
-	struct lm355x_chip_data *chip =
-	    container_of(work, struct lm355x_chip_data, work_indicator);
+	int ret;
 
 	mutex_lock(&chip->lock);
-	lm355x_control(chip, chip->br_indicator, MODE_INDIC);
+	ret = lm355x_control(chip, brightness, MODE_FLASH);
 	mutex_unlock(&chip->lock);
+	return ret;
 }
 
-static void lm355x_indicator_brightness_set(struct led_classdev *cdev,
+/* indicator */
+
+static int lm355x_indicator_brightness_set(struct led_classdev *cdev,
 					    enum led_brightness brightness)
 {
 	struct lm355x_chip_data *chip =
 	    container_of(cdev, struct lm355x_chip_data, cdev_indicator);
+	int ret;
 
-	chip->br_indicator = brightness;
-	schedule_work(&chip->work_indicator);
+	mutex_lock(&chip->lock);
+	ret = lm355x_control(chip, brightness, MODE_INDIC);
+	mutex_unlock(&chip->lock);
+	return ret;
 }
 
 /* indicator pattern only for lm3556*/
@@ -479,34 +452,31 @@ static int lm355x_probe(struct i2c_client *client,
 		goto err_out;
 
 	/* flash */
-	INIT_WORK(&chip->work_flash, lm355x_deferred_strobe_brightness_set);
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
-	chip->cdev_flash.brightness_set = lm355x_strobe_brightness_set;
+	chip->cdev_flash.brightness_set_blocking = lm355x_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_flash);
 	if (err < 0)
 		goto err_out;
 	/* torch */
-	INIT_WORK(&chip->work_torch, lm355x_deferred_torch_brightness_set);
 	chip->cdev_torch.name = "torch";
 	chip->cdev_torch.max_brightness = 8;
-	chip->cdev_torch.brightness_set = lm355x_torch_brightness_set;
+	chip->cdev_torch.brightness_set_blocking = lm355x_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
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
 	else
 		chip->cdev_indicator.max_brightness = 8;
-	chip->cdev_indicator.brightness_set = lm355x_indicator_brightness_set;
+	chip->cdev_indicator.brightness_set_blocking =
+					lm355x_indicator_brightness_set;
 	/* indicator pattern control only for LM3556 */
 	if (id->driver_data == CHIP_LM3556)
 		chip->cdev_indicator.groups = lm355x_indicator_groups;
@@ -534,11 +504,8 @@ static int lm355x_remove(struct i2c_client *client)
 
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
