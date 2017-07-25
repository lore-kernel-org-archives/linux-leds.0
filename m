From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 25 Jul 2017 16:51:38 +0000
Message-ID: <1501001499-21971-2-git-send-email-vadimp@mellanox.com>
References: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:43252 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752277AbdGYOyl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2017 10:54:41 -0400
In-Reply-To: <1501001499-21971-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

This patch adds core regmap platform driver for Mellanox BMC cards with
the programmable devcies based chassis control. The device logics,
controlled by software includes:
- Interrupt handling for chassis, ASIC, CPU events;
- LED handling;
- Exposes through sysfs mux, reset signals, reset cause notification;
The patch provides support for the access to programmable device through
the register map and allows dynamic device tree manipulation at runtime
for removable devices.

This driver requires activator driver, which responsibility is to create
register map and pass it to regmap core. Such activator could be based for
example on I2C, SPI or  MMIO interface.

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
 PSU nodes' statuses
 - psu1
 - psu2
 FAN nodes' statuses:
 - fan1
 - fan2
 Power cable nodes' statuses:
 - pwr1
 - pwr2
 Asic nodes' statuses:
 - asic1
 - asic2
 General purpose RW nodes:
 - version

Drivers also probes LED platform driver, in case device tree description
contains LED nodes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 .../devicetree/bindings/mfd/mellanox,mlxreg-core   |  347 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    7 +
 drivers/mfd/Kconfig                                |   15 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/mlxreg-core.c                          | 1250 ++++++++++++++++++++
 include/linux/platform_data/mlxreg.h               |   93 ++
 7 files changed, 1714 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
 create mode 100644 drivers/mfd/mlxreg-core.c
 create mode 100644 include/linux/platform_data/mlxreg.h

diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
new file mode 100644
index 0000000..4c2901c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
@@ -0,0 +1,347 @@
+Mellanox programmable device control.
+-------------------------------------
+This binding defines the device control interface over I2C bus for Mellanox BMC
+based switches.
+
+Required properties:
+- compatible = "mellanox,mlxreg-i2c",
+	       "mellanox,mlxreg-i2c-16",
+	       "mellanox,mlxreg-core";
+- #address-cells : must be 1;
+- #size-cells : must be 0;
+- reg : I2C address;
+
+Optional properties:
+- interrupt-parent : phandle of parent interrupt controller;
+- interrupts : interrupt line;
+- deferred - I2C deferred bus phandle;
+	     For example, for the case when device attached to I2C bus number 4
+	     performs dynamic attachment of device to bus 12 upon some event.
+	     Due to this reason bus 4 is enforced to be activated after bus 12;
+- cell - top aggregation register offset;
+- mask - top aggregation register mask;
+- psu - power supply unit nodes:
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- fan - fan unit nodes:
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- pwr - power cable nodes.
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- host - host side nodes (CPU host side for BMC):
+	- aggr_mask - effective bit in aggregation mask;
+	- reg - register offset for all group members;
+	- mask - register mask;
+	- phandles - list of relevant device nodes;
+- asic - asic nodes.
+	- aggr_mask - effective bit in aggregation mask;
+	- regs - register offsets array per group member;
+	- masks = register masks  array per group member;
+	- phandles - list of relevant device nodes;
+- reset - reset nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- reset_name - reset control node:
+		- reg - register offset;
+		- mask - attribute mask;
+- cause - reset cause nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- cause_name - cause info node:
+		- reg - register offset;
+		- mask - attribute mask;
+- mux - mux nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- mux_name - mux control node:
+		- reg - register offset;
+		- mask - attribute mask;
+		- bit - effective bit;
+- gprw - general purpose register nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- gprw_name - general purpose read-write register;
+		- reg - register offset;
+		- mask - attribute mask;
+- gpro - general purpose register nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- gpro_name - general purpose read only register.
+		- reg - register offset.
+		- mask - attribute mask.
+- led - led nodes:
+	- #address-cells : must be 1;
+	- #size-cells : must be 0;
+	- led_name-color - led control node:
+		- label - symbolic name;
+		- reg - register offset;
+		- mask - attribute mask;
+
+Example:
+	mlxcpld-mng-ctrl@71 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&gpio>;
+		interrupts = <ASPEED_GPIO(S, 1) 2>;
+		compatible = "mellanox,mlxcpld-ctrl-i2c";
+		reg = <0x71>;
+		deferred = <&i2c6>;
+		cell = <0x3a>;
+		mask = <0x4c>;
+
+		psu {
+			aggr_mask = <0x08>;
+			reg = <0x58>;
+			mask = <0x03>;
+			phandles = <&psu1_eeprom &psu2_eeprom>;
+		};
+
+		pwr {
+			aggr_mask = <0x08>;
+			reg = <0x64>;
+			mask = <0x03>;
+			phandles = <&psu1_ctrl &psu2_ctrl>;
+		};
+
+		fan {
+			aggr_mask = <0x40>;
+			reg = <0x88>;
+			mask = <0x0f>;
+			phandles = <&fan1_eeprom &fan2_eeprom &fan3_eeprom
+				    &fan4_eeprom>;
+		};
+
+		mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			uart_sel {
+				reg = <0x30>;
+				mask = <0xef>;
+				bit = <0x00>;
+			};
+			spi_burn_bios_ci {
+				reg = <0x32>;
+				mask = <0xfe>;
+				bit = <0x00>;
+				of-phandle = <&spi2>;
+			};
+			spi_burn_ncsi {
+				reg = <0x32>;
+				mask = <0xfd>;
+				bit = <0x00>;
+				of-phandle = <&spi2>;
+			};
+			bmc_uart_en {
+				reg = <0x32>;
+				mask = <0xdf>;
+				bit = <0x00>;
+			};
+			safe_bios1 {
+				reg = <0x35>;
+				mask = <0xfb>;
+				bit = <0x01>;
+			};
+			safe_bios2 {
+				reg = <0x35>;
+				mask = <0xf7>;
+				bit = <0x01>;
+			};
+			safe_bios_disable {
+				reg = <0x35>;
+				mask = <0xdf>;
+				bit = <0x01>;
+			};
+		};
+
+		led {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status-green {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			status-red {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			status-amber {
+				reg = <0x20>;
+				mask = <0xf0>;
+			};
+			fan1-green {
+				reg = <0x21>;
+				mask = <0xf0>;
+			};
+			fan1-red {
+				reg = <0x21>;
+				mask = <0xf0>;
+			};
+			fan2-green {
+				reg = <0x21>;
+				mask = <0x0f>;
+			};
+			fan2-red {
+				reg = <0x21>;
+				mask = <0x0f>;
+			};
+			fan3-green {
+				reg = <0x22>;
+				mask = <0xf0>;
+			};
+			fan3-red {
+				label = "fan3:red";
+				reg = <0x22>;
+				mask = <0xf0>;
+			};
+			fan4-green {
+				reg = <0x22>;
+				mask = <0x0f>;
+			};
+			fan4-red {
+				reg = <0x22>;
+				mask = <0x0f>;
+			};
+		};
+
+		reset {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			bmc_reset_soft {
+				reg = <0x17>;
+				mask = <0xfd>;
+			};
+			system_reset_hard {
+				reg = <0x17>;
+				mask = <0xfe>;
+			};
+			cpu_reset_soft {
+				reg = <0x17>;
+				mask = <0xf7>;
+			};
+			ps1_on {
+				reg = <0x30>;
+				mask = <0xfe>;
+			};
+			ps2_on {
+				label = "ps2_on";
+				reg = <0x30>;
+				mask = <0xfd>;
+			};
+			sys_power_cycle {
+				reg = <0x30>;
+				mask = <0xfb>;
+			};
+			mng_pg_ovrd {
+				reg = <0x30>;
+				mask = <0xf7>;
+			};
+			cpu_reset_hard {
+				reg = <0x30>;
+				mask = <0xdf>;
+			};
+		};
+
+		cause {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			ac_power_cycle {
+				reg = <0x1d>;
+				mask = <0xfe>;
+			};
+			dc_power_cycle {
+				reg = <0x1d>;
+				mask = <0xfd>;
+			};
+			cpu_power_down {
+				reg = <0x1d>;
+				mask = <0xfb>;
+			};
+			cpu_reboot {
+				reg = <0x1d>;
+				mask = <0xf7>;
+			};
+			cpu_shutdown {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+			cpu_watchdog {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+
+			cpu_kernel_panic {
+				reg = <0x1d>;
+				mask = <0xef>;
+			};
+			bmc_warm_reset {
+				reg = <0x71>;
+				mask = <0xfe>;
+			};
+			bmc_upgrade {
+				reg = <0x2e>;
+				mask = <0xf7>;
+			};
+		};
+
+		gpro {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			version {
+				reg = <0x00>;
+				mask = <0xff>;
+				bit = <0xff>;
+			};
+		};
+	};
+
+	mlxcpld-swb-ctrl@72 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&gpio>;
+		interrupts = <ASPEED_GPIO(S, 1) 2>;
+		compatible = "mellanox,mlxcpld-ctrl-i2c";
+		reg = <0x72>;
+		deferred = <&i2c12>;
+		cell = <0x40>;
+		mask = <0x01>;
+
+		asic {
+			aggr_mask = <0x01>;
+			regs = <0x50>;
+			masks = <0x03>;
+			phandles = <&asic_thermal>;
+		};
+
+		gpro {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			version {
+				reg = <0x01>;
+				mask = <0xff>;
+				bit = <0xff>;
+			};
+		};
+
+		reset {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			asic_reset {
+				reg = <0x19>;
+				mask = <0xf7>;
+			};
+			phy_reset {
+				reg = <0x19>;
+				mask = <0xef>;
+			};
+		};
+
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c03d201..bd78198 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -187,6 +187,7 @@ mediatek	MediaTek Inc.
 megachips	MegaChips
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
+mellanox	Mellanox Technologies
 memsic	MEMSIC Inc.
 merrii	Merrii Technology Co., Ltd.
 micrel	Micrel Inc.
diff --git a/MAINTAINERS b/MAINTAINERS
index 767e9d2..bcb7f45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8294,6 +8294,13 @@ S:	Supported
 F:	drivers/input/touchscreen/melfas_mip4.c
 F:	Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 
+MELLANOX BMC MFD DRIVERS
+M:	Vadim Pasternak <vadimp@mellanox.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
+F:	drivers/mfd/mlxreg-core.c
+F:	include/linux/platform_data/mlxreg.h
+
 MELLANOX ETHERNET DRIVER (mlx4_en)
 M:	Tariq Toukan <tariqt@mellanox.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3eb5c93..fa1562f 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1694,6 +1694,21 @@ config MFD_STM32_TIMERS
 	  for PWM and IIO Timer. This driver allow to share the
 	  registers between the others drivers.
 
+config MFD_MLXREG_CORE
+	tristate "Mellanox programmable device register control for BMC"
+	depends on OF || COMPILE_TEST
+	depends on REGMAP
+	depends on OF_DYNAMIC
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
index 0000000..0c924a4
--- /dev/null
+++ b/drivers/mfd/mlxreg-core.c
@@ -0,0 +1,1250 @@
+/*
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
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
+#include <linux/gpio.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+/* Offset of event and mask registers from status register. */
+#define MLXREG_CORE_EVENT_OFF		1
+#define MLXREG_CORE_MASK_OFF		2
+#define MLXREG_CORE_AGGR_MASK_OFF	1
+
+/* Attribute parameters. */
+#define MLXREG_CORE_ATTR_VALUE_SIZE	10
+#define MLXREG_CORE_ATTR_GROUP_NUM	11
+#define MLXREG_CORE_ATTRS_NUM		48
+
+/* ASIC health parameters. */
+#define MLXREG_CORE_HEALTH_MASK		0x02
+#define MLXREG_CORE_RST_CNTR		3
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
+ * struct mlxreg_core_group - same type components controlled by the driver:
+ *
+ * @data: component data;
+ * @aggr_mask: group aggregation mask;
+ * @reg: group interrupt status register;
+ * @mask: group interrupt mask;
+ * @cache: last status value for elements fro the same group;
+ * @count: number of available elements in the group;
+ * @ind: element's index inside the group;
+ */
+struct mlxreg_core_item {
+	struct mlxreg_core_data *data;
+	u32 aggr_mask;
+	u32 reg;
+	u32 mask;
+	u32 cache;
+	u8 count;
+	u8 ind;
+};
+
+/**
+ * typedef mlxreg_core_parse_np - parse device node parameters.
+ */
+typedef int (*mlxreg_core_parse_np)(struct device_node *np,
+				     struct device *dev,
+				     struct mlxreg_core_item *item);
+
+/**
+ * struct mlxreg_core_grp - attribute group parameters:
+ *
+ * @name: attribute group name;
+ * @type: attribute type;
+ * @access: attribute access permissions (negative for no access);
+ * @use_grp_name: use group name as basic attribute name if set true;
+ * @cb: device node attribute parsing callback function;
+ */
+struct mlxreg_core_grp {
+	const char *name;
+	enum mlxreg_core_attr_type type;
+	int access;
+	bool use_grp_name;
+	mlxreg_core_parse_np cb;
+};
+
+/**
+ * struct mlxreg_core_priv_data - driver's private data:
+ *
+ * @irq: platform interrupt number;
+ * @pdev: platform device;
+ * @led_pdev: led platform device;
+ * @dev: parent device pointer;
+ * @regmap: register map of parent device;
+ * @item: groups control data;
+ * @led_data: led data;
+ * @hwmon: hwmon device;
+ * @mlxreg_core_attr: sysfs attributes array;
+ * @mlxreg_core_dev_attr: sysfs sensor device attribute array;
+ * @group: sysfs attribute group;
+ * @groups: list of sysfs attribute group for hwmon registration;
+ * @dwork_irq: delayed work template for signal handling;
+ * @lock: spin lock for sync with interrupt;
+ * @cell: location of top aggregation interrupt register;
+ * @mask: top aggregation interrupt common mask;
+ * @aggr_cache: last value of aggregation register status;
+ * @set_handler: if set - interrupt handler should be connected;
+ * @en_dynamic_node: set to true after dynamic device node is enabled;
+ * @after_probe: flag indicating if driver is after probing complition;
+ */
+struct mlxreg_core_priv_data {
+	int irq;
+	int irq_gpio;
+	struct platform_device *pdev;
+	struct platform_device *led_pdev;
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
+	struct delayed_work dwork_irq;
+	spinlock_t lock; /* sync with interrupt */
+	u32 cell;
+	u32 mask;
+	u32 aggr_cache;
+	bool set_handler;
+	bool en_dynamic_node;
+	bool after_probe;
+};
+
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
+
+static int mlxreg_core_parser(struct device_node *np, struct device *dev,
+			      struct mlxreg_core_item *item)
+{
+	struct mlxreg_core_data *data = item->data;
+	struct device_node *child, *phandle;
+
+	for_each_child_of_node(np, child) {
+		strlcpy(data->label, child->name, MLXREG_CORE_LABEL_MAX_SIZE);
+		strreplace(data->label, '-', ':');
+		if (of_property_read_u32(child, "reg", &data->reg))
+			return -EINVAL;
+
+		of_property_read_u32(child, "mask", &data->mask);
+		of_property_read_u32(child, "bit", &data->bit);
+
+		phandle = of_parse_phandle(child, "of-phandle", 0);
+		if (phandle)
+			data->np = phandle;
+
+		data++;
+	}
+
+	return 0;
+}
+
+static int mlxreg_core_plug_parser(struct device_node *np, struct device *dev,
+				   struct mlxreg_core_item *item)
+{
+	struct mlxreg_core_data *data = item->data;
+	struct of_phandle_args args;
+	int i;
+	int ret;
+
+	if (of_property_read_u32(np, "aggr_mask", &item->aggr_mask))
+		return -EINVAL;
+
+	if (of_property_read_u32(np, "reg", &item->reg))
+		return -EINVAL;
+
+	if (of_property_read_u32(np, "mask", &item->mask))
+		return -EINVAL;
+
+	for (i = 0; i < item->count; i++) {
+		ret = of_parse_phandle_with_fixed_args(np, "phandles", 0,
+						       i, &args);
+		if (ret < 0)
+			return ret;
+
+		data->np = args.np;
+		data++;
+	}
+
+	return 0;
+}
+
+static int mlxreg_core_asic_parser(struct device_node *np, struct device *dev,
+				   struct mlxreg_core_item *item)
+{
+	struct mlxreg_core_data *data = item->data;
+	struct of_phandle_args args;
+	u32 regs[16], masks[16];
+	int i;
+	int ret;
+
+	if (of_property_read_u32(np, "aggr_mask", &item->aggr_mask))
+		return -EINVAL;
+
+	ret = of_property_read_u32_array(np, "regs", regs, item->count);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_array(np, "masks", masks, item->count);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < item->count; i++) {
+		ret = of_parse_phandle_with_fixed_args(np, "phandles", 0,
+						       0, &args);
+		if (ret < 0)
+			return ret;
+
+		data->np = args.np;
+		data->reg = regs[i];
+		data->mask = masks[i];
+		data++;
+	}
+
+	return 0;
+}
+
+static struct mlxreg_core_grp mlxreg_core_grp[] = {
+	{ "psu", MLXREG_CORE_ATTR_PSU, 1, true, mlxreg_core_plug_parser },
+	{ "pwr", MLXREG_CORE_ATTR_PWR, 1, true, mlxreg_core_plug_parser },
+	{ "fan", MLXREG_CORE_ATTR_FAN, 1, true, mlxreg_core_plug_parser },
+	{ "reset", MLXREG_CORE_ATTR_RST, 2, false, mlxreg_core_parser },
+	{ "cause", MLXREG_CORE_ATTR_CAUSE, 1, false, mlxreg_core_parser },
+	{ "mux", MLXREG_CORE_ATTR_MUX, 0, false, mlxreg_core_parser },
+	{ "gprw", MLXREG_CORE_ATTR_GPRW, 0, false, mlxreg_core_parser },
+	{ "gpro", MLXREG_CORE_ATTR_GPRO, 1, false, mlxreg_core_parser },
+	{ "asic", MLXREG_CORE_ATTR_ASIC, 1, true, mlxreg_core_asic_parser },
+	{ "led", MLXREG_CORE_ATTR_LED, -1, false, mlxreg_core_parser },
+	{ "host", MLXREG_CORE_ATTR_HOST, -1, true, mlxreg_core_plug_parser },
+};
+
+static int
+mlxreg_core_item_parser(struct device_node *np, struct device *dev,
+			struct mlxreg_core_item *item,
+			mlxreg_core_parse_np cb)
+{
+	item->count = of_get_child_count(np);
+	if (!item->count) {
+		item->count = of_count_phandle_with_args(np, "phandles", NULL);
+		if (item->count < 0)
+			return item->count;
+	}
+
+	item->data = devm_kzalloc(dev, sizeof(*item->data) * item->count,
+				  GFP_KERNEL);
+	if (!item->data)
+		return -ENOMEM;
+
+	return cb(np, dev, item);
+}
+
+static int mlxreg_core_get_pos(struct mlxreg_core_priv_data *priv,
+			       struct mlxreg_core_grp *grp, int index)
+{
+	return (index - priv->item[grp->type]->ind) %
+	       priv->item[grp->type]->count;
+}
+
+static struct mlxreg_core_data*
+mlxreg_core_get(struct mlxreg_core_priv_data *priv,
+		struct mlxreg_core_grp *grp, int index)
+{
+	if (!index)
+		return priv->item[grp->type]->data;
+
+	return priv->item[grp->type + (index - priv->item[grp->type]->ind) %
+	       priv->item[grp->type]->count]->data;
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
+	case MLXREG_CORE_ATTR_PSU:
+	case MLXREG_CORE_ATTR_FAN:
+		/* Bit = 0 : item is functional. */
+		ret = regmap_read(priv->regmap,
+				  priv->item[mlxreg_core_grp[nr].type]->reg,
+				  &regval);
+		if (ret)
+			goto access_error;
+
+		regval = !!!(regval & BIT(mlxreg_core_get_pos(priv,
+					  &mlxreg_core_grp[nr], index)));
+
+		break;
+
+	case MLXREG_CORE_ATTR_PWR:
+		/* Bit = 1 : item is functional. */
+		ret = regmap_read(priv->regmap,
+				  priv->item[mlxreg_core_grp[nr].type]->reg,
+				  &regval);
+		if (ret)
+			goto access_error;
+
+		regval = !!(regval & BIT(mlxreg_core_get_pos(priv,
+					 &mlxreg_core_grp[nr], index)));
+		break;
+
+	case MLXREG_CORE_ATTR_ASIC:
+		/* ASIC status. */
+		if (!mlxreg_core_get(priv, &mlxreg_core_grp[nr], 0))
+			return -ENODEV;
+
+		data = mlxreg_core_get(priv, &mlxreg_core_grp[nr], index);
+		ret = regmap_read(priv->regmap, data->reg, &regval);
+		if (ret)
+			goto access_error;
+
+		regval &= data->mask;
+
+		break;
+
+	case MLXREG_CORE_ATTR_RST:
+		break;
+
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
+	case MLXREG_CORE_ATTR_LED:
+	case MLXREG_CORE_ATTR_HOST:
+
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
+	for (i = 0; i < priv->item[grp->type]->count; i++, id++, data++) {
+		priv->mlxreg_core_attr[id] =
+				&priv->mlxreg_core_dev_attr[id].dev_attr.attr;
+		if (grp->use_grp_name)
+			priv->mlxreg_core_attr[id]->name =
+				devm_kasprintf(priv->dev, GFP_KERNEL,
+					       "%s%u", grp->name, id %
+						priv->item[grp->type]->count
+						+ 1);
+		else
+			priv->mlxreg_core_attr[id]->name =
+				devm_kasprintf(priv->dev, GFP_KERNEL,
+					       data->label);
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
+	int i, num_attrs = 0;
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
+static void
+mlxreg_core_work_helper(struct mlxreg_core_priv_data *priv,
+			struct mlxreg_core_item *item, u8 is_inverse,
+			u16 off, u32 mask, u32 *cache)
+{
+	struct mlxreg_core_data *data;
+	u32 asserted, regval, bit;
+	int ret;
+
+	/*
+	 * Validate if item related to received signal type is valid.
+	 * It should never happen, excepted the situation when some
+	 * piece of hardware is broken. In such situation just produce
+	 * error message and return. Caller must continue to handle the
+	 * signals from other devices if any.
+	 */
+	if (unlikely(!item)) {
+		dev_err(priv->dev, "False signal is received: register at offset 0x%02x, mask 0x%02x.\n",
+			off, mask);
+
+		return;
+	}
+
+	/* Mask event. */
+	ret = regmap_write(priv->regmap, off + MLXREG_CORE_MASK_OFF, 0);
+	if (ret)
+		goto access_error;
+
+	/* Read status. */
+	ret = regmap_read(priv->regmap, off, &regval);
+	if (ret)
+		goto access_error;
+
+	/* Set asserted bits and save last status. */
+	regval &= mask;
+	asserted = *cache ^ regval;
+	*cache = regval;
+
+	for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
+		data = item->data + bit;
+		if (regval & BIT(bit)) {
+			if (is_inverse)
+				mlxreg_core_dev_disable(data->np);
+			else
+				mlxreg_core_dev_enable(data->np);
+		} else {
+			if (is_inverse)
+				mlxreg_core_dev_enable(data->np);
+			else
+				mlxreg_core_dev_disable(data->np);
+		}
+	}
+
+	/* Acknowledge event. */
+	ret = regmap_write(priv->regmap, off + MLXREG_CORE_EVENT_OFF, 0);
+	if (ret)
+		goto access_error;
+
+	/* Unmask event. */
+	ret = regmap_write(priv->regmap, off + MLXREG_CORE_MASK_OFF, mask);
+	if (ret)
+		goto access_error;
+
+	return;
+
+access_error:
+	dev_err(priv->dev, "Failed to complete workqueue.\n");
+}
+
+static void
+mlxreg_core_asic_work_helper(struct mlxreg_core_priv_data *priv, u32 *cache)
+{
+	struct mlxreg_core_data *data =
+				priv->item[MLXREG_CORE_ATTR_ASIC]->data;
+	u32 regval;
+	int i, ret;
+
+	for (i = 0; i < priv->item[MLXREG_CORE_ATTR_ASIC]->count; i++,
+	     data++) {
+		/* Mask event. */
+		ret = regmap_write(priv->regmap, data->reg +
+				   MLXREG_CORE_MASK_OFF, 0);
+		if (ret)
+			goto access_error;
+
+		/* Read status. */
+		ret = regmap_read(priv->regmap, data->reg, &regval);
+		if (ret)
+			goto access_error;
+
+		regval &= data->mask;
+		*cache = regval;
+		if (regval == MLXREG_CORE_HEALTH_MASK) {
+			if ((data->health_counter++ == MLXREG_CORE_RST_CNTR) ||
+			    !priv->after_probe) {
+				mlxreg_core_dev_enable(data->np);
+				data->attached = true;
+			}
+		} else {
+			if (data->attached) {
+				mlxreg_core_dev_disable(data->np);
+				data->attached = false;
+				data->health_counter = 0;
+			}
+		}
+
+		/* Acknowledge event. */
+		ret = regmap_write(priv->regmap, data->reg +
+				   MLXREG_CORE_EVENT_OFF, 0);
+		if (ret)
+			goto access_error;
+
+		/* Unmask event. */
+		ret = regmap_write(priv->regmap, data->reg +
+				   MLXREG_CORE_MASK_OFF, data->mask);
+		if (ret)
+			goto access_error;
+	}
+
+	return;
+
+access_error:
+	dev_err(priv->dev, "Failed to complete workqueue.\n");
+}
+
+/*
+ * mlxreg_core_work_handler - performs traversing of CPLD interrupt
+ * registers according to the below hierarchy schema:
+ *
+ *				Aggregation registers (status/mask)
+ * PSU registers:		*---*
+ * *-----------------*		|   |
+ * |status/event/mask|----->    | * |
+ * *-----------------*		|   |
+ * Power registers:		|   |
+ * *-----------------*		|   |
+ * |status/event/mask|----->    | * |
+ * *-----------------*		|   |
+ * FAN registers:		|   |--> CPU
+ * *-----------------*		|   |
+ * |status/event/mask|----->    | * |
+ * *-----------------*		|   |
+ * ASIC registers:		|   |
+ * *-----------------*		|   |
+ * |status/event/mask|----->    | * |
+ * *-----------------*		|   |
+ *				*---*
+ *
+ * In case some system changed are detected: FAN in/out, PSU in/out, power
+ * cable attached/detached, ASIC helath good/bad, relevant device is created
+ * or destroyed.
+ */
+static void mlxreg_core_work_handler(struct work_struct *work)
+{
+	struct mlxreg_core_priv_data *priv = container_of(work,
+			struct mlxreg_core_priv_data, dwork_irq.work);
+	struct mlxreg_core_item *item;
+	unsigned long flags;
+	u8 aggr_asserted;
+	u32 regval;
+	int i, ret;
+
+	/* Mask aggregation event. */
+	ret = regmap_write(priv->regmap, priv->cell +
+			   MLXREG_CORE_AGGR_MASK_OFF, 0);
+	if (ret < 0)
+		goto access_error;
+
+	/* Read aggregation status. */
+	ret = regmap_read(priv->regmap, priv->cell, &regval);
+	if (ret)
+		goto access_error;
+
+	regval &= priv->mask;
+	aggr_asserted = priv->aggr_cache ^ regval;
+	priv->aggr_cache = regval;
+
+	/* Handle topology and health configuration changes. */
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		switch (mlxreg_core_grp[i].type) {
+		case MLXREG_CORE_ATTR_PSU:
+		case MLXREG_CORE_ATTR_FAN:
+			item = priv->item[mlxreg_core_grp[i].type];
+			if (aggr_asserted & item->aggr_mask)
+				mlxreg_core_work_helper(priv, item, 1,
+							item->reg, item->mask,
+							&item->cache);
+			break;
+
+		case MLXREG_CORE_ATTR_PWR:
+		case MLXREG_CORE_ATTR_HOST:
+			item = priv->item[mlxreg_core_grp[i].type];
+			if (aggr_asserted & item->aggr_mask)
+				mlxreg_core_work_helper(priv, item, 0,
+							item->reg, item->mask,
+							&item->cache);
+			break;
+
+		case MLXREG_CORE_ATTR_ASIC:
+			item = priv->item[mlxreg_core_grp[i].type];
+			if (aggr_asserted & item->aggr_mask)
+				mlxreg_core_asic_work_helper(priv,
+							     &item->cache);
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	if (aggr_asserted) {
+		spin_lock_irqsave(&priv->lock, flags);
+
+		/*
+		 * It is possible, that some signals have been inserted, while
+		 * interrupt has been masked by mlxreg_core_work_handler.
+		 * In this case such signals will be missed. In order to handle
+		 * these signals delayed work is canceled and work task
+		 * re-scheduled for immediate execution. It allows to handle
+		 * missed signals, if any. In other case work handler just
+		 * validates that no new signals have been received during
+		 * masking.
+		 */
+		cancel_delayed_work(&priv->dwork_irq);
+		schedule_delayed_work(&priv->dwork_irq, 0);
+
+		spin_unlock_irqrestore(&priv->lock, flags);
+
+		return;
+	}
+
+	/* Unmask aggregation event (no need acknowledge). */
+	ret = regmap_write(priv->regmap, priv->cell +
+			   MLXREG_CORE_AGGR_MASK_OFF, priv->mask);
+	if (ret)
+		goto access_error;
+
+	return;
+
+access_error:
+	dev_err(priv->dev, "Failed to complete workqueue.\n");
+}
+
+static int mlxreg_core_set_irq(struct mlxreg_core_priv_data *priv)
+{
+	struct mlxreg_core_item *item;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		if (!mlxreg_core_get(priv, &mlxreg_core_grp[i], 0))
+			continue;
+
+		switch (mlxreg_core_grp[i].type) {
+		case MLXREG_CORE_ATTR_PSU:
+		case MLXREG_CORE_ATTR_FAN:
+			/* Clear group presense event. */
+			item = priv->item[mlxreg_core_grp[i].type];
+			ret = regmap_write(priv->regmap, item->reg +
+					   MLXREG_CORE_EVENT_OFF, 0);
+			if (ret)
+				goto access_error;
+
+			/*
+			 * Set group initial status as mask and unmask
+			 * group event.
+			 */
+			item = priv->item[mlxreg_core_grp[i].type];
+			item->cache = item->mask;
+			ret = regmap_write(priv->regmap, item->reg +
+					   MLXREG_CORE_MASK_OFF, item->mask);
+			if (ret)
+				goto access_error;
+
+			break;
+
+		case MLXREG_CORE_ATTR_PWR:
+		case MLXREG_CORE_ATTR_ASIC:
+		case MLXREG_CORE_ATTR_HOST:
+			/* Clear group presense event. */
+			item = priv->item[mlxreg_core_grp[i].type];
+			ret = regmap_write(priv->regmap, item->reg +
+					   MLXREG_CORE_EVENT_OFF, 0);
+			if (ret)
+				goto access_error;
+
+			/*
+			 * Keep group initial status as zero and unmask
+			 * group event.
+			 */
+			ret = regmap_write(priv->regmap, item->reg +
+					   MLXREG_CORE_MASK_OFF, item->mask);
+
+			if (ret)
+				goto access_error;
+
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	/* Keep aggregation initial status as zero and unmask events. */
+	ret = regmap_write(priv->regmap, priv->cell +
+			   MLXREG_CORE_AGGR_MASK_OFF, priv->mask);
+	if (ret)
+		goto access_error;
+
+	/* Invoke work handler for initializing hot plug devices setting. */
+	mlxreg_core_work_handler(&priv->dwork_irq.work);
+
+	enable_irq(priv->irq);
+
+	return 0;
+
+access_error:
+	dev_err(priv->dev, "Failed to set interrupts.\n");
+
+	enable_irq(priv->irq);
+
+	return ret;
+}
+
+static void mlxreg_core_unset_irq(struct mlxreg_core_priv_data *priv)
+{
+	struct mlxreg_core_data *data;
+	int count, i, j;
+
+	disable_irq(priv->irq);
+	cancel_delayed_work_sync(&priv->dwork_irq);
+
+	/* Mask aggregation event. */
+	regmap_write(priv->regmap, priv->cell + MLXREG_CORE_AGGR_MASK_OFF, 0);
+
+	/* Clear topology configurations. */
+	for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+		switch (mlxreg_core_grp[i].type) {
+		case MLXREG_CORE_ATTR_PSU:
+		case MLXREG_CORE_ATTR_FAN:
+		case MLXREG_CORE_ATTR_ASIC:
+		case MLXREG_CORE_ATTR_PWR:
+		case MLXREG_CORE_ATTR_HOST:
+			data = mlxreg_core_get(priv, &mlxreg_core_grp[i], 0);
+			if (!data)
+				break;
+
+			/* Mask group presense event. */
+			regmap_write(priv->regmap, data->reg +
+				     MLXREG_CORE_MASK_OFF, 0);
+			/* Clear group presense event. */
+			regmap_write(priv->regmap, data->reg +
+				     MLXREG_CORE_EVENT_OFF, 0);
+
+			/* Remove all the attached devices in group. */
+			count = priv->item[mlxreg_core_grp[i].type]->count;
+			for (j = 0; j < count; j++, data++)
+				mlxreg_core_dev_disable(data->np);
+			break;
+
+		default:
+			break;
+		}
+	}
+}
+
+static irqreturn_t mlxreg_core_irq_handler(int irq, void *dev)
+{
+	struct mlxreg_core_priv_data *priv =
+				(struct mlxreg_core_priv_data *)dev;
+
+	/* Schedule work task for immediate execution.*/
+	schedule_delayed_work(&priv->dwork_irq, 0);
+
+	return IRQ_HANDLED;
+}
+
+static int mlxreg_core_set_led(struct mlxreg_core_priv_data *priv, int count)
+{
+	struct mlxreg_core_led_data *data;
+	struct mlxreg_core_data *led;
+	int i;
+	int err;
+
+	priv->led_pdata = devm_kzalloc(&priv->pdev->dev,
+				       sizeof(*priv->led_pdata->data),
+				       GFP_KERNEL);
+	if (!priv->led_pdata)
+		return -ENOMEM;
+	priv->led_pdata->data = devm_kzalloc(&priv->pdev->dev,
+					     sizeof(*priv->led_pdata->data) *
+					     count, GFP_KERNEL);
+	if (!priv->led_pdata->data)
+		return -ENOMEM;
+
+	priv->led_pdata->regmap = priv->regmap;
+	priv->led_pdata->counter = priv->item[MLXREG_CORE_ATTR_LED]->count;
+
+	data = priv->led_pdata->data;
+	led = priv->item[MLXREG_CORE_ATTR_LED]->data;
+	for (i = 0; i < priv->led_pdata->counter; i++, data++, led++)
+		data->led = led;
+
+	priv->led_pdev = platform_device_alloc("leds-mlxreg", priv->pdev->id);
+	if (!priv->led_pdev)
+		return -ENOMEM;
+
+	priv->led_pdev->dev.parent = &priv->pdev->dev;
+	priv->led_pdev->dev.of_node = priv->pdev->dev.of_node;
+	err = platform_device_add_data(priv->led_pdev, priv->led_pdata,
+					       sizeof(*priv->led_pdata));
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
+	return err;
+}
+
+static int mlxreg_core_probe(struct platform_device *pdev)
+{
+	struct device_node *child, *np = pdev->dev.of_node;
+	struct mlxreg_core_priv_data *priv;
+	u32 val;
+	int i;
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
+	if (!of_property_read_u32(np, "cell", &val))
+		priv->cell = val;
+
+	if (!of_property_read_u32(np, "mask", &val))
+		priv->mask = val;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq >= 0) {
+		err = devm_request_irq(&pdev->dev, priv->irq,
+				       mlxreg_core_irq_handler,
+				       IRQF_TRIGGER_FALLING | IRQF_SHARED,
+				       np->name, priv);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to request irq: %d\n",
+				err);
+			return err;
+		}
+
+		disable_irq(priv->irq);
+		priv->set_handler = true;
+	}
+
+	/* Parse device tree table and configure driver's attributes. */
+	for_each_child_of_node(np, child) {
+		for (i = 0; i < ARRAY_SIZE(mlxreg_core_grp); i++) {
+			if (!of_node_cmp(child->name,
+					 mlxreg_core_grp[i].name)) {
+				err = mlxreg_core_item_parser(child,
+					&priv->pdev->dev,
+					priv->item[mlxreg_core_grp[i].type],
+					mlxreg_core_grp[i].cb);
+				goto parse_check;
+			}
+		}
+parse_check:
+		if (err)
+			return err;
+	}
+
+	spin_lock_init(&priv->lock);
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
+		err = mlxreg_core_set_led(priv,
+				priv->item[MLXREG_CORE_ATTR_LED]->count);
+		if (err)
+			return err;
+	}
+
+	if (priv->set_handler) {
+		INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_core_work_handler);
+		/* Perform initial interrupts setup. */
+		mlxreg_core_set_irq(priv);
+	}
+
+	priv->after_probe = true;
+	dev_set_drvdata(&pdev->dev, priv);
+
+	return 0;
+}
+
+static int mlxreg_core_remove(struct platform_device *pdev)
+{
+	struct mlxreg_core_priv_data *priv = dev_get_drvdata(&pdev->dev);
+
+	/* Clean interrupts setup. */
+	if (priv->set_handler)
+		mlxreg_core_unset_irq(priv);
+
+	if (priv->item[MLXREG_CORE_ATTR_LED] &&
+	    (priv->item[MLXREG_CORE_ATTR_LED]->count > 0))
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
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("Mellanox regmap core driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:mlxreg-core");
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
new file mode 100644
index 0000000..ce3c69c
--- /dev/null
+++ b/include/linux/platform_data/mlxreg.h
@@ -0,0 +1,93 @@
+/*
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
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
+#define MLXREG_CORE_LABEL_MAX_SIZE	32
+
+/**
+ * struct mlxreg_core_data - attributes control data:
+ *
+ * @label: attribute label;
+ * @label: attribute register offset;
+ * @reg: attribute register;
+ * @mask: attribute access mask;
+ * @bit: attribute effective bit;
+ * @np - pointer to node platform associated with attribute;
+ * @health_counter: dynamic device health indication counter;
+ * @attached: true if device has been attached after good helath indication;
+ */
+struct mlxreg_core_data {
+	char label[MLXREG_CORE_LABEL_MAX_SIZE];
+	u32 reg;
+	u32 mask;
+	u32 bit;
+	struct device_node *np;
+	u8 health_counter;
+	bool attached;
+};
+
+/**
+ * struct mlxreg_core_led_data - led control data:
+ *
+ * @led: led private data;
+ * @led_classdev: led class data;
+ * @base_color: base led color (other colors have constant offset from base);
+ * @bitset: led setting (on, off);
+ * @set_count: number of bits set for deferred operation (limited by 32);
+ * @led_data: led data;
+ * @data_parent: pointer to private device control data of parent;
+ * @dwork_led: delayed work template for led blink handling;
+ */
+struct mlxreg_core_led_data {
+	struct mlxreg_core_data *led;
+	struct led_classdev led_cdev;
+	u8 base_color;
+	u32 bitset;
+	u8 set_count;
+	void *data_parent;
+	char led_cdev_name[MLXREG_CORE_LABEL_MAX_SIZE];
+	struct delayed_work dwork_led;
+};
+
+/**
+ * struct mlxreg_core_led_platform_data - led platform data:
+ *
+ * @data: led private data;
+ * @regmap: register map of parent device;
+ * @led_classdev: led class data;
+ * @counter: number of led instances;
+ */
+struct mlxreg_core_led_platform_data {
+	struct mlxreg_core_led_data *data;
+	void *regmap;
+	int counter;
+};
-- 
2.1.4
