From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 27 Feb 2015 10:01:31 +0900
Message-ID: <1424998891-25591-4-git-send-email-ingi2.kim@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39488 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652AbbB0BBm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Feb 2015 20:01:42 -0500
In-reply-to: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kerner.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>

This patch adds a driver to support the ktd2692 flash LEDs.
ktd2692 can control flash current by ExpressWire interface.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/leds/Kconfig        |    8 ++
 drivers/leds/Makefile       |    1 +
 drivers/leds/leds-ktd2692.c |  245 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 drivers/leds/leds-ktd2692.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 25b320d..f8870db 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -526,6 +526,14 @@ config LEDS_VERSATILE
 	  This option enabled support for the LEDs on the ARM Versatile
 	  and RealView boards. Say Y to enabled these.
 
+config LEDS_KTD2692
+	tristate "LED support for the KTD2692 Driver"
+	depends on LEDS_CLASS
+	depends on GPIOLIB
+	help
+	  This option enables support for the KTD2692 connected through
+	  ExpressWire Interface. Say Y to enable these.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index cbba921..289513b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
+obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
new file mode 100644
index 0000000..9c98689
--- /dev/null
+++ b/drivers/leds/leds-ktd2692.c
@@ -0,0 +1,245 @@
+/*
+ * Kinetic Technologies KTD2692 Flash LED Driver
+ *
+ * Copyright (C) 2015 Samsung Electronics
+ * Ingi Kim <ingi2.kim@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+
+#define GET_BIT(bit, val)			(((val) >> (bit)) & 0x01)
+
+/* Adjust a multiple of brightness */
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_16(x)	(((x) >> 4) & 0x0F)
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_8(x)	(((x) >> 5) & 0x0F)
+#define KTD2692_BRIGHTNESS_RANGE_255_TO_4(x)	(((x) >> 6) & 0x0F)
+
+/* Base register address */
+#define KTD2692_REG_LVP_BASE			0x00
+#define KTD2692_REG_FLASH_TIMEOUT_BASE		0x20
+#define KTD2692_REG_MIN_CURRENT_SET_BASE	0x40
+#define KTD2692_REG_MOVIE_CURRENT_BASE		0x60
+#define KTD2692_REG_FLASH_CURRENT_BASE		0x80
+#define KTD2692_REG_MODE_BASE			0xA0
+
+/* Set bit coding time for expresswire interface */
+#define KTD2692_TIME_RESET_US			700
+#define KTD2692_TIME_DATA_START_TIME_US		10
+#define KTD2692_TIME_HIGH_END_OF_DATA_US	350
+#define KTD2692_TIME_LOW_END_OF_DATA_US		10
+#define KTD2692_TIME_SHORT_BITSET_US		4
+#define KTD2692_TIME_LONG_BITSET_US		12
+
+/* KTD2692 default length of name */
+#define KTD2692_NAME_LENGTH			20
+
+/* KTD2692 default name */
+#define KTD2692_DEFAULT_NAME			"ktd2692"
+
+enum ktd2692_mode {
+	KTD2692_MODE_DISABLE = 0,
+	KTD2692_MODE_MOVIE,
+	KTD2692_MODE_FLASH,
+};
+
+enum ktd2692_bitset {
+	KTD2692_LOW = 0,
+	KTD2692_HIGH,
+};
+
+struct ktd2692_context {
+	struct led_classdev cdev;
+	u8 mode;
+	int strobe_gpio;
+};
+
+static int ktd2692_brightness_set_gpio(struct ktd2692_context *led)
+{
+	int ret;
+
+	ret = devm_gpio_request_one(led->cdev.dev,
+			led->strobe_gpio, GPIOF_INIT_LOW, "strobe-gpio");
+
+	if (ret)
+		dev_err(led->cdev.dev,
+			"failed to request strobe-gpio %d error %d\n",
+			led->strobe_gpio, ret);
+
+	return ret;
+}
+
+static void ktd2692_expresswire_start(struct ktd2692_context *led)
+{
+	gpio_set_value(led->strobe_gpio, KTD2692_HIGH);
+	udelay(KTD2692_TIME_DATA_START_TIME_US);
+}
+
+static void ktd2692_expresswire_reset(struct ktd2692_context *led)
+{
+	gpio_set_value(led->strobe_gpio, KTD2692_LOW);
+	udelay(KTD2692_TIME_RESET_US);
+}
+
+static void ktd2692_expresswire_end(struct ktd2692_context *led)
+{
+	gpio_set_value(led->strobe_gpio, KTD2692_LOW);
+	udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
+	gpio_set_value(led->strobe_gpio, KTD2692_HIGH);
+	udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
+}
+
+static void ktd2692_expresswire_set_bit(struct ktd2692_context *led, bool bit)
+{
+	if (bit) {
+		gpio_set_value(led->strobe_gpio, KTD2692_LOW);
+		udelay(KTD2692_TIME_SHORT_BITSET_US);
+		gpio_set_value(led->strobe_gpio, KTD2692_HIGH);
+		udelay(KTD2692_TIME_LONG_BITSET_US);
+	} else {
+		gpio_set_value(led->strobe_gpio, KTD2692_LOW);
+		udelay(KTD2692_TIME_LONG_BITSET_US);
+		gpio_set_value(led->strobe_gpio, KTD2692_HIGH);
+		udelay(KTD2692_TIME_SHORT_BITSET_US);
+	}
+}
+
+static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
+{
+	int i;
+
+	ktd2692_expresswire_start(led);
+	for (i = 7; i >= 0; i--)
+		ktd2692_expresswire_set_bit(led, GET_BIT(i, value));
+	ktd2692_expresswire_end(led);
+}
+
+static void ktd2692_brightness_set(struct led_classdev *led_cdev,
+		enum led_brightness value)
+{
+	u8 mask;
+	int brightness = (int)value;
+	struct ktd2692_context *led =
+		container_of(led_cdev, struct ktd2692_context, cdev);
+
+	if (brightness == LED_OFF) {
+		gpio_set_value(led->strobe_gpio, 0);
+		led->cdev.brightness = brightness;
+		return;
+	}
+
+	if (brightness < 0 || brightness > led->cdev.max_brightness) {
+		dev_err(led_cdev->dev, "Invalid brightness %d\n", brightness);
+	} else {
+		mask = KTD2692_BRIGHTNESS_RANGE_255_TO_8(value);
+		mask |= KTD2692_REG_MOVIE_CURRENT_BASE;
+		ktd2692_expresswire_write(led, mask);
+
+		led->mode = KTD2692_REG_MODE_BASE | KTD2692_MODE_MOVIE;
+		ktd2692_expresswire_write(led, led->mode);
+		led->cdev.brightness = brightness;
+	}
+}
+
+static enum led_brightness ktd2692_brightness_get(struct led_classdev *led_cdev)
+{
+	struct ktd2692_context *led =
+		container_of(led_cdev, struct ktd2692_context, cdev);
+
+	return led->cdev.brightness;
+}
+
+static struct ktd2692_context *ktd2692_parse_dt(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct ktd2692_context *led;
+
+	led = devm_kzalloc(dev, sizeof(struct ktd2692_context), GFP_KERNEL);
+	if (!led)
+		return ERR_PTR((long)led);
+
+	led->strobe_gpio = of_get_named_gpio(np, "strobe-gpio", 0);
+	if (!gpio_is_valid(led->strobe_gpio)) {
+		dev_err(dev, "no strobe_gpio property found\n");
+		return ERR_PTR(led->strobe_gpio);
+	}
+
+	return led;
+}
+
+static int ktd2692_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ktd2692_context *led;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	led = ktd2692_parse_dt(dev);
+	if (IS_ERR(led))
+		return PTR_ERR(led);
+
+	led->cdev.name = KTD2692_DEFAULT_NAME;
+	led->cdev.brightness = LED_OFF;
+	led->cdev.max_brightness = LED_FULL;
+	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
+	led->cdev.brightness_set = ktd2692_brightness_set;
+	led->cdev.brightness_get = ktd2692_brightness_get;
+	led->mode = KTD2692_REG_MODE_BASE | KTD2692_MODE_DISABLE;
+
+	platform_set_drvdata(pdev, led);
+
+	ret = led_classdev_register(&pdev->dev, &led->cdev);
+	if (ret) {
+		dev_err(dev, "couldn't register LED %s\n", led->cdev.name);
+		return ret;
+	}
+
+	ret = ktd2692_brightness_set_gpio(led);
+	if (ret) {
+		led_classdev_unregister(&led->cdev);
+		return ret;
+	}
+
+	ktd2692_expresswire_reset(led);
+
+	return ret;
+}
+
+static int ktd2692_remove(struct platform_device *pdev)
+{
+	struct ktd2692_context *led = platform_get_drvdata(pdev);
+
+	led_classdev_unregister(&led->cdev);
+
+	return 0;
+}
+
+static const struct of_device_id ktd2692_match[] = {
+	{ .compatible = "kinetic,ktd2692", },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver ktd2692_driver = {
+	.driver = {
+		.name  = "leds-ktd2692",
+		.of_match_table = ktd2692_match,
+	},
+	.probe  = ktd2692_probe,
+	.remove = ktd2692_remove,
+};
+
+module_platform_driver(ktd2692_driver);
+
+MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
+MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
