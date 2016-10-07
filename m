From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 01/10] mfd: Add Juniper I2CS MFD driver
Date: Fri,  7 Oct 2016 18:21:00 +0300
Message-ID: <1475853669-22480-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Avirup Banerjee <abanerjee-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Add Juniper's I2CS FPGA MFD driver.

This driver is bare-bones and only provides a method for the
instantiation of the following subdevices.

- I2C mux driver (i2c-mux-i2cs)
- LEDS driver (leds-jnx-i2cs)
- GPIO driver (gpio-jnx-i2cs)
- HWMON driver (i2cs-fan-hwmon)

Signed-off-by: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/mfd/Kconfig               |  17 ++++++
 drivers/mfd/Makefile              |   1 +
 drivers/mfd/jnx-i2cs-core.c       | 118 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/jnx-i2cs-core.h |  96 +++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/mfd/jnx-i2cs-core.c
 create mode 100644 include/linux/mfd/jnx-i2cs-core.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6107f7a..82493d5 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1400,6 +1400,23 @@ config MFD_JUNIPER_CBC
 	  This driver can be built as a module. If built as a module it will be
 	  called "cbc-core"
 
+config MFD_JUNIPER_I2CS
+	tristate "Juniper I2CS FPGA"
+	depends on JNX_PTX1K_RCB || PTXPMB_COMMON || JNX_SYSTEM
+	select MFD_CORE
+	select REGMAP_I2C
+	select GPIO_JNX_I2CS
+	select I2C_MUX_I2CS
+	select LEDS_JNX_I2CS
+	depends on I2C=y
+	default y
+	help
+	  Select this to enable the I2CS FPGA multi-function kernel driver.
+	  This FPGA is present on almost any Juniper Networks card.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "jnx_i2cs"
+
 config MFD_TWL4030_AUDIO
 	bool "TI TWL4030 Audio"
 	depends on TWL4030_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 0ea6dc6..215d9cf 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_MFD_JUNIPER_CPLD)	+= ptxpmb-cpld-core.o
 obj-$(CONFIG_MFD_JUNIPER_SAM)	+= sam-core.o
 obj-$(CONFIG_MFD_JUNIPER_EXT_CPLD) += ptxpmb-ext-cpld-core.o
 obj-$(CONFIG_MFD_JUNIPER_CBC)	+= cbc-core.o
+obj-$(CONFIG_MFD_JUNIPER_I2CS)	+= jnx-i2cs-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
 # ab8500-core need to come after db8500-prcmu (which provides the channel)
 obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
diff --git a/drivers/mfd/jnx-i2cs-core.c b/drivers/mfd/jnx-i2cs-core.c
new file mode 100644
index 0000000..d279a73
--- /dev/null
+++ b/drivers/mfd/jnx-i2cs-core.c
@@ -0,0 +1,118 @@
+/*
+ * drivers/mfd/jnx-i2cs-core.c
+ *
+ * Copyright (c) 2014, Juniper Networks
+ * Author: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
+ *
+ * The I2C Slave FPGA (I2CS) - found on almost any Juniper card.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/bug.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/mfd/jnx-i2cs-core.h>
+
+static int jnx_i2cs_probe(struct i2c_client *i2c,
+			  const struct i2c_device_id *id)
+{
+	struct device *dev = &i2c->dev;
+	struct jnx_i2cs_platform_data *pdata = dev_get_platdata(dev);
+	struct device_node *child, *np = dev->of_node;
+	struct mfd_cell *cells;
+	int ncells, ret;
+
+	if (np) {
+		ncells = of_get_child_count(np);
+		if (ncells == 0) {
+			dev_err(dev, "No child specified for %s\n", np->name);
+			return -EINVAL;
+		}
+
+		cells = devm_kzalloc(dev, ncells * sizeof(*cells), GFP_KERNEL);
+		if (!cells)
+			return -ENOMEM;
+
+		ncells = 0;
+		for_each_available_child_of_node(dev->of_node, child) {
+			const char *s;
+
+			s = of_get_property(child, "compatible", NULL);
+			if (!s) {
+				dev_err(dev,
+					"Missing compatible property for %s\n",
+					child->name);
+				return -EINVAL;
+			}
+
+			cells[ncells].name = child->name;
+			cells[ncells].of_compatible = s;
+			ncells++;
+		}
+		if (ncells == 0) {
+			dev_err(dev, "No active child for %s\n", np->name);
+			return -EINVAL;
+		}
+	} else if (pdata) {
+		cells = pdata->cells;
+		ncells = pdata->ncells;
+	} else {
+		return -ENODEV;
+	}
+
+	ret = mfd_add_devices(dev, i2c_adapter_id(i2c->adapter),
+			      cells, ncells, NULL, 0, NULL);
+
+	return ret;
+}
+
+static int jnx_i2cs_remove(struct i2c_client *i2c)
+{
+	mfd_remove_devices(&i2c->dev);
+
+	return 0;
+}
+
+static const struct of_device_id jnx_i2cs_of_match[] = {
+	{ .compatible = "jnx,i2cs-rcb" },
+	{ .compatible = "jnx,i2cs-fpc" },
+	{ .compatible = "jnx,i2cs-sib" },
+	{ .compatible = "jnx,i2cs-fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, jnx_i2cs_of_match);
+
+static const struct i2c_device_id jnx_i2cs_id[] = {
+	{ "jnx_i2cs_rcb", 0 },
+	{ "jnx_i2cs_fpc", 0 },
+	{ "jnx_i2cs_sib", 0 },
+	{ "jnx_i2cs_fan", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, jnx_i2cs_id);
+
+static struct i2c_driver jnx_i2cs_driver = {
+	.driver = {
+		.name = "jnx_i2cs",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(jnx_i2cs_of_match),
+	},
+	.probe    = jnx_i2cs_probe,
+	.remove   = jnx_i2cs_remove,
+	.id_table = jnx_i2cs_id,
+};
+
+module_i2c_driver(jnx_i2cs_driver);
+
+MODULE_DESCRIPTION("Juniper I2CS MFD core driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/jnx-i2cs-core.h b/include/linux/mfd/jnx-i2cs-core.h
new file mode 100644
index 0000000..5e63aab
--- /dev/null
+++ b/include/linux/mfd/jnx-i2cs-core.h
@@ -0,0 +1,96 @@
+/*
+ * I2CS FPGA (jnx-i2cs-core) registers
+ *
+ * Copyright (C) 2014 Juniper Networks
+ * Author: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __JNX_I2CS_CORE_H__
+#define __JNX_I2CS_CORE_H__
+
+/* SIB I2CS registers */
+#define I2CS_SCRATCH		0x00
+#define I2CS_VERSION		0x01
+#define I2CS_MASTER_STATUS	0x02
+#define I2CS_MASTER_TIMEOUT	0x03
+#define I2CS_MASTER_FORCE	0x04
+#define I2CS_I2C0_STATUS	0x05
+#define I2CS_I2C1_STATUS	0x06
+#define I2CS_I2C_RESET		0x07
+#define I2CS_DATECODE		0x0f
+#define I2CS_INT_STATUS		0x10
+#define I2CS_INT_ENABLE		0x11
+#define I2CS_FRU_LED		0x12
+#define I2CS_MISC_IO		0x13
+#define I2CS_BUTTON_STATUS	0x14
+#define I2CS_BUTTON_ENABLE	0x15
+#define I2CS_GPIO_OE		0x16
+#define I2CS_GPIO_OUT		0x17
+#define I2CS_GPIO_IN		0x18
+#define I2CS_SERIAL_CONFIG0	0x19
+#define I2CS_SERIAL_CONFIG1	0x1a
+#define I2CS_MII_CONFIG		0x1b
+#define I2CS_MII_ADDR		0x1c
+#define I2CS_MII_DATA0		0x1d
+#define I2CS_MII_DATA1		0x1e
+#define I2CS_MII_DATA2		0x1f
+#define I2CS_PWR_CONTROL	0x20
+#define I2CS_PWR_UP_STATUS	0x21
+#define I2CS_PWR_DIS_STATUS	0x22
+#define I2CS_PWR_DIS_CAUSE	0x23
+#define I2CS_PWR_VFAIL_STATUS	0x24
+#define I2CS_PWR_VFAIL_CAUSE	0x25
+#define I2CS_PWR_TRIM_UP_A	0x26
+#define I2CS_PWR_TRIM_UP_B	0x27
+#define I2CS_PWR_TRIM_DN_A	0x28
+#define I2CS_PWR_TRIM_DN_B	0x29
+#define I2CS_PWR_VFAIL_STATUS_B	0x2a
+#define I2CS_PWR_VFAIL_CAUSE_B	0x2b
+#define I2CS_SCB		0x2c
+#define I2CS_RESET_I2CS_REG	0x2d
+#define I2CS_RESET_CONTROL	0x40
+#define I2CS_SIB_ID_PORT_STATUS	0x41
+#define I2CS_SIB_PCIE_GEN	0x42
+#define I2CS_TF_LTC		0x43
+#define I2CS_POWER_RST_HSWAP	0x44
+#define I2CS_SIB_EN		0x45
+#define I2CS_SIB_SPARE		0x46
+#define I2CS_TF_PCIE_INT_STAT	0x47
+#define I2CS_TF_PCIE_INT_EN	0x48
+#define I2CS_SIB_MISC_0		0x49
+#define I2CS_SIB_MISC_1		0x4a
+#define I2CS_LINK_STATUS_0	0x4b
+#define I2CS_LINK_STATUS_1	0x4c
+#define I2CS_LINK_STATUS_2	0x4d
+#define I2CS_LINK_STATUS_3	0x4e
+#define I2CS_LINK_STATUS_4	0x4f
+#define I2CS_LINK_STATUS_5	0x50
+#define I2CS_LINK_STATUS_6	0x51
+#define I2CS_LINK_STATUS_7	0x52
+#define I2CS_LINK_STATUS_8	0x53
+#define I2CS_LINK_STATUS_9	0x54
+#define I2CS_LINK_STATUS_10	0x55
+#define I2CS_LINK_STATUS_11	0x56
+#define I2CS_LINK_STATUS_12	0x57
+#define I2CS_LINK_STATUS_13	0x58
+#define I2CS_LINK_STATUS_14	0x59
+#define I2CS_LINK_STATUS_15	0x5a
+#define I2CS_LINK_STATUS_16	0x5b
+#define I2CS_LINK_STATUS_17	0x5c
+#define I2CS_PWR_VFAIL_IGNORE_SNG	0x5d
+#define I2CS_SPARE		0x5e
+#define I2CS_SPARE_OE		0x5f
+#define I2CS_MAX_REGISTER	I2CS_SPARE_OE
+
+struct mfd_cell;
+
+struct jnx_i2cs_platform_data {
+	int ncells;
+	struct mfd_cell *cells;
+};
+
+#endif /*__JNX_I2CS_CORE_H__*/
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
