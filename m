From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 03/10] i2c/muxes: Juniper I2CS RE mux
Date: Fri,  7 Oct 2016 18:21:02 +0300
Message-ID: <1475853669-22480-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Avirup Banerjee <abanerjee-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, JawaharBalaji Thirumalaisamy <jawaharb-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

From: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Add support for Juniper I2C Slave RE multiplexer driver.

This I2C multiplexer driver allows the RE to access some of
the FPC I2C buses. It's compatible only with the FPC variant of the
I2CS.

Signed-off-by: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/i2c/muxes/Kconfig        |  10 +++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-i2cs.c | 155 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/i2c/muxes/i2c-mux-i2cs.c

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index f45a9cb..c95380d 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -30,6 +30,16 @@ config I2C_MUX_GPIO
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-gpio.
 
+config I2C_MUX_I2CS
+	tristate "Juniper I2C Slave MFD client RE multiplexer"
+	depends on MFD_JUNIPER_I2CS
+	help
+	  Select this to enable the Juniper I2C Slave RE multiplexer driver
+	  on the relevant Juniper platforms.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-i2cs.
+
 config I2C_MUX_PCA9541
 	tristate "NXP PCA9541 I2C Master Selector"
 	help
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 78d8cba..45b4287 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_I2C_ARB_GPIO_CHALLENGE)	+= i2c-arb-gpio-challenge.o
 obj-$(CONFIG_I2C_DEMUX_PINCTRL)		+= i2c-demux-pinctrl.o
 
 obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
+obj-$(CONFIG_I2C_MUX_I2CS)	+= i2c-mux-i2cs.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-i2cs.c b/drivers/i2c/muxes/i2c-mux-i2cs.c
new file mode 100644
index 0000000..c498a44
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-i2cs.c
@@ -0,0 +1,155 @@
+/*
+ * Juniper Networks I2CS RE mux driver
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/jnx-i2cs-core.h>
+
+#define MISC_IO_RE_EN	0x01
+
+/*
+ * Read/write to mux register.
+ *   Don't use i2c_transfer()/i2c_smbus_xfer()
+ *   for this as they will try to lock adapter a second time
+ */
+static int i2cs_mux_read_byte(struct i2c_client *client,
+				  u8 offset, u8 *val)
+{
+	struct i2c_msg msg[2];
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = 1;
+	msg[0].buf = &offset;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = 1;
+	msg[1].buf = val;
+
+	return client->adapter->algo->master_xfer(client->adapter, msg, 2);
+}
+
+static int i2cs_mux_write_byte(struct i2c_client *client, u8 offset, u8 val)
+{
+	struct i2c_msg msg;
+	char buf[2];
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = 2;
+	buf[0] = offset;
+	buf[1] = val;
+	msg.buf = buf;
+
+	return client->adapter->algo->master_xfer(client->adapter, &msg, 1);
+}
+
+static int i2cs_mux_select(struct i2c_mux_core *muxc, u32 chan)
+{
+	int ret;
+	u8 val = 0;
+	struct i2c_client *client = i2c_mux_priv(muxc);
+
+	ret = i2cs_mux_read_byte(client, I2CS_MISC_IO, &val);
+	if (ret < 0)
+		return ret;
+
+	val |= MISC_IO_RE_EN;
+	ret = i2cs_mux_write_byte(client, I2CS_MISC_IO, val);
+
+	return ret;
+}
+
+static int i2cs_mux_deselect(struct i2c_mux_core *muxc, u32 chan)
+{
+	int ret;
+	u8 val = 0;
+	struct i2c_client *client = i2c_mux_priv(muxc);
+
+	ret = i2cs_mux_read_byte(client, I2CS_MISC_IO, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= ~MISC_IO_RE_EN;
+	ret = i2cs_mux_write_byte(client, I2CS_MISC_IO, val);
+
+	return 0;
+}
+
+static int i2cs_mux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	int ret;
+
+	if (!dev->parent)
+		return -ENODEV;
+
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return -ENODEV;
+
+	muxc = i2c_mux_alloc(client->adapter, &client->dev, 1, 0, 0,
+				i2cs_mux_select, i2cs_mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+	muxc->priv = client;
+
+	ret = i2c_mux_add_adapter(muxc, 0, 0, 0);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, muxc);
+
+	return 0;
+}
+
+static int i2cs_mux_remove(struct platform_device *pdev)
+{
+	i2c_mux_del_adapters(platform_get_drvdata(pdev));
+
+	return 0;
+}
+
+static const struct of_device_id i2cs_mux_of_match[] = {
+	{ .compatible = "jnx,i2c-mux-i2cs", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, i2cs_mux_of_match);
+
+static struct platform_driver i2cs_mux_driver = {
+	.driver = {
+		.name = "i2c-mux-i2cs",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_match_ptr(i2cs_mux_of_match),
+	},
+	.probe = i2cs_mux_probe,
+	.remove = i2cs_mux_remove,
+};
+module_platform_driver(i2cs_mux_driver);
+
+MODULE_DESCRIPTION("Juniper Networks I2CS RE Mux driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:i2c-mux-i2cs");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
