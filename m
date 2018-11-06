From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 20/24] leds: as3645a: Use led_compose_name()
Date: Tue,  6 Nov 2018 23:07:28 +0100
Message-ID: <1541542052-10081-21-git-send-email-jacek.anaszewski@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/leds/leds-as3645a.c | 65 ++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 98a69b1..d7f6037 100644
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
 			      struct device_node *node)
 {
 	struct as3645a_config *cfg = &flash->cfg;
 	struct device_node *child;
-	const char *name;
 	int rval;
 
 	for_each_child_of_node(node, child) {
@@ -524,13 +517,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		return -ENODEV;
 	}
 
-	rval = of_property_read_string(flash->flash_node, "label", &name);
-	if (!rval)
-		strlcpy(names->flash, name, sizeof(names->flash));
-	else
-		snprintf(names->flash, sizeof(names->flash),
-			 "%pOFn:flash", node);
-
 	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
 				    &cfg->flash_timeout_us);
 	if (rval < 0) {
@@ -568,13 +554,6 @@ static int as3645a_parse_node(struct as3645a *flash,
 		goto out_err;
 	}
 
-	rval = of_property_read_string(flash->indicator_node, "label", &name);
-	if (!rval)
-		strlcpy(names->indicator, name, sizeof(names->indicator));
-	else
-		snprintf(names->indicator, sizeof(names->indicator),
-			 "%pOFn:indicator", node);
-
 	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
 				    &cfg->indicator_max_ua);
 	if (rval < 0) {
@@ -592,21 +571,27 @@ static int as3645a_parse_node(struct as3645a *flash,
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
+	init_data.fwnode = of_fwnode_handle(flash->indicator_node);
+	rval = led_compose_name(init_data.fwnode, AS_NAME, "indicator",
+				init_data.name);
+	if (rval < 0)
+		return rval;
+
 	iled_cdev->brightness_set_blocking = as3645a_set_indicator_brightness;
 	iled_cdev->max_brightness =
 		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
 	iled_cdev->flags = LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_register(&flash->client->dev, iled_cdev);
+	rval = led_classdev_register_ext(&flash->client->dev, iled_cdev,
+					 &init_data);
 	if (rval < 0)
 		return rval;
 
@@ -624,7 +609,12 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 
 	flash->fled.ops = &as3645a_led_flash_ops;
 
-	fled_cdev->name = names->flash;
+	init_data.fwnode = of_fwnode_handle(flash->flash_node);
+	rval = led_compose_name(init_data.fwnode, AS_NAME, "flash",
+				init_data.name);
+	if (rval < 0)
+		goto out_err;
+
 	fled_cdev->brightness_set_blocking = as3645a_set_assist_brightness;
 	/* Value 0 is off in LED class. */
 	fled_cdev->max_brightness =
@@ -632,14 +622,18 @@ static int as3645a_led_class_setup(struct as3645a *flash,
 				       flash->cfg.assist_max_ua) + 1;
 	fled_cdev->flags = LED_DEV_CAP_FLASH | LED_CORE_SUSPENDRESUME;
 
-	rval = led_classdev_flash_register(&flash->client->dev, &flash->fled);
-	if (rval) {
-		led_classdev_unregister(iled_cdev);
-		dev_err(&flash->client->dev,
-			"led_classdev_flash_register() failed, error %d\n",
-			rval);
-	}
+	rval = led_classdev_flash_register_ext(&flash->client->dev,
+					       &flash->fled, &init_data);
+	if (rval)
+		goto out_err;
+
+	return rval;
 
+out_err:
+	led_classdev_unregister(iled_cdev);
+	dev_err(&flash->client->dev,
+		"led_classdev_flash_register() failed, error %d\n",
+		rval);
 	return rval;
 }
 
@@ -686,7 +680,6 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 
 static int as3645a_probe(struct i2c_client *client)
 {
-	struct as3645a_names names;
 	struct as3645a *flash;
 	int rval;
 
@@ -699,7 +692,7 @@ static int as3645a_probe(struct i2c_client *client)
 
 	flash->client = client;
 
-	rval = as3645a_parse_node(flash, &names, client->dev.of_node);
+	rval = as3645a_parse_node(flash, client->dev.of_node);
 	if (rval < 0)
 		return rval;
 
@@ -714,7 +707,7 @@ static int as3645a_probe(struct i2c_client *client)
 	if (rval)
 		goto out_mutex_destroy;
 
-	rval = as3645a_led_class_setup(flash, &names);
+	rval = as3645a_led_class_setup(flash);
 	if (rval)
 		goto out_mutex_destroy;
 
-- 
2.1.4
