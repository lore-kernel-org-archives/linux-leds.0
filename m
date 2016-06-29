From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] leds: add PM8058 LEDs driver
Date: Wed, 29 Jun 2016 16:21:59 +0200
Message-ID: <1467210120-8829-2-git-send-email-linus.walleij@linaro.org>
References: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33866 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752013AbcF2OWJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 29 Jun 2016 10:22:09 -0400
Received: by mail-lf0-f41.google.com with SMTP id h129so34712348lfh.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Jun 2016 07:22:08 -0700 (PDT)
In-Reply-To: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

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
 drivers/leds/Kconfig       |   8 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-pm8058.c | 194 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
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
index 000000000000..3ab27ec6f2de
--- /dev/null
+++ b/drivers/leds/leds-pm8058.c
@@ -0,0 +1,194 @@
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
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/leds.h>
+
+#define PM8058_LED_TYPE_COMMON	0x00
+#define PM8058_LED_TYPE_KEYPAD	0x01
+#define PM8058_LED_TYPE_FLASH	0x02
+
+#define PM8058_LED_TYPE_COMMON_MASK	0xf8
+#define PM8058_LED_TYPE_KEYPAD_MASK	0xf0
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
+					 value << 3);
+		break;
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		ret = regmap_update_bits(led->map, led->reg,
+					 PM8058_LED_TYPE_KEYPAD_MASK,
+					 value << 4);
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
+		return ((val & 0xf8) >> 3);
+		break;
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		ret = regmap_read(led->map, led->reg, &val);
+		if (ret) {
+			pr_err("Failed to get LED brightness\n");
+			return LED_OFF;
+		}
+		return ((val & 0xf0) >> 4);
+		break;
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
+	ret = led_classdev_register(&pdev->dev, &led->cdev);
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
+static int __exit pm8058_led_remove(struct platform_device *pdev)
+{
+	struct pm8058_led *led = platform_get_drvdata(pdev);
+
+	led_classdev_unregister(&led->cdev);
+	return 0;
+}
+
+static struct platform_driver pm8058_led_driver = {
+	.probe		= pm8058_led_probe,
+	.remove		= __exit_p(pm8058_led_remove),
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
2.4.11
