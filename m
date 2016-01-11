From: Simon Que <sque@chromium.org>
Subject: [PATCH v2] leds: Add Chrome OS keyboard LEDs driver
Date: Mon, 11 Jan 2016 11:12:10 -0800
Message-ID: <1452539530-10829-1-git-send-email-sque@chromium.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:33234 "EHLO
	mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934358AbcAKTND (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Jan 2016 14:13:03 -0500
Received: by mail-pf0-f181.google.com with SMTP id e65so49168703pfe.0
        for <linux-leds@vger.kernel.org>; Mon, 11 Jan 2016 11:13:02 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
Cc: Sameer Nanda <snanda@chromium.org>, Todd Broch <tbroch@chromium.org>, Duncal Laurie <dlaurie@chromium.org>, Evan McClain <aeroevan@gmail.com>, Simon Que <sque@chromium.org>

Some Chrome OS devices use ACPI-based keyboard backlight LEDs.

Enable with menuconfig option under Device Drivers -> LED Support.

Change-Id: Id5a762b97e131c3b66c90fd0da93658c98bd8bc8
Signed-off-by: Simon Que <sque@chromium.org>
---
 drivers/leds/Kconfig                  |   7 +++
 drivers/leds/Makefile                 |   1 +
 drivers/leds/leds-chromeos-keyboard.c | 115 ++++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 drivers/leds/leds-chromeos-keyboard.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 72156c1..c530085 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -487,6 +487,13 @@ config LEDS_BLINKM
 	  This option enables support for the BlinkM RGB LED connected
 	  through I2C. Say Y to enable support for the BlinkM LED.
 
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
index 3cd76db..bf88b27 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_LM355x)		+= leds-lm355x.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
+obj-$(CONFIG_LEDS_CHROMEOS_KEYBOARD)	+= leds-chromeos-keyboard.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
new file mode 100644
index 0000000..32d70c0
--- /dev/null
+++ b/drivers/leds/leds-chromeos-keyboard.c
@@ -0,0 +1,115 @@
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
+#include <linux/leds.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
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
+	cdev = kzalloc(sizeof(struct led_classdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+	cdev->name = "chromeos::kbd_backlight";
+	cdev->brightness_set = keyboard_led_set_brightness;
+	cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
+	cdev->brightness = cdev->max_brightness;
+	cdev->flags |= LED_CORE_SUSPENDRESUME;
+
+	ret = led_classdev_register(&pdev->dev, cdev);
+	if (ret)
+		goto err;
+
+	platform_set_drvdata(pdev, cdev);
+	return 0;
+err:
+	kfree(cdev);
+	return ret;
+}
+
+static int keyboard_led_remove(struct platform_device *pdev)
+{
+	struct led_classdev *cdev = platform_get_drvdata(pdev);
+
+	platform_set_drvdata(pdev, NULL);
+	kfree(cdev);
+	return 0;
+}
+
+static struct platform_driver keyboard_led_driver = {
+	.driver		= {
+		.name	= "chromeos-keyboard-leds",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= keyboard_led_probe,
+	.remove		= keyboard_led_remove,
+};
+
+module_platform_driver(keyboard_led_driver);
+
+MODULE_AUTHOR("Simon Que <sque@chromium.org>");
+MODULE_DESCRIPTION("ChromeOS Keyboard LED Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:chromeos-keyboard-leds");
-- 
2.6.0.rc2.230.g3dd15c0
