From: Luigi Baldoni <aloisio@gmx.com>
Subject: [PATCH 1/3]: Add PCEngines APU1 LEDs driver
Date: Thu, 4 May 2017 12:59:45 +0200
Message-ID: <e4bd8a8f-382c-57b6-084a-2f766660c6a9@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:58496 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751799AbdEDK7t (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 May 2017 06:59:49 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

This patch adds the driver for the PCEngines APU1 LEDs.

Signed-off-by: Christian Herzog <daduke@daduke.org>

---
  drivers/leds/leds-apu.c  |  213 +++++++++++++++++++++++++++++++++++++++++
  1 files changed, 213 insertions(+)

Index: b/drivers/leds/leds-apu.c
===================================================================
--- /dev/null
+++ b/drivers/leds/leds-apu.c
@@ -0,0 +1,213 @@
+/*
+ * LEDs driver for PCEngines apu
+ *
+ * Copyright (C) 2017 Christian Herzog <daduke@daduke.org>, based on
+ * Petr Leibman's leds-alix
+ * Based on leds-wrap.c
+ * Hardware info taken from 
http://www.dpie.com/manuals/miniboards/kontron/\
+    KTD-S0043-0_KTA55_SoftwareGuide.pdf
+ * many thanks to Luigi Baldoni for his help
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/leds.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/dmi.h>
+
+#define DRVNAME			"apu-led"
+#define FCH_ACPI_MMIO_BASE	0xFED80000
+#define FCH_GPIO_BASE		(FCH_ACPI_MMIO_BASE + 0x1BD)
+#define LEDON			0x8
+#define LEDOFF			0xC8
+#define APU_NUM_GPIO		3
+
+
+MODULE_AUTHOR("Christian Herzog <daduke@daduke.org>");
+MODULE_DESCRIPTION("PCEngines apu LED driver");
+MODULE_LICENSE("GPL");
+
+static int __init apu_led_dmi_callback(const struct dmi_system_id *id)
+{
+	pr_info("'%s' found\n", id->ident);
+	return 1;
+}
+
+static struct dmi_system_id apu_led_dmi_table[] __initdata = {
+	{
+		.callback = apu_led_dmi_callback,
+		.ident = "apu",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCEngines"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "APU")
+		}
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, apu_led_dmi_table);
+
+static u8 gpio_offset[APU_NUM_GPIO] = {0, 1, 2};
+
+static void __iomem *gpio_addr[APU_NUM_GPIO];
+
+static struct platform_device *pdev;
+
+static void apu_led_set_1(struct led_classdev *led_cdev,
+		enum led_brightness value) {
+	if (value)
+		iowrite8(LEDON, gpio_addr[0]);
+	else
+		iowrite8(LEDOFF, gpio_addr[0]);
+}
+
+static void apu_led_set_2(struct led_classdev *led_cdev,
+		enum led_brightness value) {
+	if (value)
+		iowrite8(LEDON, gpio_addr[1]);
+	else
+		iowrite8(LEDOFF, gpio_addr[1]);
+}
+
+static void apu_led_set_3(struct led_classdev *led_cdev,
+		enum led_brightness value) {
+	if (value)
+		iowrite8(LEDON, gpio_addr[2]);
+	else
+		iowrite8(LEDOFF, gpio_addr[2]);
+}
+
+static struct led_classdev apu_led_1 = {
+	.name		= "apu:1",
+	.brightness_set	= apu_led_set_1,
+};
+
+static struct led_classdev apu_led_2 = {
+	.name		= "apu:2",
+	.brightness_set	= apu_led_set_2,
+};
+
+static struct led_classdev apu_led_3 = {
+	.name		= "apu:3",
+	.brightness_set	= apu_led_set_3,
+};
+
+#ifdef CONFIG_PM
+static int apu_led_suspend(struct platform_device *dev,
+		pm_message_t state)
+{
+	led_classdev_suspend(&apu_led_1);
+	led_classdev_suspend(&apu_led_2);
+	led_classdev_suspend(&apu_led_3);
+	return 0;
+}
+
+static int apu_led_resume(struct platform_device *dev)
+{
+	led_classdev_resume(&apu_led_1);
+	led_classdev_resume(&apu_led_2);
+	led_classdev_resume(&apu_led_3);
+	return 0;
+}
+#else
+#define apu_led_suspend NULL
+#define apu_led_resume NULL
+#endif
+
+static int apu_led_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = led_classdev_register(&pdev->dev, &apu_led_1);
+	if (ret)
+		goto error1;
+
+	ret = led_classdev_register(&pdev->dev, &apu_led_2);
+	if (ret)
+		goto error2;
+
+	ret = led_classdev_register(&pdev->dev, &apu_led_3);
+	if (ret)
+		goto error3;
+
+	return 0;
+
+error3:
+	led_classdev_unregister(&apu_led_2);
+error2:
+	led_classdev_unregister(&apu_led_1);
+error1:
+	return ret;
+
+}
+
+static int apu_led_remove(struct platform_device *pdev)
+{
+	led_classdev_unregister(&apu_led_3);
+	led_classdev_unregister(&apu_led_2);
+	led_classdev_unregister(&apu_led_1);
+	return 0;
+}
+
+static struct platform_driver apu_led_driver = {
+	.probe		= apu_led_probe,
+	.remove		= apu_led_remove,
+	.suspend	= apu_led_suspend,
+	.resume		= apu_led_resume,
+	.driver		= {
+		.name		= DRVNAME,
+		.owner		= THIS_MODULE,
+	},
+};
+
+static int __init apu_led_init(void)
+{
+	void __iomem *addr;
+	int ret;
+	int i;
+
+	ret = platform_driver_register(&apu_led_driver);
+	if (ret < 0)
+		goto error_driver;
+
+	pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		goto error_register;
+	}
+
+	ret = -ENOMEM;
+	for (i = 0; i < APU_NUM_GPIO; i++) {
+		addr = devm_ioremap(&pdev->dev,
+				FCH_GPIO_BASE +
+				(gpio_offset[i] * sizeof(char)),
+				sizeof(char));
+		if (!addr)
+			goto error_ioremap;
+		gpio_addr[i] = addr;
+	}
+	return 0;
+
+error_ioremap:
+	platform_device_unregister(pdev);
+error_register:
+	platform_driver_unregister(&apu_led_driver);
+error_driver:
+	return ret;
+}
+
+static void __exit apu_led_exit(void)
+{
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&apu_led_driver);
+}
+
+module_init(apu_led_init);
+module_exit(apu_led_exit);
