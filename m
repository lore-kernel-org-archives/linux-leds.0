From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 5/9] mfd: add TI LMU driver
Date: Thu, 26 Nov 2015 15:57:01 +0900
Message-ID: <1448521025-2796-6-git-send-email-milo.kim@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

TI LMU (Lighting Management Unit) driver supports lighting devices below.

  LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.

LMU devices have common features.
  - I2C interface for accessing device registers
  - Hardware enable pin control
  - Backlight brightness control
  - Notifier for hardware fault monitoring
  - Regulators for LCD display bias

It contains fault monitor, backlight, LED and regulator driver.

LMU fault monitor
-----------------
  LM3633 and LM3697 provide hardware monitoring feature.
  It enables open or short circuit detection.
  After monitoring is done, each device should be re-initialized.
  Notifier is used for this case.
  Please refer to separate patch for 'ti-lmu-fault-monitor'.

Backlight
---------
  It's handled by TI LMU backlight consolidated driver and
  chip dependent data. Please refer to separate patches for
  'ti-lmu-backlight'.

LED indicator
-------------
  LM3633 has 6 indicator LEDs. Programmable dimming pattern is also
  supported. Please refer to separate patch for 'leds-lm3633'.

Regulator
---------
  LM3631 has 5 regulators for the display bias.
  LM3632 supports 3 regulators. One consolidated driver enables it.
  Please refer to separate patch for 'lm363x-regulator'.

Cc: Lee Jones <lee.jones@linaro.org> 
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/mfd/Kconfig                 |  12 ++
 drivers/mfd/Makefile                |   2 +
 drivers/mfd/ti-lmu.c                | 259 +++++++++++++++++++++++++++++++++
 include/linux/mfd/ti-lmu-register.h | 280 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/ti-lmu.h          |  87 +++++++++++
 5 files changed, 640 insertions(+)
 create mode 100644 drivers/mfd/ti-lmu.c
 create mode 100644 include/linux/mfd/ti-lmu-register.h
 create mode 100644 include/linux/mfd/ti-lmu.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 4d92df6..a6aab27 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1049,6 +1049,18 @@ config MFD_LP8788
 	  TI LP8788 PMU supports regulators, battery charger, RTC,
 	  ADC, backlight driver and current sinks.
 
+config MFD_TI_LMU
+	tristate "TI Lighting Management Unit driver"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Say yes here to enable support for TI LMU chips.
+
+	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, LM3695 and LM3697.
+	  It consists of backlight, LED and regulator driver.
+	  It provides consistent device controls for lighting functions.
+
 config MFD_OMAP_USB_HOST
 	bool "TI OMAP USBHS core and TLL driver"
 	depends on USB_EHCI_HCD_OMAP || USB_OHCI_HCD_OMAP3
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a8b76b8..10e4bc2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -111,6 +111,8 @@ obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
 obj-$(CONFIG_MFD_LP3943)	+= lp3943.o
 obj-$(CONFIG_MFD_LP8788)	+= lp8788.o lp8788-irq.o
 
+obj-$(CONFIG_MFD_TI_LMU)	+= ti-lmu.o
+
 da9055-objs			:= da9055-core.o da9055-i2c.o
 obj-$(CONFIG_MFD_DA9055)	+= da9055.o
 obj-$(CONFIG_MFD_DA9062)	+= da9062-core.o
diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
new file mode 100644
index 0000000..aeb1e7d
--- /dev/null
+++ b/drivers/mfd/ti-lmu.c
@@ -0,0 +1,259 @@
+/*
+ * TI LMU (Lighting Management Unit) Core Driver
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/ti-lmu.h>
+#include <linux/mfd/ti-lmu-register.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/slab.h>
+
+struct ti_lmu_data {
+	struct mfd_cell *cells;
+	int num_cells;
+	unsigned int max_register;
+};
+
+static int ti_lmu_enable_hw(struct ti_lmu *lmu, enum ti_lmu_id id)
+{
+	int ret;
+
+	if (gpio_is_valid(lmu->en_gpio)) {
+		ret = devm_gpio_request_one(lmu->dev, lmu->en_gpio,
+					    GPIOF_OUT_INIT_HIGH, "lmu_hwen");
+		if (ret) {
+			dev_err(lmu->dev, "Can not request enable GPIO: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* Delay about 1ms after HW enable pin control */
+	usleep_range(1000, 1500);
+
+	/* LM3631 has additional power up sequence - enable LCD_EN bit. */
+	if (id == LM3631) {
+		return regmap_update_bits(lmu->regmap, LM3631_REG_DEVCTRL,
+					  LM3631_LCD_EN_MASK,
+					  LM3631_LCD_EN_MASK);
+	}
+
+	return 0;
+}
+
+static void ti_lmu_disable_hw(struct ti_lmu *lmu)
+{
+	if (gpio_is_valid(lmu->en_gpio))
+		gpio_set_value(lmu->en_gpio, 0);
+}
+
+static struct mfd_cell lm3532_devices[] = {
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3532,
+		.of_compatible = "ti,lm3532-backlight",
+	},
+};
+
+#define LM363X_REGULATOR(_id)			\
+{						\
+	.name          = "lm363x-regulator",	\
+	.id            = _id,			\
+	.of_compatible = "ti,lm363x-regulator",	\
+}						\
+
+static struct mfd_cell lm3631_devices[] = {
+	LM363X_REGULATOR(LM3631_BOOST),
+	LM363X_REGULATOR(LM3631_LDO_CONT),
+	LM363X_REGULATOR(LM3631_LDO_OREF),
+	LM363X_REGULATOR(LM3631_LDO_POS),
+	LM363X_REGULATOR(LM3631_LDO_NEG),
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3631,
+		.of_compatible = "ti,lm3631-backlight",
+	},
+};
+
+static struct mfd_cell lm3632_devices[] = {
+	LM363X_REGULATOR(LM3632_BOOST),
+	LM363X_REGULATOR(LM3632_LDO_POS),
+	LM363X_REGULATOR(LM3632_LDO_NEG),
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3632,
+		.of_compatible = "ti,lm3632-backlight",
+	},
+};
+
+static struct mfd_cell lm3633_devices[] = {
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3633,
+		.of_compatible = "ti,lm3633-backlight",
+	},
+	{
+		.name          = "lm3633-leds",
+		.of_compatible = "ti,lm3633-leds",
+	},
+	/* Monitoring driver for open/short circuit detection */
+	{
+		.name          = "ti-lmu-fault-monitor",
+		.id            = LM3633,
+		.of_compatible = "ti,lm3633-fault-monitor",
+	},
+};
+
+static struct mfd_cell lm3695_devices[] = {
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3695,
+		.of_compatible = "ti,lm3695-backlight",
+	},
+};
+
+static struct mfd_cell lm3697_devices[] = {
+	{
+		.name          = "ti-lmu-backlight",
+		.id            = LM3697,
+		.of_compatible = "ti,lm3697-backlight",
+	},
+	/* Monitoring driver for open/short circuit detection */
+	{
+		.name          = "ti-lmu-fault-monitor",
+		.id            = LM3697,
+		.of_compatible = "ti,lm3697-fault-monitor",
+	},
+};
+
+#define TI_LMU_DATA(chip, max_reg)		\
+static const struct ti_lmu_data chip##_data =	\
+{						\
+	.cells = chip##_devices,		\
+	.num_cells = ARRAY_SIZE(chip##_devices),\
+	.max_register = max_reg,		\
+}						\
+
+TI_LMU_DATA(lm3532, LM3532_MAX_REG);
+TI_LMU_DATA(lm3631, LM3631_MAX_REG);
+TI_LMU_DATA(lm3632, LM3632_MAX_REG);
+TI_LMU_DATA(lm3633, LM3633_MAX_REG);
+TI_LMU_DATA(lm3695, LM3695_MAX_REG);
+TI_LMU_DATA(lm3697, LM3697_MAX_REG);
+
+static const struct of_device_id ti_lmu_of_match[] = {
+	{ .compatible = "ti,lm3532", .data = &lm3532_data },
+	{ .compatible = "ti,lm3631", .data = &lm3631_data },
+	{ .compatible = "ti,lm3632", .data = &lm3632_data },
+	{ .compatible = "ti,lm3633", .data = &lm3633_data },
+	{ .compatible = "ti,lm3695", .data = &lm3695_data },
+	{ .compatible = "ti,lm3697", .data = &lm3697_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
+
+static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_device_id *id)
+{
+	struct device *dev = &cl->dev;
+	const struct of_device_id *match;
+	const struct ti_lmu_data *data;
+	struct regmap_config regmap_cfg;
+	struct ti_lmu *lmu;
+	int ret;
+
+	match = of_match_device(ti_lmu_of_match, dev);
+	if (!match)
+		return -ENODEV;
+	/*
+	 * Get device specific data from of_match table.
+	 * This data is defined by using TI_LMU_DATA() macro.
+	 */
+	data = (struct ti_lmu_data *)match->data;
+
+	lmu = devm_kzalloc(dev, sizeof(*lmu), GFP_KERNEL);
+	if (!lmu)
+		return -ENOMEM;
+
+	lmu->dev = &cl->dev;
+
+	/* Setup regmap */
+	memset(&regmap_cfg, 0, sizeof(struct regmap_config));
+	regmap_cfg.reg_bits = 8;
+	regmap_cfg.val_bits = 8;
+	regmap_cfg.name = id->name;
+	regmap_cfg.max_register = data->max_register;
+
+	lmu->regmap = devm_regmap_init_i2c(cl, &regmap_cfg);
+	if (IS_ERR(lmu->regmap))
+		return PTR_ERR(lmu->regmap);
+
+	/* HW enable pin control and additional power up sequence if required */
+	lmu->en_gpio = of_get_named_gpio(dev->of_node, "enable-gpios", 0);
+	ret = ti_lmu_enable_hw(lmu, id->driver_data);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fault circuit(open/short) can be detected by ti-lmu-fault-monitor.
+	 * After fault detection is done, some devices should re-initialize
+	 * configuration. The notifier enables such kind of handling.
+	 */
+	BLOCKING_INIT_NOTIFIER_HEAD(&lmu->notifier);
+
+	i2c_set_clientdata(cl, lmu);
+
+	return mfd_add_devices(lmu->dev, 0, data->cells,
+			       data->num_cells, NULL, 0, NULL);
+}
+
+static int ti_lmu_remove(struct i2c_client *cl)
+{
+	struct ti_lmu *lmu = i2c_get_clientdata(cl);
+
+	ti_lmu_disable_hw(lmu);
+	mfd_remove_devices(lmu->dev);
+	return 0;
+}
+
+static const struct i2c_device_id ti_lmu_ids[] = {
+	{ "lm3532", LM3532 },
+	{ "lm3631", LM3631 },
+	{ "lm3632", LM3632 },
+	{ "lm3633", LM3633 },
+	{ "lm3695", LM3695 },
+	{ "lm3697", LM3697 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
+
+static struct i2c_driver ti_lmu_driver = {
+	.probe = ti_lmu_probe,
+	.remove = ti_lmu_remove,
+	.driver = {
+		.name = "ti-lmu",
+		.of_match_table = ti_lmu_of_match,
+	},
+	.id_table = ti_lmu_ids,
+};
+
+module_i2c_driver(ti_lmu_driver);
+
+MODULE_DESCRIPTION("TI LMU MFD Core Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/ti-lmu-register.h b/include/linux/mfd/ti-lmu-register.h
new file mode 100644
index 0000000..0ea4804
--- /dev/null
+++ b/include/linux/mfd/ti-lmu-register.h
@@ -0,0 +1,280 @@
+/*
+ * TI LMU (Lighting Management Unit) Device Register Map
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __MFD_TI_LMU_REGISTER_H__
+#define __MFD_TI_LMU_REGISTER_H__
+
+#include <linux/bitops.h>
+
+/* LM3532 */
+#define LM3532_REG_OUTPUT_CFG			0x10
+#define LM3532_ILED1_CFG_MASK			0x03
+#define LM3532_ILED2_CFG_MASK			0x0C
+#define LM3532_ILED3_CFG_MASK			0x30
+#define LM3532_ILED1_CFG_SHIFT			0
+#define LM3532_ILED2_CFG_SHIFT			2
+#define LM3532_ILED3_CFG_SHIFT			4
+
+#define LM3532_REG_RAMPUP			0x12
+#define LM3532_REG_RAMPDN			LM3532_REG_RAMPUP
+#define LM3532_RAMPUP_MASK			0x07
+#define LM3532_RAMPUP_SHIFT			0
+#define LM3532_RAMPDN_MASK			0x38
+#define LM3532_RAMPDN_SHIFT			3
+
+#define LM3532_REG_ENABLE			0x1D
+
+#define LM3532_REG_PWM_A_CFG			0x13
+#define LM3532_PWM_A_MASK			0x05	/* zone 0 */
+#define LM3532_PWM_ZONE_0			BIT(2)
+
+#define LM3532_REG_PWM_B_CFG			0x14
+#define LM3532_PWM_B_MASK			0x09	/* zone 1 */
+#define LM3532_PWM_ZONE_1			BIT(3)
+
+#define LM3532_REG_PWM_C_CFG			0x15
+#define LM3532_PWM_C_MASK			0x11	/* zone 2 */
+#define LM3532_PWM_ZONE_2			BIT(4)
+
+#define LM3532_REG_ZONE_CFG_A			0x16
+#define LM3532_REG_ZONE_CFG_B			0x18
+#define LM3532_REG_ZONE_CFG_C			0x1A
+#define LM3532_ZONE_MASK			(BIT(2) | BIT(3) | BIT(4))
+#define LM3532_ZONE_0				0
+#define LM3532_ZONE_1				BIT(2)
+#define LM3532_ZONE_2				BIT(3)
+
+#define LM3532_REG_BRT_A			0x70	/* zone 0 */
+#define LM3532_REG_BRT_B			0x76	/* zone 1 */
+#define LM3532_REG_BRT_C			0x7C	/* zone 2 */
+
+#define LM3532_MAX_REG				0x7E
+
+/* LM3631 */
+#define LM3631_REG_DEVCTRL			0x00
+#define LM3631_LCD_EN_MASK			BIT(1)
+#define LM3631_BL_EN_MASK			BIT(0)
+
+#define LM3631_REG_BRT_LSB			0x01
+#define LM3631_REG_BRT_MSB			0x02
+
+#define LM3631_REG_BL_CFG			0x06
+#define LM3631_BL_CHANNEL_MASK			BIT(3)
+#define LM3631_BL_DUAL_CHANNEL			0
+#define LM3631_BL_SINGLE_CHANNEL		BIT(3)
+#define LM3631_MAP_MASK				BIT(5)
+#define LM3631_EXPONENTIAL_MAP			0
+
+#define LM3631_REG_BRT_MODE			0x08
+#define LM3631_MODE_MASK			(BIT(1) | BIT(2) | BIT(3))
+#define LM3631_DEFAULT_MODE			(BIT(1) | BIT(3))
+
+#define LM3631_REG_SLOPE			0x09
+#define LM3631_SLOPE_MASK			0xF0
+#define LM3631_SLOPE_SHIFT			4
+
+#define LM3631_REG_LDO_CTRL1			0x0A
+#define LM3631_EN_OREF_MASK			BIT(0)
+#define LM3631_EN_VNEG_MASK			BIT(1)
+#define LM3631_EN_VPOS_MASK			BIT(2)
+
+#define LM3631_REG_LDO_CTRL2			0x0B
+#define LM3631_EN_CONT_MASK			BIT(0)
+
+#define LM3631_REG_VOUT_CONT			0x0C
+#define LM3631_VOUT_CONT_MASK			(BIT(6) | BIT(7))
+
+#define LM3631_REG_VOUT_BOOST			0x0C
+#define LM3631_REG_VOUT_POS			0x0D
+#define LM3631_REG_VOUT_NEG			0x0E
+#define LM3631_REG_VOUT_OREF			0x0F
+#define LM3631_VOUT_MASK			0x3F
+
+#define LM3631_REG_ENTIME_VCONT			0x0B
+#define LM3631_ENTIME_CONT_MASK			0x70
+
+#define LM3631_REG_ENTIME_VOREF			0x0F
+#define LM3631_REG_ENTIME_VPOS			0x10
+#define LM3631_REG_ENTIME_VNEG			0x11
+#define LM3631_ENTIME_MASK			0xF0
+#define LM3631_ENTIME_SHIFT			4
+
+#define LM3631_MAX_REG				0x16
+
+/* LM3632 */
+#define LM3632_REG_CONFIG1			0x02
+#define LM3632_OVP_MASK				(BIT(5) | BIT(6) | BIT(7))
+#define LM3632_OVP_25V				BIT(6)
+
+#define LM3632_REG_CONFIG2			0x03
+#define LM3632_SWFREQ_MASK			BIT(7)
+#define LM3632_SWFREQ_1MHZ			BIT(7)
+
+#define LM3632_REG_BRT_LSB			0x04
+#define LM3632_REG_BRT_MSB			0x05
+
+#define LM3632_REG_IO_CTRL			0x09
+#define LM3632_PWM_MASK				BIT(6)
+#define LM3632_I2C_MODE				0
+#define LM3632_PWM_MODE				BIT(6)
+
+#define LM3632_REG_ENABLE			0x0A
+#define LM3632_BL_EN_MASK			BIT(0)
+#define LM3632_BL_CHANNEL_MASK			(BIT(3) | BIT(4))
+#define LM3632_BL_SINGLE_CHANNEL			BIT(4)
+#define LM3632_BL_DUAL_CHANNEL			BIT(3)
+
+#define LM3632_REG_BIAS_CONFIG			0x0C
+#define LM3632_EXT_EN_MASK			BIT(0)
+#define LM3632_EN_VNEG_MASK			BIT(1)
+#define LM3632_EN_VPOS_MASK			BIT(2)
+
+#define LM3632_REG_VOUT_BOOST			0x0D
+#define LM3632_REG_VOUT_POS			0x0E
+#define LM3632_REG_VOUT_NEG			0x0F
+#define LM3632_VOUT_MASK			0x3F
+
+#define LM3632_MAX_REG				0x10
+
+/* LM3633 */
+#define LM3633_REG_HVLED_OUTPUT_CFG		0x10
+#define LM3633_HVLED1_CFG_MASK			BIT(0)
+#define LM3633_HVLED2_CFG_MASK			BIT(1)
+#define LM3633_HVLED3_CFG_MASK			BIT(2)
+#define LM3633_HVLED1_CFG_SHIFT			0
+#define LM3633_HVLED2_CFG_SHIFT			1
+#define LM3633_HVLED3_CFG_SHIFT			2
+
+#define LM3633_REG_BANK_SEL			0x11
+
+#define LM3633_REG_BL0_RAMP			0x12
+#define LM3633_REG_BL1_RAMP			0x13
+#define LM3633_BL_RAMPUP_MASK			0xF0
+#define LM3633_BL_RAMPUP_SHIFT			4
+#define LM3633_BL_RAMPDN_MASK			0x0F
+#define LM3633_BL_RAMPDN_SHIFT			0
+
+#define LM3633_REG_BL_RAMP_CONF			0x1B
+#define LM3633_BL_RAMP_MASK			0x0F
+#define LM3633_BL_RAMP_EACH			0x05
+
+#define LM3633_REG_PTN0_RAMP			0x1C
+#define LM3633_REG_PTN1_RAMP			0x1D
+#define LM3633_PTN_RAMPUP_MASK			0x70
+#define LM3633_PTN_RAMPUP_SHIFT			4
+#define LM3633_PTN_RAMPDN_MASK			0x07
+#define LM3633_PTN_RAMPDN_SHIFT			0
+
+#define LM3633_REG_LED_MAPPING_MODE		0x1F
+#define LM3633_LED_EXPONENTIAL			BIT(1)
+
+#define LM3633_REG_IMAX_HVLED_A			0x20
+#define LM3633_REG_IMAX_HVLED_B			0x21
+#define LM3633_REG_IMAX_LVLED_BASE		0x22
+
+#define LM3633_REG_BL_FEEDBACK_ENABLE		0x28
+
+#define LM3633_REG_ENABLE			0x2B
+#define LM3633_LED_BANK_OFFSET			2
+
+#define LM3633_REG_PATTERN			0x2C
+
+#define LM3633_REG_BOOST_CFG			0x2D
+#define LM3633_OVP_MASK				(BIT(1) | BIT(2))
+#define LM3633_OVP_40V				0x6
+
+#define LM3633_REG_PWM_CFG			0x2F
+#define LM3633_PWM_A_MASK			BIT(0)
+#define LM3633_PWM_B_MASK			BIT(1)
+
+#define LM3633_REG_BRT_HVLED_A_LSB		0x40
+#define LM3633_REG_BRT_HVLED_A_MSB		0x41
+#define LM3633_REG_BRT_HVLED_B_LSB		0x42
+#define LM3633_REG_BRT_HVLED_B_MSB		0x43
+
+#define LM3633_REG_BRT_LVLED_BASE		0x44
+
+#define LM3633_REG_PTN_DELAY			0x50
+
+#define LM3633_REG_PTN_LOWTIME			0x51
+
+#define LM3633_REG_PTN_HIGHTIME			0x52
+
+#define LM3633_REG_PTN_LOWBRT			0x53
+
+#define LM3633_REG_PTN_HIGHBRT			LM3633_REG_BRT_LVLED_BASE
+
+#define LM3633_REG_BL_OPEN_FAULT_STATUS		0xB0
+
+#define LM3633_REG_BL_SHORT_FAULT_STATUS	0xB2
+
+#define LM3633_REG_MONITOR_ENABLE		0xB4
+
+#define LM3633_MAX_REG				0xB4
+
+/* LM3695 */
+#define LM3695_REG_GP				0x10
+#define LM3695_BL_CHANNEL_MASK			BIT(3)
+#define LM3695_BL_DUAL_CHANNEL			0
+#define LM3695_BL_SINGLE_CHANNEL			BIT(3)
+#define LM3695_BRT_RW_MASK			BIT(2)
+#define LM3695_BL_EN_MASK			BIT(0)
+
+#define LM3695_REG_BRT_LSB			0x13
+#define LM3695_REG_BRT_MSB			0x14
+
+#define LM3695_MAX_REG				0x14
+
+/* LM3697 */
+#define LM3697_REG_HVLED_OUTPUT_CFG		0x10
+#define LM3697_HVLED1_CFG_MASK			BIT(0)
+#define LM3697_HVLED2_CFG_MASK			BIT(1)
+#define LM3697_HVLED3_CFG_MASK			BIT(2)
+#define LM3697_HVLED1_CFG_SHIFT			0
+#define LM3697_HVLED2_CFG_SHIFT			1
+#define LM3697_HVLED3_CFG_SHIFT			2
+
+#define LM3697_REG_BL0_RAMP			0x11
+#define LM3697_REG_BL1_RAMP			0x12
+#define LM3697_RAMPUP_MASK			0xF0
+#define LM3697_RAMPUP_SHIFT			4
+#define LM3697_RAMPDN_MASK			0x0F
+#define LM3697_RAMPDN_SHIFT			0
+
+#define LM3697_REG_RAMP_CONF			0x14
+#define LM3697_RAMP_MASK			0x0F
+#define LM3697_RAMP_EACH			0x05
+
+#define LM3697_REG_PWM_CFG			0x1C
+#define LM3697_PWM_A_MASK			BIT(0)
+#define LM3697_PWM_B_MASK			BIT(1)
+
+#define LM3697_REG_IMAX_A			0x17
+#define LM3697_REG_IMAX_B			0x18
+
+#define LM3697_REG_FEEDBACK_ENABLE		0x19
+
+#define LM3697_REG_BRT_A_LSB			0x20
+#define LM3697_REG_BRT_A_MSB			0x21
+#define LM3697_REG_BRT_B_LSB			0x22
+#define LM3697_REG_BRT_B_MSB			0x23
+
+#define LM3697_REG_ENABLE			0x24
+
+#define LM3697_REG_OPEN_FAULT_STATUS		0xB0
+
+#define LM3697_REG_SHORT_FAULT_STATUS		0xB2
+
+#define LM3697_REG_MONITOR_ENABLE		0xB4
+
+#define LM3697_MAX_REG				0xB4
+#endif
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
new file mode 100644
index 0000000..cbb1074
--- /dev/null
+++ b/include/linux/mfd/ti-lmu.h
@@ -0,0 +1,87 @@
+/*
+ * TI LMU (Lighting Management Unit) Devices
+ *
+ * Copyright 2015 Texas Instruments
+ *
+ * Author: Milo Kim <milo.kim@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __MFD_TI_LMU_H__
+#define __MFD_TI_LMU_H__
+
+#include <linux/gpio.h>
+#include <linux/notifier.h>
+#include <linux/regmap.h>
+
+/* Notifier event */
+#define LMU_EVENT_MONITOR_DONE		0x01
+
+enum ti_lmu_id {
+	LM3532,
+	LM3631,
+	LM3632,
+	LM3633,
+	LM3695,
+	LM3697,
+	LMU_MAX_ID,
+};
+
+enum ti_lmu_max_current {
+	LMU_IMAX_5mA,
+	LMU_IMAX_6mA,
+	LMU_IMAX_7mA = 0x03,
+	LMU_IMAX_8mA,
+	LMU_IMAX_9mA,
+	LMU_IMAX_10mA = 0x07,
+	LMU_IMAX_11mA,
+	LMU_IMAX_12mA,
+	LMU_IMAX_13mA,
+	LMU_IMAX_14mA,
+	LMU_IMAX_15mA = 0x0D,
+	LMU_IMAX_16mA,
+	LMU_IMAX_17mA,
+	LMU_IMAX_18mA,
+	LMU_IMAX_19mA,
+	LMU_IMAX_20mA = 0x13,
+	LMU_IMAX_21mA,
+	LMU_IMAX_22mA,
+	LMU_IMAX_23mA = 0x17,
+	LMU_IMAX_24mA,
+	LMU_IMAX_25mA,
+	LMU_IMAX_26mA,
+	LMU_IMAX_27mA = 0x1C,
+	LMU_IMAX_28mA,
+	LMU_IMAX_29mA,
+	LMU_IMAX_30mA,
+};
+
+enum lm363x_regulator_id {
+	LM3631_BOOST,		/* Boost output */
+	LM3631_LDO_CONT,	/* Display panel controller */
+	LM3631_LDO_OREF,	/* Gamma reference */
+	LM3631_LDO_POS,		/* Positive display bias output */
+	LM3631_LDO_NEG,		/* Negative display bias output */
+	LM3632_BOOST,		/* Boost output */
+	LM3632_LDO_POS,		/* Positive display bias output */
+	LM3632_LDO_NEG,		/* Negative display bias output */
+};
+
+/**
+ * struct ti_lmu
+ *
+ * @dev:	Parent device pointer
+ * @regmap:	Used for i2c communcation on accessing registers
+ * @en_gpio:	GPIO for HWEN pin [Optional]
+ * @notifier:	Notifier for reporting hwmon event
+ */
+struct ti_lmu {
+	struct device *dev;
+	struct regmap *regmap;
+	int en_gpio;
+	struct blocking_notifier_head notifier;
+};
+#endif
-- 
1.9.1
