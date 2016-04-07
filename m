From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 1/1] leds: pca9532: Add device tree binding
Date: Thu,  7 Apr 2016 15:22:52 +0800
Message-ID: <1460013772-129968-2-git-send-email-preid@electromag.com.au>
References: <1460013772-129968-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:53468 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755219AbcDGHXE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2016 03:23:04 -0400
In-Reply-To: <1460013772-129968-1-git-send-email-preid@electromag.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

This patch adds basic device tree support for the pca9532 LEDs.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 .../devicetree/bindings/leds/leds-pca9532.txt      | 42 +++++++++++++
 drivers/leds/leds-pca9532.c                        | 69 ++++++++++++++++++++--
 include/dt-bindings/leds/leds-pca9532.h            | 23 ++++++++
 include/linux/leds-pca9532.h                       | 18 ++----
 4 files changed, 135 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
 create mode 100644 include/dt-bindings/leds/leds-pca9532.h

diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
new file mode 100644
index 0000000..284b96c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
@@ -0,0 +1,42 @@
+*NXP - pca9532 PWM LED Driver
+
+The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
+The PWM support 256 steps.
+
+Required properties:
+	- compatible:
+		"nxp,pca9530"
+		"nxp,pca9531"
+		"nxp,pca9532"
+		"nxp,pca9533"
+	- reg -  I2C slave address
+
+Each led is represented as a sub-node of the nxp,pca9530.
+
+Optional sub-node properties:
+	- label: Name for this LED. If omitted, the label is taken from the node name.
+	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
+	- state: Initial LED state (default OFF)
+	- linux,default-trigger: Trigger assigned to the LED.
+
+Example:
+  #include <dt-bindings/leds/leds-pca9532.h>
+
+  leds: pca9530@60 {
+    compatible = "nxp,pca9530";
+    reg = <0x60>;
+
+    red-power {
+      label = "pca:red:power";
+      type = <PCA9532_TYPE_LED>;
+      state = <PCA9532_PWM0>;
+    };
+    green-power {
+      label = "pca:green:power";
+      type = <PCA9532_TYPE_LED>;
+      state = <PCA9532_PWM1>;
+    };
+  };
+
+For more product information please see the link below:
+http://nxp.com/documents/data_sheet/PCA9532.pdf
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index e3d3b1a..3bbaa39 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -21,6 +21,8 @@
 #include <linux/workqueue.h>
 #include <linux/leds-pca9532.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 /* m =  num_leds*/
 #define PCA9532_REG_INPUT(i)	((i) >> 3)
@@ -86,9 +88,22 @@ static const struct pca9532_chip_info pca9532_chip_info_tbl[] = {
 	},
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id of_pca9532_leds_match[] = {
+	{ .compatible = "nxp,pca9530", .data = (void *)pca9530 },
+	{ .compatible = "nxp,pca9531", .data = (void *)pca9531 },
+	{ .compatible = "nxp,pca9532", .data = (void *)pca9532 },
+	{ .compatible = "nxp,pca9533", .data = (void *)pca9533 },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_pca9532_leds_match);
+#endif
+
 static struct i2c_driver pca9532_driver = {
 	.driver = {
 		.name = "leds-pca953x",
+		.of_match_table = of_match_ptr(of_pca9532_leds_match),
 	},
 	.probe = pca9532_probe,
 	.remove = pca9532_remove,
@@ -354,6 +369,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->state = pled->state;
 			led->name = pled->name;
 			led->ldev.name = led->name;
+			led->ldev.default_trigger = led->default_trigger;
 			led->ldev.brightness = LED_OFF;
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
@@ -432,15 +448,60 @@ exit:
 	return err;
 }
 
+struct pca9532_platform_data *pca9532_of_populate_pdata(struct device *dev,
+						      struct device_node *np)
+{
+	struct pca9532_platform_data *pdata;
+	struct device_node *child;
+	int devid = (int)of_match_device(of_pca9532_leds_match, dev)->data;
+	int maxleds = pca9532_chip_info_tbl[devid].num_leds;
+	int i = 0;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_child_of_node(np, child) {
+		if (of_property_read_string(child, "label",
+					    &pdata->leds[i].name))
+			pdata->leds[i].name = child->name;
+		of_property_read_u32(child, "type", &pdata->leds[i].type);
+		of_property_read_u32(child, "state", &pdata->leds[i].state);
+		of_property_read_string(child, "linux,default-trigger",
+					&pdata->leds[i].default_trigger);
+		if (++i >= maxleds) {
+			of_node_put(child);
+			break;
+		}
+	}
+
+	return pdata;
+}
+
 static int pca9532_probe(struct i2c_client *client,
 	const struct i2c_device_id *id)
 {
+	int devid;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	struct pca9532_platform_data *pca9532_pdata =
 			dev_get_platdata(&client->dev);
-
-	if (!pca9532_pdata)
-		return -EIO;
+	struct device_node *np = client->dev.of_node;
+
+	if (!pca9532_pdata) {
+		if (np) {
+			pca9532_pdata =
+				pca9532_of_populate_pdata(&client->dev, np);
+			if (IS_ERR(pca9532_pdata))
+				return PTR_ERR(pca9532_pdata);
+		} else {
+			dev_err(&client->dev, "no platform data\n");
+			return -EINVAL;
+		}
+		devid = (int)of_match_device(
+			of_pca9532_leds_match, &client->dev)->data;
+	} else {
+		devid = id->driver_data;
+	}
 
 	if (!i2c_check_functionality(client->adapter,
 		I2C_FUNC_SMBUS_BYTE_DATA))
@@ -450,7 +511,7 @@ static int pca9532_probe(struct i2c_client *client,
 	if (!data)
 		return -ENOMEM;
 
-	data->chip_info = &pca9532_chip_info_tbl[id->driver_data];
+	data->chip_info = &pca9532_chip_info_tbl[devid];
 
 	dev_info(&client->dev, "setting platform data\n");
 	i2c_set_clientdata(client, data);
diff --git a/include/dt-bindings/leds/leds-pca9532.h b/include/dt-bindings/leds/leds-pca9532.h
new file mode 100644
index 0000000..4db6cb2
--- /dev/null
+++ b/include/dt-bindings/leds/leds-pca9532.h
@@ -0,0 +1,23 @@
+/*
+ * This header provides constants for pca9532 LED bindings.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifndef _DT_BINDINGS_LEDS_PCA9532_H
+#define _DT_BINDINGS_LEDS_PCA9532_H
+
+#define PCA9532_OFF               0x0
+#define PCA9532_ON                0x1
+#define PCA9532_PWM0              0x2
+#define PCA9532_PWM1              0x3
+
+#define PCA9532_TYPE_NONE         0
+#define PCA9532_TYPE_LED          1
+#define PCA9532_TYPE_N2100_BEEP   2
+#define PCA9532_TYPE_GPIO         3
+#define PCA9532_LED_TIMER2        4
+
+#endif /* _DT_BINDINGS_LEDS_PCA9532_H */
diff --git a/include/linux/leds-pca9532.h b/include/linux/leds-pca9532.h
index b8d6fff..562b320 100644
--- a/include/linux/leds-pca9532.h
+++ b/include/linux/leds-pca9532.h
@@ -16,25 +16,17 @@
 
 #include <linux/leds.h>
 #include <linux/workqueue.h>
-
-enum pca9532_state {
-	PCA9532_OFF  = 0x0,
-	PCA9532_ON   = 0x1,
-	PCA9532_PWM0 = 0x2,
-	PCA9532_PWM1 = 0x3
-};
-
-enum pca9532_type { PCA9532_TYPE_NONE, PCA9532_TYPE_LED,
-	PCA9532_TYPE_N2100_BEEP, PCA9532_TYPE_GPIO };
+#include <dt-bindings/leds/leds-pca9532.h>
 
 struct pca9532_led {
 	u8 id;
 	struct i2c_client *client;
-	char *name;
+	const char *name;
+	const char *default_trigger;
 	struct led_classdev ldev;
 	struct work_struct work;
-	enum pca9532_type type;
-	enum pca9532_state state;
+	u32 type;
+	u32 state;
 };
 
 struct pca9532_platform_data {
-- 
1.8.3.1
