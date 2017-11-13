From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] leds: lm3692x: Introduce LM3692x dual string driver
Date: Mon, 13 Nov 2017 14:50:52 -0600
Message-ID: <20171113205052.25884-2-dmurphy@ti.com>
References: <20171113205052.25884-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113205052.25884-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Introducing the LM3692x Dual-String white LED driver.

Data sheet is located
http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3692x.c | 380 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 380 insertions(+)
 create mode 100644 drivers/leds/leds-lm3692x.c

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
new file mode 100644
index 000000000000..beb753abc7b0
--- /dev/null
+++ b/drivers/leds/leds-lm3692x.c
@@ -0,0 +1,380 @@
+/*
+ * TI lm3692x LED Driver
+ *
+ * Copyright (C) 2017 Texas Instruments
+ *
+ * Author: Dan Murphy <dmurphy@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/slab.h>
+
+#define LM3692X_LED_NAME	"lm3692x_led"
+
+#define LM3692X_REV		0x0
+#define LM3692X_RESET		0x1
+#define LM3692X_EN		0x10
+#define LM3692X_BRT_CTRL	0x11
+#define LM3692X_PWM_CTRL	0x12
+#define LM3692X_BOOST_CTRL	0x13
+#define LM3692X_AUTO_FREQ_HI	0x15
+#define LM3692X_AUTO_FREQ_LO	0x16
+#define LM3692X_BL_ADJ_THRESH	0x17
+#define LM3692X_BRT_LSB		0x18
+#define LM3692X_BRT_MSB		0x19
+#define LM3692X_FAULT_CTRL	0x1e
+#define LM3692X_FAULT_FLAGS	0x1f
+
+#define LM3692X_SW_RESET	BIT(0)
+#define LM3692X_DEVICE_EN	BIT(0)
+#define LM3692X_LED1_EN		BIT(1)
+#define LM3692X_LED2_EN		BIT(2)
+
+/* Brightness Control Bits */
+#define LM3692X_BL_ADJ_POL	BIT(0)
+#define LM3692X_RAMP_RATE_125us	0x00
+#define LM3692X_RAMP_RATE_250us	BIT(1)
+#define LM3692X_RAMP_RATE_500us BIT(2)
+#define LM3692X_RAMP_RATE_1ms	(BIT(1) | BIT(2))
+#define LM3692X_RAMP_RATE_2ms	BIT(3)
+#define LM3692X_RAMP_RATE_4ms	(BIT(3) | BIT(1))
+#define LM3692X_RAMP_RATE_8ms	(BIT(2) | BIT(3))
+#define LM3692X_RAMP_RATE_16ms	(BIT(1) | BIT(2) | BIT(3))
+#define LM3692X_RAMP_EN		BIT(4)
+#define LM3692X_BRHT_MODE_REG	0x00
+#define LM3692X_BRHT_MODE_PWM	BIT(5)
+#define LM3692X_BRHT_MODE_MULTI_RAMP BIT(6)
+#define LM3692X_BRHT_MODE_RAMP_MULTI (BIT(5) | BIT(6))
+#define LM3692X_MAP_MODE_EXP	BIT(7)
+
+/* PWM Register Bits */
+#define LM3692X_PWM_FILTER_100	BIT(0)
+#define LM3692X_PWM_FILTER_150	BIT(1)
+#define LM3692X_PWM_FILTER_200	(BIT(0) | BIT(1))
+#define LM3692X_PWM_HYSTER_1LSB BIT(2)
+#define LM3692X_PWM_HYSTER_2LSB	BIT(3)
+#define LM3692X_PWM_HYSTER_3LSB (BIT(3) | BIT(2))
+#define LM3692X_PWM_HYSTER_4LSB BIT(4)
+#define LM3692X_PWM_HYSTER_5LSB (BIT(4) | BIT(2))
+#define LM3692X_PWM_HYSTER_6LSB (BIT(4) | BIT(3))
+#define LM3692X_PWM_POLARITY	BIT(5)
+#define LM3692X_PWM_SAMP_4MHZ	BIT(6)
+#define LM3692X_PWM_SAMP_24MHZ	BIT(7)
+
+/* Boost Control Bits */
+#define LM3692X_OCP_PROT_1A	BIT(0)
+#define LM3692X_OCP_PROT_1_25A	BIT(1)
+#define LM3692X_OCP_PROT_1_5A	(BIT(0) | BIT(1))
+#define LM3692X_OVP_21V		BIT(2)
+#define LM3692X_OVP_25V		BIT(3)
+#define LM3692X_OVP_29V		(BIT(2) | BIT(3))
+#define LM3692X_MIN_IND_22UH	BIT(4)
+#define LM3692X_BOOST_SW_1MHZ	BIT(5)
+#define LM3692X_BOOST_SW_NO_SHIFT	BIT(6)
+
+/* Fault Control Bits */
+#define LM3692X_FAULT_CTRL_OVP BIT(0)
+#define LM3692X_FAULT_CTRL_OCP BIT(1)
+#define LM3692X_FAULT_CTRL_TSD BIT(2)
+#define LM3692X_FAULT_CTRL_OPEN BIT(3)
+
+/* Fault Flag Bits */
+#define LM3692X_FAULT_FLAG_OVP BIT(0)
+#define LM3692X_FAULT_FLAG_OCP BIT(1)
+#define LM3692X_FAULT_FLAG_TSD BIT(2)
+#define LM3692X_FAULT_FLAG_SHRT BIT(3)
+#define LM3692X_FAULT_FLAG_OPEN BIT(4)
+
+/**
+ * struct lm3692x_led -
+ * @lock - Lock for reading/writing the device
+ * @client - Pointer to the I2C client
+ * @led_dev - led class device pointer
+ * @regmap - Devices register map
+ * @enable_gpio - VDDIO/EN gpio to enable communication interface
+ * @regulator - LED supply regulator pointer
+ * @label - LED label
+ **/
+struct lm3692x_led {
+	struct mutex lock;
+	struct i2c_client *client;
+	struct led_classdev led_dev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	struct regulator *regulator;
+	const char *label;
+};
+
+static const struct reg_default lm3692x_reg_defs[] = {
+	{LM3692X_EN, 0xf},
+	{LM3692X_BRT_CTRL, 0x61},
+	{LM3692X_PWM_CTRL, 0x73},
+	{LM3692X_BOOST_CTRL, 0x6f},
+	{LM3692X_AUTO_FREQ_HI, 0x0},
+	{LM3692X_AUTO_FREQ_LO, 0x0},
+	{LM3692X_BL_ADJ_THRESH, 0x0},
+	{LM3692X_BRT_LSB, 0x7},
+	{LM3692X_BRT_MSB, 0xff},
+	{LM3692X_FAULT_CTRL, 0x7},
+};
+
+static const struct regmap_config lm3692x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = LM3692X_FAULT_FLAGS,
+	.reg_defaults = lm3692x_reg_defs,
+	.num_reg_defaults = ARRAY_SIZE(lm3692x_reg_defs),
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int lm3692x_fault_check(struct lm3692x_led *led)
+{
+	int ret, fault;
+	unsigned int read_buf;
+
+	ret = regmap_read(led->regmap, LM3692X_FAULT_FLAGS, &read_buf);
+	if (ret)
+		goto out;
+
+	fault = read_buf;
+
+	if (fault)
+		dev_err(&led->client->dev, "Detected a fault 0x%X\n",
+			fault);
+out:
+	return ret;
+}
+
+static int lm3692x_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness brt_val)
+{
+	struct lm3692x_led *led =
+			container_of(led_cdev, struct lm3692x_led, led_dev);
+	int led_brightness = (brt_val << 4) + 7;
+	int ret;
+
+	if (brt_val == LED_OFF)
+		led_brightness = 0;
+
+	mutex_lock(&led->lock);
+
+	ret = lm3692x_fault_check(led);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot read/clear faults\n");
+		goto out;
+	}
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_MSB,
+			(led_brightness & 0xff0) >> 4);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot write MSB\n");
+		goto out;
+	}
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_LSB,
+			led_brightness & 0x07);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot write LSB\n");
+		goto out;
+	}
+out:
+	mutex_unlock(&led->lock);
+	return ret;
+}
+
+static int lm3692x_init(struct lm3692x_led *led)
+{
+	int ret;
+
+	if (led->regulator) {
+		ret = regulator_enable(led->regulator);
+		if (ret)
+			dev_err(&led->client->dev,
+				"Failed to enable regulator\n");
+	}
+
+	if (led->enable_gpio)
+		gpiod_direction_output(led->enable_gpio, 1);
+
+	ret = lm3692x_fault_check(led);
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot read/clear faults\n");
+		goto out;
+	}
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL, 0x00);
+	if (ret)
+		dev_err(&led->client->dev, "Fail writing BRT CTRL\n");
+	/*
+	 * For glitch free operation, the following data should
+	 * only be written while device enable bit is 0
+	 * Per Section 7.5.14 of the data sheet
+	 */
+	ret = regmap_write(led->regmap, LM3692X_PWM_CTRL,
+		LM3692X_PWM_FILTER_100 | LM3692X_PWM_SAMP_24MHZ);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming PWM CTRL\n");
+
+	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
+			LM3692X_BRHT_MODE_RAMP_MULTI |
+			LM3692X_BL_ADJ_POL |
+			LM3692X_RAMP_RATE_250us);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming BOOST CTRL\n");
+
+	ret = regmap_write(led->regmap, LM3692X_AUTO_FREQ_HI, 0x00);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming AUTO HI FREQ\n");
+
+	ret = regmap_write(led->regmap, LM3692X_AUTO_FREQ_LO, 0x00);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming AUTO LO FREQ\n");
+
+
+	ret = regmap_write(led->regmap, LM3692X_BL_ADJ_THRESH, 0x00);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming BL Threshold\n");
+
+	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
+			LM3692X_BL_ADJ_POL | LM3692X_PWM_HYSTER_4LSB);
+	if (ret)
+		dev_err(&led->client->dev, "Failed programming BRT CTRL\n");
+
+	return ret;
+out:
+
+	if (led->enable_gpio)
+		gpiod_direction_output(led->enable_gpio, 0);
+
+	if (led->regulator) {
+		ret = regulator_disable(led->regulator);
+		if (ret)
+			dev_err(&led->client->dev,
+				"Failed to disable regulator\n");
+	}
+
+	return ret;
+}
+
+static int lm3692x_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	int ret;
+	struct lm3692x_led *led;
+	struct device_node *np = client->dev.of_node;
+
+	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	if (client->dev.of_node) {
+		ret = of_property_read_string(np, "label", &led->label);
+		if (ret)
+			led->label = LM3692X_LED_NAME;
+	}
+
+	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
+						   "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(led->enable_gpio)) {
+		ret = PTR_ERR(led->enable_gpio);
+		dev_err(&client->dev, "Failed to get enable gpio: %d\n", ret);
+		return ret;
+	}
+
+	led->regulator = devm_regulator_get(&client->dev, "vled");
+	if (IS_ERR(led->regulator))
+		led->regulator = NULL;
+
+	led->client = client;
+	led->led_dev.name = led->label;
+	led->led_dev.max_brightness = LED_FULL;
+	led->led_dev.brightness_set_blocking = lm3692x_brightness_set;
+
+	mutex_init(&led->lock);
+
+	i2c_set_clientdata(client, led);
+
+	led->regmap = devm_regmap_init_i2c(client, &lm3692x_regmap_config);
+	if (IS_ERR(led->regmap)) {
+		ret = PTR_ERR(led->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = lm3692x_init(led);
+	if (ret)
+		return ret;
+
+	ret = led_classdev_register(&client->dev, &led->led_dev);
+	if (ret) {
+		dev_err(&client->dev, "led register err: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int lm3692x_remove(struct i2c_client *client)
+{
+	struct lm3692x_led *led = i2c_get_clientdata(client);
+	int ret;
+
+	led_classdev_unregister(&led->led_dev);
+
+	if (led->enable_gpio)
+		gpiod_direction_output(led->enable_gpio, 0);
+
+	if (led->regulator) {
+		ret = regulator_disable(led->regulator);
+		if (ret)
+			dev_err(&led->client->dev,
+				"Failed to disable regulator\n");
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id lm3692x_id[] = {
+	{ "lm3692x", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, lm3692x_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_lm3692x_leds_match[] = {
+	{ .compatible = "ti,lm3692x", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_lm3692x_leds_match);
+#endif
+
+static struct i2c_driver lm3692x_driver = {
+	.driver = {
+		.name	= "lm3692x",
+		.of_match_table = of_match_ptr(of_lm3692x_leds_match),
+	},
+	.probe		= lm3692x_probe,
+	.remove		= lm3692x_remove,
+	.id_table	= lm3692x_id,
+};
+module_i2c_driver(lm3692x_driver);
+
+MODULE_DESCRIPTION("Texas Instruments LM3692X LED driver");
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_LICENSE("GPL");
-- 
2.15.0.124.g7668cbc60
