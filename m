From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: [PATCH v4 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Fri, 10 Jun 2016 16:57:45 +0100
Message-ID: <1465574265-2965-1-git-send-email-tony.makkiel@daqri.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37425 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932214AbcFJQAO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Jun 2016 12:00:14 -0400
Received: by mail-wm0-f45.google.com with SMTP id k204so108045366wmk.0
        for <linux-leds@vger.kernel.org>; Fri, 10 Jun 2016 09:00:13 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Tony Makkiel <tony.makkiel@daqri.com>, j.anaszewski@samsung.com, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org

The chip can drive 2 sets of RGB leds. Controller can
be controlled via PWM, I2C and audio synchronisation.
This driver uses I2C to communicate with the chip.

Datasheet: http://www.ti.com/lit/gpn/lp3952

Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
---
 drivers/leds/Kconfig        |  12 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-lp3952.c  | 297 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/leds-lp3952.h | 129 +++++++++++++++++++
 4 files changed, 439 insertions(+)
 create mode 100644 drivers/leds/leds-lp3952.c
 create mode 100644 include/linux/leds-lp3952.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 5ae2834..305faf9 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -228,6 +228,18 @@ config LEDS_LP3944
 	  To compile this driver as a module, choose M here: the
 	  module will be called leds-lp3944.
 
+config LEDS_LP3952
+	tristate "LED Support for TI LP3952 2 channel LED driver"
+	depends on LEDS_CLASS
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This option enables support for LEDs connected to the Texas
+	  Instruments LP3952 LED driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-lp3952.
+
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cb2013d..0684c86 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_LEDS_PCA9532)		+= leds-pca9532.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
 obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
+obj-$(CONFIG_LEDS_LP3952)		+= leds-lp3952.o
 obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
 obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
 obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
new file mode 100644
index 0000000..7c670cb
--- /dev/null
+++ b/drivers/leds/leds-lp3952.c
@@ -0,0 +1,297 @@
+/*
+ *	LED driver for TI lp3952 controller
+ *
+ *	Copyright (C) 2016, DAQRI, LLC.
+ *	Author: Tony Makkiel <tony.makkiel@daqri.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/leds-lp3952.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+
+int lp3952_register_write(struct i2c_client *client, u8 reg, u8 val)
+{
+	int ret;
+	struct lp3952_led_array *priv = i2c_get_clientdata(client);
+
+	ret = regmap_write(priv->regmap, reg, val);
+
+	if (ret)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, reg, val, ret);
+	return ret;
+}
+
+static void lp3952_on_off(struct lp3952_led_array *priv,
+			  enum lp3952_leds led_id, int on)
+{
+	int ret, val;
+
+	dev_dbg(&priv->client->dev, "%s LED %d to %d\n", __func__, led_id, on);
+
+	val = 1 << led_id;
+	if (led_id == LP3952_LED_ALL)
+		val = LP3952_LED_MASK_ALL;
+
+	ret = regmap_update_bits(priv->regmap, LP3952_REG_LED_CTRL, val,
+				 on ? val : 0);
+	if (ret)
+		dev_err(&priv->client->dev, "%s, Error %d\n", __func__, ret);
+}
+
+/*
+ * Using Imax to control brightness. There are 4 possible
+ * setting 25, 50, 75 and 100 % of Imax. Possible values are
+ * values 0-4. 0 meaning turn off.
+ */
+static int lp3952_set_brightness(struct led_classdev *cdev,
+				 enum led_brightness value)
+{
+	unsigned int reg, shift_val;
+	struct lp3952_ctrl_hdl *led = container_of(cdev,
+						   struct lp3952_ctrl_hdl,
+						   cdev);
+	struct lp3952_led_array *priv = (struct lp3952_led_array *)led->priv;
+
+	dev_dbg(cdev->dev, "Brightness request: %d on %d\n", value,
+		led->channel);
+
+	if (value == LED_OFF) {
+		lp3952_on_off(priv, led->channel, LED_OFF);
+		return 0;
+	}
+
+	if (led->channel > LP3952_RED_1) {
+		dev_err(cdev->dev, " %s Invalid LED requested", __func__);
+		return -EINVAL;
+	}
+
+	if (led->channel >= LP3952_BLUE_1) {
+		reg = LP3952_REG_RGB1_MAX_I_CTRL;
+		shift_val = (led->channel - LP3952_BLUE_1) * 2;
+	} else {
+		reg = LP3952_REG_RGB2_MAX_I_CTRL;
+		shift_val = led->channel * 2;
+	}
+
+	/* Enable the LED in case it is not enabled already */
+	lp3952_on_off(priv, led->channel, 1);
+
+	return (regmap_update_bits(priv->regmap, reg, 3 << shift_val,
+				   --value << shift_val));
+}
+
+static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
+{
+	int i, ret = -ENODEV;
+	const char *led_name[] = {
+		"lp3952:blue2",
+		"lp3952:green2",
+		"lp3952:red2",
+		"lp3952:blue1",
+		"lp3952:green1",
+		"lp3952:red1"
+	};
+
+	for (i = 0; i < priv->ndev; i++) {
+		sprintf(priv->leds[i].name, "%s", led_name[i]);
+		priv->leds[i].cdev.name = priv->leds[i].name;
+		priv->leds[i].cdev.brightness = LED_OFF;
+		priv->leds[i].cdev.max_brightness = LP3952_BRIGHT_MAX;
+		priv->leds[i].cdev.brightness_set_blocking =
+				lp3952_set_brightness;
+		priv->leds[i].channel = i;
+		priv->leds[i].priv = priv;
+
+		ret = devm_led_classdev_register(&priv->client->dev,
+						 &priv->leds[i].cdev);
+		if (ret < 0) {
+			dev_err(&priv->client->dev,
+				"couldn't register LED %s\n",
+				priv->leds[i].cdev.name);
+			break;
+		}
+	}
+	return ret;
+}
+
+static int lp3952_set_pattern_gen_cmd(struct lp3952_led_array *priv,
+				      u8 cmd_index, u8 r, u8 g, u8 b,
+				      enum lp3952_tt tt, enum lp3952_cet cet)
+{
+	int ret;
+	struct ptrn_gen_cmd line = {
+		.r = r,
+		.g = g,
+		.b = b,
+		.cet = cet,
+		.tt = tt
+	};
+
+	if (cmd_index >= LP3952_CMD_REG_COUNT)
+		return -EINVAL;
+
+	ret = lp3952_register_write(priv->client,
+				    LP3952_REG_CMD_0 + cmd_index * 2,
+				    line.bytes.msb);
+	if (ret)
+		return ret;
+
+	return (lp3952_register_write(priv->client,
+				      LP3952_REG_CMD_0 + cmd_index * 2 + 1,
+				      line.bytes.lsb));
+}
+
+static int lp3952_configure(struct lp3952_led_array *priv)
+{
+	int ret;
+
+	/* Disable any LEDs on from any previous conf. */
+	ret = lp3952_register_write(priv->client, LP3952_REG_LED_CTRL, 0);
+	if (ret)
+		return ret;
+
+	/* enable rgb patter, loop */
+	ret = lp3952_register_write(priv->client, LP3952_REG_PAT_GEN_CTRL,
+				    LP3952_PATRN_LOOP | LP3952_PATRN_GEN_EN);
+	if (ret)
+		return ret;
+
+	/* Update Bit 6 (Active mode), Select both Led sets, Bit [1:0] */
+	ret = lp3952_register_write(priv->client, LP3952_REG_ENABLES,
+				    LP3952_ACTIVE_MODE | LP3952_INT_B00ST_LDR);
+	if (ret)
+		return ret;
+
+	/* Set Cmd1 for RGB intensity,cmd and transition time */
+	return (lp3952_set_pattern_gen_cmd(priv, 0, I46, I71, I100, TT0,
+					   CET197));
+}
+
+static const struct regmap_config lp3952_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_MAX,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int lp3952_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	int status;
+	struct lp3952_ctrl_hdl *leds;
+	struct lp3952_led_array *priv;
+
+	dev_dbg(&client->dev, "%s\n", __func__);
+
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->ndev = LP3952_LED_ALL;
+
+	leds = devm_kcalloc(&client->dev, priv->ndev, sizeof(*leds),
+			    GFP_KERNEL);
+	if (!leds) {
+		devm_kfree(&client->dev, priv);
+		return -ENOMEM;
+	}
+
+	priv->leds = leds;
+	priv->client = client;
+
+	priv->enable_gpio = devm_gpiod_get(&client->dev, NULL, GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->enable_gpio)) {
+		status = PTR_ERR(priv->enable_gpio);
+		dev_err(&client->dev, "Failed to enable gpio: %d\n", status);
+		return status;
+	}
+
+	priv->regmap = devm_regmap_init_i2c(client, &lp3952_regmap);
+	if (IS_ERR(priv->regmap)) {
+		int err = PTR_ERR(priv->regmap);
+
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			err);
+		return err;
+	}
+
+	i2c_set_clientdata(client, priv);
+
+	status = lp3952_configure(priv);
+	if (status) {
+		dev_err(&client->dev, "Probe failed. Device not found (%d)\n",
+			status);
+		return status;
+	}
+
+	status = lp3952_register_led_classdev(priv);
+	if (status) {
+		dev_err(&client->dev, "Unable to register led_classdev: %d\n",
+			status);
+		return status;
+	}
+
+	return 0;
+}
+
+static int lp3952_remove(struct i2c_client *client)
+{
+	struct lp3952_led_array *priv;
+
+	priv = i2c_get_clientdata(client);
+	lp3952_on_off(priv, LP3952_LED_ALL, 0);
+	gpiod_set_value(priv->enable_gpio, 0);
+
+	return 0;
+}
+
+static const struct i2c_device_id lp3952_id[] = {
+	{LP3952_NAME, 0},
+	{}
+};
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id lp3952_acpi_match[] = {
+	{LP3952_NAME, 0},
+	{LP3952_ACPI_NAME, 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
+#endif
+
+static struct i2c_driver lp3952_i2c_driver = {
+	.driver = {
+		   .name = LP3952_NAME,
+		   .owner = THIS_MODULE,
+#ifdef CONFIG_ACPI
+		   .acpi_match_table = ACPI_PTR(lp3952_acpi_match),
+#endif
+		   },
+	.probe = lp3952_probe,
+	.remove = lp3952_remove,
+	.id_table = lp3952_id,
+};
+
+module_i2c_driver(lp3952_i2c_driver);
+
+MODULE_AUTHOR("Tony Makkiel <tony.makkiel@daqri.com>");
+MODULE_DESCRIPTION("lp3952 I2C LED controller driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.h
new file mode 100644
index 0000000..ef30cdc
--- /dev/null
+++ b/include/linux/leds-lp3952.h
@@ -0,0 +1,129 @@
+/*
+ *	LED driver for TI lp3952 controller
+ *
+ *	Copyright (C) 2016, DAQRI, LLC.
+ *	Author: Tony Makkiel <tony.makkiel@daqri.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef LEDS_LP3952_H_
+#define LEDS_LP3952_H_
+
+/* ACPI iasl compiler wont take name LP3952,
+ * "ASL_MSG_HID_LENGTH". Hence the name TLP3952
+ */
+#define LP3952_NAME                         "lp3952"
+#define LP3952_ACPI_NAME                    "TLP3952"
+#define LP3952_CMD_REG_COUNT                8
+#define LP3952_BRIGHT_MAX                   4
+
+#define LP3952_REG_LED_CTRL                 0x00
+#define LP3952_REG_R1_BLNK_TIME_CTRL        0x01
+#define LP3952_REG_R1_BLNK_CYCLE_CTRL       0x02
+#define LP3952_REG_G1_BLNK_TIME_CTRL        0x03
+#define LP3952_REG_G1_BLNK_CYCLE_CTRL       0x04
+#define LP3952_REG_B1_BLNK_TIME_CTRL        0x05
+#define LP3952_REG_B1_BLNK_CYCLE_CTRL       0x06
+#define LP3952_REG_ENABLES                  0x0B
+#define LP3952_REG_PAT_GEN_CTRL             0x11
+#define LP3952_REG_RGB1_MAX_I_CTRL          0x12
+#define LP3952_REG_RGB2_MAX_I_CTRL          0x13
+#define LP3952_REG_CMD_0                    0x50
+#define LP3952_REG_RESET                    0x60
+#define REG_MAX                             LP3952_REG_RESET
+
+#define LP3952_PATRN_LOOP                   BIT(1)
+#define LP3952_PATRN_GEN_EN                 BIT(2)
+#define LP3952_INT_B00ST_LDR                BIT(2)
+#define LP3952_ACTIVE_MODE                  BIT(6)
+#define LP3952_LED_MASK_ALL                 0x3f
+
+/* Transition Time in ms */
+enum lp3952_tt {
+	TT0,
+	TT55,
+	TT110,
+	TT221,
+	TT422,
+	TT885,
+	TT1770,
+	TT3539
+};
+
+/* Command Execution Time in ms */
+enum lp3952_cet {
+	CET197,
+	CET393,
+	CET590,
+	CET786,
+	CET1180,
+	CET1376,
+	CET1573,
+	CET1769,
+	CET1966,
+	CET2163,
+	CET2359,
+	CET2556,
+	CET2763,
+	CET2949,
+	CET3146
+};
+
+/* Max Current in % */
+enum lp3952_colour_I_log_0 {
+	I0,
+	I7,
+	I14,
+	I21,
+	I32,
+	I46,
+	I71,
+	I100
+};
+
+enum lp3952_leds {
+	LP3952_BLUE_2,
+	LP3952_GREEN_2,
+	LP3952_RED_2,
+	LP3952_BLUE_1,
+	LP3952_GREEN_1,
+	LP3952_RED_1,
+	LP3952_LED_ALL
+};
+
+struct lp3952_ctrl_hdl {
+	struct led_classdev cdev;
+	char name[15];
+	enum lp3952_leds channel;
+	void *priv;
+};
+
+struct ptrn_gen_cmd {
+	union {
+		struct {
+			u16 tt:3;
+			u16 b:3;
+			u16 cet:4;
+			u16 g:3;
+			u16 r:3;
+		};
+		struct {
+			u8 lsb;
+			u8 msb;
+		} bytes;
+	};
+} __packed;
+
+struct lp3952_led_array {
+	u8 ndev;
+	struct regmap *regmap;
+	struct i2c_client *client;
+	struct gpio_desc *enable_gpio;
+	struct lp3952_ctrl_hdl *leds;
+};
+
+#endif /* LEDS_LP3952_H_ */
-- 
1.9.1
