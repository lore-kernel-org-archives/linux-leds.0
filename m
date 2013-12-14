From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 5/5] leds: leds-mc13783: Add devicetree support
Date: Sat, 14 Dec 2013 15:02:30 +0400
Message-ID: <1387018950-7166-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp27.mail.ru ([94.100.176.180]:45433 "EHLO smtp27.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752126Ab3LNLFw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 14 Dec 2013 06:05:52 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Alexander Shiyan <shc_work@mail.ru>

This patch adds devicetree support for the MC13XXX LED driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt |  47 ++++++++
 drivers/leds/leds-mc13783.c                       | 130 ++++++++++++++++++----
 2 files changed, 158 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index abd9e3c..7592542 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -10,9 +10,44 @@ Optional properties:
 - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
 
 Sub-nodes:
+- leds : Contain the led nodes and initial register values in property
+  "led-control". Number of register depends of used IC, for MC13783 is 6,
+  for MC13892 is 4, dor MC34708 is 1. See datasheet for bits definitions of
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
index b5a8357..c1f75fb 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
+#include <linux/of.h>
 #include <linux/workqueue.h>
 #include <linux/mfd/mc13xxx.h>
 
@@ -42,7 +43,7 @@ struct mc13xxx_leds {
 	struct mc13xxx			*master;
 	struct mc13xxx_led_devtype	*devtype;
 	int				num_leds;
-	struct mc13xxx_led		led[0];
+	struct mc13xxx_led		*led;
 };
 
 static unsigned int mc13xxx_max_brightness(int id)
@@ -134,6 +135,94 @@ static void mc13xxx_led_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work);
 }
 
+#ifdef CONFIG_OF
+static int __init mc13xxx_led_probe_dt(struct platform_device *pdev)
+{
+	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
+	struct mc13xxx *mcdev = leds->master;
+	struct device_node *parent, *child;
+	struct device *dev = &pdev->dev;
+	u32 *ctrls, init_led = 0;
+	int i, ret;
+
+	ctrls = devm_kzalloc(dev, leds->devtype->num_regs * sizeof(*ctrls),
+			     GFP_KERNEL);
+	if (!ctrls)
+		return -ENOMEM;
+
+	of_node_get(dev->parent->of_node);
+	parent = of_find_node_by_name(dev->parent->of_node, "leds");
+	if (!parent) {
+		ret = -ENODATA;
+		goto out_node_put;
+	}
+
+	ret = of_property_read_u32_array(parent, "led-control", ctrls,
+					 leds->devtype->num_regs);
+	if (ret)
+		goto out_node_put;
+
+	for (i = 0; i < leds->devtype->num_regs; i++) {
+		ret = mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
+					ctrls[i]);
+		if (ret)
+			goto out_node_put;
+	}
+
+	leds->led = devm_kzalloc(dev, of_get_child_count(parent) *
+				 sizeof(*leds->led), GFP_KERNEL);
+	if (!leds->led)
+		return -ENOMEM;
+
+	i = 0;
+
+	for_each_child_of_node(parent, child) {
+		u32 id;
+
+		if (of_property_read_u32(child, "reg", &id))
+			continue;
+
+		if (id > (leds->devtype->led_max - leds->devtype->led_min)) {
+			dev_warn(dev, "Invalid reg ID %i\n", id);
+			continue;
+		}
+
+		if (init_led & (1 << id))
+			continue;
+
+		leds->led[i].id = id + leds->devtype->led_min;
+		leds->led[i].leds = leds;
+		leds->led[i].cdev.name = of_get_property(child, "label", NULL);
+		leds->led[i].cdev.default_trigger =
+			of_get_property(child, "linux,default-trigger", NULL);
+		leds->led[i].cdev.flags |= LED_CORE_SUSPENDRESUME;
+		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
+		leds->led[i].cdev.max_brightness = mc13xxx_max_brightness(id);
+
+		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
+
+		if (led_classdev_register(dev, &leds->led[i].cdev))
+			continue;
+
+		init_led |= 1 << id;
+		i++;
+	};
+
+	leds->num_leds = i;
+	ret = 0;
+
+out_node_put:
+	of_node_put(parent);
+
+	return ret;
+}
+#else
+static inline int __init mc13xxx_led_probe_dt(struct platform_device *pdev)
+{
+	return -ENOTSUPP;
+}
+#endif
+
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -142,32 +231,35 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
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
 
+	if (dev->parent->of_node)
+		return mc13xxx_led_probe_dt(pdev);
+	else if (!pdata)
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
@@ -175,7 +267,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	for (i = 0; i < num_leds; i++) {
+	for (i = 0; i < leds->num_leds; i++) {
 		const char *name, *trig;
 
 		ret = -EINVAL;
-- 
1.8.3.2
