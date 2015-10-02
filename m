From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Fri, 02 Oct 2015 18:41:15 +0900
Message-ID: <1443778875-18261-3-git-send-email-ingi2.kim@samsung.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46605 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbbJBJlU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 2 Oct 2015 05:41:20 -0400
In-reply-to: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: sameo@linux.intel.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds device driver of Richtek RT5033 PMIC.
The driver supports a current regulated output to drive
white LEDs for camera flash.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/leds/Kconfig               |   8 ++
 drivers/leds/Makefile              |   1 +
 drivers/leds/leds-rt5033.c         | 222 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/rt5033.c               |   3 +
 include/linux/mfd/rt5033-private.h |  67 +++++++++--
 include/linux/mfd/rt5033.h         |  27 ++++-
 6 files changed, 317 insertions(+), 11 deletions(-)
 create mode 100644 drivers/leds/leds-rt5033.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 42990f2..29613e3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -345,6 +345,14 @@ config LEDS_PCA963X
 	  LED driver chip accessed via the I2C bus. Supported
 	  devices include PCA9633 and PCA9634
 
+config LEDS_RT5033
+	tristate "LED support for RT5033 PMIC"
+	depends on LEDS_CLASS_FLASH && OF
+	depends on MFD_RT5033
+	help
+	  This option enables support for on-chip LED driver on
+	  RT5033 PMIC.
+
 config LEDS_WM831X_STATUS
 	tristate "LED support for status LEDs on WM831x PMICs"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index b503f92..bcc4d93 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
 obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
+obj-$(CONFIG_LEDS_RT5033)		+= leds-rt5033.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
 obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
diff --git a/drivers/leds/leds-rt5033.c b/drivers/leds/leds-rt5033.c
new file mode 100644
index 0000000..b154676
--- /dev/null
+++ b/drivers/leds/leds-rt5033.c
@@ -0,0 +1,222 @@
+/*
+ * led driver for RT5033
+ *
+ * Copyright (C) 2015 Samsung Electronics, Co., Ltd.
+ * Ingi Kim <ingi2.kim@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/mfd/rt5033.h>
+#include <linux/mfd/rt5033-private.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define RT5033_LED_FLASH_TIMEOUT_MIN		64000
+#define RT5033_LED_FLASH_TIMEOUT_STEPS		32000
+#define RT5033_LED_TORCH_CURRENT_LEVEL_MAX	16
+
+/* Macro for getting offset of flash timeout */
+#define GET_TIMEOUT_OFFSET(tm, step)	((tm) / (step) - 2)
+
+static struct rt5033_led *flcdev_to_led(
+				struct led_classdev_flash *fled_cdev)
+{
+	return container_of(fled_cdev, struct rt5033_led, fled_cdev);
+}
+
+static int rt5033_led_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct rt5033_led *led = flcdev_to_led(fled_cdev);
+
+	if (!brightness) {
+		regmap_update_bits(led->regmap, RT5033_REG_FL_FUNCTION2,
+				   RT5033_FL_CTRL2_MASK, 0x0);
+	} else {
+		regmap_update_bits(led->regmap, RT5033_REG_FL_FUNCTION1,
+				   RT5033_FL_FUNC1_MASK, RT5033_FL_PINCTRL);
+		regmap_update_bits(led->regmap,	RT5033_REG_FL_CTRL1,
+				   RT5033_FL_CTRL1_MASK, (brightness-1) << 4);
+		regmap_update_bits(led->regmap, RT5033_REG_FL_FUNCTION2,
+				   RT5033_FL_CTRL2_MASK, RT5033_FL_ENFLED);
+	}
+
+	return 0;
+}
+
+static void rt5033_init_flash_timeout(struct rt5033_led *led)
+{
+	struct led_flash_setting *setting;
+
+	setting = &led->fled_cdev.timeout;
+	setting->min = RT5033_LED_FLASH_TIMEOUT_MIN;
+	setting->max = led->data->flash_max_timeout;
+	setting->step = RT5033_LED_FLASH_TIMEOUT_STEPS;
+	setting->val = led->data->flash_max_timeout;
+}
+
+static int rt5033_led_parse_dt(struct rt5033_led *led, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *child_node;
+	struct rt5033_led_config_data *data;
+	int ret = 0;
+
+	if (!np)
+		return -ENXIO;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	child_node = of_get_next_available_child(np, NULL);
+	if (!child_node) {
+		dev_err(dev, "DT child node isn't found\n");
+		return -EINVAL;
+	}
+
+	led->fled_cdev.led_cdev.name =
+		of_get_property(child_node, "label", NULL) ? : child_node->name;
+
+	ret = of_property_read_u32(child_node, "led-max-microamp",
+				   &data->torch_max_microamp);
+	if (ret) {
+		dev_err(dev, "failed to parse led-max-microamp\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(child_node, "flash-max-microamp",
+				   &data->flash_max_microamp);
+	if (ret) {
+		dev_err(dev, "failed to parse flash-max-microamp\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
+				   &data->flash_max_timeout);
+	if (ret)
+		dev_err(dev, "failed to parse flash-max-timeout-us\n");
+
+	of_node_put(child_node);
+	led->data = data;
+
+	return ret;
+}
+
+static int rt5033_led_flash_timeout_set(struct led_classdev_flash *fled_cdev,
+					 u32 timeout)
+{
+	return 0;
+}
+
+static int rt5033_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
+					bool state)
+{
+	struct rt5033_led *led = flcdev_to_led(fled_cdev);
+	u32 flash_tm_reg;
+
+	regmap_update_bits(led->regmap,	RT5033_REG_FL_FUNCTION1,
+			   RT5033_FL_FUNC1_MASK, RT5033_FL_RESET);
+	fled_cdev->led_cdev.brightness = LED_OFF;
+
+	if (state) {
+		flash_tm_reg = GET_TIMEOUT_OFFSET(fled_cdev->timeout.val,
+						  fled_cdev->timeout.step);
+		regmap_update_bits(led->regmap,	RT5033_REG_FL_STROBE_CTRL2,
+				   RT5033_FL_STRBCTRL2_MASK, flash_tm_reg);
+		regmap_update_bits(led->regmap,	RT5033_REG_FL_FUNCTION1,
+				   RT5033_FL_FUNC1_MASK, RT5033_FL_STRB_SEL
+				   | RT5033_FL_PINCTRL);
+		regmap_update_bits(led->regmap,	RT5033_REG_FL_FUNCTION2,
+				   RT5033_FL_FUNC2_MASK, RT5033_FL_ENFLED
+				   | RT5033_FL_SREG_STRB);
+	}
+
+	return 0;
+}
+
+static const struct led_flash_ops flash_ops = {
+	.strobe_set = rt5033_led_flash_strobe_set,
+	.timeout_set = rt5033_led_flash_timeout_set,
+};
+
+static int rt5033_led_probe(struct platform_device *pdev)
+{
+	struct rt5033_dev *rt5033 = dev_get_drvdata(pdev->dev.parent);
+	struct rt5033_led *led;
+	struct led_classdev *led_cdev;
+	int ret;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, led);
+	led->dev = &pdev->dev;
+	led->regmap = rt5033->regmap;
+
+	ret = rt5033_led_parse_dt(led, &pdev->dev);
+	if (ret)
+		return ret;
+
+	rt5033_init_flash_timeout(led);
+	led->fled_cdev.ops = &flash_ops;
+	led_cdev = &led->fled_cdev.led_cdev;
+
+	led_cdev->max_brightness = RT5033_LED_TORCH_CURRENT_LEVEL_MAX;
+	led_cdev->brightness_set_sync = rt5033_led_brightness_set;
+	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
+
+	ret = led_classdev_flash_register(&pdev->dev, &led->fled_cdev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
+		return ret;
+	}
+
+	regmap_update_bits(led->regmap,	RT5033_REG_FL_FUNCTION1,
+			   RT5033_FL_FUNC1_MASK, RT5033_FL_RESET);
+
+	return 0;
+}
+
+static int rt5033_led_remove(struct platform_device *pdev)
+{
+	struct rt5033_led *led = platform_get_drvdata(pdev);
+
+	led_classdev_flash_unregister(&led->fled_cdev);
+
+	return 0;
+}
+
+static const struct platform_device_id rt5033_led_id[] = {
+	{ "rt5033-led", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, rt5033_led_id);
+
+static const struct of_device_id rt5033_led_match[] = {
+	{ .compatible = "richtek,rt5033-led", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rt5033_led_match);
+
+static struct platform_driver rt5033_led_driver = {
+	.driver = {
+		.name = "rt5033-led",
+		.of_match_table = rt5033_led_match,
+	},
+	.probe		= rt5033_led_probe,
+	.id_table	= rt5033_led_id,
+	.remove		= rt5033_led_remove,
+};
+module_platform_driver(rt5033_led_driver);
+
+MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
+MODULE_DESCRIPTION("Richtek RT5033 LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:rt5033-led");
diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index d60f916..035421c 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -47,6 +47,9 @@ static const struct mfd_cell rt5033_devs[] = {
 	}, {
 		.name = "rt5033-battery",
 		.of_compatible = "richtek,rt5033-battery",
+	}, {
+		.name = "rt5033-led",
+		.of_compatible = "richtek,rt5033-led",
 	},
 };
 
diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mfd/rt5033-private.h
index 1b63fc2..21c3aff 100644
--- a/include/linux/mfd/rt5033-private.h
+++ b/include/linux/mfd/rt5033-private.h
@@ -25,15 +25,15 @@ enum rt5033_reg {
 	/* Reserved 0x09~0x18 */
 	RT5033_REG_RT_CTRL1		= 0x19,
 	/* Reserved 0x1A~0x20 */
-	RT5033_REG_FLED_FUNCTION1	= 0x21,
-	RT5033_REG_FLED_FUNCTION2	= 0x22,
-	RT5033_REG_FLED_STROBE_CTRL1	= 0x23,
-	RT5033_REG_FLED_STROBE_CTRL2	= 0x24,
-	RT5033_REG_FLED_CTRL1		= 0x25,
-	RT5033_REG_FLED_CTRL2		= 0x26,
-	RT5033_REG_FLED_CTRL3		= 0x27,
-	RT5033_REG_FLED_CTRL4		= 0x28,
-	RT5033_REG_FLED_CTRL5		= 0x29,
+	RT5033_REG_FL_FUNCTION1		= 0x21,
+	RT5033_REG_FL_FUNCTION2		= 0x22,
+	RT5033_REG_FL_STROBE_CTRL1	= 0x23,
+	RT5033_REG_FL_STROBE_CTRL2	= 0x24,
+	RT5033_REG_FL_CTRL1		= 0x25,
+	RT5033_REG_FL_CTRL2		= 0x26,
+	RT5033_REG_FL_CTRL3		= 0x27,
+	RT5033_REG_FL_CTRL4		= 0x28,
+	RT5033_REG_FL_CTRL5		= 0x29,
 	/* Reserved 0x2A~0x40 */
 	RT5033_REG_CTRL			= 0x41,
 	RT5033_REG_BUCK_CTRL		= 0x42,
@@ -93,6 +93,55 @@ enum rt5033_reg {
 #define RT5033_RT_CTRL1_UUG_MASK	0x02
 #define RT5033_RT_HZ_MASK		0x01
 
+/* RT5033 FLED Function1 register */
+#define RT5033_FL_FLED1_MASK		0x94
+#define RT5033_FL_STROBE_SEL		0x04
+#define RT5033_FL_PIN_CTRL		0x10
+#define RT5033_FL_RESET			0x80
+
+/* RT5033 FLED Function2 register */
+#define RT5033_FL_FLED2_MASK		0x81
+#define RT5033_FL_ENFLED		0x01
+#define RT5033_FL_SREG_STROBE		0x80
+
+/* RT5033 FLED Strobe Control1 */
+#define RT5033_FL_STRBCTRL1_MASK	0xFF
+#define RT5033_FL_STRBCTRL1_TM_CUR_MAX	0xE0
+#define RT5033_FL_STRBCTRL1_FL_CUR_DEF	0x0D
+#define RT5033_FL_STRBCTRL1_FL_CUR_MAX	0x1F
+
+/* RT5033 FLED Strobe Control2 */
+#define RT5033_FL_STRBCTRL2_MASK	0x3F
+#define RT5033_FL_STRBCTRL2_TM_DEF	0x0F
+#define RT5033_FL_STRBCTRL2_TM_MAX	0x3F
+
+/* RT5033 FLED Control1 */
+#define RT5033_FL_CTRL1_MASK		0xF7
+#define RT5033_FL_CTRL1_TORCH_CUR_DEF	0x20
+#define RT5033_FL_CTRL1_TORCH_CUR_MAX	0xF0
+#define RT5033_FL_CTRL1_LBP_DEF		0x02
+#define RT5033_FL_CTRL1_LBP_MAX		0x07
+
+/* RT5033 FLED Control2 */
+#define RT5033_FL_CTRL2_MASK		0xFF
+#define RT5033_FL_CTRL2_VMID_DEF	0x37
+#define RT5033_FL_CTRL2_VMID_MAX	0x3F
+#define RT5033_FL_CTRL2_TRACK_ALIVE	0x40
+#define RT5033_FL_CTRL2_MID_TRACK	0x80
+
+/* RT5033 FLED Control4 */
+#define RT5033_FL_CTRL4_MASK		0xE0
+#define RT5033_FL_CTRL4_RESV		0x14
+#define RT5033_FL_CTRL4_VTRREG_DEF	0x40
+#define RT5033_FL_CTRL4_VTRREG_MAX	0x60
+#define RT5033_FL_CTRL4_TRACK_CLK	0x80
+
+/* RT5033 FLED Control5 */
+#define RT5033_FL_CTRL5_MASK		0xC0
+#define RT5033_FL_CTRL5_RESV		0x10
+#define RT5033_FL_CTRL5_TA_GOOD		0x40
+#define RT5033_FL_CTRL5_TA_EXIST	0x80
+
 /* RT5033 control register */
 #define RT5033_CTRL_FCCM_BUCK_MASK		0x00
 #define RT5033_CTRL_BUCKOMS_MASK		0x01
diff --git a/include/linux/mfd/rt5033.h b/include/linux/mfd/rt5033.h
index 6cff5cf..45c97b7 100644
--- a/include/linux/mfd/rt5033.h
+++ b/include/linux/mfd/rt5033.h
@@ -12,10 +12,11 @@
 #ifndef __RT5033_H__
 #define __RT5033_H__
 
-#include <linux/regulator/consumer.h>
+#include <linux/led-class-flash.h>
 #include <linux/i2c.h>
-#include <linux/regmap.h>
 #include <linux/power_supply.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* RT5033 regulator IDs */
 enum rt5033_regulators {
@@ -59,4 +60,26 @@ struct rt5033_charger {
 	struct rt5033_charger_data	*chg;
 };
 
+/* RT5033 led platform data */
+
+struct rt5033_led_config_data {
+	/* maximum LED current in movie mode */
+	u32 torch_max_microamp;
+	/* maximum LED current in flash mode */
+	u32 flash_max_microamp;
+	/* maximum flash timeout */
+	u32 flash_max_timeout;
+	/* max LED brightness level */
+	enum led_brightness max_brightness;
+};
+
+struct rt5033_led {
+	struct device		*dev;
+	struct rt5033_dev	*rt5033;
+	struct regmap		*regmap;
+
+	/* Related LED class device */
+	struct led_classdev	cdev;
+};
+
 #endif /* __RT5033_H__ */
-- 
2.0.5
