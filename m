From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 13/51] leds: lm3642: Remove work queue
Date: Fri, 17 Jul 2015 10:46:59 +0200
Message-ID: <1437122857-6765-14-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Daniel Jeong <daniel.jeong@ti.com>, "G.Shark Jeong" <gshark.jeong@gmail.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Jeong <daniel.jeong@ti.com>
Cc: G.Shark Jeong <gshark.jeong@gmail.com>
---
 drivers/leds/leds-lm3642.c |   54 ++++++++------------------------------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index d3dec01..b54f98d 100644
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
@@ -209,24 +204,16 @@ out_strtoint:
 
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
 static void lm3642_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_torch);
 
+	mutex_lock(&chip->lock);
 	chip->br_torch = brightness;
-	schedule_work(&chip->work_torch);
+	lm3642_control(chip, chip->br_torch, MODES_TORCH);
+	mutex_unlock(&chip->lock);
 }
 
 /* flash */
@@ -266,45 +253,29 @@ out_strtoint:
 
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
 static void lm3642_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_flash);
 
-	chip->br_flash = brightness;
-	schedule_work(&chip->work_flash);
-}
-
-/* indicator */
-static void lm3642_deferred_indicator_brightness_set(struct work_struct *work)
-{
-	struct lm3642_chip_data *chip =
-	    container_of(work, struct lm3642_chip_data, work_indicator);
-
 	mutex_lock(&chip->lock);
-	lm3642_control(chip, chip->br_indicator, MODES_INDIC);
+	chip->br_flash = brightness;
+	lm3642_control(chip, chip->br_flash, MODES_FLASH);
 	mutex_unlock(&chip->lock);
 }
 
+/* indicator */
 static void lm3642_indicator_brightness_set(struct led_classdev *cdev,
 					    enum led_brightness brightness)
 {
 	struct lm3642_chip_data *chip =
 	    container_of(cdev, struct lm3642_chip_data, cdev_indicator);
 
+	mutex_lock(&chip->lock);
 	chip->br_indicator = brightness;
-	schedule_work(&chip->work_indicator);
+	lm3642_control(chip, chip->br_indicator, MODES_INDIC);
+	mutex_unlock(&chip->lock);
 }
 
 static const struct regmap_config lm3642_regmap = {
@@ -371,7 +342,6 @@ static int lm3642_probe(struct i2c_client *client,
 		goto err_out;
 
 	/* flash */
-	INIT_WORK(&chip->work_flash, lm3642_deferred_strobe_brightness_set);
 	chip->cdev_flash.name = "flash";
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set = lm3642_strobe_brightness_set;
@@ -385,7 +355,6 @@ static int lm3642_probe(struct i2c_client *client,
 	}
 
 	/* torch */
-	INIT_WORK(&chip->work_torch, lm3642_deferred_torch_brightness_set);
 	chip->cdev_torch.name = "torch";
 	chip->cdev_torch.max_brightness = 8;
 	chip->cdev_torch.brightness_set = lm3642_torch_brightness_set;
@@ -399,8 +368,6 @@ static int lm3642_probe(struct i2c_client *client,
 	}
 
 	/* indicator */
-	INIT_WORK(&chip->work_indicator,
-		  lm3642_deferred_indicator_brightness_set);
 	chip->cdev_indicator.name = "indicator";
 	chip->cdev_indicator.max_brightness = 8;
 	chip->cdev_indicator.brightness_set = lm3642_indicator_brightness_set;
@@ -427,11 +394,8 @@ static int lm3642_remove(struct i2c_client *client)
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
