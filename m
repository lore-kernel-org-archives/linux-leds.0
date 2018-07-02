From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/4] leds: lm3692x: Support LED sync configuration
Date: Mon, 2 Jul 2018 13:12:16 -0500
Message-ID: <20180702181216.19660-4-dmurphy@ti.com>
References: <20180702181216.19660-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702181216.19660-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jacek.anaszewski@gmail.com, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

The LM36922 has one output but can sync current to 2 LED
strings.  The user may only use one sync so the other
syncs need to be disabled.

The LM36923 has 3 LED syncs.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3692x.c | 158 +++++++++++++++++++++++++++---------
 1 file changed, 120 insertions(+), 38 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index ade4abfceb46..06f0ad954b55 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -15,6 +15,9 @@
 #include <linux/slab.h>
 #include <uapi/linux/uleds.h>
 
+#define LM36922_MODEL	0
+#define LM36923_MODEL	1
+
 #define LM3692X_REV		0x0
 #define LM3692X_RESET		0x1
 #define LM3692X_EN		0x10
@@ -33,6 +36,9 @@
 #define LM3692X_DEVICE_EN	BIT(0)
 #define LM3692X_LED1_EN		BIT(1)
 #define LM3692X_LED2_EN		BIT(2)
+#define LM36923_LED3_EN		BIT(3)
+#define LM3692X_ENABLE_MASK	(LM3692X_DEVICE_EN | LM3692X_LED1_EN | \
+				 LM3692X_LED2_EN | LM36923_LED3_EN)
 
 /* Brightness Control Bits */
 #define LM3692X_BL_ADJ_POL	BIT(0)
@@ -98,6 +104,8 @@
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
  * @label - LED label
+ * @led_enable - LED sync to be enabled
+ * @model_id - Current device model ID enumerated
  */
 struct lm3692x_led {
 	struct mutex lock;
@@ -107,6 +115,8 @@ struct lm3692x_led {
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
 	char label[LED_MAX_NAME_SIZE];
+	int led_enable;
+	int model_id;
 };
 
 static const struct reg_default lm3692x_reg_defs[] = {
@@ -189,6 +199,7 @@ static int lm3692x_brightness_set(struct led_classdev *led_cdev,
 
 static int lm3692x_init(struct lm3692x_led *led)
 {
+	int enable_state;
 	int ret;
 
 	if (led->regulator) {
@@ -215,9 +226,25 @@ static int lm3692x_init(struct lm3692x_led *led)
 
 	/*
 	 * For glitch free operation, the following data should
-	 * only be written while device enable bit is 0
+	 * only be written while LEDx enable bits are 0 and the device enable
+	 * bit is set to 1.
 	 * per Section 7.5.14 of the data sheet
 	 */
+	ret = regmap_write(led->regmap, LM3692X_EN, LM3692X_DEVICE_EN);
+	if (ret)
+		goto out;
+
+	/* Set the brightness to 0 so when enabled the LEDs do not come
+	 * on with full brightness.
+	 */
+	ret = regmap_write(led->regmap, LM3692X_BRT_MSB, 0);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_LSB, 0);
+	if (ret)
+		goto out;
+
 	ret = regmap_write(led->regmap, LM3692X_PWM_CTRL,
 		LM3692X_PWM_FILTER_100 | LM3692X_PWM_SAMP_24MHZ);
 	if (ret)
@@ -247,6 +274,38 @@ static int lm3692x_init(struct lm3692x_led *led)
 	if (ret)
 		goto out;
 
+	switch (led->led_enable) {
+	case 0:
+	default:
+		if (led->model_id == LM36923_MODEL)
+			enable_state = LM3692X_LED1_EN | LM3692X_LED2_EN |
+			       LM36923_LED3_EN;
+		else
+			enable_state = LM3692X_LED1_EN | LM3692X_LED2_EN;
+
+		break;
+	case 1:
+		enable_state = LM3692X_LED1_EN;
+		break;
+	case 2:
+		enable_state = LM3692X_LED2_EN;
+		break;
+
+	case 3:
+		if (led->model_id == LM36923_MODEL) {
+			enable_state = LM36923_LED3_EN;
+			break;
+		}
+
+		ret = -EINVAL;
+		dev_err(&led->client->dev,
+			"LED3 sync not available on this device\n");
+		goto out;
+	}
+
+	ret = regmap_update_bits(led->regmap, LM3692X_EN, LM3692X_ENABLE_MASK,
+				 enable_state | LM3692X_DEVICE_EN);
+
 	return ret;
 out:
 	dev_err(&led->client->dev, "Fail writing initialization values\n");
@@ -263,55 +322,29 @@ static int lm3692x_init(struct lm3692x_led *led)
 
 	return ret;
 }
-
-static int lm3692x_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
-	struct lm3692x_led *led;
 	const char *name;
 	int ret;
 
-	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
-	if (!led)
-		return -ENOMEM;
-
-	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
+	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(led->enable_gpio)) {
 		ret = PTR_ERR(led->enable_gpio);
-		dev_err(&client->dev, "Failed to get enable gpio: %d\n", ret);
+		dev_err(&led->client->dev, "Failed to get enable gpio: %d\n",
+			ret);
 		return ret;
 	}
 
-	led->regulator = devm_regulator_get(&client->dev, "vled");
+	led->regulator = devm_regulator_get(&led->client->dev, "vled");
 	if (IS_ERR(led->regulator))
 		led->regulator = NULL;
 
-	led->client = client;
-	led->led_dev.name = led->label;
-	led->led_dev.brightness_set_blocking = lm3692x_brightness_set;
-
-	mutex_init(&led->lock);
-
-	i2c_set_clientdata(client, led);
-
-	led->regmap = devm_regmap_init_i2c(client, &lm3692x_regmap_config);
-	if (IS_ERR(led->regmap)) {
-		ret = PTR_ERR(led->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
-	ret = lm3692x_init(led);
-	if (ret)
-		return ret;
-
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
 		dev_err(&led->client->dev, "No LED Child node\n");
-		return ret;
+		return -ENODEV;
 	}
 
 	fwnode_property_read_string(child, "linux,default-trigger",
@@ -325,14 +358,57 @@ static int lm3692x_probe(struct i2c_client *client,
 		snprintf(led->label, sizeof(led->label),
 			 "%s:%s", led->client->name, name);
 
-	led->led_dev.dev->of_node = to_of_node(child);
+	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
+	if (ret) {
+		dev_err(&led->client->dev, "reg DT property missing\n");
+		return ret;
+	}
+
+	led->led_dev.name = led->label;
 
-	ret = devm_led_classdev_register(&client->dev, &led->led_dev);
+	ret = devm_led_classdev_register(&led->client->dev, &led->led_dev);
 	if (ret) {
-		dev_err(&client->dev, "led register err: %d\n", ret);
+		dev_err(&led->client->dev, "led register err: %d\n", ret);
+		return ret;
+	}
+
+	led->led_dev.dev->of_node = to_of_node(child);
+
+	return 0;
+}
+
+static int lm3692x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct lm3692x_led *led;
+	int ret;
+
+	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	mutex_init(&led->lock);
+	led->client = client;
+	led->led_dev.brightness_set_blocking = lm3692x_brightness_set;
+	led->model_id = id->driver_data;
+	i2c_set_clientdata(client, led);
+
+	led->regmap = devm_regmap_init_i2c(client, &lm3692x_regmap_config);
+	if (IS_ERR(led->regmap)) {
+		ret = PTR_ERR(led->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			ret);
 		return ret;
 	}
 
+	ret = lm3692x_probe_dt(led);
+	if (ret)
+		return ret;
+
+	ret = lm3692x_init(led);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -341,6 +417,12 @@ static int lm3692x_remove(struct i2c_client *client)
 	struct lm3692x_led *led = i2c_get_clientdata(client);
 	int ret;
 
+	ret = regmap_update_bits(led->regmap, LM3692X_EN, LM3692X_DEVICE_EN, 0);
+	if (ret) {
+		dev_err(&led->client->dev, "Failed to disable regulator\n");
+		return ret;
+	}
+
 	if (led->enable_gpio)
 		gpiod_direction_output(led->enable_gpio, 0);
 
@@ -357,8 +439,8 @@ static int lm3692x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3692x_id[] = {
-	{ "lm36922", 0 },
-	{ "lm36923", 1 },
+	{ "lm36922", LM36922_MODEL },
+	{ "lm36923", LM36923_MODEL },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3692x_id);
-- 
2.17.0.582.gccdcbd54c
