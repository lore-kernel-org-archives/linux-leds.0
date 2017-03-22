From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv2 2/2] leds: cpcap: new driver
Date: Wed, 22 Mar 2017 01:09:12 +0100
Message-ID: <20170322000912.24210-2-sre@kernel.org>
References: <20170322000912.24210-1-sre@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756389AbdCVAPy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Mar 2017 20:15:54 -0400
In-Reply-To: <20170322000912.24210-1-sre@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Motorola CPCAP is a PMIC (power management integrated circuit) found
in multiple smartphones. This driver adds support for the chip's LED
controllers. This introduces support for all controllers used by the
Droid 4. According to Motorola's driver (no datasheets available)
there a couple of more LED controllers. I did not add support for
them, since I cannot verify that they work with my modifications.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Changes since PATCHv1:
 - binding: reference common led binding for label
 - drop DEBUG define (leftover)
 - s/led/LED/g in debug prints
 - order includes alphabetically
 - introduce mutex, since led API is not atomic
 - register led class after initial register setup
 - use GPLv2+ in header
 - drop unsupported leds from driver
---
 .../devicetree/bindings/leds/cpcap-leds.txt        |  29 +++
 drivers/leds/Kconfig                               |   9 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-cpcap.c                          | 241 +++++++++++++++++++++
 4 files changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/cpcap-leds.txt
 create mode 100644 drivers/leds/leds-cpcap.c

diff --git a/Documentation/devicetree/bindings/leds/cpcap-leds.txt b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
new file mode 100644
index 000000000000..ebf7cdc7f70c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cpcap-leds.txt
@@ -0,0 +1,29 @@
+Motorola CPCAP PMIC LEDs
+------------------------
+
+This module is part of the CPCAP. For more details about the whole
+chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
+
+Requires node properties:
+- compatible: should be one of
+   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
+   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
+   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
+   * "motorola,cpcap-led-red"		(Red Triode)
+   * "motorola,cpcap-led-green"		(Green Triode)
+   * "motorola,cpcap-led-blue"		(Blue Triode)
+   * "motorola,cpcap-led-cf"		(Camera Flash)
+   * "motorola,cpcap-led-bt"		(Bluetooth)
+   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
+- label: see Documentation/devicetree/bindings/leds/common.txt
+- vdd-supply: A phandle to the regulator powering the LED
+
+Example:
+
+&cpcap {
+	cpcap_led_red: red-led {
+		compatible = "motorola,cpcap-led-red";
+		label = "cpcap:red";
+		vdd-supply = <&sw5>;
+	};
+};
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 275f467956ee..043f02a4fe73 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -76,6 +76,15 @@ config LEDS_BCM6358
 	  This option enables support for LEDs connected to the BCM6358
 	  LED HW controller accessed via MMIO registers.
 
+config LEDS_CPCAP
+	tristate "LED Support for Motorola CPCAP"
+	depends on LEDS_CLASS
+	depends on MFD_CPCAP
+	depends on OF
+	help
+	  This option enables support for LEDs offered by Motorola's
+	  CPCAP PMIC.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6b8273736478..333e84ce5d3b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
+obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
 obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
new file mode 100644
index 000000000000..816119e40d0c
--- /dev/null
+++ b/drivers/leds/leds-cpcap.c
@@ -0,0 +1,241 @@
+/*
+ * Copyright (c) 2017 Sebastian Reichel <sre@kernel.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * later as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/leds.h>
+#include <linux/mfd/motorola-cpcap.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define CPCAP_LED_NO_CURRENT 0x0001
+#define CPCAP_LED_OFF 0x0000
+#define CPCAP_LED_ON 0x01
+
+struct cpcap_led_info {
+	u16 reg;
+	u16 mask;
+	u16 limit;
+	u16 init_mask;
+	u16 init_val;
+};
+
+static const struct cpcap_led_info cpcap_led_red = {
+	.reg	= CPCAP_REG_REDC,
+	.mask	= 0x03FF,
+	.limit	= 31,
+};
+
+static const struct cpcap_led_info cpcap_led_green = {
+	.reg	= CPCAP_REG_GREENC,
+	.mask	= 0x03FF,
+	.limit	= 31,
+};
+
+static const struct cpcap_led_info cpcap_led_blue = {
+	.reg	= CPCAP_REG_BLUEC,
+	.mask	= 0x03FF,
+	.limit	= 31,
+};
+
+/* aux display light */
+static const struct cpcap_led_info cpcap_led_adl = {
+	.reg		= CPCAP_REG_ADLC,
+	.mask		= 0x000F,
+	.limit		= 1,
+	.init_mask	= 0x7FFF,
+	.init_val	= 0x5FF0,
+};
+
+/* camera privacy led */
+static const struct cpcap_led_info cpcap_led_cp = {
+	.reg		= CPCAP_REG_CLEDC,
+	.mask		= 0x0007,
+	.limit		= 1,
+	.init_mask	= 0x03FF,
+	.init_val	= 0x0008,
+};
+
+struct cpcap_led {
+	struct led_classdev led;
+	const struct cpcap_led_info *info;
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex update_lock;
+	struct regulator *vdd;
+	bool powered;
+
+	u32 current_limit;
+};
+
+static u16 cpcap_led_val(u8 current_limit, u8 duty_cycle)
+{
+	current_limit &= 0x1f; /* 5 bit */
+	duty_cycle &= 0x0f; /* 4 bit */
+
+	return current_limit << 4 | duty_cycle;
+}
+
+static int cpcap_led_set_power(struct cpcap_led *led, bool status)
+{
+	int err;
+
+	if (status == led->powered)
+		return 0;
+
+	if (status)
+		err = regulator_enable(led->vdd);
+	else
+		err = regulator_disable(led->vdd);
+
+	if (err) {
+		dev_err(led->dev, "regulator failure: %d", err);
+		return err;
+	}
+
+	led->powered = status;
+
+	return 0;
+}
+
+static int cpcap_led_set(struct led_classdev *ledc, enum led_brightness value)
+{
+	struct cpcap_led *led = container_of(ledc, struct cpcap_led, led);
+	int brightness;
+	int err;
+
+	mutex_lock(&led->update_lock);
+
+	if (value > LED_OFF) {
+		err = cpcap_led_set_power(led, true);
+		if (err)
+			goto exit;
+	}
+
+	if (value == LED_OFF) {
+		/* Avoid HW issue by turning off current before duty cycle */
+		err = regmap_update_bits(led->regmap,
+			led->info->reg, led->info->mask, CPCAP_LED_NO_CURRENT);
+		if (err) {
+			dev_err(led->dev, "regmap failed: %d", err);
+			goto exit;
+		}
+
+		brightness = CPCAP_LED_OFF;
+	} else {
+		brightness = cpcap_led_val(value, CPCAP_LED_ON);
+	}
+
+	err = regmap_update_bits(led->regmap, led->info->reg, led->info->mask,
+		brightness);
+	if (err) {
+		dev_err(led->dev, "regmap failed: %d", err);
+		goto exit;
+	}
+
+	if (value == LED_OFF) {
+		err = cpcap_led_set_power(led, false);
+		if (err)
+			goto exit;
+	}
+
+exit:
+	mutex_unlock(&led->update_lock);
+	return err;
+}
+
+static const struct of_device_id cpcap_led_of_match[] = {
+	{ .compatible = "motorola,cpcap-led-red", .data = &cpcap_led_red },
+	{ .compatible = "motorola,cpcap-led-green", .data = &cpcap_led_green },
+	{ .compatible = "motorola,cpcap-led-blue",  .data = &cpcap_led_blue },
+	{ .compatible = "motorola,cpcap-led-adl", .data = &cpcap_led_adl },
+	{ .compatible = "motorola,cpcap-led-cp", .data = &cpcap_led_cp },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cpcap_led_of_match);
+
+static int cpcap_led_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct cpcap_led *led;
+	int err;
+
+	match = of_match_device(of_match_ptr(cpcap_led_of_match), &pdev->dev);
+	if (!match || !match->data)
+		return -EINVAL;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, led);
+	led->info = match->data;
+	led->dev = &pdev->dev;
+
+	if (led->info->reg == 0x0000) {
+		dev_err(led->dev, "Unsupported LED");
+		return -ENODEV;
+	}
+
+	led->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!led->regmap)
+		return -ENODEV;
+
+	led->vdd = devm_regulator_get(&pdev->dev, "vdd");
+	if (IS_ERR(led->vdd)) {
+		err = PTR_ERR(led->vdd);
+		dev_err(led->dev, "Couldn't get regulator: %d", err);
+		return err;
+	}
+
+	err = device_property_read_string(&pdev->dev, "label", &led->led.name);
+	if (err) {
+		dev_err(led->dev, "Couldn't read LED label: %d", err);
+		return err;
+	}
+
+	if (led->info->init_mask) {
+		err = regmap_update_bits(led->regmap, led->info->reg,
+			led->info->init_mask, led->info->init_val);
+		if (err) {
+			dev_err(led->dev, "regmap failed: %d", err);
+			return err;
+		}
+	}
+
+	mutex_init(&led->update_lock);
+
+	led->led.max_brightness = led->info->limit;
+	led->led.brightness_set_blocking = cpcap_led_set;
+	err = devm_led_classdev_register(&pdev->dev, &led->led);
+	if (err) {
+		dev_err(led->dev, "Couldn't register LED: %d", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static struct platform_driver cpcap_led_driver = {
+	.probe = cpcap_led_probe,
+	.driver = {
+		.name = "cpcap-led",
+		.of_match_table = cpcap_led_of_match,
+	},
+};
+module_platform_driver(cpcap_led_driver);
+
+MODULE_DESCRIPTION("CPCAP LED driver");
+MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.11.0
