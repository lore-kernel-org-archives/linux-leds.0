From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 13/25] leds: lm3692x: Use led_compose_name()
Date: Sun, 10 Mar 2019 19:28:24 +0100
Message-ID: <20190310182836.20841-14-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Since the same device strings would be used in two places,
then add macros LM36922_NAME and LM36922_NAME for use in
lm3692x_probe_dt(() and lm3692x_id array.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3692x.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 4f413a7c5f05..9dfc0f28a9c8 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -13,7 +13,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <uapi/linux/uleds.h>
 
 #define LM36922_MODEL	0
 #define LM36923_MODEL	1
@@ -95,6 +94,9 @@
 #define LM3692X_FAULT_FLAG_SHRT BIT(3)
 #define LM3692X_FAULT_FLAG_OPEN BIT(4)
 
+#define LM36922_NAME "lm36922"
+#define LM36923_NAME "lm36923"
+
 /**
  * struct lm3692x_led -
  * @lock - Lock for reading/writing the device
@@ -103,7 +105,6 @@
  * @regmap - Devices register map
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
- * @label - LED label
  * @led_enable - LED sync to be enabled
  * @model_id - Current device model ID enumerated
  */
@@ -114,7 +115,6 @@ struct lm3692x_led {
 	struct regmap *regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
-	char label[LED_MAX_NAME_SIZE];
 	int led_enable;
 	int model_id;
 };
@@ -325,7 +325,8 @@ static int lm3692x_init(struct lm3692x_led *led)
 static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
-	const char *name;
+	struct led_init_data init_data;
+	char *model_name;
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -346,17 +347,20 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		dev_err(&led->client->dev, "No LED Child node\n");
 		return -ENODEV;
 	}
+	init_data.fwnode = child;
 
-	fwnode_property_read_string(child, "linux,default-trigger",
-				    &led->led_dev.default_trigger);
+	if (led->model_id == LM36922_MODEL)
+		model_name =  LM36922_NAME;
+	else
+		model_name =  LM36923_NAME;
 
-	ret = fwnode_property_read_string(child, "label", &name);
+	ret = led_compose_name(child, model_name, ":backlight_cluster",
+			       init_data.name);
 	if (ret)
-		snprintf(led->label, sizeof(led->label),
-			"%s::", led->client->name);
-	else
-		snprintf(led->label, sizeof(led->label),
-			 "%s:%s", led->client->name, name);
+		return ret;
+
+	fwnode_property_read_string(child, "linux,default-trigger",
+				    &led->led_dev.default_trigger);
 
 	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
 	if (ret) {
@@ -364,16 +368,13 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 		return ret;
 	}
 
-	led->led_dev.name = led->label;
-
-	ret = devm_led_classdev_register(&led->client->dev, &led->led_dev);
+	ret = devm_led_classdev_register_ext(&led->client->dev, &led->led_dev,
+					     &init_data);
 	if (ret) {
 		dev_err(&led->client->dev, "led register err: %d\n", ret);
 		return ret;
 	}
 
-	led->led_dev.dev->of_node = to_of_node(child);
-
 	return 0;
 }
 
@@ -439,8 +440,8 @@ static int lm3692x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3692x_id[] = {
-	{ "lm36922", LM36922_MODEL },
-	{ "lm36923", LM36923_MODEL },
+	{ LM36922_NAME, LM36922_MODEL },
+	{ LM36923_NAME, LM36923_MODEL },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm3692x_id);
-- 
2.11.0
