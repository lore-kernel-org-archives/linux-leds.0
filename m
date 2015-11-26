From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH v2 6/9] mfd: add TI LMU hardware fault monitoring driver
Date: Thu, 26 Nov 2015 15:57:02 +0900
Message-ID: <1448521025-2796-7-git-send-email-milo.kim@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38854 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752362AbbKZG65 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 26 Nov 2015 01:58:57 -0500
In-Reply-To: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>

LM3633 and LM3697 are TI LMU MFD device.
Those devices have hardware monitoring feature which detects open or
short circuit case.

Debugfs
-------
  Two files are created.
    open_fault:  check light output channel is open or not.
    short_fault: check light output channel is shorted or not.

  The driver checks the status of backlight output channels.
  LM3633 and LM3697 have same sequence to check channels, so common
  functions are used.
  ABI/testing document is also included.

Operations
----------
  Two devices have common control flow but register addresses are different.
  The structure, 'ti_lmu_reg' is used for register configuration.

Event notifier
--------------
  After fault monitoring is done, LMU device is reset. So backlight and
  LED device should be reinitialized. It notifies an event as soon as
  the monitoring is done. Then, LM3633 and LM3697 backlight and LED drivers
  handle this event.

Cc: Lee Jones <lee.jones@linaro.org> 
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 .../ABI/testing/debugfs-ti-lmu-fault-monitor       |  32 ++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ti-lmu-fault-monitor.c                 | 405 +++++++++++++++++++++
 4 files changed, 448 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-ti-lmu-fault-monitor
 create mode 100644 drivers/mfd/ti-lmu-fault-monitor.c

diff --git a/Documentation/ABI/testing/debugfs-ti-lmu-fault-monitor b/Documentation/ABI/testing/debugfs-ti-lmu-fault-monitor
new file mode 100644
index 0000000..7e39e4a
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-ti-lmu-fault-monitor
@@ -0,0 +1,32 @@
+TI LMU (Lighting Management Unit) Fault Monitoring via the debugfs
+
+LM3633 and LM3697 support hardware fault monitoring which detects
+open or short circuit case.
+
+What:		/sys/kernel/debug/ti-lmu-fault-monitor/open_fault
+Date:		Dec 2015
+KernelVersion:	4.5
+Contact:	Milo Kim <milo.kim@ti.com>
+Description:	read only
+                Check whether light channel works or open circuit is detected.
+
+		Example:
+		cat /sys/kernel/debug/ti-lmu-fault-monitor/open_fault
+
+		Channel 0 works
+		Channel 1 works
+		Channel 2 is open
+
+What:		/sys/kernel/debug/ti-lmu-fault-monitor/short_fault
+Date:		Dec 2015
+KernelVersion:	4.5
+Contact:	Milo Kim <milo.kim@ti.com>
+Description:	read only
+                Check whether light channel works or short circuit is detected.
+
+		Example:
+		cat /sys/kernel/debug/ti-lmu-fault-monitor/short_fault
+
+		Channel 0 is shorted
+		Channel 1 works
+		Channel 2 works
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a6aab27..e08acba 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1061,6 +1061,16 @@ config MFD_TI_LMU
 	  It consists of backlight, LED and regulator driver.
 	  It provides consistent device controls for lighting functions.
 
+config MFD_TI_LMU_FAULT_MONITOR
+	tristate "TI LMU Hardware Fault Monitoring Driver"
+	depends on MFD_TI_LMU && DEBUG_FS
+	help
+	  Say Y here to include support for open and short circuit fault
+	  detection of TI LMU devices.
+
+	  This driver can also be built as a module. If so the module
+	  will be called ti-lmu-fault-monitor.
+
 config MFD_OMAP_USB_HOST
 	bool "TI OMAP USBHS core and TLL driver"
 	depends on USB_EHCI_HCD_OMAP || USB_OHCI_HCD_OMAP3
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 10e4bc2..5ddb4e6 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_MFD_LP3943)	+= lp3943.o
 obj-$(CONFIG_MFD_LP8788)	+= lp8788.o lp8788-irq.o
 
 obj-$(CONFIG_MFD_TI_LMU)	+= ti-lmu.o
+obj-$(CONFIG_MFD_TI_LMU_FAULT_MONITOR)	+= ti-lmu-fault-monitor.o
 
 da9055-objs			:= da9055-core.o da9055-i2c.o
 obj-$(CONFIG_MFD_DA9055)	+= da9055.o
diff --git a/drivers/mfd/ti-lmu-fault-monitor.c b/drivers/mfd/ti-lmu-fault-monitor.c
new file mode 100644
index 0000000..ba65c93
--- /dev/null
+++ b/drivers/mfd/ti-lmu-fault-monitor.c
@@ -0,0 +1,405 @@
+/*
+ * TI LMU (Lighting Management Unit) Hardware Fault Monitoring Driver
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
+#include <linux/bitops.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/gpio.h>
+#include <linux/kernel.h>
+#include <linux/mfd/ti-lmu.h>
+#include <linux/mfd/ti-lmu-register.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define LMU_ENABLE_OPEN_MONITORING		BIT(0)
+#define LMU_ENABLE_SHORT_MONITORING		BIT(1)
+#define LMU_DEFAULT_BANK			0
+#define LMU_BANK_MASK(n)			(~BIT(n) & 0x07)
+#define LMU_MAX_CHANNELS			3
+#define LMU_DELAY_STARTUP			500
+#define LMU_DELAY_FEEDBACK			5
+#define LMU_ENABLE_FEEDBACK			(BIT(0) | BIT(1) | BIT(2))
+#define LMU_MAX_BRIGHTNESS			0xFF
+#define LMU_NO_RAMP				0
+
+enum ti_lmu_fault_monitor_id {
+	LMU_OPEN_CIRCUIT,
+	LMU_SHORT_CIRCUIT,
+};
+
+/**
+ * struct ti_lmu_reg
+ *
+ * @monitor:		Enable monitoring register
+ * @bank:		Control bank configuration register
+ * @ramp:		Ramp(speed) configuration register
+ * @imax:		Current limit setting register
+ * @feedback:		Feedback enable register
+ * @brightness:		Brightness register
+ * @enable:		Bank enable register
+ * @open_fault:		Detect open circuit status register
+ * @short_fault:	Detect short circuit status register
+ *
+ * To detect hardware fault, several registers are used.
+ * Device specific register addresses are configured in this structure.
+ */
+struct ti_lmu_reg {
+	u8 monitor;
+	u8 bank;
+	u8 ramp;
+	u8 imax;
+	u8 feedback;
+	u8 brightness;
+	u8 enable;
+	u8 open_fault;
+	u8 short_fault;
+};
+
+struct ti_lmu_fault_monitor {
+	struct ti_lmu *lmu;
+	struct device *dev;
+	const struct ti_lmu_reg *regs;
+	struct dentry *dentry_root;
+	struct dentry *dentry_open;
+	struct dentry *dentry_short;
+};
+
+static void ti_lmu_reset_device(struct ti_lmu_fault_monitor *monitor)
+{
+	unsigned int en_gpio = monitor->lmu->en_gpio;
+
+	gpio_set_value(en_gpio, 0);
+	msleep(LMU_DELAY_STARTUP);
+
+	gpio_set_value(en_gpio, 1);
+	msleep(LMU_DELAY_STARTUP);
+}
+
+static int ti_lmu_monitor_enable(struct ti_lmu_fault_monitor *monitor,
+				 enum ti_lmu_fault_monitor_id id)
+{
+	struct regmap *regmap = monitor->lmu->regmap;
+	u8 reg = monitor->regs->monitor;
+
+	switch (id) {
+	case LMU_OPEN_CIRCUIT:
+		return regmap_write(regmap, reg, LMU_ENABLE_OPEN_MONITORING);
+	case LMU_SHORT_CIRCUIT:
+		return regmap_write(regmap, reg, LMU_ENABLE_SHORT_MONITORING);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int ti_lmu_monitor_assign_bank(struct ti_lmu_fault_monitor *monitor,
+				      u8 val)
+{
+	struct regmap *regmap = monitor->lmu->regmap;
+
+	return regmap_write(regmap, monitor->regs->bank, val);
+}
+
+static int ti_lmu_monitor_config_channel(struct ti_lmu_fault_monitor *monitor)
+{
+	struct regmap *regmap = monitor->lmu->regmap;
+	const struct ti_lmu_reg *reg = monitor->regs;
+	int ret;
+
+	/* Set ramp time to the fatest setting */
+	ret = regmap_write(regmap, reg->ramp, LMU_NO_RAMP);
+	if (ret)
+		return ret;
+
+	/* Set max current to 20mA */
+	ret = regmap_write(regmap, reg->imax, LMU_IMAX_20mA);
+	if (ret)
+		return ret;
+
+	/* Enable feedback */
+	ret = regmap_write(regmap, reg->feedback, LMU_ENABLE_FEEDBACK);
+	if (ret)
+		return ret;
+
+	/* Set max brightness */
+	ret = regmap_write(regmap, reg->brightness, LMU_MAX_BRIGHTNESS);
+	if (ret)
+		return ret;
+
+	/* Enable a control bank */
+	ret = regmap_write(regmap, reg->enable, 1);
+	if (ret)
+		return ret;
+
+	/* Wait until device completes fault detection */
+	msleep(LMU_DELAY_FEEDBACK);
+
+	return 0;
+}
+
+static int ti_lmu_monitor_open_fault(struct ti_lmu_fault_monitor *monitor,
+				     struct seq_file *s)
+{
+	int ret, i;
+	struct regmap *regmap = monitor->lmu->regmap;
+	u8 status = 0;
+
+	ret = regmap_read(regmap, monitor->regs->open_fault,
+			  (unsigned int *)&status);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < LMU_MAX_CHANNELS; i++) {
+		if (BIT(i) & status)
+			seq_printf(s, "Channel %d is open\n", i);
+		else
+			seq_printf(s, "Channel %d works\n", i);
+	}
+
+	return 0;
+}
+
+static int ti_lmu_monitor_short_fault(struct ti_lmu_fault_monitor *monitor,
+				      struct seq_file *s, int channel)
+{
+	struct regmap *regmap = monitor->lmu->regmap;
+	u8 status = 0;
+	int ret;
+
+	ret = regmap_read(regmap, monitor->regs->short_fault,
+			  (unsigned int *)&status);
+	if (ret)
+		return ret;
+
+	if (BIT(channel) & status)
+		seq_printf(s, "Channel %d is shorted\n", channel);
+	else
+		seq_printf(s, "Channel %d works\n", channel);
+
+	return 0;
+}
+
+static int ti_lmu_disable_all_banks(struct ti_lmu_fault_monitor *monitor)
+{
+	struct regmap *regmap = monitor->lmu->regmap;
+
+	return regmap_write(regmap, monitor->regs->enable, 0);
+}
+
+static int ti_lmu_notifier_call_chain(struct ti_lmu_fault_monitor *monitor)
+{
+	int ret;
+
+	ti_lmu_reset_device(monitor);
+
+	ret = blocking_notifier_call_chain(&monitor->lmu->notifier,
+					   LMU_EVENT_MONITOR_DONE, NULL);
+	if (ret == NOTIFY_OK || ret == NOTIFY_DONE)
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int ti_lmu_diagnose_hw(struct seq_file *s,
+			      enum ti_lmu_fault_monitor_id id)
+{
+	struct ti_lmu_fault_monitor *monitor = s->private;
+	u8 bank = LMU_DEFAULT_BANK;
+	int i, ret;
+
+	/* Device should be reset prior to fault detection */
+	ti_lmu_reset_device(monitor);
+
+	ret = ti_lmu_monitor_enable(monitor, id);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < LMU_MAX_CHANNELS; i++) {
+		if (id == LMU_SHORT_CIRCUIT)
+			bank = LMU_BANK_MASK(i);
+
+		ret = ti_lmu_monitor_assign_bank(monitor, bank);
+		if (ret)
+			return ret;
+
+		ret = ti_lmu_monitor_config_channel(monitor);
+		if (ret)
+			return ret;
+
+		/*
+		 * Open fault monitoring requires single operation -
+		 * checking status register.
+		 */
+		if (id == LMU_OPEN_CIRCUIT) {
+			ret = ti_lmu_monitor_open_fault(monitor, s);
+			if (ret)
+				return ret;
+			break;
+		}
+
+		ret = ti_lmu_monitor_short_fault(monitor, s, i);
+		if (ret)
+			return ret;
+
+		ret = ti_lmu_disable_all_banks(monitor);
+		if (ret)
+			return ret;
+	}
+
+	return ti_lmu_notifier_call_chain(monitor);
+}
+
+static int ti_lmu_show_open_fault(struct seq_file *s, void *p)
+{
+	return ti_lmu_diagnose_hw(s, LMU_OPEN_CIRCUIT);
+}
+
+static ssize_t ti_lmu_show_short_fault(struct seq_file *s, void *p)
+{
+	return ti_lmu_diagnose_hw(s, LMU_SHORT_CIRCUIT);
+}
+
+static int dbg_open_fault(struct inode *inode, struct file *file)
+{
+	return single_open(file, ti_lmu_show_open_fault, inode->i_private);
+}
+
+static int dbg_short_fault(struct inode *inode, struct file *file)
+{
+	return single_open(file, ti_lmu_show_short_fault, inode->i_private);
+}
+
+static const struct ti_lmu_reg lm3633_regs = {
+	.monitor	= LM3633_REG_MONITOR_ENABLE,
+	.bank		= LM3633_REG_HVLED_OUTPUT_CFG,
+	.ramp		= LM3633_REG_BL0_RAMP,
+	.imax		= LM3633_REG_IMAX_HVLED_A,
+	.feedback	= LM3633_REG_BL_FEEDBACK_ENABLE,
+	.brightness	= LM3633_REG_BRT_HVLED_A_MSB,
+	.enable		= LM3633_REG_ENABLE,
+	.open_fault	= LM3633_REG_BL_OPEN_FAULT_STATUS,
+	.short_fault	= LM3633_REG_BL_SHORT_FAULT_STATUS,
+};
+
+static const struct ti_lmu_reg lm3697_regs = {
+	.monitor	= LM3697_REG_MONITOR_ENABLE,
+	.bank		= LM3697_REG_HVLED_OUTPUT_CFG,
+	.ramp		= LM3697_REG_BL0_RAMP,
+	.imax		= LM3697_REG_IMAX_A,
+	.feedback	= LM3697_REG_FEEDBACK_ENABLE,
+	.brightness	= LM3697_REG_BRT_A_MSB,
+	.enable		= LM3697_REG_ENABLE,
+	.open_fault	= LM3697_REG_OPEN_FAULT_STATUS,
+	.short_fault	= LM3697_REG_SHORT_FAULT_STATUS,
+};
+
+static const struct file_operations open_fault_fops = {
+	.open		= dbg_open_fault,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static const struct file_operations short_fault_fops = {
+	.open		= dbg_short_fault,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int ti_lmu_fault_monitor_create_debugfs(const char *root_name,
+				struct ti_lmu_fault_monitor *monitor)
+{
+	monitor->dentry_root = debugfs_create_dir(root_name, NULL);
+	if (!monitor->dentry_root)
+		return -ENODEV;
+
+	monitor->dentry_open = debugfs_create_file("open_fault", S_IRUGO,
+						   monitor->dentry_root,
+						   monitor, &open_fault_fops);
+	if (!monitor->dentry_open)
+		return -ENODEV;
+
+	monitor->dentry_short = debugfs_create_file("short_fault", S_IRUGO,
+						    monitor->dentry_root,
+						    monitor, &short_fault_fops);
+	if (!monitor->dentry_short)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int ti_lmu_fault_monitor_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ti_lmu *lmu = dev_get_drvdata(dev->parent);
+	struct ti_lmu_fault_monitor *monitor;
+	const struct ti_lmu_reg *regs;
+
+	/*
+	 * HW enable pin is used for device reset on monitoring fault status.
+	 * So gpio should be configured.
+	 */
+	if (!gpio_is_valid(lmu->en_gpio))
+		return -EINVAL;
+
+	switch (pdev->id) {
+	case LM3633:
+		regs = &lm3633_regs;
+		break;
+	case LM3697:
+		regs = &lm3697_regs;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	monitor = devm_kzalloc(dev, sizeof(*monitor), GFP_KERNEL);
+	if (!monitor)
+		return -ENOMEM;
+
+	monitor->lmu = lmu;
+	monitor->dev = dev;
+	monitor->regs = regs;
+
+	platform_set_drvdata(pdev, monitor);
+
+	return ti_lmu_fault_monitor_create_debugfs(pdev->name, monitor);
+}
+
+static int ti_lmu_fault_monitor_remove(struct platform_device *pdev)
+{
+	struct ti_lmu_fault_monitor *monitor = platform_get_drvdata(pdev);
+
+	debugfs_remove_recursive(monitor->dentry_root);
+
+	return 0;
+}
+
+static struct platform_driver ti_lmu_fault_monitor_driver = {
+	.probe  = ti_lmu_fault_monitor_probe,
+	.remove = ti_lmu_fault_monitor_remove,
+	.driver = {
+		.name = "ti-lmu-fault-monitor",
+	},
+};
+
+module_platform_driver(ti_lmu_fault_monitor_driver);
+
+MODULE_DESCRIPTION("TI LMU Hardware Fault Monitoring Driver");
+MODULE_AUTHOR("Milo Kim");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:ti-lmu-fault-monitor");
-- 
1.9.1
