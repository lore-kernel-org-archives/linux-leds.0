From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v2] leds: add PM8058 LEDs driver
Date: Wed,  6 Jul 2016 23:42:13 +0200
Message-ID: <1467841333-11298-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-leds@vger.kernel.org

This adds a driver for the six PM8058 LEDs, three ordinary LEDs,
two "flash" LEDs and one "keypad" LED.

The "keypad" and "flash" LEDs are not really hard-wired to these
usecases: for example on the APQ8060 Dragonboard, the "keypad"
LED is instead used to drive an IR LED used for the proximity
sensor. The "flash" LEDs are just ordinary high-current LED
drivers.

Cc: linux-arm-msm@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Arrange #includes in alphabetical order
- Use #define'd mask and shift and abstain from magic values
- Drop surplus break; statements in switch clause
- Put in the missed terminator {} in the OF match table
- Use the devm_led_classdev_register() call to get managed resources
- As a result drop the whole redundant .remove() clause
---
 drivers/leds/Kconfig       |   8 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-pm8058.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/leds/leds-pm8058.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 5ae28340a98b..a6731f00641f 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -617,6 +617,14 @@ config LEDS_VERSATILE
 	  This option enabled support for the LEDs on the ARM Versatile
 	  and RealView boards. Say Y to enabled these.
 
+config LEDS_PM8058
+	tristate "LED Support for the Qualcomm PM8058 PMIC"
+	depends on MFD_PM8921_CORE
+	depends on LEDS_CLASS
+	help
+	  Choose this option if you want to use the LED drivers in
+	  the Qualcomm PM8058 PMIC.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cb2013df52d9..9ee31057f468 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
new file mode 100644
index 000000000000..70a6a48496cc
--- /dev/null
+++ b/drivers/leds/leds-pm8058.c
@@ -0,0 +1,188 @@
+/* Copyright (c) 2010, 2011, 2016 The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define PM8058_LED_TYPE_COMMON	0x00
+#define PM8058_LED_TYPE_KEYPAD	0x01
+#define PM8058_LED_TYPE_FLASH	0x02
+
+#define PM8058_LED_TYPE_COMMON_MASK	0xf8
+#define PM8058_LED_TYPE_KEYPAD_MASK	0xf0
+#define PM8058_LED_TYPE_COMMON_SHIFT	3
+#define PM8058_LED_TYPE_KEYPAD_SHIFT	4
+
+struct pm8058_led {
+	struct regmap *map;
+	unsigned int reg;
+	u32 ledtype;
+	struct led_classdev cdev;
+};
+
+static void pm8058_led_set(struct led_classdev *cled,
+	enum led_brightness value)
+{
+	struct pm8058_led *led;
+	int ret = 0;
+
+	led = container_of(cled, struct pm8058_led, cdev);
+	switch (led->ledtype) {
+	case PM8058_LED_TYPE_COMMON:
+		ret = regmap_update_bits(led->map, led->reg,
+					 PM8058_LED_TYPE_COMMON_MASK,
+					 value << PM8058_LED_TYPE_COMMON_SHIFT);
+		break;
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		ret = regmap_update_bits(led->map, led->reg,
+					 PM8058_LED_TYPE_KEYPAD_MASK,
+					 value << PM8058_LED_TYPE_KEYPAD_SHIFT);
+		break;
+	default:
+		break;
+	}
+	if (ret)
+		pr_err("Failed to set LED brightness\n");
+}
+
+static enum led_brightness pm8058_led_get(struct led_classdev *cled)
+{
+	struct pm8058_led *led;
+	int ret;
+	u32 val;
+
+	led = container_of(cled, struct pm8058_led, cdev);
+	switch (led->ledtype) {
+	case PM8058_LED_TYPE_COMMON:
+		ret = regmap_read(led->map, led->reg, &val);
+		if (ret) {
+			pr_err("Failed to get LED brightness\n");
+			return LED_OFF;
+		}
+		return ((val & PM8058_LED_TYPE_COMMON_MASK) >>
+			PM8058_LED_TYPE_COMMON_SHIFT);
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		ret = regmap_read(led->map, led->reg, &val);
+		if (ret) {
+			pr_err("Failed to get LED brightness\n");
+			return LED_OFF;
+		}
+		return ((val & PM8058_LED_TYPE_KEYPAD_MASK) >>
+			PM8058_LED_TYPE_KEYPAD_SHIFT);
+	default:
+		break;
+	}
+
+	return LED_OFF;
+}
+
+static const struct of_device_id pm8058_leds_id_table[] = {
+	{
+		.compatible = "qcom,pm8058-led",
+		.data = (void *)PM8058_LED_TYPE_COMMON
+	},
+	{
+		.compatible = "qcom,pm8058-keypad-led",
+		.data = (void *)PM8058_LED_TYPE_KEYPAD
+	},
+	{
+		.compatible = "qcom,pm8058-flash-led",
+		.data = (void *)PM8058_LED_TYPE_FLASH
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, pm8058_leds_id_table);
+
+static int pm8058_led_probe(struct platform_device *pdev)
+{
+	struct pm8058_led *led;
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+	struct regmap *map;
+	const struct of_device_id *match;
+	const char *state;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (led == NULL)
+		return -ENOMEM;
+
+	match = of_match_node(pm8058_leds_id_table, np);
+	if (!match)
+		return -ENXIO;
+	led->ledtype = (u32)match->data;
+
+	map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!map) {
+		dev_err(&pdev->dev, "Parent regmap unavailable.\n");
+		return -ENXIO;
+	}
+	led->map = map;
+
+	ret = of_property_read_u32(np, "reg", &led->reg);
+	if (ret) {
+		dev_err(&pdev->dev, "no register offset specified\n");
+		return -EINVAL;
+	}
+
+	/* Use label else node name */
+	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
+	led->cdev.default_trigger =
+		of_get_property(np, "linux,default-trigger", NULL);
+	led->cdev.brightness_set = pm8058_led_set;
+	led->cdev.brightness_get = pm8058_led_get;
+	led->cdev.max_brightness = 15;
+
+	state = of_get_property(np, "default-state", NULL);
+	if (state) {
+		if (!strcmp(state, "keep")) {
+			led->cdev.brightness = pm8058_led_get(&led->cdev);
+		} else if (!strcmp(state, "on")) {
+			led->cdev.brightness = LED_FULL;
+			pm8058_led_set(&led->cdev, LED_FULL);
+		} else {
+			led->cdev.brightness = LED_OFF;
+			pm8058_led_set(&led->cdev, LED_OFF);
+		}
+	}
+	led->cdev.flags	= LED_CORE_SUSPENDRESUME;
+
+	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
+			led->cdev.name);
+		return ret;
+	}
+	platform_set_drvdata(pdev, led);
+
+	return 0;
+}
+
+static struct platform_driver pm8058_led_driver = {
+	.probe		= pm8058_led_probe,
+	.driver		= {
+		.name	= "pm8058-leds",
+		.of_match_table = pm8058_leds_id_table,
+	},
+};
+module_platform_driver(pm8058_led_driver);
+
+MODULE_DESCRIPTION("PM8058 LEDs driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:pm8058-leds");
-- 
2.7.4
