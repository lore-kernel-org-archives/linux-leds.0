From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 3/6] leds: lp8860: Update the dt parsing for LED labeling
Date: Tue, 12 Dec 2017 12:58:06 -0600
Message-ID: <20171212185809.23880-5-dmurphy@ti.com>
References: <20171212185809.23880-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212185809.23880-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Update the DT parsing for the label node so that
the label is retrieved from the device child as
opposed to being part of the parent.

This will align this driver with the LED
binding documentation

Documentation/devicetree/bindings/leds/common.txt

Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
---

v3 - Changed the label generation to pull the name from the i2c device id 
as opposed to pulling the id from the parent dt node since that will just be 
led-controller - https://patchwork.kernel.org/patch/10093753/

v2 - no changes

 drivers/leds/leds-lp8860.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 3e70775a2d54..bc432764c99d 100644
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
+					id->name, name);
+		else
+		    snprintf(led->label, sizeof(led->label),
+			     "%s::display_cluster", id->name);
 	}
 
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
