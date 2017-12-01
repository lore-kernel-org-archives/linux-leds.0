From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 5/6] leds: lp8860: Update the LED label generation
Date: Fri, 1 Dec 2017 10:56:12 -0600
Message-ID: <20171201165613.10358-5-dmurphy@ti.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201165613.10358-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Fix the LED label generation for the LP8860 to
conform with the

Documentation/devicetree/bindings/leds/common.txt

document indicating the LED label should be part of a
child node to the device parent.  If no label is
in the child node then the LED label is created based
on the parent node name and the alternate name passed in.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v6 - New patch to use the new LED class API

 drivers/leds/leds-lp8860.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 3e70775a2d54..26bbfa144402 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -22,6 +22,7 @@
 #include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
+#include <uapi/linux/uleds.h>
 
 #define LP8860_DISP_CL1_BRT_MSB		0x00
 #define LP8860_DISP_CL1_BRT_LSB		0x01
@@ -86,8 +87,6 @@
 
 #define LP8860_CLEAR_FAULTS		0x01
 
-#define LP8860_DISP_LED_NAME		"display_cluster"
-
 /**
  * struct lp8860_led -
  * @lock - Lock for reading/writing the device
@@ -107,7 +106,7 @@ struct lp8860_led {
 	struct regmap *eeprom_regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
-	const char *label;
+	char label[LED_MAX_NAME_SIZE];
 };
 
 struct lp8860_eeprom_reg {
@@ -318,7 +317,7 @@ static const struct regmap_config lp8860_regmap_config = {
 	.max_register = LP8860_EEPROM_UNLOCK,
 	.reg_defaults = lp8860_reg_defs,
 	.num_reg_defaults = ARRAY_SIZE(lp8860_reg_defs),
-	.cache_type = REGCACHE_NONE,
+	.cache_type = REGCACHE_RBTREE,
 };
 
 static const struct reg_default lp8860_eeprom_defs[] = {
@@ -356,7 +355,7 @@ static const struct regmap_config lp8860_eeprom_regmap_config = {
 	.max_register = LP8860_EEPROM_REG_24,
 	.reg_defaults = lp8860_eeprom_defs,
 	.num_reg_defaults = ARRAY_SIZE(lp8860_eeprom_defs),
-	.cache_type = REGCACHE_NONE,
+	.cache_type = REGCACHE_RBTREE,
 };
 
 static int lp8860_probe(struct i2c_client *client,
@@ -365,19 +364,23 @@ static int lp8860_probe(struct i2c_client *client,
 	int ret;
 	struct lp8860_led *led;
 	struct device_node *np = client->dev.of_node;
+	struct device_node *child_node;
+
+	if (!client->dev.of_node)
+		return -ENODEV;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	led->label = LP8860_DISP_LED_NAME;
+	for_each_available_child_of_node(np, child_node) {
+		led->led_dev.default_trigger = of_get_property(child_node,
+						    "linux,default-trigger",
+						    NULL);
 
-	if (client->dev.of_node) {
-		ret = of_property_read_string(np, "label", &led->label);
-		if (ret) {
-			dev_err(&client->dev, "Missing label in dt\n");
-			return -EINVAL;
-		}
+		of_led_compose_name(np, child_node, "white:backlight",
+				sizeof("white:backlight"),
+				led->label);
 	}
 
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
-- 
2.15.0.124.g7668cbc60
