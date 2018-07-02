From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/4] leds: lm3692x: Change DT calls to fwnode calls
Date: Mon, 2 Jul 2018 13:12:14 -0500
Message-ID: <20180702181216.19660-2-dmurphy@ti.com>
References: <20180702181216.19660-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702181216.19660-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, jacek.anaszewski@gmail.com, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Update the code to use the fwnode calls as opposed
to ARM DT node api's.

This allows the device to be used with either DT
configurations or ACPI definitions.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3692x.c | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 1a06d8c97789..ade4abfceb46 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -267,30 +267,15 @@ static int lm3692x_init(struct lm3692x_led *led)
 static int lm3692x_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	int ret;
+	struct fwnode_handle *child = NULL;
 	struct lm3692x_led *led;
-	struct device_node *np = client->dev.of_node;
-	struct device_node *child_node;
 	const char *name;
+	int ret;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child_node) {
-		led->led_dev.default_trigger = of_get_property(child_node,
-						    "linux,default-trigger",
-						    NULL);
-
-		ret = of_property_read_string(child_node, "label", &name);
-		if (!ret)
-			snprintf(led->label, sizeof(led->label),
-				 "%s:%s", id->name, name);
-		else
-			snprintf(led->label, sizeof(led->label),
-				 "%s::backlight_cluster", id->name);
-	};
-
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(led->enable_gpio)) {
@@ -323,6 +308,25 @@ static int lm3692x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	child = device_get_next_child_node(&led->client->dev, child);
+	if (!child) {
+		dev_err(&led->client->dev, "No LED Child node\n");
+		return ret;
+	}
+
+	fwnode_property_read_string(child, "linux,default-trigger",
+				    &led->led_dev.default_trigger);
+
+	ret = fwnode_property_read_string(child, "label", &name);
+	if (ret)
+		snprintf(led->label, sizeof(led->label),
+			"%s::", led->client->name);
+	else
+		snprintf(led->label, sizeof(led->label),
+			 "%s:%s", led->client->name, name);
+
+	led->led_dev.dev->of_node = to_of_node(child);
+
 	ret = devm_led_classdev_register(&client->dev, &led->led_dev);
 	if (ret) {
 		dev_err(&client->dev, "led register err: %d\n", ret);
-- 
2.17.0.582.gccdcbd54c
