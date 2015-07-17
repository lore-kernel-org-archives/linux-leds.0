From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 18/51] leds: lp8860: Remove work queue
Date: Fri, 17 Jul 2015 10:47:04 +0200
Message-ID: <1437122857-6765-19-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c |   24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 8c2b7fb..40e0ed8 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -91,26 +91,22 @@
 /**
  * struct lp8860_led -
  * @lock - Lock for reading/writing the device
- * @work - Work item used to off load the brightness register writes
  * @client - Pointer to the I2C client
  * @led_dev - led class device pointer
  * @regmap - Devices register map
  * @eeprom_regmap - EEPROM register map
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
- * @brightness - Current brightness value requested
  * @label - LED label
 **/
 struct lp8860_led {
 	struct mutex lock;
-	struct work_struct work;
 	struct i2c_client *client;
 	struct led_classdev led_dev;
 	struct regmap *regmap;
 	struct regmap *eeprom_regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
-	enum led_brightness brightness;
 	const char *label;
 };
 
@@ -212,11 +208,13 @@ out:
 	return ret;
 }
 
-static void lp8860_led_brightness_work(struct work_struct *work)
+static void lp8860_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness brt_val)
 {
-	struct lp8860_led *led = container_of(work, struct lp8860_led, work);
+	struct lp8860_led *led =
+			container_of(led_cdev, struct lp8860_led, led_dev);
+	int disp_brightness = brt_val * 255;
 	int ret;
-	int disp_brightness = led->brightness * 255;
 
 	mutex_lock(&led->lock);
 
@@ -243,16 +241,6 @@ out:
 	mutex_unlock(&led->lock);
 }
 
-static void lp8860_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness brt_val)
-{
-	struct lp8860_led *led =
-			container_of(led_cdev, struct lp8860_led, led_dev);
-
-	led->brightness = brt_val;
-	schedule_work(&led->work);
-}
-
 static int lp8860_init(struct lp8860_led *led)
 {
 	unsigned int read_buf;
@@ -409,7 +397,6 @@ static int lp8860_probe(struct i2c_client *client,
 	led->led_dev.brightness_set = lp8860_brightness_set;
 
 	mutex_init(&led->lock);
-	INIT_WORK(&led->work, lp8860_led_brightness_work);
 
 	i2c_set_clientdata(client, led);
 
@@ -448,7 +435,6 @@ static int lp8860_remove(struct i2c_client *client)
 	int ret;
 
 	led_classdev_unregister(&led->led_dev);
-	cancel_work_sync(&led->work);
 
 	if (led->enable_gpio)
 		gpiod_direction_output(led->enable_gpio, 0);
-- 
1.7.9.5
