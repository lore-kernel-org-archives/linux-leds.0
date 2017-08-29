From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v4 2/2] mfd: Add Mellanox regmap I2C driver
Date: Tue, 29 Aug 2017 18:00:16 +0000
Message-ID: <1504029616-192277-3-git-send-email-vadimp@mellanox.com>
References: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1504029616-192277-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-leds@vger.kernel.org

This patch adds I2C regmap driver for Mellanox BMC cards with the
programmable devices attached to I2C interface. It allows support
for CPLD devices with one and two bytes address space.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 MAINTAINERS              |   1 +
 drivers/mfd/Kconfig      |  13 ++++
 drivers/mfd/Makefile     |   1 +
 drivers/mfd/mlxreg-i2c.c | 183 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 drivers/mfd/mlxreg-i2c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bcb7f45..86a5f8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8299,6 +8299,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
 F:	drivers/mfd/mlxreg-core.c
+F:	drivers/mfd/mlxreg-i2c.c
 F:	include/linux/platform_data/mlxreg.h
 
 MELLANOX ETHERNET DRIVER (mlx4_en)
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index fa1562f..453afcb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1709,6 +1709,19 @@ config MFD_MLXREG_CORE
 	  This driver can also be built as a module. If so the module
 	  will be called mlxreg-core.
 
+config MFD_MLXREG_I2C
+	bool "Mellanox programmable device with I2C interface"
+	depends on I2C && REGMAP_I2C
+	depends on MFD_MLXREG_CORE
+	help
+	  Support for the Mellanox BMC card with hardware control by a
+	  programmable device. This option enables core support for the
+	  programmable devices with I2C interface. It allows support for
+	  the devices with address space 1 and 2 bytes.
+
+	  This driver can also be built as a module. If so the module
+	  will be called mlxreg-i2c.
+
 menu "Multimedia Capabilities Port drivers"
 	depends on ARCH_SA1100
 
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9661ee2..b76c5b2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -222,3 +222,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
 obj-$(CONFIG_MFD_MLXREG_CORE)	+= mlxreg-core.o
+obj-$(CONFIG_MFD_MLXREG_I2C)	+= mlxreg-i2c.o
diff --git a/drivers/mfd/mlxreg-i2c.c b/drivers/mfd/mlxreg-i2c.c
new file mode 100644
index 0000000..04823b5
--- /dev/null
+++ b/drivers/mfd/mlxreg-i2c.c
@@ -0,0 +1,183 @@
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
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/**
+ * enum mlxreg_i2c_type - driver flavours:
+ *
+ * @MLXREG_8BIT: type for I2C CPLD control with 1 byte address space;
+ * @MLXREG_16BIT: type for I2C CPLD control with 2 bytes address space;
+ */
+enum mlxreg_i2c_type {
+	MLXREG_8BIT,
+	MLXREG_16BIT,
+};
+
+/**
+ * Configuration for the register map of a device with 1 byte address space.
+ */
+static const struct regmap_config mlxreg_i2c_regmap8_conf = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 255,
+};
+
+/**
+ * Configuration for the register map of a device with 2 bytes address space.
+ */
+static const struct regmap_config mlxreg_i2c_regmap16_conf = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = 1023,
+};
+
+static struct resource mlxreg_i2c_resources[] = {
+	[0] = DEFINE_RES_IRQ_NAMED(-1, "mlxcpld-ctrl-2c"),
+};
+
+static int
+mlxreg_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device_node *child, *np = client->dev.of_node;
+	struct platform_device *pdev;
+	struct i2c_adapter *adapter;
+	struct regmap *regmap;
+	int err = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	if (!of_device_is_compatible(np, "mellanox,mlxreg-i2c"))
+		return -ENODEV;
+
+	child = of_parse_phandle(np, "deferred", 0);
+	if (child) {
+		adapter = of_find_i2c_adapter_by_node(child);
+		of_node_put(child);
+		if (!adapter)
+			return -EPROBE_DEFER;
+	}
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA |
+				     I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	switch (id->driver_data) {
+	case MLXREG_8BIT:
+		regmap = devm_regmap_init_i2c(client,
+					      &mlxreg_i2c_regmap8_conf);
+		break;
+	case MLXREG_16BIT:
+		regmap = devm_regmap_init_i2c(client,
+					      &mlxreg_i2c_regmap16_conf);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pdev = platform_device_alloc("mlxreg-core", (client->adapter->nr << 8)
+				     | client->addr);
+	if (!pdev)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, pdev);
+	pdev->dev.parent = &client->dev;
+	pdev->dev.of_node = client->dev.of_node;
+	pdev->dev.platform_data = regmap;
+
+	if (client->irq) {
+		mlxreg_i2c_resources[0].start = client->irq;
+		err = platform_device_add_resources(pdev,
+				mlxreg_i2c_resources,
+				ARRAY_SIZE(mlxreg_i2c_resources));
+	}
+
+	err = err ? err : platform_device_add(pdev);
+
+	if (err)
+		platform_device_put(pdev);
+
+	return err;
+}
+
+static int mlxreg_i2c_remove(struct i2c_client *client)
+{
+	struct platform_device *pdev = i2c_get_clientdata(client);
+
+	platform_device_unregister(pdev);
+
+	return 0;
+}
+
+static const struct i2c_device_id mlxreg_i2c_id[] = {
+	{ "mlxreg-i2c", MLXREG_8BIT },
+	{ "mlxreg-i2c-16", MLXREG_16BIT },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, mlxreg_i2c_id);
+
+static const struct of_device_id mlxreg_i2c_dt_match[] = {
+	{ .compatible = "mellanox,mlxreg-i2c" },
+	{ .compatible = "mellanox,mlxreg-i2c-16" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mlxreg_i2c_dt_match);
+
+static struct i2c_driver mlxreg_i2c_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+	    .name = "mlxreg-i2c",
+	    .of_match_table = of_match_ptr(mlxreg_i2c_dt_match),
+	},
+	.probe = mlxreg_i2c_probe,
+	.remove = mlxreg_i2c_remove,
+	.id_table = mlxreg_i2c_id,
+};
+
+module_i2c_driver(mlxreg_i2c_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
+MODULE_DESCRIPTION("Mellanox CPLD control I2C driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("mlxreg-i2c");
-- 
2.1.4
