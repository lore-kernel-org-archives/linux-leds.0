From: Evan McClain <aeroevan@gmail.com>
Subject: [PATCH v4] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 23 Feb 2016 08:01:02 -0500
Message-ID: <1456232462-2925-1-git-send-email-aeroevan@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:33927 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbcBWNBX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 08:01:23 -0500
Received: by mail-qg0-f49.google.com with SMTP id b67so135203227qgb.1
        for <linux-leds@vger.kernel.org>; Tue, 23 Feb 2016 05:01:23 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Simon Que <sque@chromium.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Duncan Laurie <dlaurie@chromium.org>, Evan McClain <aeroevan@gmail.com>

From: Simon Que <sque@chromium.org>

Some Chrome OS devices use ACPI-based keyboard backlight LEDs.

Enable with menuconfig option under Device Drivers -> LED Support.

Signed-off-by: Simon Que <sque@chromium.org>
Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
Signed-off-by: Evan McClain <aeroevan@gmail.com>
---
 drivers/leds/Kconfig                  |   7 +++
 drivers/leds/Makefile                 |   1 +
 drivers/leds/leds-chromeos-keyboard.c | 110 ++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/leds/leds-chromeos-keyboard.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1034696..89c81b6 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -619,6 +619,13 @@ config LEDS_VERSATILE
 	  This option enabled support for the LEDs on the ARM Versatile
 	  and RealView boards. Say Y to enabled these.
 
+config LEDS_CHROMEOS_KEYBOARD
+	tristate "LED support for Chrome OS keyboards"
+	depends on LEDS_CLASS && ACPI
+	help
+	  This option enables support for the LEDs on Chrome OS keyboards.
+	  Say Y to enable keyboard LEDs on Chrome OS systems.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 89c9b6f..5b96d15 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_SN3218)		+= leds-sn3218.o
+obj-$(CONFIG_LEDS_CHROMEOS_KEYBOARD)	+= leds-chromeos-keyboard.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
new file mode 100644
index 0000000..4611fae
--- /dev/null
+++ b/drivers/leds/leds-chromeos-keyboard.c
@@ -0,0 +1,110 @@
+/*
+ *  LED driver for Chrome OS keyboard backlight
+ *
+ *  Copyright (C) 2012 Google, Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/* Keyboard LED ACPI Device must be defined in firmware */
+#define ACPI_KEYBOARD_BACKLIGHT_DEVICE	"\\_SB.KBLT"
+#define ACPI_KEYBOARD_BACKLIGHT_READ	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
+#define ACPI_KEYBOARD_BACKLIGHT_WRITE	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBCM"
+
+#define ACPI_KEYBOARD_BACKLIGHT_MAX		100
+
+static void keyboard_led_set_brightness(struct led_classdev *cdev,
+					enum led_brightness brightness)
+{
+	union acpi_object param;
+	struct acpi_object_list input;
+	acpi_status status;
+
+	if (!(cdev->flags & LED_SUSPENDED))
+		cdev->brightness = brightness;
+
+	param.type = ACPI_TYPE_INTEGER;
+	param.integer.value = brightness;
+	input.count = 1;
+	input.pointer = &param;
+
+	status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
+					  &input, NULL);
+	if (ACPI_FAILURE(status))
+		dev_err(cdev->dev, "Error setting keyboard LED value");
+}
+
+static int keyboard_led_probe(struct platform_device *pdev)
+{
+	struct led_classdev *cdev;
+	acpi_handle handle;
+	acpi_status status;
+	int ret;
+
+	/* Look for the keyboard LED ACPI Device */
+	status = acpi_get_handle(ACPI_ROOT_OBJECT,
+				 ACPI_KEYBOARD_BACKLIGHT_DEVICE,
+				 &handle);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&pdev->dev, "Unable fo find ACPI device %s\n",
+			ACPI_KEYBOARD_BACKLIGHT_DEVICE);
+		return -ENODEV;
+	}
+
+	cdev = devm_kzalloc(&pdev->dev, sizeof(struct led_classdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+
+	cdev->name = "chromeos::kbd_backlight";
+	cdev->brightness_set = keyboard_led_set_brightness;
+	cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
+	cdev->flags |= LED_CORE_SUSPENDRESUME;
+
+	ret = devm_led_classdev_register(&pdev->dev, cdev);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, cdev);
+
+	return 0;
+}
+
+static const struct acpi_device_id keyboard_led_id[] = {
+	{ "GOOG0002", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
+
+static struct platform_driver keyboard_led_driver = {
+	.driver		= {
+		.name	= "chromeos-keyboard-leds",
+		.owner	= THIS_MODULE,
+		.acpi_match_table = ACPI_PTR(keyboard_led_id),
+	},
+	.probe		= keyboard_led_probe,
+};
+
+module_platform_driver(keyboard_led_driver);
+
+MODULE_AUTHOR("Simon Que <sque@chromium.org>");
+MODULE_DESCRIPTION("ChromeOS Keyboard LED Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:chromeos-keyboard-leds");
-- 
2.5.0
