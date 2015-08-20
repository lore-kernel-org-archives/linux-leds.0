From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 17/36] leds: lm3642: Remove work queue
Date: Thu, 20 Aug 2015 16:43:47 +0200
Message-ID: <1440081846-11697-18-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41235 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552AbbHTOqo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 20 Aug 2015 10:46:44 -0400
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Jeong <daniel.jeong@ti.com>, "G.Shark Jeong" <gshark.jeong@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Jeong <daniel.jeong@ti.com>
Cc: G.Shark Jeong <gshark.jeong@gmail.com>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
---
 drivers/leds/leds-lm3642.c |   73 +++++++++++++-------------------------------
 1 file changed, 22 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 02ebe34..cada084 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -15,7 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/fs.h>
 #include <linux/regmap.h>
-#include <linux/workqueue.h>
 #include <linux/platform_data/leds-lm3642.h>
 
 #define	REG_FILT_TIME			(0x0)
@@ -73,10 +72,6 @@ struct lm3642_chip_data {
 	struct led_classdev cdev_torch;
 	struct led_classdev cdev_indicator;
 
-	struct work_struct work_flash;
-	struct work_struct work_torch;
-	struct work_struct work_indicator;
-
 	u8 br_flash;
 	u8 br_torch;
 	u8 br_indicator;
@@ -209,24 +204,18 @@ out_strtoint:
 
 static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
 
-static void lm3642_deferred_torch_brightness_set(struct work_struct *work)
-{
-	struct lm3642_chip_data *chip =
-	    container_of(work, struct lm3642_chip_data, work_torch);
-
-	mutex_lock(&chip->lock);
-	lm3642_control(chip, chip->br_torch, MODES_TORCH);
-	mutex_unlock(&chip->lock);
-}
-
-static void lm3642_torch_brightness_set(struct led_classdev *cdev,
+static int lm3642_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_torch);
+	int ret;
 
+	mutex_lock(&chip->lock);
 	chip->br_torch = brightness;
-	schedule_work(&chip->work_torch);
+	ret = lm3642_control(chip, chip->br_torch, MODES_TORCH);
+	mutex_unlock(&chip->lock);
+	return ret;
 }
 
 /* flash */
@@ -266,45 +255,33 @@ out_strtoint:
 
 static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
 
-static void lm3642_deferred_strobe_brightness_set(struct work_struct *work)
-{
-	struct lm3642_chip_data *chip =
-	    container_of(work, struct lm3642_chip_data, work_flash);
-
-	mutex_lock(&chip->lock);
-	lm3642_control(chip, chip->br_flash, MODES_FLASH);
-	mutex_unlock(&chip->lock);
-}
-
-static void lm3642_strobe_brightness_set(struct led_classdev *cdev,
+static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_flash);
-
-	chip->br_flash = brightness;
-	schedule_work(&chip->work_flash);
-}
-
-/* indicator */
-static void lm3642_deferred_indicator_brightness_set(struct work_struct *work)
-{
-	struct lm3642_chip_data *chip =
-	    container_of(work, struct lm3642_chip_data, work_indicator);
+	int ret;
 
 	mutex_lock(&chip->lock);
-	lm3642_control(chip, chip->br_indicator, MODES_INDIC);
+	chip->br_flash = brightness;
+	ret = lm3642_control(chip, chip->br_flash, MODES_FLASH);
 	mutex_unlock(&chip->lock);
+	return ret;
 }
 
-static void lm3642_indicator_brightness_set(struct led_classdev *cdev,
+/* indicator */
+static int lm3642_indicator_brightness_set(struct led_classdev *cdev,
 					    enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_indicator);
+	int ret;
 
+	mutex_lock(&chip->lock);
 	chip->br_indicator = brightness;
-	schedule_work(&chip->work_indicator);
+	ret = lm3642_control(chip, chip->br_indicator, MODES_INDIC);
+	mutex_unlock(&chip->lock);
+	return ret;
 }
 
 static const struct regmap_config lm3642_regmap = {
@@ -371,10 +348,9 @@ static int lm3642_probe(struct i2c_client *client,
 		goto err_out;
 
 	/* flash */
-	INIT_WORK(&chip->work_flash, lm3642_deferred_strobe_brightness_set);
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
-	chip->cdev_flash.brightness_set = lm3642_strobe_brightness_set;
+	chip->cdev_flash.brightness_set_blocking = lm3642_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
 	chip->cdev_flash.groups = lm3642_flash_groups,
 	err = led_classdev_register((struct device *)
@@ -385,10 +361,9 @@ static int lm3642_probe(struct i2c_client *client,
 	}
 
 	/* torch */
-	INIT_WORK(&chip->work_torch, lm3642_deferred_torch_brightness_set);
 	chip->cdev_torch.name = "torch";
 	chip->cdev_torch.max_brightness = 8;
-	chip->cdev_torch.brightness_set = lm3642_torch_brightness_set;
+	chip->cdev_torch.brightness_set_blocking = lm3642_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
 	chip->cdev_torch.groups = lm3642_torch_groups,
 	err = led_classdev_register((struct device *)
@@ -399,11 +374,10 @@ static int lm3642_probe(struct i2c_client *client,
 	}
 
 	/* indicator */
-	INIT_WORK(&chip->work_indicator,
-		  lm3642_deferred_indicator_brightness_set);
 	chip->cdev_indicator.name = "indicator";
 	chip->cdev_indicator.max_brightness = 8;
-	chip->cdev_indicator.brightness_set = lm3642_indicator_brightness_set;
+	chip->cdev_indicator.brightness_set_blocking =
+						lm3642_indicator_brightness_set;
 	err = led_classdev_register((struct device *)
 				    &client->dev, &chip->cdev_indicator);
 	if (err < 0) {
@@ -427,11 +401,8 @@ static int lm3642_remove(struct i2c_client *client)
 	struct lm3642_chip_data *chip = i2c_get_clientdata(client);
 
 	led_classdev_unregister(&chip->cdev_indicator);
-	flush_work(&chip->work_indicator);
 	led_classdev_unregister(&chip->cdev_torch);
-	flush_work(&chip->work_torch);
 	led_classdev_unregister(&chip->cdev_flash);
-	flush_work(&chip->work_flash);
 	regmap_write(chip->regmap, REG_ENABLE, 0);
 	return 0;
 }
-- 
1.7.9.5
