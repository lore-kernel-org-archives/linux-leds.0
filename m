From: Dan O'Donovan <dan@emutex.com>
Subject: [PATCH v3 2/3] leds: upboard: Add LED support
Date: Wed, 31 Oct 2018 20:44:48 +0000
Message-ID: <1541018689-20625-3-git-send-email-dan@emutex.com>
References: <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1541018689-20625-1-git-send-email-dan@emutex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541018689-20625-1-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Dan O'Donovan <dan@emutex.com>
List-Id: linux-leds@vger.kernel.org

Allow userspace to use the on-board LEDs as "upboard:<color>:".

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/leds/Kconfig        |  10 +++++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-upboard.c | 103 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/leds/leds-upboard.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a72f97f..4ae1ec3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -766,6 +766,16 @@ config LEDS_NIC78BX
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-nic78bx.
 
+config LEDS_UPBOARD
+	tristate "LED support for the UP Squared"
+	depends on LEDS_CLASS
+	depends on MFD_UPBOARD
+	help
+	  This option enables support for the LEDs on the UP Squared board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called leds-upboard.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4c1b005..a35629d 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
+obj-$(CONFIG_LEDS_UPBOARD)		+= leds-upboard.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
new file mode 100644
index 0000000..90ebd9b
--- /dev/null
+++ b/drivers/leds/leds-upboard.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// UP Board LED driver
+//
+// Copyright (c) 2018, Emutex Ltd.
+//
+// Author: Javier Arteaga <javier@emutex.com>
+//
+
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/mfd/upboard.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define to_upboard_led(cdev) container_of(cdev, struct upboard_led, cdev)
+
+static const char * const upboard_led_names[] = {
+	"upboard:blue:",
+	"upboard:yellow:",
+	"upboard:green:",
+	"upboard:red:",
+};
+
+struct upboard_led {
+	struct regmap_field *field;
+	struct led_classdev cdev;
+};
+
+static enum led_brightness upboard_led_brightness_get(struct led_classdev *cdev)
+{
+	struct upboard_led *led = to_upboard_led(cdev);
+	int ret, brightness = 0;
+
+	ret = regmap_field_read(led->field, &brightness);
+	if (ret < 0)
+		dev_err(cdev->dev, "Failed to get led brightness, %d", ret);
+
+	return brightness;
+}
+
+static void upboard_led_brightness_set(struct led_classdev *cdev,
+				       enum led_brightness brightness)
+{
+	struct upboard_led *led = to_upboard_led(cdev);
+	int ret;
+
+	ret = regmap_field_write(led->field, brightness);
+	if (ret < 0)
+		dev_err(cdev->dev, "Failed to set led brightness, %d", ret);
+}
+
+static int upboard_led_probe(struct platform_device *pdev)
+{
+	unsigned int led_index = pdev->id;
+	struct device *dev = &pdev->dev;
+	struct upboard_led *led;
+	struct regmap *regmap;
+	struct reg_field conf = {
+		.reg = UPBOARD_REG_FUNC_EN0,
+		.lsb = led_index,
+		.msb = led_index,
+	};
+
+	if (led_index >= ARRAY_SIZE(upboard_led_names))
+		return -EINVAL;
+
+	if (!dev->parent)
+		return -EINVAL;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -EINVAL;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->field = devm_regmap_field_alloc(dev, regmap, conf);
+	if (IS_ERR(led->field))
+		return PTR_ERR(led->field);
+
+	led->cdev.max_brightness = 1;
+	led->cdev.brightness_get = upboard_led_brightness_get;
+	led->cdev.brightness_set = upboard_led_brightness_set;
+	led->cdev.name = upboard_led_names[led_index];
+
+	return devm_led_classdev_register(dev, &led->cdev);
+}
+
+static struct platform_driver upboard_led_driver = {
+	.driver = {
+		.name = "upboard-led",
+	},
+};
+
+module_platform_driver_probe(upboard_led_driver, upboard_led_probe);
+
+MODULE_ALIAS("platform:upboard-led");
+MODULE_AUTHOR("Javier Arteaga <javier@emutex.com>");
+MODULE_DESCRIPTION("UP Board LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4


------
This email has been scanned for spam and malware by The Email Laundry.
