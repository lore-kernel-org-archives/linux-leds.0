From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 25/25] leds: an30259a: Use led_compose_name()
Date: Sun, 10 Mar 2019 19:28:36 +0100
Message-ID: <20190310182836.20841-26-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Simon Shields <simon@lineageos.org>
---
 drivers/leds/leds-an30259a.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 1c1f0c8c56f4..d714ee8322c0 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -13,7 +13,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
-#include <uapi/linux/uleds.h>
 
 #define AN30259A_MAX_LEDS 3
 
@@ -54,6 +53,8 @@
 #define AN30259A_BLINK_MAX_TIME 7500 /* ms */
 #define AN30259A_SLOPE_RESOLUTION 500 /* ms */
 
+#define AN30259A_NAME "an30259a"
+
 #define STATE_OFF 0
 #define STATE_KEEP 1
 #define STATE_ON 2
@@ -62,11 +63,11 @@ struct an30259a;
 
 struct an30259a_led {
 	struct an30259a *chip;
+	struct fwnode_handle *fwnode;
 	struct led_classdev cdev;
 	u32 num;
 	u32 default_state;
 	bool sloping;
-	char label[LED_MAX_NAME_SIZE];
 };
 
 struct an30259a {
@@ -226,14 +227,7 @@ static int an30259a_dt_init(struct i2c_client *client,
 
 		led->num = source;
 		led->chip = chip;
-
-		if (of_property_read_string(child, "label", &str))
-			snprintf(led->label, sizeof(led->label), "an30259a::");
-		else
-			snprintf(led->label, sizeof(led->label), "an30259a:%s",
-				 str);
-
-		led->cdev.name = led->label;
+		led->fwnode = of_fwnode_handle(child);
 
 		if (!of_property_read_string(child, "default-state", &str)) {
 			if (!strcmp(str, "on"))
@@ -312,13 +306,21 @@ static int an30259a_probe(struct i2c_client *client)
 	chip->regmap = devm_regmap_init_i2c(client, &an30259a_regmap_config);
 
 	for (i = 0; i < chip->num_leds; i++) {
+		struct led_init_data init_data = { chip->leds[i].fwnode };
+
+		int ret = led_compose_name(init_data.fwnode, AN30259A_NAME, ":",
+					   init_data.name);
+		if (ret)
+			return ret;
+
 		an30259a_init_default_state(&chip->leds[i]);
 		chip->leds[i].cdev.brightness_set_blocking =
 			an30259a_brightness_set;
 		chip->leds[i].cdev.blink_set = an30259a_blink_set;
 
-		err = devm_led_classdev_register(&client->dev,
-						 &chip->leds[i].cdev);
+		err = devm_led_classdev_register_ext(&client->dev,
+						 &chip->leds[i].cdev,
+						 &init_data);
 		if (err < 0)
 			goto exit;
 	}
-- 
2.11.0
