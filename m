From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 15/25] leds: lm3601x: Use led_compose_name()
Date: Sun, 10 Mar 2019 19:28:26 +0100
Message-ID: <20190310182836.20841-16-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3601x.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index 081aa71e43a3..91ea65217d48 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <uapi/linux/uleds.h>
 
 #define LM3601X_LED_IR		0x0
 #define LM3601X_LED_TORCH	0x1
@@ -90,8 +89,6 @@ struct lm3601x_led {
 	struct regmap *regmap;
 	struct mutex lock;
 
-	char led_name[LED_MAX_NAME_SIZE];
-
 	unsigned int flash_timeout;
 	unsigned int last_flag;
 
@@ -322,10 +319,24 @@ static const struct led_flash_ops flash_ops = {
 	.fault_get		= lm3601x_flash_fault_get,
 };
 
-static int lm3601x_register_leds(struct lm3601x_led *led)
+static int lm3601x_register_leds(struct lm3601x_led *led,
+				 struct fwnode_handle *fwnode)
 {
 	struct led_classdev *led_cdev;
 	struct led_flash_setting *setting;
+	struct led_init_data init_data = { fwnode };
+	char *mode_name;
+	int ret;
+
+	if (led->led_mode == LM3601X_LED_TORCH)
+		mode_name = "torch";
+	else
+		mode_name = "infrared";
+
+	ret = led_compose_name(fwnode, led->client->name, mode_name,
+			       init_data.name);
+	if (ret < 0)
+		return ret;
 
 	led->fled_cdev.ops = &flash_ops;
 
@@ -342,20 +353,20 @@ static int lm3601x_register_leds(struct lm3601x_led *led)
 	setting->val = led->flash_current_max;
 
 	led_cdev = &led->fled_cdev.led_cdev;
-	led_cdev->name = led->led_name;
 	led_cdev->brightness_set_blocking = lm3601x_brightness_set;
 	led_cdev->max_brightness = DIV_ROUND_UP(led->torch_current_max,
 						LM3601X_TORCH_REG_DIV);
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
-	return led_classdev_flash_register(&led->client->dev, &led->fled_cdev);
+	return led_classdev_flash_register_ext(&led->client->dev,
+						&led->fled_cdev, &init_data);
 }
 
-static int lm3601x_parse_node(struct lm3601x_led *led)
+static int lm3601x_parse_node(struct lm3601x_led *led,
+			      struct fwnode_handle **fwnode)
 {
 	struct fwnode_handle *child = NULL;
 	int ret = -ENODEV;
-	const char *name;
 
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
@@ -376,17 +387,6 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 		goto out_err;
 	}
 
-	ret = fwnode_property_read_string(child, "label", &name);
-	if (ret) {
-		if (led->led_mode == LM3601X_LED_TORCH)
-			name = "torch";
-		else
-			name = "infrared";
-	}
-
-	snprintf(led->led_name, sizeof(led->led_name),
-		"%s:%s", led->client->name, name);
-
 	ret = fwnode_property_read_u32(child, "led-max-microamp",
 					&led->torch_current_max);
 	if (ret) {
@@ -411,6 +411,8 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 		goto out_err;
 	}
 
+	*fwnode = child;
+
 out_err:
 	fwnode_handle_put(child);
 	return ret;
@@ -419,6 +421,7 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 static int lm3601x_probe(struct i2c_client *client)
 {
 	struct lm3601x_led *led;
+	struct fwnode_handle *fwnode;
 	int ret;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
@@ -428,7 +431,7 @@ static int lm3601x_probe(struct i2c_client *client)
 	led->client = client;
 	i2c_set_clientdata(client, led);
 
-	ret = lm3601x_parse_node(led);
+	ret = lm3601x_parse_node(led, &fwnode);
 	if (ret)
 		return -ENODEV;
 
@@ -442,7 +445,7 @@ static int lm3601x_probe(struct i2c_client *client)
 
 	mutex_init(&led->lock);
 
-	return lm3601x_register_leds(led);
+	return lm3601x_register_leds(led, fwnode);
 }
 
 static int lm3601x_remove(struct i2c_client *client)
-- 
2.11.0
