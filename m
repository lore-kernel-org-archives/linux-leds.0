From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v5 21/57] leds: lp55xx: Remove work queue
Date: Tue, 11 Aug 2015 11:37:34 +0200
Message-ID: <1439285890-27329-22-git-send-email-j.anaszewski@samsung.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5521.c        |    6 ++----
 drivers/leds/leds-lp5523.c        |    6 ++----
 drivers/leds/leds-lp5562.c        |    6 ++----
 drivers/leds/leds-lp55xx-common.c |    9 ++++-----
 drivers/leds/leds-lp55xx-common.h |    6 ++----
 drivers/leds/leds-lp8501.c        |    6 ++----
 6 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 8ca197a..9893f7b 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -362,10 +362,8 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
-static void lp5521_led_brightness_work(struct work_struct *work)
+static void lp5521_led_brightness(struct lp55xx_led *led)
 {
-	struct lp55xx_led *led = container_of(work, struct lp55xx_led,
-					      brightness_work);
 	struct lp55xx_chip *chip = led->chip;
 
 	mutex_lock(&chip->lock);
@@ -501,7 +499,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 	},
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
-	.brightness_work_fn = lp5521_led_brightness_work,
+	.brightness_fn      = lp5521_led_brightness,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp5521_firmware_loaded,
 	.run_engine         = lp5521_run_engine,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 584dbbc..35d58ac 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -802,10 +802,8 @@ leave:
 	return ret;
 }
 
-static void lp5523_led_brightness_work(struct work_struct *work)
+static void lp5523_led_brightness(struct lp55xx_led *led)
 {
-	struct lp55xx_led *led = container_of(work, struct lp55xx_led,
-					      brightness_work);
 	struct lp55xx_chip *chip = led->chip;
 
 	mutex_lock(&chip->lock);
@@ -867,7 +865,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	},
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
-	.brightness_work_fn = lp5523_led_brightness_work,
+	.brightness_fn      = lp5523_led_brightness,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp5523_firmware_loaded,
 	.run_engine         = lp5523_run_engine,
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index ca85724..0c0487b 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -311,10 +311,8 @@ static int lp5562_post_init_device(struct lp55xx_chip *chip)
 	return 0;
 }
 
-static void lp5562_led_brightness_work(struct work_struct *work)
+static void lp5562_led_brightness(struct lp55xx_led *led)
 {
-	struct lp55xx_led *led = container_of(work, struct lp55xx_led,
-					      brightness_work);
 	struct lp55xx_chip *chip = led->chip;
 	u8 addr[] = {
 		LP5562_REG_R_PWM,
@@ -503,7 +501,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 	},
 	.post_init_device   = lp5562_post_init_device,
 	.set_led_current    = lp5562_set_led_current,
-	.brightness_work_fn = lp5562_led_brightness_work,
+	.brightness_fn      = lp5562_led_brightness,
 	.run_engine         = lp5562_run_engine,
 	.firmware_cb        = lp5562_firmware_loaded,
 	.dev_attr_group     = &lp5562_group,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 96d51e9..b3c834b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -138,9 +138,10 @@ static void lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
+	struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led->brightness = (u8)brightness;
-	schedule_work(&led->brightness_work);
+	cfg->brightness_fn(led);
 }
 
 static int lp55xx_init_led(struct lp55xx_led *led,
@@ -174,6 +175,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 
 	led->cdev.brightness_set = lp55xx_set_brightness;
 	led->cdev.groups = lp55xx_led_groups;
+	led->cdev.flags |= LED_BRIGHTNESS_BLOCKING;
 
 	if (pdata->led_config[chan].name) {
 		led->cdev.name = pdata->led_config[chan].name;
@@ -464,7 +466,7 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 	int ret;
 	int i;
 
-	if (!cfg->brightness_work_fn) {
+	if (!cfg->brightness_fn) {
 		dev_err(&chip->cl->dev, "empty brightness configuration\n");
 		return -EINVAL;
 	}
@@ -481,8 +483,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 		if (ret)
 			goto err_init_led;
 
-		INIT_WORK(&each->brightness_work, cfg->brightness_work_fn);
-
 		chip->num_leds++;
 		each->chip = chip;
 
@@ -507,7 +507,6 @@ void lp55xx_unregister_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 	for (i = 0; i < chip->num_leds; i++) {
 		each = led + i;
 		led_classdev_unregister(&each->cdev);
-		flush_work(&each->brightness_work);
 	}
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_leds);
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index cceab48..0a045d0 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -95,7 +95,7 @@ struct lp55xx_reg {
  * @enable             : Chip specific enable command
  * @max_channel        : Maximum number of channels
  * @post_init_device   : Chip specific initialization code
- * @brightness_work_fn : Brightness work function
+ * @brightness_fn      : Brightness function
  * @set_led_current    : LED current set function
  * @firmware_cb        : Call function when the firmware is loaded
  * @run_engine         : Run internal engine for pattern
@@ -110,7 +110,7 @@ struct lp55xx_device_config {
 	int (*post_init_device) (struct lp55xx_chip *chip);
 
 	/* access brightness register */
-	void (*brightness_work_fn)(struct work_struct *work);
+	void (*brightness_fn)(struct lp55xx_led *led);
 
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
@@ -164,7 +164,6 @@ struct lp55xx_chip {
  * @cdev            : LED class device
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
- * @brightness_work : Workqueue for brightness control
  * @brightness      : Brightness value
  * @chip            : The lp55xx chip data
  */
@@ -173,7 +172,6 @@ struct lp55xx_led {
 	struct led_classdev cdev;
 	u8 led_current;
 	u8 max_current;
-	struct work_struct brightness_work;
 	u8 brightness;
 	struct lp55xx_chip *chip;
 };
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d3098e3..753ce15 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -272,10 +272,8 @@ static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 	lp8501_update_program_memory(chip, fw->data, fw->size);
 }
 
-static void lp8501_led_brightness_work(struct work_struct *work)
+static void lp8501_led_brightness(struct lp55xx_led *led)
 {
-	struct lp55xx_led *led = container_of(work, struct lp55xx_led,
-					      brightness_work);
 	struct lp55xx_chip *chip = led->chip;
 
 	mutex_lock(&chip->lock);
@@ -296,7 +294,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 	},
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
-	.brightness_work_fn = lp8501_led_brightness_work,
+	.brightness_fn      = lp8501_led_brightness,
 	.set_led_current    = lp8501_set_led_current,
 	.firmware_cb        = lp8501_firmware_loaded,
 	.run_engine         = lp8501_run_engine,
-- 
1.7.9.5
