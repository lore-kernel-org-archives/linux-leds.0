From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 4/7] leds: TI LMU: Add common code for TI LMU devices
Date: Mon, 6 May 2019 14:16:11 -0500
Message-ID: <20190506191614.25051-5-dmurphy@ti.com>
References: <20190506191614.25051-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506191614.25051-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: lee.jones@linaro.org, rdunlap@infradead.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Create a TI LMU common framework for TI LMU devices that share
common features.

Currently the runtime ramp and brightness setting have
been identified as common features with common register settings.

This work is derived from Milo Kims TI LMU MFD code.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v4 - Renamed the files from ti-lmu-led-common to leds-ti-lmu-common, updated the
ramp-up/down variable from ms->us, fixed Kconfig, updated common header name -
https://lore.kernel.org/patchwork/patch/1068615/

v3 - No changes - https://lore.kernel.org/patchwork/patch/1058764/
v2 - Added support for the brightness resolution parameter as it is a global
parameter for all LMU devices, no other changes were made -
https://lore.kernel.org/patchwork/patch/1054500/

 drivers/leds/Kconfig               |   8 ++
 drivers/leds/Makefile              |   1 +
 drivers/leds/leds-ti-lmu-common.c  | 156 +++++++++++++++++++++++++++++
 include/linux/leds-ti-lmu-common.h |  47 +++++++++
 4 files changed, 212 insertions(+)
 create mode 100644 drivers/leds/leds-ti-lmu-common.c
 create mode 100644 include/linux/leds-ti-lmu-common.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index da00b9ed5a5c..a88dad3be96c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -776,6 +776,14 @@ config LEDS_NIC78BX
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-nic78bx.
 
+config LEDS_TI_LMU_COMMON
+	tristate "LED driver for TI LMU"
+	depends on REGMAP
+	help
+	  Say Y to enable the LED driver for TI LMU devices.
+	  This supports common features between the TI LM3532, LM3631, LM3632,
+	  LM3633, LM3695 and LM3697.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7a8b1f55d459..9d7cdd363603 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
+obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
new file mode 100644
index 000000000000..adc7293004f1
--- /dev/null
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2015 Texas Instruments
+// Copyright 2018 Sebastian Reichel
+// Copyright 2018 Pavel Machek <pavel@ucw.cz>
+// TI LMU LED common framework, based on previous work from
+// Milo Kim <milo.kim@ti.com>
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+
+#include <linux/leds-ti-lmu-common.h>
+
+const static int ramp_table[16] = {2048, 262000, 524000, 1049000, 2090000,
+				4194000, 8389000, 16780000, 33550000, 41940000,
+				50330000, 58720000, 67110000, 83880000,
+				100660000, 117440000};
+
+static int ti_lmu_common_update_brightness(struct ti_lmu_bank *lmu_bank,
+					   int brightness)
+{
+	struct regmap *regmap = lmu_bank->regmap;
+	u8 reg, val;
+	int ret;
+
+	/*
+	 * Brightness register update
+	 *
+	 * 11 bit dimming: update LSB bits and write MSB byte.
+	 *		   MSB brightness should be shifted.
+	 *  8 bit dimming: write MSB byte.
+	 */
+	if (lmu_bank->max_brightness == MAX_BRIGHTNESS_11BIT) {
+		reg = lmu_bank->lsb_brightness_reg;
+		ret = regmap_update_bits(regmap, reg,
+					 LMU_11BIT_LSB_MASK,
+					 brightness);
+		if (ret)
+			return ret;
+
+		val = brightness >> LMU_11BIT_MSB_SHIFT;
+	} else {
+		val = brightness;
+	}
+
+	reg = lmu_bank->msb_brightness_reg;
+
+	return regmap_write(regmap, reg, val);
+}
+
+int ti_lmu_common_set_brightness(struct ti_lmu_bank *lmu_bank, int brightness)
+{
+	return ti_lmu_common_update_brightness(lmu_bank, brightness);
+}
+EXPORT_SYMBOL(ti_lmu_common_set_brightness);
+
+static int ti_lmu_common_convert_ramp_to_index(unsigned int usec)
+{
+	int size = ARRAY_SIZE(ramp_table);
+	int i;
+
+	if (usec <= ramp_table[0])
+		return 0;
+
+	if (usec > ramp_table[size - 1])
+		return size - 1;
+
+	for (i = 1; i < size; i++) {
+		if (usec == ramp_table[i])
+			return i;
+
+		/* Find an approximate index by looking up the table */
+		if (usec > ramp_table[i - 1] && usec < ramp_table[i]) {
+			if (usec - ramp_table[i - 1] < ramp_table[i] - usec)
+				return i - 1;
+			else
+				return i;
+		}
+	}
+
+	return -EINVAL;
+}
+
+int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
+{
+	struct regmap *regmap = lmu_bank->regmap;
+	u8 ramp, ramp_up, ramp_down;
+
+	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
+		ramp_up = 0;
+		ramp_down = 0;
+	} else {
+		ramp_up = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_up_usec);
+		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
+	}
+
+	if (ramp_up < 0 || ramp_down < 0)
+		return -EINVAL;
+
+	ramp = (ramp_up << 4) | ramp_down;
+
+	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
+
+}
+EXPORT_SYMBOL(ti_lmu_common_set_ramp);
+
+int ti_lmu_common_get_ramp_params(struct device *dev,
+				  struct fwnode_handle *child,
+				  struct ti_lmu_bank *lmu_data)
+{
+	int ret;
+
+	ret = fwnode_property_read_u32(child, "ramp-up-us",
+				 &lmu_data->ramp_up_usec);
+	if (ret)
+		dev_warn(dev, "ramp-up-us property missing\n");
+
+
+	ret = fwnode_property_read_u32(child, "ramp-down-us",
+				 &lmu_data->ramp_down_usec);
+	if (ret)
+		dev_warn(dev, "ramp-down-us property missing\n");
+
+	return 0;
+}
+EXPORT_SYMBOL(ti_lmu_common_get_ramp_params);
+
+int ti_lmu_common_get_brt_res(struct device *dev, struct fwnode_handle *child,
+				  struct ti_lmu_bank *lmu_data)
+{
+	int ret;
+
+	ret = device_property_read_u32(dev, "ti,brightness-resolution",
+				       &lmu_data->max_brightness);
+	if (ret)
+		ret = fwnode_property_read_u32(child,
+					       "ti,brightness-resolution",
+					       &lmu_data->max_brightness);
+	if (lmu_data->max_brightness <= 0) {
+		lmu_data->max_brightness = MAX_BRIGHTNESS_8BIT;
+		return ret;
+	}
+
+	if (lmu_data->max_brightness > MAX_BRIGHTNESS_11BIT)
+			lmu_data->max_brightness = MAX_BRIGHTNESS_11BIT;
+
+
+	return 0;
+}
+EXPORT_SYMBOL(ti_lmu_common_get_brt_res);
+
+MODULE_DESCRIPTION("TI LMU common LED framework");
+MODULE_AUTHOR("Sebastian Reichel");
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("ti-lmu-led-common");
diff --git a/include/linux/leds-ti-lmu-common.h b/include/linux/leds-ti-lmu-common.h
new file mode 100644
index 000000000000..5eb111f38803
--- /dev/null
+++ b/include/linux/leds-ti-lmu-common.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// TI LMU Common Core
+// Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+
+#ifndef _TI_LMU_COMMON_H_
+#define _TI_LMU_COMMON_H_
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <uapi/linux/uleds.h>
+
+#define LMU_11BIT_LSB_MASK	(BIT(0) | BIT(1) | BIT(2))
+#define LMU_11BIT_MSB_SHIFT	3
+
+#define MAX_BRIGHTNESS_8BIT	255
+#define MAX_BRIGHTNESS_11BIT	2047
+
+struct ti_lmu_bank {
+	struct regmap *regmap;
+
+	int max_brightness;
+
+	u8 lsb_brightness_reg;
+	u8 msb_brightness_reg;
+
+	u8 runtime_ramp_reg;
+	u32 ramp_up_usec;
+	u32 ramp_down_usec;
+};
+
+int ti_lmu_common_set_brightness(struct ti_lmu_bank *lmu_bank, int brightness);
+
+int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank);
+
+int ti_lmu_common_get_ramp_params(struct device *dev,
+				  struct fwnode_handle *child,
+				  struct ti_lmu_bank *lmu_data);
+
+int ti_lmu_common_get_brt_res(struct device *dev, struct fwnode_handle *child,
+			      struct ti_lmu_bank *lmu_data);
+
+#endif /* _TI_LMU_COMMON_H_ */
-- 
2.21.0.5.gaeb582a983
