From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v3 21/25] leds: as3645a: Use generic support for composing LED names
Date: Sun, 31 Mar 2019 19:54:57 +0200
Message-ID: <20190331175501.23471-22-jacek.anaszewski@gmail.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-as3645a.c | 69 ++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index b0df514992e1..fa339e3ecdd5 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -132,11 +132,6 @@ struct as3645a_config {
 	u32 peak;
 };
 
-struct as3645a_names {
-	char flash[32];
-	char indicator[32];
-};
-
 struct as3645a {
 	struct i2c_client *client;
 
@@ -492,12 +487,10 @@ static int as3645a_detect(struct as3645a *flash)
 }
 
 static int as3645a_parse_node(struct as3645a *flash,
-			      struct as3645a_names *names,
 			      struct fwnode_handle *fwnode)
 {
 	struct as3645a_config *cfg = &flash->cfg;
 	struct fwnode_handle *child;
-	const char *name;
 	int rval;
 
 	fwnode_for_each_child_node(fwnode, child) {
@@ -525,17 +518,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		return -ENODEV;
 	}
 
-	rval = fwnode_property_read_string(flash->flash_node, "label", &name);
-	if (!rval) {
-		strlcpy(names->flash, name, sizeof(names->flash));
-	} else if (is_of_node(fwnode)) {
-		snprintf(names->flash, sizeof(names->flash),
-			 "%pOFn:flash", to_of_node(fwnode));
-	} else {
-		dev_err(&flash->client->dev, "flash node has no label!\n");
-		return -EINVAL;
-	}
-
 	rval = fwnode_property_read_u32(flash->flash_node, "flash-timeout-us",
 					&cfg->flash_timeout_us);
 	if (rval < 0) {
@@ -573,17 +555,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		goto out_err;
 	}
 
-	rval = fwnode_property_read_string(flash->indicator_node, "label",
-					   &name);
-	if (!rval) {
-		strlcpy(names->indicator, name, sizeof(names->indicator));
-	} else if (is_of_node(fwnode)) {
-		snprintf(names->indicator, sizeof(names->indicator),
-			 "%pOFn:indicator", to_of_node(fwnode));
-	} else {
-		dev_err(&flash->client->dev, "indicator node has no label!\n");
-		return -EINVAL;
-	}
 
 	rval = fwnode_property_read_u32(flash->indicator_node,
 					"led-max-microamp",
@@ -603,21 +574,25 @@ static int as3645a_parse_node(struct as3645a *flash,
 	return rval;
 }
 
-static int as3645a_led_class_setup(struct as3645a *flash,
-				   struct as3645a_names *names)
+static int as3645a_led_class_setup(struct as3645a *flash)
 {
 	struct led_classdev *fled_cdev = &flash->fled.led_cdev;
 	struct led_classdev *iled_cdev = &flash->iled_cdev;
+	struct led_init_data init_data;
 	struct led_flash_setting *cfg;
 	int rval;
 
-	iled_cdev->name = names->indicator;
 	iled_cdev->brightness_set_blocking = as3645a_set_indicator_brightness;
 	iled_cdev->max_brightness =
 		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
 	iled_cdev->flags = LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_register(&flash->client->dev, iled_cdev);
+	init_data.fwnode = flash->indicator_node;
+	init_data.led_hw_name = AS_NAME;
+	init_data.default_label = "indicator";
+
+	rval = led_classdev_register_ext(&flash->client->dev, iled_cdev,
+					 &init_data);
 	if (rval < 0)
 		return rval;
 
@@ -635,7 +610,6 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 
 	flash->fled.ops = &as3645a_led_flash_ops;
 
-	fled_cdev->name = names->flash;
 	fled_cdev->brightness_set_blocking = as3645a_set_assist_brightness;
 	/* Value 0 is off in LED class. */
 	fled_cdev->max_brightness =
@@ -643,15 +617,23 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 				       flash->cfg.assist_max_ua) + 1;
 	fled_cdev->flags = LED_DEV_CAP_FLASH | LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_flash_register(&flash->client->dev, &flash->fled);
-	if (rval) {
-		led_classdev_unregister(iled_cdev);
-		dev_err(&flash->client->dev,
-			"led_classdev_flash_register() failed, error %d\n",
-			rval);
-	}
+	init_data.fwnode = flash->flash_node;
+	init_data.led_hw_name = AS_NAME;
+	init_data.default_label = "flash";
+
+	rval = led_classdev_flash_register_ext(&flash->client->dev,
+					       &flash->fled, &init_data);
+	if (rval)
+		goto out_err;
 
 	return rval;
+
+out_err:
+	led_classdev_unregister(iled_cdev);
+	dev_err(&flash->client->dev,
+		"led_classdev_flash_register() failed, error %d\n",
+		rval);
+	return rval;
 }
 
 static int as3645a_v4l2_setup(struct as3645a *flash)
@@ -697,7 +679,6 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 
 static int as3645a_probe(struct i2c_client *client)
 {
-	struct as3645a_names names;
 	struct as3645a *flash;
 	int rval;
 
@@ -710,7 +691,7 @@ static int as3645a_probe(struct i2c_client *client)
 
 	flash->client = client;
 
-	rval = as3645a_parse_node(flash, &names, dev_fwnode(&client->dev));
+	rval = as3645a_parse_node(flash, dev_fwnode(&client->dev));
 	if (rval < 0)
 		return rval;
 
@@ -725,7 +706,7 @@ static int as3645a_probe(struct i2c_client *client)
 	if (rval)
 		goto out_mutex_destroy;
 
-	rval = as3645a_led_class_setup(flash, &names);
+	rval = as3645a_led_class_setup(flash);
 	if (rval)
 		goto out_mutex_destroy;
 
-- 
2.11.0
