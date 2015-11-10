From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v4 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Tue, 10 Nov 2015 11:17:44 +0900
Message-ID: <1447121864-15460-3-git-send-email-ingi2.kim@samsung.com>
References: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1447121864-15460-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

This patch adds device driver of Richtek RT5033 PMIC.
The driver supports a current regulated output to drive white LEDs.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/leds/Kconfig               |   8 +
 drivers/leds/Makefile              |   1 +
 drivers/leds/leds-rt5033.c         | 502 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rt5033-private.h |  51 ++++
 4 files changed, 562 insertions(+)
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
index 0000000..eb89731
--- /dev/null
+++ b/drivers/leds/leds-rt5033.c
@@ -0,0 +1,502 @@
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
+#include <linux/led-class-flash.h>
+#include <linux/mfd/rt5033.h>
+#include <linux/mfd/rt5033-private.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+#define RT5033_LED_FLASH_TIMEOUT_MIN		64000
+#define RT5033_LED_FLASH_TIMEOUT_STEP		32000
+#define RT5033_LED_FLASH_BRIGHTNESS_MIN		50000
+#define RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH	600000
+#define RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH	800000
+#define RT5033_LED_FLASH_BRIGHTNESS_STEP	25000
+#define RT5033_LED_TORCH_BRIGHTNESS_MIN		12500
+#define RT5033_LED_TORCH_BRIGHTNESS_STEP	12500
+
+/* Macro to get offset of rt5033_led_config_data */
+#define RT5033_LED_CONFIG_DATA_OFFSET(val, step, min)	(((val) - (min)) \
+							/ (step))
+#define MIN(a, b)		((a) > (b) ? (b) : (a))
+#define FLED1_IOUT		(BIT(0))
+#define FLED2_IOUT		(BIT(1))
+
+enum rt5033_fled {
+	FLED1,
+	FLED2,
+};
+
+struct rt5033_sub_led {
+	enum rt5033_fled fled_id;
+	struct led_classdev_flash fled_cdev;
+	struct work_struct work_brightness_set;
+
+	u32 torch_brightness;
+	u32 flash_brightness;
+	u32 flash_timeout;
+};
+
+/* RT5033 Flash led platform data */
+struct rt5033_led {
+	struct device *dev;
+	struct mutex lock;
+	struct regmap *regmap;
+	struct rt5033_sub_led sub_leds[2];
+
+	u32 iout_torch_max[2];
+	u32 iout_flash_max[2];
+	u8 fled_mask;
+
+	/* arrangement of current outputs */
+	bool iout_joint;
+};
+
+struct rt5033_led_config_data {
+	const char *label[2];
+	u32 flash_max_microamp[2];
+	u32 flash_max_timeout[2];
+	u32 torch_max_microamp[2];
+	u32 num_leds;
+};
+
+static struct rt5033_sub_led *flcdev_to_sub_led(
+					struct led_classdev_flash *fled_cdev)
+{
+	return container_of(fled_cdev, struct rt5033_sub_led, fled_cdev);
+}
+
+static struct rt5033_led *sub_led_to_led(struct rt5033_sub_led *sub_led)
+{
+	return container_of(sub_led, struct rt5033_led,
+			    sub_leds[sub_led->fled_id]);
+}
+
+static int rt5033_fled_used(struct rt5033_led *led, enum rt5033_fled fled_id)
+{
+	u8 fled_bit = (fled_id == FLED1) ? FLED1_IOUT : FLED2_IOUT;
+
+	return led->fled_mask & fled_bit;
+}
+
+static void __rt5033_led_brightness_set(struct rt5033_led *led,
+					enum rt5033_fled fled_id,
+					enum led_brightness brightness)
+{
+	unsigned int val;
+
+	mutex_lock(&led->lock);
+
+	if (!brightness) {
+		regmap_read(led->regmap, RT5033_REG_FLED_FUNCTION1, &val);
+		val &= ~(rt5033_fled_used(led, fled_id));
+		regmap_write(led->regmap, RT5033_REG_FLED_FUNCTION1, val);
+	} else {
+		regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
+				   RT5033_FLED_FUNC1_MASK, RT5033_FLED_PINCTRL |
+				   rt5033_fled_used(led, fled_id));
+		regmap_update_bits(led->regmap,	RT5033_REG_FLED_CTRL1,
+				   RT5033_FLED_CTRL1_MASK,
+				   (brightness - 1) << 4);
+		regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION2,
+				   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED);
+	}
+
+	mutex_unlock(&led->lock);
+}
+
+static void rt5033_led_brightness_set_work(struct work_struct *work)
+{
+	struct rt5033_sub_led *sub_led =
+		container_of(work, struct rt5033_sub_led, work_brightness_set);
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+
+	__rt5033_led_brightness_set(led, sub_led->fled_id,
+				    sub_led->torch_brightness);
+}
+
+static void rt5033_led_brightness_set(struct led_classdev *led_cdev,
+				      enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+
+	sub_led->torch_brightness = brightness;
+	schedule_work(&sub_led->work_brightness_set);
+}
+
+static int rt5033_led_brightness_set_sync(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+
+	__rt5033_led_brightness_set(led, sub_led->fled_id, brightness);
+
+	return 0;
+}
+
+static int rt5033_led_flash_brightness_set(struct led_classdev_flash *fled_cdev,
+					   u32 brightness)
+{
+	struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+	u32 flash_brightness_offset;
+
+	mutex_lock(&led->lock);
+
+	flash_brightness_offset =
+		RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->brightness.val,
+					      fled_cdev->brightness.step,
+					      fled_cdev->brightness.min);
+	sub_led->flash_brightness = flash_brightness_offset;
+
+	mutex_unlock(&led->lock);
+
+	return 0;
+}
+
+static int rt5033_led_flash_timeout_set(struct led_classdev_flash *fled_cdev,
+					u32 timeout)
+{
+	struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+	u32 flash_tm_offset;
+
+	mutex_lock(&led->lock);
+
+	flash_tm_offset =
+		RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->timeout.val,
+					      fled_cdev->timeout.step,
+					      fled_cdev->timeout.min);
+	sub_led->flash_timeout = flash_tm_offset;
+
+	mutex_unlock(&led->lock);
+
+	return 0;
+}
+
+static int rt5033_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
+				       bool state)
+{
+	struct rt5033_sub_led *sub_led = flcdev_to_sub_led(fled_cdev);
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+	enum rt5033_fled fled_id = sub_led->fled_id;
+	unsigned int val;
+
+	regmap_update_bits(led->regmap,	RT5033_REG_FLED_FUNCTION2,
+			   RT5033_FLED_FUNC2_MASK, 0x0);
+	if (state) {
+		regmap_update_bits(led->regmap,	RT5033_REG_FLED_STROBE_CTRL2,
+				   RT5033_FLED_STRBCTRL2_MASK,
+				   sub_led->flash_timeout);
+		regmap_update_bits(led->regmap, RT5033_REG_FLED_STROBE_CTRL1,
+				   RT5033_FLED_STRBCTRL1_MASK,
+				   sub_led->flash_brightness);
+		regmap_update_bits(led->regmap, RT5033_REG_FLED_FUNCTION1,
+				   RT5033_FLED_FUNC1_MASK,
+				   RT5033_FLED_PINCTRL | RT5033_FLED_STRB_SEL |
+				   rt5033_fled_used(led, fled_id));
+		regmap_update_bits(led->regmap,	RT5033_REG_FLED_FUNCTION2,
+				   RT5033_FLED_FUNC2_MASK, RT5033_FLED_ENFLED
+				   | RT5033_FLED_SREG_STRB);
+
+		regmap_read(led->regmap, RT5033_REG_FLED_FUNCTION1, &val);
+	}
+
+	fled_cdev->led_cdev.brightness = LED_OFF;
+
+	mutex_unlock(&led->lock);
+
+	return 0;
+}
+
+static const struct led_flash_ops flash_ops = {
+	.flash_brightness_set = rt5033_led_flash_brightness_set,
+	.strobe_set = rt5033_led_flash_strobe_set,
+	.timeout_set = rt5033_led_flash_timeout_set,
+};
+
+static void rt5033_init_flash_properties(struct rt5033_sub_led *sub_led,
+					 struct rt5033_led_config_data *led_cfg)
+{
+	struct led_classdev_flash *fled_cdev = &sub_led->fled_cdev;
+	struct rt5033_led *led = sub_led_to_led(sub_led);
+	struct led_flash_setting *tm_set, *fl_set;
+	enum rt5033_fled fled_id = sub_led->fled_id;
+
+	tm_set = &fled_cdev->timeout;
+	tm_set->min = RT5033_LED_FLASH_TIMEOUT_MIN;
+	tm_set->max = led_cfg->flash_max_timeout[fled_id];
+	tm_set->step = RT5033_LED_FLASH_TIMEOUT_STEP;
+	tm_set->val = tm_set->max;
+
+	fl_set = &fled_cdev->brightness;
+	fl_set->min = RT5033_LED_FLASH_BRIGHTNESS_MIN;
+	if (led->iout_joint)
+		fl_set->max = MIN(led_cfg->flash_max_microamp[FLED1] +
+				  led_cfg->flash_max_microamp[FLED2],
+				  RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH);
+	else
+		fl_set->max = MIN(led_cfg->flash_max_microamp[fled_id],
+				  RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH);
+	fl_set->step = RT5033_LED_FLASH_BRIGHTNESS_STEP;
+	fl_set->val = fl_set->max;
+}
+
+static void rt5033_led_init_fled_cdev(struct rt5033_sub_led *sub_led,
+				      struct rt5033_led_config_data *led_cfg)
+{
+	struct led_classdev_flash *fled_cdev;
+	struct led_classdev *led_cdev;
+	enum rt5033_fled fled_id = sub_led->fled_id;
+	u32 flash_tm_offset, flash_brightness_offset;
+
+	/* Initialize LED Flash class device */
+	fled_cdev = &sub_led->fled_cdev;
+	fled_cdev->ops = &flash_ops;
+	led_cdev = &fled_cdev->led_cdev;
+
+	led_cdev->name = led_cfg->label[fled_id];
+
+	led_cdev->brightness_set = rt5033_led_brightness_set;
+	led_cdev->brightness_set_sync = rt5033_led_brightness_set_sync;
+	led_cdev->max_brightness = RT5033_LED_CONFIG_DATA_OFFSET(
+				   led_cfg->torch_max_microamp[fled_id],
+				   RT5033_LED_TORCH_BRIGHTNESS_STEP,
+				   RT5033_LED_TORCH_BRIGHTNESS_MIN);
+
+	led_cdev->flags |= LED_DEV_CAP_FLASH;
+	INIT_WORK(&sub_led->work_brightness_set,
+		  rt5033_led_brightness_set_work);
+
+	rt5033_init_flash_properties(sub_led, led_cfg);
+
+	flash_tm_offset = RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->timeout.val,
+							fled_cdev->timeout.step,
+							fled_cdev->timeout.min);
+	flash_brightness_offset =
+		RT5033_LED_CONFIG_DATA_OFFSET(fled_cdev->brightness.val,
+					      fled_cdev->brightness.step,
+					      fled_cdev->brightness.min);
+
+	sub_led->flash_timeout = flash_tm_offset;
+	sub_led->flash_brightness = flash_brightness_offset;
+}
+
+static int rt5033_led_parse_dt(struct rt5033_led *led, struct device *dev,
+			       struct rt5033_led_config_data *cfg,
+			       struct device_node **sub_nodes)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *child_node;
+	struct rt5033_sub_led *sub_leds = led->sub_leds;
+	struct property *prop;
+	u32 led_sources[2];
+	enum rt5033_fled fled_id;
+	int i, ret;
+
+	if (!np)
+		return -ENXIO;
+
+	for_each_available_child_of_node(np, child_node) {
+		prop = of_find_property(child_node, "led-sources", NULL);
+		if (prop) {
+			const u32 *srcs = NULL;
+
+			for (i = 0; i < ARRAY_SIZE(led_sources); ++i) {
+				srcs = of_prop_next_u32(prop, srcs,
+							&led_sources[i]);
+				if (!srcs)
+					break;
+			}
+		} else {
+			dev_err(dev, "led-sources DT property missing\n");
+			ret = -EINVAL;
+			goto err_parse_dt;
+		}
+
+		if (i == 2) {
+			fled_id = FLED1;
+			led->fled_mask = FLED1_IOUT | FLED2_IOUT;
+		} else if (led_sources[0] == FLED1) {
+			fled_id = FLED1;
+			led->fled_mask |= FLED1_IOUT;
+		} else if (led_sources[0] == FLED2) {
+			fled_id = FLED2;
+			led->fled_mask |= FLED2_IOUT;
+		} else {
+			dev_err(dev, "Wrong led-sources DT property value.\n");
+			ret = -EINVAL;
+			goto err_parse_dt;
+		}
+
+		if (sub_nodes[fled_id]) {
+			dev_err(dev,
+				"Conflicting \"led-sources\" DT properties\n");
+			ret = -EINVAL;
+			goto err_parse_dt;
+		}
+
+		sub_nodes[fled_id] = child_node;
+		sub_leds[fled_id].fled_id = fled_id;
+
+		cfg->label[fled_id] =
+			of_get_property(child_node, "label", NULL) ? :
+					child_node->name;
+
+		ret = of_property_read_u32(child_node, "led-max-microamp",
+					   &cfg->torch_max_microamp[fled_id]);
+		if (ret) {
+			dev_err(dev, "failed to parse led-max-microamp\n");
+			goto err_parse_dt;
+		}
+
+		ret = of_property_read_u32(child_node, "flash-max-microamp",
+					   &cfg->flash_max_microamp[fled_id]);
+		if (ret) {
+			dev_err(dev, "failed to parse flash-max-microamp\n");
+			goto err_parse_dt;
+		}
+
+		ret = of_property_read_u32(child_node, "flash-max-timeout-us",
+					   &cfg->flash_max_timeout[fled_id]);
+		if (ret) {
+			dev_err(dev, "failed to parse flash-max-timeout-us\n");
+			goto err_parse_dt;
+		}
+
+		if (++cfg->num_leds == 2 ||
+		    (rt5033_fled_used(led, FLED1) &&
+		     rt5033_fled_used(led, FLED2))) {
+			of_node_put(child_node);
+			break;
+		}
+	}
+
+	if (cfg->num_leds == 0) {
+		dev_err(dev, "No DT child node found for connected LED(s).\n");
+		return -EINVAL;
+	}
+
+	return 0;
+
+err_parse_dt:
+	of_node_put(child_node);
+	return ret;
+}
+
+static int rt5033_led_probe(struct platform_device *pdev)
+{
+	struct rt5033_dev *rt5033 = dev_get_drvdata(pdev->dev.parent);
+	struct rt5033_led *led;
+	struct rt5033_sub_led *sub_leds;
+	struct device_node *sub_nodes[2] = {};
+	struct rt5033_led_config_data led_cfg = {};
+	int init_fled_cdev[2], i, ret;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, led);
+	led->dev = &pdev->dev;
+	led->regmap = rt5033->regmap;
+	sub_leds = led->sub_leds;
+
+	ret = rt5033_led_parse_dt(led, &pdev->dev, &led_cfg, sub_nodes);
+	if (ret)
+		return ret;
+
+	if (led_cfg.num_leds == 1 && rt5033_fled_used(led, FLED1) &&
+	    rt5033_fled_used(led, FLED2))
+		led->iout_joint = true;
+
+	mutex_init(&led->lock);
+
+	init_fled_cdev[FLED1] =
+			led->iout_joint || rt5033_fled_used(led, FLED1);
+	init_fled_cdev[FLED2] =
+			!led->iout_joint && rt5033_fled_used(led, FLED2);
+
+	for (i = FLED1; i <= FLED2; ++i) {
+		if (!init_fled_cdev[i])
+			continue;
+
+		rt5033_led_init_fled_cdev(&sub_leds[i], &led_cfg);
+		ret = led_classdev_flash_register(led->dev,
+						  &sub_leds[i].fled_cdev);
+		if (ret < 0) {
+			if (i == FLED2)
+				goto err_register_led2;
+			else
+				goto err_register_led1;
+		}
+	}
+
+	regmap_update_bits(led->regmap,	RT5033_REG_FLED_FUNCTION1,
+			   RT5033_FLED_FUNC1_MASK, RT5033_FLED_RESET);
+
+	return 0;
+
+err_register_led2:
+	led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
+err_register_led1:
+	mutex_destroy(&led->lock);
+
+	return ret;
+}
+
+static int rt5033_led_remove(struct platform_device *pdev)
+{
+	struct rt5033_led *led = platform_get_drvdata(pdev);
+	struct rt5033_sub_led *sub_leds = led->sub_leds;
+
+	if (led->iout_joint || rt5033_fled_used(led, FLED1)) {
+		led_classdev_flash_unregister(&sub_leds[FLED1].fled_cdev);
+		cancel_work_sync(&sub_leds[FLED1].work_brightness_set);
+	}
+
+	if (!led->iout_joint && rt5033_fled_used(led, FLED2)) {
+		led_classdev_flash_unregister(&sub_leds[FLED2].fled_cdev);
+		cancel_work_sync(&sub_leds[FLED2].work_brightness_set);
+	}
+
+	mutex_destroy(&led->lock);
+
+	return 0;
+}
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
+	.remove		= rt5033_led_remove,
+};
+module_platform_driver(rt5033_led_driver);
+
+MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
+MODULE_DESCRIPTION("Richtek RT5033 LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:rt5033-led");
diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mfd/rt5033-private.h
index 1b63fc2..b20c7e4 100644
--- a/include/linux/mfd/rt5033-private.h
+++ b/include/linux/mfd/rt5033-private.h
@@ -93,6 +93,57 @@ enum rt5033_reg {
 #define RT5033_RT_CTRL1_UUG_MASK	0x02
 #define RT5033_RT_HZ_MASK		0x01
 
+/* RT5033 FLED Function1 register */
+#define RT5033_FLED_FUNC1_MASK		0x97
+#define RT5033_FLED_EN_LEDCS1		0x01
+#define RT5033_FLED_EN_LEDCS2		0x02
+#define RT5033_FLED_STRB_SEL		0x04
+#define RT5033_FLED_PINCTRL		0x10
+#define RT5033_FLED_RESET		0x80
+
+/* RT5033 FLED Function2 register */
+#define RT5033_FLED_FUNC2_MASK		0x81
+#define RT5033_FLED_ENFLED		0x01
+#define RT5033_FLED_SREG_STRB		0x80
+
+/* RT5033 FLED Strobe Control1 */
+#define RT5033_FLED_STRBCTRL1_MASK		0xFF
+#define RT5033_FLED_STRBCTRL1_TM_CUR_MAX	0xE0
+#define RT5033_FLED_STRBCTRL1_FL_CUR_DEF	0x0D
+#define RT5033_FLED_STRBCTRL1_FL_CUR_MAX	0x1F
+
+/* RT5033 FLED Strobe Control2 */
+#define RT5033_FLED_STRBCTRL2_MASK	0x3F
+#define RT5033_FLED_STRBCTRL2_TM_DEF	0x0F
+#define RT5033_FLED_STRBCTRL2_TM_MAX	0x3F
+
+/* RT5033 FLED Control1 */
+#define RT5033_FLED_CTRL1_MASK		0xF7
+#define RT5033_FLED_CTRL1_TORCH_CUR_DEF	0x20
+#define RT5033_FLED_CTRL1_TORCH_CUR_MAX	0xF0
+#define RT5033_FLED_CTRL1_LBP_DEF	0x02
+#define RT5033_FLED_CTRL1_LBP_MAX	0x07
+
+/* RT5033 FLED Control2 */
+#define RT5033_FLED_CTRL2_MASK		0xFF
+#define RT5033_FLED_CTRL2_VMID_DEF	0x37
+#define RT5033_FLED_CTRL2_VMID_MAX	0x3F
+#define RT5033_FLED_CTRL2_TRACK_ALIVE	0x40
+#define RT5033_FLED_CTRL2_MID_TRACK	0x80
+
+/* RT5033 FLED Control4 */
+#define RT5033_FLED_CTRL4_MASK		0xE0
+#define RT5033_FLED_CTRL4_RESV		0x14
+#define RT5033_FLED_CTRL4_VTRREG_DEF	0x40
+#define RT5033_FLED_CTRL4_VTRREG_MAX	0x60
+#define RT5033_FLED_CTRL4_TRACK_CLK	0x80
+
+/* RT5033 FLED Control5 */
+#define RT5033_FLED_CTRL5_MASK		0xC0
+#define RT5033_FLED_CTRL5_RESV		0x10
+#define RT5033_FLED_CTRL5_TA_GOOD	0x40
+#define RT5033_FLED_CTRL5_TA_EXIST	0x80
+
 /* RT5033 control register */
 #define RT5033_CTRL_FCCM_BUCK_MASK		0x00
 #define RT5033_CTRL_BUCKOMS_MASK		0x01
-- 
2.0.5
