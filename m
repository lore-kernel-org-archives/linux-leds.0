From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2 v4] leds: add PM8058 LEDs driver
Date: Tue, 16 Aug 2016 11:25:10 +0200
Message-ID: <1471339510-26171-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35361 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753258AbcHPJ0W (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 16 Aug 2016 05:26:22 -0400
Received: by mail-wm0-f48.google.com with SMTP id f65so131651951wmi.0
        for <linux-leds@vger.kernel.org>; Tue, 16 Aug 2016 02:25:15 -0700 (PDT)
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
ChangeLog v3->v4:
- Remove unneeded #includes
- Move mask/val outside the switch statement, set up the masking
  and shifting in the switch and have a single regmap call after
  the switch in led_set() and led_get()
- Use of_device_get__match_data() and move match table to the
  bottom of the file.
- Handle the 5 vs 4 bit resolution difference in max brightness
  when registering the different LED types.
- Pass the max brightness for the LED if set to "on" instead of
  hammering with LED_FULL.
- Set core suspend only for the keypad and flash LEDs.
ChangeLog v2->v3:
- No changes, just resending.
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
 drivers/leds/leds-pm8058.c | 191 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 drivers/leds/leds-pm8058.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9dcc9b13d495..f499db5a8552 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -631,6 +631,14 @@ config LEDS_VERSATILE
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
index 0684c865a1c0..220860c970ca 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
+obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
new file mode 100644
index 000000000000..a52674327857
--- /dev/null
+++ b/drivers/leds/leds-pm8058.c
@@ -0,0 +1,191 @@
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
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
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
+	u32 reg;
+	u32 ledtype;
+	struct led_classdev cdev;
+};
+
+static void pm8058_led_set(struct led_classdev *cled,
+	enum led_brightness value)
+{
+	struct pm8058_led *led;
+	int ret = 0;
+	unsigned int mask = 0;
+	unsigned int val = 0;
+
+	led = container_of(cled, struct pm8058_led, cdev);
+	switch (led->ledtype) {
+	case PM8058_LED_TYPE_COMMON:
+		mask = PM8058_LED_TYPE_COMMON_MASK;
+		val = value << PM8058_LED_TYPE_COMMON_SHIFT;
+		break;
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		mask = PM8058_LED_TYPE_KEYPAD_MASK;
+		val = value << PM8058_LED_TYPE_KEYPAD_SHIFT;
+		break;
+	default:
+		break;
+	}
+
+	ret = regmap_update_bits(led->map, led->reg, mask, val);
+	if (ret)
+		pr_err("Failed to set LED brightness\n");
+}
+
+static enum led_brightness pm8058_led_get(struct led_classdev *cled)
+{
+	struct pm8058_led *led;
+	int ret;
+	unsigned int val;
+
+	led = container_of(cled, struct pm8058_led, cdev);
+
+	ret = regmap_read(led->map, led->reg, &val);
+	if (ret) {
+		pr_err("Failed to get LED brightness\n");
+		return LED_OFF;
+	}
+
+	switch (led->ledtype) {
+	case PM8058_LED_TYPE_COMMON:
+		val &= PM8058_LED_TYPE_COMMON_MASK;
+		val >>= PM8058_LED_TYPE_COMMON_SHIFT;
+		break;
+	case PM8058_LED_TYPE_KEYPAD:
+	case PM8058_LED_TYPE_FLASH:
+		val &= PM8058_LED_TYPE_KEYPAD_MASK;
+		val >>= PM8058_LED_TYPE_KEYPAD_SHIFT;
+		break;
+	default:
+		val = LED_OFF;
+		break;
+	}
+
+	return val;
+}
+
+static int pm8058_led_probe(struct platform_device *pdev)
+{
+	struct pm8058_led *led;
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+	struct regmap *map;
+	const char *state;
+	enum led_brightness maxbright;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
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
+	if (led->ledtype == PM8058_LED_TYPE_COMMON)
+		maxbright = 31; /* 5 bits */
+	else
+		maxbright = 15; /* 4 bits */
+	led->cdev.max_brightness = maxbright;
+
+	state = of_get_property(np, "default-state", NULL);
+	if (state) {
+		if (!strcmp(state, "keep")) {
+			led->cdev.brightness = pm8058_led_get(&led->cdev);
+		} else if (!strcmp(state, "on")) {
+			led->cdev.brightness = maxbright;
+			pm8058_led_set(&led->cdev, maxbright);
+		} else {
+			led->cdev.brightness = LED_OFF;
+			pm8058_led_set(&led->cdev, LED_OFF);
+		}
+	}
+
+	if (led->ledtype == PM8058_LED_TYPE_KEYPAD ||
+	    led->ledtype == PM8058_LED_TYPE_FLASH)
+		led->cdev.flags	= LED_CORE_SUSPENDRESUME;
+
+	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
+			led->cdev.name);
+		return ret;
+	}
+
+	return 0;
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
