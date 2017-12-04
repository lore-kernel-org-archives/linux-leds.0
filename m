From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/5] leds: lp8860: Update the dt parsing for LED labeling
Date: Mon, 4 Dec 2017 15:20:23 -0600
Message-ID: <20171204212026.14214-3-dmurphy@ti.com>
References: <20171204212026.14214-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171204212026.14214-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the DT parsing for the label node so that
the label is retrieved from the device child as
opposed to being part of the parent.

This will align this driver with the LED
binding documentation

Documentation/devicetree/bindings/leds/common.txt

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 3e70775a2d54..13d6210cba85 100644
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
@@ -365,19 +364,21 @@ static int lp8860_probe(struct i2c_client *client,
 	int ret;
 	struct lp8860_led *led;
 	struct device_node *np = client->dev.of_node;
+	struct device_node *child_node;
+	const char *name;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	led->label = LP8860_DISP_LED_NAME;
-
-	if (client->dev.of_node) {
-		ret = of_property_read_string(np, "label", &led->label);
-		if (ret) {
-			dev_err(&client->dev, "Missing label in dt\n");
-			return -EINVAL;
-		}
+	for_each_available_child_of_node(np, child_node) {
+		ret = of_property_read_string(child_node, "label", &name);
+		if (!ret)
+		    snprintf(led->label, sizeof(led->label), "%s:%s",
+					np->name, name);
+		else
+		    snprintf(led->label, sizeof(led->label),
+			     "%s::display_cluster", np->name);
 	}
 
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
-- 
2.15.0.124.g7668cbc60
