From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [patch v5 1/2] mfd: Add Mellanox regmap core driver
Date: Thu, 14 Sep 2017 06:48:57 +0000
Message-ID: <1505371738-128683-2-git-send-email-vadimp@mellanox.com>
References: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505371738-128683-1-git-send-email-vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds core regmap platform driver for Mellanox BMC cards with
the programmable devices based chassis control. The device logics,
controlled by software includes:
- Interrupt handling for chassis, ASIC, CPU events;
- LED handling;
- Exposes through sysfs mux, reset signals, reset cause notification;
The patch provides support for the access to programmable device through
the register map and allows dynamic device tree manipulation at runtime
for removable devices.

This driver requires activator driver, which responsibility is to create
register map and pass it to regmap core. Such activator could be based for
example on I2C, SPI or MMIO interface.

Drivers exposes the number of hwmon attributes to sysfs according to the
attribute groups, defined in the device tree. These attributes will be
located for example in /sys/class/hwmon/hwmonX folder, which is a symbolic
link to for example:
/sys/bus/i2c/devices/4-0072/mlxreg-core.1138/hwmon/hwmon10.
The attributes are divided to the groups, like in the below example:
 MUX nodes
 - safe_bios_disable
 - spi_burn_bios_ci
 - spi_burn_ncsi
 - uart_sel
 Reset nodes:
 - sys_power_cycle
 - bmc_upgrade
 - asic_reset
 Cause of reset nodes:
 - cpu_kernel_panic
 - cpu_shutdown
 - bmc_warm_reset
 General purpose RW nodes:
 - version

Drivers also probes LED and hotplug drivers, in case device tree
description contains LED and hotplug nodes.

Signed-off-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
v4->v5:
 Comments pointed out by Lee:
 - Remove mlxreg-i2c module from the patchset;
 Changes added by Vadim:
 - Remove include/linux/platform_data/mlxreg.h from the patcheset, since
   it have been sent with
 - Modify dts parsing routines;
 - Disable compliation of_update_property if CONFIG_COMPILE_TEST is set;
v3->v4:
 Comments pointed out by Lee:
 - Split interrupt related logic into separate module and place this logic
   within the existing Mellanox hotplug driver. Move for this reason this
   driver from drivers/platform/x86 to drivers/platform/mellanox folder;
 Comments pointed out by Rob:
 - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
 - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
   and send it within this series;
 - Modify "compatible" property;
 - Modify explanation for "deferred" property;
 - Describe each subnode by its own section;
 - Don't use underscore in attribute names;
 Changes added by Vadim:
 - Add mlxreg_hotplug_device and mlxreg_core_item structures to mlxreg.h
   and modify mlxreg_core_led_platform_data structure;
v2->v3:
 Changes added by Vadim:
 - Change name of field led data in struct mlxreg_core_led_platform_data
   in mlxreg.h;
 - fix data position assignment in mlxreg_core_get;
 - update name of field led data in mlxreg_core_set_led;
v1->v2:
 Comments pointed out by Pavel:
 - Remove extra new line in mellanox,mlxreg-core;
 - Replace three NOT with one in mlxreg_core_attr_show;
 - Make error message in mlxreg_core_work_helper shorter;
 - Make attribute assignment more readable;
 - Separate mellanox,mlxreg-core file for sending to DT maintainers.
 Comments pointed out by Jacek:
 - Since  brightness_set_blocking is used instead of
   brightness_set, three fields from mlxreg_core_led_data are removed.
---
 MAINTAINERS               |   6 +
 drivers/mfd/Kconfig       |  14 +
 drivers/mfd/Makefile      |   1 +
 drivers/mfd/mlxreg-core.c | 843 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 864 insertions(+)
 create mode 100644 drivers/mfd/mlxreg-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 767e9d2..092be63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8294,6 +8294,12 @@ S:	Supported
 F:	drivers/input/touchscreen/melfas_mip4.c
 F:	Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 
+MELLANOX BMC MFD DRIVERS
+M:	Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
+S:	Supported
+F:	Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
+F:	drivers/mfd/mlxreg-core.c
+
 MELLANOX ETHERNET DRIVER (mlx4_en)
 M:	Tariq Toukan <tariqt-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3eb5c93..e7463f8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1694,6 +1694,20 @@ config MFD_STM32_TIMERS
 	  for PWM and IIO Timer. This driver allow to share the
 	  registers between the others drivers.
 
+config MFD_MLXREG_CORE
+	tristate "Mellanox programmable device register control for BMC"
+	depends on (ARM && OF && OF_DYNAMIC) || COMPILE_TEST
+	depends on REGMAP
+	help
+	  Support for the Mellanox BMC card with hardware control by a
+	  programmable device which includes signal handling for chassis,
+	  ASIC, CPU events, LED control, exposing sysfs interface for
+	  reset control, reset monitoring and mux selection for the access
+	  to remote devices at the host side.
+
+	  This driver can also be built as a module. If so the module
+	  will be called mlxreg-core.
+
 menu "Multimedia Capabilities Port drivers"
 	depends on ARCH_SA1100
 
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c16bf1e..9661ee2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -221,3 +221,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
+obj-$(CONFIG_MFD_MLXREG_CORE)	+= mlxreg-core.o
diff --git a/drivers/mfd/mlxreg-core.c b/drivers/mfd/mlxreg-core.c
new file mode 100644
index 0000000..0181efc
--- /dev/null
+++ b/drivers/mfd/mlxreg-core.c
@@ -0,0 +1,843 @@
+/*
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the names of the copyright holders nor the names of its
+ *    contributors may be used to endorse or promote products derived from
+ *    this software without specific prior written permission.
+ *
+ * Alternatively, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") version 2 as published by the Free
+ * Software Foundation.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* Attribute parameters. */
+#define MLXREG_CORE_ATTR_VALUE_SIZE	10
+#define MLXREG_CORE_ATTR_GROUP_NUM	11
+#define MLXREG_CORE_ATTRS_NUM		48
+
+#define MLXREG_CORE_PROP_OKAY		"okay"
+#define MLXREG_CORE_PROP_DISABLED	"disabled"
+#define MLXREG_CORE_PROP_STATUS		"status"
+
+/**
+ * enum mlxreg_core_attr_type - sysfs attributes for hotplug events:
+ *
+ * @MLXREG_CORE_ATTR_PSU: power supply unit attribute;
+ * @MLXREG_CORE_ATTR_PWR: power cable attribute;
+ * @MLXREG_CORE_ATTR_FAN: FAN drawer attribute;
+ * @MLXREG_CORE_ATTR_RST: reset attribute;
+ * @MLXREG_CORE_ATTR_CAUSE: reset cause attribute;
+ * @MLXREG_CORE_ATTR_MUX: mux attribute;
+ * @MLXREG_CORE_ATTR_GPRW: general purpose read/write attribute;
+ * @MLXREG_CORE_ATTR_GPRO: general purpose read only attribute;
+ * @MLXREG_CORE_ATTR_LED: LED attribute;
+ * @MLXREG_CORE_ATTR_HOST: host cpu attribute;
+ */
+enum mlxreg_core_attr_type {
+	MLXREG_CORE_ATTR_PSU,
+	MLXREG_CORE_ATTR_PWR,
+	MLXREG_CORE_ATTR_FAN,
+	MLXREG_CORE_ATTR_RST,
+	MLXREG_CORE_ATTR_CAUSE,
+	MLXREG_CORE_ATTR_MUX,
+	MLXREG_CORE_ATTR_GPRW,
+	MLXREG_CORE_ATTR_GPRO,
+	MLXREG_CORE_ATTR_ASIC,
+	MLXREG_CORE_ATTR_LED,
+	MLXREG_CORE_ATTR_HOST,
+};
+
+/**
+ * typedef mlxreg_core_parse_np - parse device node parameters.
+ */
+typedef int (*mlxreg_core_parse_np)(struct device_node *np,
+				     struct device *dev,
+				     enum mlxreg_core_attr_type type,
+				     struct mlxreg_core_item *item);
+
+/**
+ * struct mlxreg_core_grp - attribute group parameters:
+ *
+ * @name: attribute group name;
+ * @type: attribute type;
+ * @access: attribute access permissions (negative for no access);
+ * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK;
+ * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK, -1 - n/a;
+ * @cb: device node attribute parsing callback function;
+ */
+struct mlxreg_core_grp {
+	const char *name;
+	enum mlxreg_core_attr_type type;
+	int access;
+	int inversed;
+	mlxreg_core_parse_np cb;
+};
+
+/**
+ * struct mlxreg_core_priv_data - driver's private data:
+ *
+ * @irq: platform interrupt number;
+ * @pdev: platform device;
+ * @led_pdev: led platform device;
+ * @hp_pdev: hotplug platform device;
+ * @dev: parent device pointer;
+ * @regmap: register map of parent device;
+ * @item: groups control data;
+ * @led_data: led data;
+ * @hwmon: hwmon device;
+ * @mlxreg_core_attr: sysfs attributes array;
+ * @mlxreg_core_dev_attr: sysfs sensor device attribute array;
+ * @group: sysfs attribute group;
+ * @groups: list of sysfs attribute group for hwmon registration;
+ * @hp_counter: number of the groups with hotplug capability;
+ * @cell: location of top aggregation interrupt register;
+ * @mask: top aggregation interrupt common mask;
+ * @en_dynamic_node: set to true after dynamic device node is enabled;
+ */
+struct mlxreg_core_priv_data {
+	int irq;
+	struct platform_device *pdev;
+	struct platform_device *led_pdev;
+	struct platform_device *hp_pdev;
+	struct device *dev;
+	struct regmap *regmap;
+	struct mlxreg_core_item *item[MLXREG_CORE_ATTR_GROUP_NUM];
+	struct mlxreg_core_led_platform_data *led_pdata;
+	struct device *hwmon;
+	struct attribute *mlxreg_core_attr[MLXREG_CORE_ATTRS_NUM + 1];
+	struct sensor_device_attribute_2
+			mlxreg_core_dev_attr[MLXREG_CORE_ATTRS_NUM];
+	struct attribute_group group;
+	const struct attribute_group *groups[2];
+	u32 hp_counter;
+	u32 cell;
+	u32 mask;
+	bool en_dynamic_node;
+};
+
+#if defined(CONFIG_OF) && !defined(CONFIG_COMPILE_TEST)
+/**
+ * struct mlxreg_core_device_en - Open Firmware property for enabling device
+ *
+ * @name - property name;
+ * @value - property value string;
+ * @length - length of proprty value string;
+ *
+ * The structure is used for the devices, which require some dynamic
+ * selection operation allowing access to them.
+ */
+static struct property mlxreg_core_device_en = {
+	.name = MLXREG_CORE_PROP_STATUS,
+	.value = MLXREG_CORE_PROP_OKAY,
+	.length = sizeof(MLXREG_CORE_PROP_OKAY),
+};
+
+/**
+ * struct mlxreg_core_device_dis - Open Firmware property for disabling device
+ *
+ * @name - property name;
+ * @value - property value string;
+ * @length - length of proprty value string;
+ *
+ * The structure is used for the devices, which require some dynamic
+ * selection operation disallowing access to them.
+ */
+static struct property mlxreg_core_device_dis = {
+	.name = MLXREG_CORE_PROP_STATUS,
+	.value = MLXREG_CORE_PROP_DISABLED,
+	.length = sizeof(MLXREG_CORE_PROP_DISABLED),
+};
+
+static void mlxreg_core_dev_enable(struct device_node *np)
+{
+	/* Enable and create device. */
+	of_update_property(np, &mlxreg_core_device_en);
+}
+
+static void mlxreg_core_dev_disable(struct device_node *np)
+{
+	/* Disable and unregister platform device. */
+	of_update_property(np, &mlxreg_core_device_dis);
+	of_node_clear_flag(np, OF_POPULATED);
+}
+#else
+static void mlxreg_core_dev_enable(struct device_node *np)
+{
+}
+
+static void mlxreg_core_dev_disable(struct device_node *np)
+{
+}
+#endif
+
+static int mlxreg_core_parser(struct device_node *np, struct device *dev,
+			      enum mlxreg_core_attr_type type,
+			      struct mlxreg_core_item *item)
+{
+	struct mlxreg_core_data *data = item->data;
+	struct device_node *child, *handle;
+	int ret;
+
+	for_each_child_of_node(np, child) {
+		ret = of_property_count_u32_elems(child, "attr-spec");
+		if (ret <= 0)
+			goto put_child;
+
+		ret = of_property_read_u32_array(child, "attr-spec",
+						 &data->reg, ret);
+		if (ret)
+			goto put_child;
+
+		strlcpy(data->label, child->name, MLXREG_CORE_LABEL_MAX_SIZE);
+		if (type == MLXREG_CORE_ATTR_LED)
+			strreplace(data->label, '-', ':');
+
+		handle = of_parse_phandle(child, "hotplugs", 0);
+		if (handle)
+			data->np = handle;
+
+		data++;
+	}
+
+	return 0;
+
+put_child:
+	of_node_put(child);
+
+	return ret;
+}
+
+static int mlxreg_core_hp_parser(struct device_node *np, struct device *dev,
+				 enum mlxreg_core_attr_type type,
+				 struct mlxreg_core_item *item)
+{
+	struct mlxreg_core_data *data = item->data;
+	struct of_phandle_args args;
+	int i;
+	int ret;
+
+	ret = of_property_count_u32_elems(np, "hotplug-spec");
+	if (ret <= 0)
+		goto put_np;
+
+	ret = of_property_read_u32_array(np, "hotplug-spec",
+					 &item->aggr_mask, ret);
+	if (ret)
+		goto put_np;
+
+	if (type == MLXREG_CORE_ATTR_ASIC)
+		item->health = true;
+
+	for (i = 0; i < item->count; i++) {
+		ret = of_parse_phandle_with_fixed_args(np, "hotplugs", 0,
+						       i, &args);
+		if (ret < 0)
+			goto put_np;
+
+		data->np = args.np;
+		data->reg = item->reg;
+		data->mask = item->mask;
+		data++;
+	}
+
+	return 0;
+
+put_np:
+	of_node_put(np);
+
+	return ret;
+}
+
+static struct mlxreg_core_grp mlxreg_core_grp[] = {
+	{ "psu", MLXREG_CORE_ATTR_PSU, -1, 1, mlxreg_core_hp_parser },
+	{ "pwr", MLXREG_CORE_ATTR_PWR, -1, 0, mlxreg_core_hp_parser },
+	{ "fan", MLXREG_CORE_ATTR_FAN, -1, 1,  mlxreg_core_hp_parser },
+	{ "reset", MLXREG_CORE_ATTR_RST, 2, -1, mlxreg_core_parser },
+	{ "cause", MLXREG_CORE_ATTR_CAUSE, 1, -1, mlxreg_core_parser },
+	{ "mux", MLXREG_CORE_ATTR_MUX, 0, -1, mlxreg_core_parser },
+	{ "gprw", MLXREG_CORE_ATTR_GPRW, 0, -1, mlxreg_core_parser },
+	{ "gpro", MLXREG_CORE_ATTR_GPRO, 1, -1, mlxreg_core_parser },
+	{ "asic", MLXREG_CORE_ATTR_ASIC, -1, 0, mlxreg_core_hp_parser },
+	{ "led", MLXREG_CORE_ATTR_LED, -1, -1, mlxreg_core_parser },
+	{ "host", MLXREG_CORE_ATTR_HOST, -1, 0, mlxreg_core_hp_parser },
+};
+
+static int
+mlxreg_core_item_parser(struct device_node *np, struct device *dev,
+			enum mlxreg_core_attr_type type,
+			struct mlxreg_core_item *item,
+			mlxreg_core_parse_np cb)
+{
+	item->count = of_get_child_count(np);
+	if (!item->count) {
+		item->count = of_count_phandle_with_args(np, "hotplugs", NULL);
+		if (item->count < 0)
+			return item->count;
+	}
+
+	item->data = devm_kzalloc(dev, sizeof(*item->data) * item->count,
+				  GFP_KERNEL);
+	if (!item->data)
+		return -ENOMEM;
+
+	return cb(np, dev, type, item);
+}
+
+static struct mlxreg_core_data*
+mlxreg_core_get(struct mlxreg_core_priv_data *priv,
+		struct mlxreg_core_grp *grp, int index)
+{
+	int pos;
+
+	if (!index)
+		return priv->item[grp->type]->data;
+
+	pos = (index - priv->item[grp->type]->ind) %
+	      priv->item[grp->type]->count;
+
+	return priv->item[grp->type]->data + pos;
+}
+
+static ssize_t mlxreg_core_attr_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct mlxreg_core_priv_data *priv = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr_2(attr)->index;
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	struct mlxreg_core_data *data;
+	u32 regval = 0;
+	int ret;
+
+	switch (nr) {
+	case MLXREG_CORE_ATTR_CAUSE:
+	case MLXREG_CORE_ATTR_MUX:
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+		ret = regmap_read(priv->regmap, data->reg, &regval);
+		if (ret)
+			goto access_error;
+
+		regval = !!(data->reg & ~data->mask);
+
+		break;
+
+	case MLXREG_CORE_ATTR_GPRW:
+	case MLXREG_CORE_ATTR_GPRO:
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+		ret = regmap_read(priv->regmap, data->reg, &regval);
+		if (ret)
+			goto access_error;
+
+		break;
+
+	case MLXREG_CORE_ATTR_PSU:
+	case MLXREG_CORE_ATTR_FAN:
+	case MLXREG_CORE_ATTR_PWR:
+	case MLXREG_CORE_ATTR_ASIC:
+	case MLXREG_CORE_ATTR_RST:
+	case MLXREG_CORE_ATTR_LED:
+	case MLXREG_CORE_ATTR_HOST:
+		break;
+	}
+
+	return sprintf(buf, "%u\n", regval);
+
+access_error:
+	return ret;
+}
+
+static int
+mlxreg_core_store(struct mlxreg_core_priv_data *priv,
+		  struct mlxreg_core_data *data, const char *buf, u32 *val)
+{
+	u32 regval;
+	int ret;
+
+	ret = kstrtou32(buf, MLXREG_CORE_ATTR_VALUE_SIZE, val);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, data->reg, &regval);
+	if (ret)
+		goto access_error;
+
+	regval &= data->mask;
+
+	*val = !!(*val);
+	if (*val)
+		regval |= ~data->mask;
+	else
+		regval &= data->mask;
+
+	ret = regmap_write(priv->regmap, data->reg, regval);
+	if (ret < 0)
+		goto access_error;
+
+	return 0;
+
+access_error:
+	dev_err(priv->dev, "Bus access error\n");
+	return ret;
+}
+
+static ssize_t mlxreg_core_attr_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	struct mlxreg_core_priv_data *priv = dev_get_drvdata(dev);
+	int index = to_sensor_dev_attr_2(attr)->index;
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	struct mlxreg_core_data *data;
+	u32 regval;
+	int ret;
+
+	switch (nr) {
+	case MLXREG_CORE_ATTR_PSU:
+	case MLXREG_CORE_ATTR_PWR:
+	case MLXREG_CORE_ATTR_FAN:
+	case MLXREG_CORE_ATTR_CAUSE:
+	case MLXREG_CORE_ATTR_GPRO:
+	case MLXREG_CORE_ATTR_ASIC:
+	case MLXREG_CORE_ATTR_LED:
+	case MLXREG_CORE_ATTR_HOST:
+		break;
+
+	case MLXREG_CORE_ATTR_MUX:
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+
+		ret = mlxreg_core_store(priv, data, buf, &regval);
+		if (ret)
+			goto access_error;
+
+		/*
+		 * Mux can open and close an access to some devices, which by
+		 * default are un-accessible.
+		 * Create dynamic device, in case it is associated with mux
+		 * attribute. Typical example of such device is SPI flash
+		 * device, which generally is not used by local CPU. For
+		 * example, in case a local CPU is located on Base Management
+		 * Controller board and capable of access to some devices, like
+		 * BIOS or NC-SI flash for some sort of out of service
+		 * maintenance.
+		 * Enabling more than one dynamic device at the mux is not
+		 * allowed.
+		 */
+		if (regval && data->np && priv->en_dynamic_node)
+			break;
+
+		if (data->np) {
+			if (regval) {
+				/* Enable and create platform device. */
+				mlxreg_core_dev_enable(data->np);
+				priv->en_dynamic_node = true;
+			} else {
+				/* Disable and unregister platform device. */
+				mlxreg_core_dev_disable(data->np);
+				priv->en_dynamic_node = false;
+			}
+		}
+
+		break;
+
+	case MLXREG_CORE_ATTR_RST:
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+		ret = mlxreg_core_store(priv, data, buf, &regval);
+		if (ret)
+			goto access_error;
+
+		break;
+
+	case MLXREG_CORE_ATTR_GPRW:
+		ret = kstrtou32(buf, MLXREG_CORE_ATTR_VALUE_SIZE, &regval);
+		if (ret)
+			return ret;
+
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+		ret = regmap_write(priv->regmap, data->reg, regval);
+		if (ret)
+			goto access_error;
+
+		break;
+	}
+
+	return len;
+
+access_error:
+	dev_err(priv->dev, "Failed to store attribute\n");
+
+	return ret;
+}
+
+static int
+mlxreg_core_add_attr_group(struct mlxreg_core_priv_data *priv,
+			   struct mlxreg_core_grp *grp, int id)
+{
+	struct mlxreg_core_data *data = priv->item[grp->type]->data;
+	int i;
+
+	/* Skip group with negative access value. */
+	if (grp->access < 0)
+		return id;
+
+	priv->item[grp->type]->ind = id;
+	priv->item[grp->type]->inversed = grp->inversed;
+
+	for (i = 0; i < priv->item[grp->type]->count; i++, id++, data++) {
+		priv->mlxreg_core_attr[id] =
+				&priv->mlxreg_core_dev_attr[id].dev_attr.attr;
+
+		/* Set attribute name as a label. */
+		priv->mlxreg_core_attr[id]->name = devm_kasprintf(priv->dev,
+								  GFP_KERNEL,
+								  data->label);
+
+		if (!priv->mlxreg_core_attr[id]->name) {
+			dev_err(priv->dev, "Memory allocation failed for sysfs attribute %d.\n",
+				id + 1);
+			return -ENOMEM;
+		}
+
+		priv->mlxreg_core_dev_attr[id].nr = grp->type;
+
+		switch (grp->access) {
+		case 0:
+			priv->mlxreg_core_dev_attr[id].dev_attr.attr.mode =
+							0644;
+			priv->mlxreg_core_dev_attr[id].dev_attr.show =
+							mlxreg_core_attr_show;
+			priv->mlxreg_core_dev_attr[id].dev_attr.store =
+							mlxreg_core_attr_store;
+			break;
+
+		case 1:
+			priv->mlxreg_core_dev_attr[id].dev_attr.attr.mode =
+							0444;
+			priv->mlxreg_core_dev_attr[id].dev_attr.show =
+							mlxreg_core_attr_show;
+
+			break;
+
+		case 2:
+			priv->mlxreg_core_dev_attr[id].dev_attr.attr.mode =
+							0200;
+			priv->mlxreg_core_dev_attr[id].dev_attr.store =
+							mlxreg_core_attr_store;
+
+			break;
+
+		default:
+
+			break;
+		}
+
+		priv->mlxreg_core_dev_attr[id].dev_attr.attr.name =
+					priv->mlxreg_core_attr[id]->name;
+		priv->mlxreg_core_dev_attr[id].index = id;
+		sysfs_attr_init(&priv->mlxreg_core_dev_attr[id].dev_attr.attr);
+	}
+
+	return id;
+}
+
+static int mlxreg_core_attr_init(struct mlxreg_core_priv_data *priv)
+{
+	u32 i, num_attrs = 0;
+	int ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		if (mlxreg_core_grp[i].access >= 0)
+			num_attrs +=
+				priv->item[mlxreg_core_grp[i].type]->count;
+	}
+
+	priv->group.attrs = devm_kzalloc(&priv->pdev->dev, num_attrs *
+					 sizeof(struct attribute *),
+					 GFP_KERNEL);
+	if (!priv->group.attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		ret = mlxreg_core_add_attr_group(priv,
+						 &mlxreg_core_grp[i],
+						 ret);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	priv->group.attrs = priv->mlxreg_core_attr;
+	priv->groups[0] = &priv->group;
+	priv->groups[1] = NULL;
+
+	return 0;
+}
+
+static int mlxreg_core_set_led(struct mlxreg_core_priv_data *priv)
+{
+	struct mlxreg_core_led_platform_data *led_pdata;
+	int count;
+	int err;
+
+	led_pdata = devm_kzalloc(&priv->pdev->dev, sizeof(*led_pdata),
+				 GFP_KERNEL);
+	if (!led_pdata)
+		return -ENOMEM;
+
+	count = priv->item[MLXREG_CORE_ATTR_LED]->count;
+	led_pdata->regmap = priv->regmap;
+	led_pdata->counter = priv->item[MLXREG_CORE_ATTR_LED]->count;
+	led_pdata->data = priv->item[MLXREG_CORE_ATTR_LED]->data;
+
+	priv->led_pdev = platform_device_alloc("leds-mlxreg", priv->pdev->id);
+	if (!priv->led_pdev)
+		return -ENOMEM;
+
+	priv->led_pdev->dev.parent = &priv->pdev->dev;
+	priv->led_pdev->dev.of_node = priv->pdev->dev.of_node;
+	err = platform_device_add_data(priv->led_pdev, led_pdata,
+				       sizeof(*led_pdata));
+	if (err) {
+		platform_device_put(priv->led_pdev);
+
+		return err;
+	}
+
+	err = platform_device_add(priv->led_pdev);
+	if (err)
+		platform_device_put(priv->led_pdev);
+
+	priv->led_pdata = led_pdata;
+
+	return err;
+}
+
+static int mlxreg_core_set_irq(struct mlxreg_core_priv_data *priv)
+{
+	struct mlxreg_core_item *items[MLXREG_CORE_ATTR_GROUP_NUM], *item;
+	struct mlxreg_core_hotplug_platform_data *hp_pdata;
+	enum mlxreg_core_attr_type type;
+	struct mlxreg_core_data *data;
+	struct mlxreg_core_grp *grp;
+	u32 i, j;
+	int err;
+
+	hp_pdata = devm_kzalloc(&priv->pdev->dev, sizeof(*hp_pdata),
+				GFP_KERNEL);
+	if (!hp_pdata)
+		return -ENOMEM;
+
+	/* Set all the items, capable of interrupt handling. */
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		grp = &mlxreg_core_grp[i];
+		type = grp->type;
+		if ((grp->inversed >= 0) && (priv->item[type]->count > 0)) {
+			item = priv->item[i];
+			item->inversed = grp->inversed;
+			items[priv->hp_counter] = item;
+			priv->hp_counter++;
+
+			data = item->data;
+			for (j = 0; j < item->count; j++, data++) {
+				/*
+				 * Set reg and mask for non-health compatible
+				 * items.
+				 */
+				if (!priv->item[type]->health) {
+					data->reg = item->reg;
+					data->mask = BIT(j);
+				}
+
+				/*
+				 * Construct an attribute name from the group
+				 * name and attribute index within the group.
+				 */
+				sprintf(data->label, "%s%u", grp->name, j + 1);
+			}
+		}
+	}
+
+	hp_pdata->items = devm_kzalloc(&priv->pdev->dev,
+				       sizeof(*hp_pdata->items) *
+				       priv->hp_counter, GFP_KERNEL);
+	if (!hp_pdata->items)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->hp_counter; i++)
+		memcpy(hp_pdata->items + i, items[i], sizeof(*hp_pdata->items));
+
+	hp_pdata->regmap = priv->regmap;
+	hp_pdata->irq = priv->irq;
+	hp_pdata->cell = priv->cell;
+	hp_pdata->mask = priv->mask;
+	hp_pdata->counter = priv->hp_counter;
+
+	priv->hp_pdev = platform_device_alloc("mlxreg-hotplug", priv->pdev->id);
+	if (!priv->hp_pdev)
+		return -ENOMEM;
+
+	priv->hp_pdev->dev.parent = &priv->pdev->dev;
+	priv->hp_pdev->dev.of_node = priv->pdev->dev.of_node;
+	err = platform_device_add_data(priv->hp_pdev, hp_pdata,
+				       sizeof(*hp_pdata));
+	if (err) {
+		platform_device_put(priv->hp_pdev);
+
+		return err;
+	}
+
+	err = platform_device_add(priv->hp_pdev);
+	if (err)
+		platform_device_put(priv->hp_pdev);
+
+	return err;
+}
+
+static int mlxreg_core_probe(struct platform_device *pdev)
+{
+	struct device_node *child, *np = pdev->dev.of_node;
+	struct mlxreg_core_priv_data *priv;
+	struct mlxreg_core_grp *grp;
+	u32 i;
+	int err;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = pdev->dev.platform_data;
+	priv->dev = pdev->dev.parent;
+	priv->pdev = pdev;
+
+	for (i = 0; i < MLXREG_CORE_ATTR_GROUP_NUM; i++) {
+		priv->item[i] = devm_kzalloc(&pdev->dev,
+					     sizeof(*priv->item[i]),
+					     GFP_KERNEL);
+		if (!priv->item[i])
+			return -ENOMEM;
+	}
+
+	err = of_property_count_u32_elems(np, "hotplug-spec");
+	if (err > 0) {
+		err = of_property_read_u32_array(np, "hotplug-spec",
+						 &priv->cell, err);
+		if (err) {
+			of_node_put(np);
+
+			return err;
+		}
+	}
+
+	/* Parse device tree table and configure driver's attributes. */
+	for_each_child_of_node(np, child) {
+		for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+			grp = &mlxreg_core_grp[i];
+			if (!of_node_cmp(child->name, grp->name)) {
+				err = mlxreg_core_item_parser(child,
+							&priv->pdev->dev,
+							grp->type,
+							priv->item[grp->type],
+							grp->cb);
+				goto parse_check;
+			}
+		}
+parse_check:
+		if (err)
+			return err;
+	}
+
+	err = mlxreg_core_attr_init(priv);
+	if (err) {
+		dev_err(priv->dev, "Failed to allocate attributes: %d\n",
+			err);
+		return err;
+	}
+
+	priv->hwmon = devm_hwmon_device_register_with_groups(&pdev->dev,
+					"mlxreg_core", priv, priv->groups);
+	if (IS_ERR(priv->hwmon)) {
+		dev_err(&pdev->dev, "Failed to register hwmon device %ld\n",
+			PTR_ERR(priv->hwmon));
+		return PTR_ERR(priv->hwmon);
+	}
+
+	if (priv->item[MLXREG_CORE_ATTR_LED] &&
+	    (priv->item[MLXREG_CORE_ATTR_LED]->count > 0)) {
+		err = mlxreg_core_set_led(priv);
+		if (err)
+			return err;
+	}
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq >= 0)
+		err = mlxreg_core_set_irq(priv);
+
+	dev_set_drvdata(&pdev->dev, priv);
+
+	return 0;
+}
+
+static int mlxreg_core_remove(struct platform_device *pdev)
+{
+	struct mlxreg_core_priv_data *priv = dev_get_drvdata(&pdev->dev);
+
+	if (priv->hp_pdev)
+		platform_device_unregister(priv->hp_pdev);
+
+	if (priv->led_pdev)
+		platform_device_unregister(priv->led_pdev);
+
+	return 0;
+}
+
+static const struct of_device_id mlxreg_core_dt_match[] = {
+	{ .compatible = "mellanox,mlxreg-core" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mlxreg_core_dt_match);
+
+static struct platform_driver mlxreg_core_driver = {
+	.driver = {
+	    .name = "mlxreg-core",
+	    .of_match_table = of_match_ptr(mlxreg_core_dt_match),
+	},
+	.probe = mlxreg_core_probe,
+	.remove = mlxreg_core_remove,
+};
+
+module_platform_driver(mlxreg_core_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>");
+MODULE_DESCRIPTION("Mellanox regmap core driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:mlxreg-core");
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
