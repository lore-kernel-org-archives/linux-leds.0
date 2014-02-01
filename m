From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v3 5/5] leds: leds-mc13783: Add devicetree support
Date: Sat,  1 Feb 2014 10:37:23 +0400
Message-ID: <1391236643-16585-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds devicetree support for the MC13XXX LED driver.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt |  47 +++++++++
 drivers/leds/leds-mc13783.c                       | 112 ++++++++++++++++++----
 2 files changed, 140 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index abd9e3c..1413f39 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -10,9 +10,44 @@ Optional properties:
 - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
 
 Sub-nodes:
+- leds : Contain the led nodes and initial register values in property
+  "led-control". Number of register depends of used IC, for MC13783 is 6,
+  for MC13892 is 4, for MC34708 is 1. See datasheet for bits definitions of
+  these registers.
+  - #address-cells: Must be 1.
+  - #size-cells: Must be 0.
+  Each led node should contain "reg", which used as LED ID (described below).
+  Optional properties "label" and "linux,default-trigger" is described in
+  Documentation/devicetree/bindings/leds/common.txt.
 - regulators : Contain the regulator nodes. The regulators are bound using
   their names as listed below with their registers and bits for enabling.
 
+MC13783 LED IDs:
+    0  : Main display
+    1  : AUX display
+    2  : Keypad
+    3  : Red 1
+    4  : Green 1
+    5  : Blue 1
+    6  : Red 2
+    7  : Green 2
+    8  : Blue 2
+    9  : Red 3
+    10 : Green 3
+    11 : Blue 3
+
+MC13892 LED IDs:
+    0  : Main display
+    1  : AUX display
+    2  : Keypad
+    3  : Red
+    4  : Green
+    5  : Blue
+
+MC34708 LED IDs:
+    0  : Charger Red
+    1  : Charger Green
+
 MC13783 regulators:
     sw1a      : regulator SW1A      (register 24, bit 0)
     sw1b      : regulator SW1B      (register 25, bit 0)
@@ -89,6 +124,18 @@ ecspi@70010000 { /* ECSPI1 */
 		interrupt-parent = <&gpio0>;
 		interrupts = <8>;
 
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			led-control = <0x000 0x000 0x0e0 0x000>;
+
+			sysled {
+				reg = <3>;
+				label = "system:red:live";
+				linux,default-trigger = "heartbeat";
+			};
+		};
+
 		regulators {
 			sw1_reg: mc13892__sw1 {
 				regulator-min-microvolt = <600000>;
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 4cfcfde..e4e4ef5 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
+#include <linux/of.h>
 #include <linux/workqueue.h>
 #include <linux/mfd/mc13xxx.h>
 
@@ -41,7 +42,7 @@ struct mc13xxx_leds {
 	struct mc13xxx			*master;
 	struct mc13xxx_led_devtype	*devtype;
 	int				num_leds;
-	struct mc13xxx_led		led[0];
+	struct mc13xxx_led		*led;
 };
 
 static unsigned int mc13xxx_max_brightness(int id)
@@ -119,6 +120,74 @@ static void mc13xxx_led_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work);
 }
 
+#ifdef CONFIG_OF
+static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
+	struct platform_device *pdev)
+{
+	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
+	struct mc13xxx_leds_platform_data *pdata;
+	struct device_node *parent, *child;
+	struct device *dev = &pdev->dev;
+	int i = 0, ret = -ENODATA;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	of_node_get(dev->parent->of_node);
+
+	parent = of_find_node_by_name(dev->parent->of_node, "leds");
+	if (!parent)
+		goto out_node_put;
+
+	ret = of_property_read_u32_array(parent, "led-control",
+					 pdata->led_control,
+					 leds->devtype->num_regs);
+	if (ret)
+		goto out_node_put;
+
+	pdata->num_leds = of_get_child_count(parent);
+
+	pdata->led = devm_kzalloc(dev, pdata->num_leds * sizeof(*pdata->led),
+				  GFP_KERNEL);
+	if (!pdata->led) {
+		ret = -ENOMEM;
+		goto out_node_put;
+	}
+
+	for_each_child_of_node(parent, child) {
+		const char *str;
+		u32 tmp;
+
+		if (of_property_read_u32(child, "reg", &tmp))
+			continue;
+		pdata->led[i].id = leds->devtype->led_min + tmp;
+
+		if (!of_property_read_string(child, "label", &str))
+			pdata->led[i].name = str;
+		if (!of_property_read_string(child, "linux,default-trigger",
+					     &str))
+			pdata->led[i].default_trigger = str;
+
+		i++;
+	};
+
+	pdata->num_leds = i;
+	ret = i > 0 ? 0 : -ENODATA;
+
+out_node_put:
+	of_node_put(parent);
+
+	return ret ? ERR_PTR(ret) : pdata;
+}
+#else
+static inline struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
+	struct platform_device *pdev)
+{
+	return ERR_PTR(-ENOSYS);
+}
+#endif
+
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -127,32 +196,37 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 	struct mc13xxx_led_devtype *devtype =
 		(struct mc13xxx_led_devtype *)pdev->id_entry->driver_data;
 	struct mc13xxx_leds *leds;
-	int i, id, num_leds, ret = -ENODATA;
+	int i, id, ret = -ENODATA;
 	u32 init_led = 0;
 
-	if (!pdata) {
-		dev_err(dev, "Missing platform data\n");
-		return -ENODEV;
-	}
-
-	num_leds = pdata->num_leds;
-
-	if ((num_leds < 1) ||
-	    (num_leds > (devtype->led_max - devtype->led_min + 1))) {
-		dev_err(dev, "Invalid LED count %d\n", num_leds);
-		return -EINVAL;
-	}
-
-	leds = devm_kzalloc(dev, num_leds * sizeof(struct mc13xxx_led) +
-			    sizeof(struct mc13xxx_leds), GFP_KERNEL);
+	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
 
 	leds->devtype = devtype;
-	leds->num_leds = num_leds;
 	leds->master = mcdev;
 	platform_set_drvdata(pdev, leds);
 
+	if (dev->parent->of_node) {
+		pdata = mc13xxx_led_probe_dt(pdev);
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
+	} else if (!pdata)
+		return -ENODATA;
+
+	leds->num_leds = pdata->num_leds;
+
+	if ((leds->num_leds < 1) ||
+	    (leds->num_leds > (devtype->led_max - devtype->led_min + 1))) {
+		dev_err(dev, "Invalid LED count %d\n", leds->num_leds);
+		return -EINVAL;
+	}
+
+	leds->led = devm_kzalloc(dev, leds->num_leds * sizeof(*leds->led),
+				 GFP_KERNEL);
+	if (!leds->led)
+		return -ENOMEM;
+
 	for (i = 0; i < devtype->num_regs; i++) {
 		ret = mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
 					pdata->led_control[i]);
@@ -160,7 +234,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	for (i = 0; i < num_leds; i++) {
+	for (i = 0; i < leds->num_leds; i++) {
 		const char *name, *trig;
 
 		ret = -EINVAL;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
