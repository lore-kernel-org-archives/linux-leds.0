From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH 3/3] leds: leds-mc13783: Add devicetree support
Date: Sat,  7 Dec 2013 10:24:24 +0400
Message-ID: <1386397464-31033-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Philippe=20R=C3=A9tornaz?= <philippe.retornaz-p8DiymsW2f8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds devicetree support for the MC13XXX LED driver.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt |  38 +++++
 drivers/leds/leds-mc13783.c                       | 161 ++++++++++++++--------
 2 files changed, 143 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index abd9e3c..bdf31e8 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -10,9 +10,37 @@ Optional properties:
 - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
 
 Sub-nodes:
+- leds : Contain the led nodes and initial register values in property
+  "led_control". Number of register depends of used IC, for MC13783 is 6,
+  for MC13892 is 4. See datasheet for bits definitions of these register.
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
+    12 : Main display
+    13 : AUX display
+    14 : Keypad
+    15 : Red
+    16 : Green
+    17 : Blue
+
 MC13783 regulators:
     sw1a      : regulator SW1A      (register 24, bit 0)
     sw1b      : regulator SW1B      (register 25, bit 0)
@@ -89,6 +117,16 @@ ecspi@70010000 { /* ECSPI1 */
 		interrupt-parent = <&gpio0>;
 		interrupts = <8>;
 
+		leds {
+			led_control = <0x000 0x000 0x0e0 0x000>;
+
+			system_led {
+				reg = <15>;
+				label = "system:red:live";
+				linux,default-trigger = "heartbeat";
+			};
+		};
+
 		regulators {
 			sw1_reg: mc13892__sw1 {
 				regulator-min-microvolt = <600000>;
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index ca87a1b..bc3ea2b 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -20,26 +20,27 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/leds.h>
+#include <linux/of.h>
 #include <linux/workqueue.h>
 #include <linux/mfd/mc13xxx.h>
 
-#define MC13XXX_REG_LED_CONTROL(x)	(51 + (x))
-
 struct mc13xxx_led_devtype {
 	int	led_min;
 	int	led_max;
 	int	num_regs;
+	u32	ledctrl_base;
 };
 
 struct mc13xxx_led {
 	struct led_classdev	cdev;
 	struct work_struct	work;
-	struct mc13xxx		*master;
 	enum led_brightness	new_brightness;
 	int			id;
+	struct mc13xxx_leds	*leds;
 };
 
 struct mc13xxx_leds {
+	struct mc13xxx			*master;
 	struct mc13xxx_led_devtype	*devtype;
 	int				num_leds;
 	struct mc13xxx_led		led[0];
@@ -48,23 +49,24 @@ struct mc13xxx_leds {
 static void mc13xxx_led_work(struct work_struct *work)
 {
 	struct mc13xxx_led *led = container_of(work, struct mc13xxx_led, work);
-	int reg, mask, value, bank, off, shift;
+	struct mc13xxx_leds *leds = led->leds;
+	unsigned int reg, mask, value, bank, off, shift;
 
 	switch (led->id) {
 	case MC13783_LED_MD:
-		reg = MC13XXX_REG_LED_CONTROL(2);
+		reg = 2;
 		shift = 9;
 		mask = 0x0f;
 		value = led->new_brightness >> 4;
 		break;
 	case MC13783_LED_AD:
-		reg = MC13XXX_REG_LED_CONTROL(2);
+		reg = 2;
 		shift = 13;
 		mask = 0x0f;
 		value = led->new_brightness >> 4;
 		break;
 	case MC13783_LED_KP:
-		reg = MC13XXX_REG_LED_CONTROL(2);
+		reg = 2;
 		shift = 17;
 		mask = 0x0f;
 		value = led->new_brightness >> 4;
@@ -80,25 +82,25 @@ static void mc13xxx_led_work(struct work_struct *work)
 	case MC13783_LED_B3:
 		off = led->id - MC13783_LED_R1;
 		bank = off / 3;
-		reg = MC13XXX_REG_LED_CONTROL(3) + bank;
+		reg = 3 + bank;
 		shift = (off - bank * 3) * 5 + 6;
 		value = led->new_brightness >> 3;
 		mask = 0x1f;
 		break;
 	case MC13892_LED_MD:
-		reg = MC13XXX_REG_LED_CONTROL(0);
+		reg = 0;
 		shift = 3;
 		mask = 0x3f;
 		value = led->new_brightness >> 2;
 		break;
 	case MC13892_LED_AD:
-		reg = MC13XXX_REG_LED_CONTROL(0);
+		reg = 0;
 		shift = 15;
 		mask = 0x3f;
 		value = led->new_brightness >> 2;
 		break;
 	case MC13892_LED_KP:
-		reg = MC13XXX_REG_LED_CONTROL(1);
+		reg = 1;
 		shift = 3;
 		mask = 0x3f;
 		value = led->new_brightness >> 2;
@@ -108,7 +110,7 @@ static void mc13xxx_led_work(struct work_struct *work)
 	case MC13892_LED_B:
 		off = led->id - MC13892_LED_R;
 		bank = off / 2;
-		reg = MC13XXX_REG_LED_CONTROL(2) + bank;
+		reg = 2 + bank;
 		shift = (off - bank * 2) * 12 + 3;
 		value = led->new_brightness >> 2;
 		mask = 0x3f;
@@ -117,7 +119,8 @@ static void mc13xxx_led_work(struct work_struct *work)
 		BUG();
 	}
 
-	mc13xxx_reg_rmw(led->master, reg, mask << shift, value << shift);
+	mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + reg,
+			mask << shift, value << shift);
 }
 
 static void mc13xxx_led_set(struct led_classdev *led_cdev,
@@ -130,80 +133,121 @@ static void mc13xxx_led_set(struct led_classdev *led_cdev,
 	schedule_work(&led->work);
 }
 
+static int __init mc13xxx_led_setup_of(struct mc13xxx_leds *leds,
+				       struct device_node *parent)
+{
+#ifdef CONFIG_OF
+	struct device_node *child;
+	int ret, i = 0;
+
+	for_each_child_of_node(parent, child) {
+		ret = of_property_read_u32(child, "reg", &leds->led[i].id);
+		if (ret)
+			return ret;
+		leds->led[i].cdev.name = of_get_property(child, "label", NULL);
+		leds->led[i].cdev.default_trigger =
+			of_get_property(child, "linux,default-trigger", NULL);
+		i++;
+	}
+
+	return 0;
+#else
+	return -ENOTSUPP;
+#endif
+}
+
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
-	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct mc13xxx *mcdev = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(dev);
+	struct mc13xxx *mcdev = dev_get_drvdata(dev->parent);
 	struct mc13xxx_led_devtype *devtype =
 		(struct mc13xxx_led_devtype *)pdev->id_entry->driver_data;
+	int i, num_leds = 0, ret = 0;
+	struct device_node *parent;
 	struct mc13xxx_leds *leds;
-	int i, id, num_leds, ret = -ENODATA;
-	u32 reg, init_led = 0;
-
-	if (!pdata) {
-		dev_err(&pdev->dev, "Missing platform data\n");
-		return -ENODEV;
+	u32 *ctrls = NULL, init_led = 0;
+
+	of_node_get(dev->parent->of_node);
+	parent = of_find_node_by_name(dev->parent->of_node, "leds");
+
+	if (pdata) {
+		num_leds = pdata->num_leds;
+		ctrls = pdata->led_control;
+	} else if (parent) {
+		num_leds = of_get_child_count(parent);
+		ret = of_property_read_u32_array(parent, "led_control", ctrls,
+						 devtype->num_regs);
+		if (ret)
+			goto out_node_put;
+	} else {
+		return -ENODATA;
 	}
 
-	num_leds = pdata->num_leds;
-
 	if ((num_leds < 1) ||
 	    (num_leds > (devtype->led_max - devtype->led_min + 1))) {
-		dev_err(&pdev->dev, "Invalid LED count %d\n", num_leds);
-		return -EINVAL;
+		ret = -ERANGE;
+		goto out_node_put;
 	}
 
-	leds = devm_kzalloc(&pdev->dev, num_leds * sizeof(struct mc13xxx_led) +
-			    sizeof(struct mc13xxx_leds), GFP_KERNEL);
-	if (!leds)
-		return -ENOMEM;
+	leds = devm_kzalloc(dev, num_leds * sizeof(struct mc13xxx_led) +
+			    sizeof(*leds), GFP_KERNEL);
+	if (!leds) {
+		ret = -ENOMEM;
+		goto out_node_put;
+	}
 
 	leds->devtype = devtype;
 	leds->num_leds = num_leds;
+	leds->master = mcdev;
 	platform_set_drvdata(pdev, leds);
 
 	for (i = 0; i < devtype->num_regs; i++) {
-		reg = pdata->led_control[i];
-		WARN_ON(reg >= (1 << 24));
-		ret = mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), reg);
+		ret = mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i,
+					ctrls[i]);
 		if (ret)
-			return ret;
+			goto out_node_put;
 	}
 
-	for (i = 0; i < num_leds; i++) {
-		const char *name, *trig;
-
-		ret = -EINVAL;
-
-		id = pdata->led[i].id;
-		name = pdata->led[i].name;
-		trig = pdata->led[i].default_trigger;
+	if (pdata) {
+		for (i = 0; i < num_leds; i++) {
+			leds->led[i].id = pdata->led[i].id;
+			leds->led[i].cdev.name = pdata->led[i].name;
+			leds->led[i].cdev.default_trigger =
+				pdata->led[i].default_trigger;
+		}
+	} else {
+		ret = mc13xxx_led_setup_of(leds, parent);
+		if (ret)
+			goto out_node_put;
+	}
 
-		if ((id > devtype->led_max) || (id < devtype->led_min)) {
-			dev_err(&pdev->dev, "Invalid ID %i\n", id);
+	for (i = 0; i < num_leds; i++) {
+		if ((leds->led[i].id > devtype->led_max) ||
+		    (leds->led[i].id < devtype->led_min)) {
+			dev_err(dev, "Invalid ID %i\n", leds->led[i].id);
+			ret = -EINVAL;
 			break;
 		}
 
-		if (init_led & (1 << id)) {
-			dev_warn(&pdev->dev,
-				 "LED %i already initialized\n", id);
+		if (init_led & (1 << leds->led[i].id)) {
+			dev_err(dev, "LED %i already initialized\n",
+				leds->led[i].id);
+			ret = -EEXIST;
 			break;
 		}
 
-		init_led |= 1 << id;
-		leds->led[i].id = id;
-		leds->led[i].master = mcdev;
-		leds->led[i].cdev.name = name;
-		leds->led[i].cdev.default_trigger = trig;
+		init_led |= 1 << leds->led[i].id;
+		leds->led[i].leds = leds;
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.brightness = LED_OFF;
 
 		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
 
-		ret = led_classdev_register(pdev->dev.parent,
-					    &leds->led[i].cdev);
+		ret = led_classdev_register(dev, &leds->led[i].cdev);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to register LED %i\n", id);
+			dev_err(dev, "Failed to register LED %i\n",
+				leds->led[i].id);
 			break;
 		}
 	}
@@ -214,13 +258,16 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 			cancel_work_sync(&leds->led[i].work);
 		}
 
+out_node_put:
+	of_node_put(parent);
+
 	return ret;
 }
 
 static int mc13xxx_led_remove(struct platform_device *pdev)
 {
-	struct mc13xxx *mcdev = dev_get_drvdata(pdev->dev.parent);
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
+	struct mc13xxx *mcdev = leds->master;
 	int i;
 
 	for (i = 0; i < leds->num_leds; i++) {
@@ -229,7 +276,7 @@ static int mc13xxx_led_remove(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < leds->devtype->num_regs; i++)
-		mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), 0);
+		mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base + i, 0);
 
 	return 0;
 }
@@ -238,12 +285,14 @@ static const struct mc13xxx_led_devtype mc13783_led_devtype = {
 	.led_min	= MC13783_LED_MD,
 	.led_max	= MC13783_LED_B3,
 	.num_regs	= 6,
+	.ledctrl_base	= 51,
 };
 
 static const struct mc13xxx_led_devtype mc13892_led_devtype = {
 	.led_min	= MC13892_LED_MD,
 	.led_max	= MC13892_LED_B,
 	.num_regs	= 4,
+	.ledctrl_base	= 51,
 };
 
 static const struct platform_device_id mc13xxx_led_id_table[] = {
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
