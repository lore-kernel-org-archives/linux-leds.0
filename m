From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] leds: Delete obsolete Versatile driver
Date: Thu,  4 May 2017 14:03:08 +0200
Message-ID: <20170504120308.6738-1-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:32814 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752181AbdEDMDP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2017 08:03:15 -0400
Received: by mail-lf0-f54.google.com with SMTP id r17so6541498lfg.0
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2017 05:03:14 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

All users of the Versatile LED driver are deleted and replaced
with the very generic leds-syscon. Delete the old driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig          |   8 ---
 drivers/leds/Makefile         |   1 -
 drivers/leds/leds-versatile.c | 110 ------------------------------------------
 3 files changed, 119 deletions(-)
 delete mode 100644 drivers/leds/leds-versatile.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6c2999872090..fbe3468eb911 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -651,14 +651,6 @@ config LEDS_SYSCON
 	  devices. This will only work with device tree enabled
 	  devices.
 
-config LEDS_VERSATILE
-	tristate "LED support for the ARM Versatile and RealView"
-	depends on ARCH_REALVIEW || ARCH_VERSATILE
-	depends on LEDS_CLASS
-	help
-	  This option enabled support for the LEDs on the ARM Versatile
-	  and RealView boards. Say Y to enabled these.
-
 config LEDS_PM8058
 	tristate "LED Support for the Qualcomm PM8058 PMIC"
 	depends on MFD_PM8XXX
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 45f133962ed8..e4a8d007c5a9 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -62,7 +62,6 @@ obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_LM355x)		+= leds-lm355x.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
-obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
diff --git a/drivers/leds/leds-versatile.c b/drivers/leds/leds-versatile.c
deleted file mode 100644
index 80553022d661..000000000000
--- a/drivers/leds/leds-versatile.c
+++ /dev/null
@@ -1,110 +0,0 @@
-/*
- * Driver for the 8 user LEDs found on the RealViews and Versatiles
- * Based on DaVinci's DM365 board code
- *
- * License terms: GNU General Public License (GPL) version 2
- * Author: Linus Walleij <triad@df.lth.se>
- */
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/leds.h>
-#include <linux/platform_device.h>
-
-struct versatile_led {
-	void __iomem		*base;
-	struct led_classdev	cdev;
-	u8			mask;
-};
-
-/*
- * The triggers lines up below will only be used if the
- * LED triggers are compiled in.
- */
-static const struct {
-	const char *name;
-	const char *trigger;
-} versatile_leds[] = {
-	{ "versatile:0", "heartbeat", },
-	{ "versatile:1", "mmc0", },
-	{ "versatile:2", "cpu0" },
-	{ "versatile:3", "cpu1" },
-	{ "versatile:4", "cpu2" },
-	{ "versatile:5", "cpu3" },
-	{ "versatile:6", },
-	{ "versatile:7", },
-};
-
-static void versatile_led_set(struct led_classdev *cdev,
-			      enum led_brightness b)
-{
-	struct versatile_led *led = container_of(cdev,
-						 struct versatile_led, cdev);
-	u32 reg = readl(led->base);
-
-	if (b != LED_OFF)
-		reg |= led->mask;
-	else
-		reg &= ~led->mask;
-	writel(reg, led->base);
-}
-
-static enum led_brightness versatile_led_get(struct led_classdev *cdev)
-{
-	struct versatile_led *led = container_of(cdev,
-						 struct versatile_led, cdev);
-	u32 reg = readl(led->base);
-
-	return (reg & led->mask) ? LED_FULL : LED_OFF;
-}
-
-static int versatile_leds_probe(struct platform_device *dev)
-{
-	int i;
-	struct resource *res;
-	void __iomem *base;
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&dev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	/* All off */
-	writel(0, base);
-	for (i = 0; i < ARRAY_SIZE(versatile_leds); i++) {
-		struct versatile_led *led;
-
-		led = kzalloc(sizeof(*led), GFP_KERNEL);
-		if (!led)
-			break;
-
-		led->base = base;
-		led->cdev.name = versatile_leds[i].name;
-		led->cdev.brightness_set = versatile_led_set;
-		led->cdev.brightness_get = versatile_led_get;
-		led->cdev.default_trigger = versatile_leds[i].trigger;
-		led->mask = BIT(i);
-
-		if (led_classdev_register(NULL, &led->cdev) < 0) {
-			kfree(led);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static struct platform_driver versatile_leds_driver = {
-	.driver = {
-		.name   = "versatile-leds",
-	},
-	.probe = versatile_leds_probe,
-};
-
-module_platform_driver(versatile_leds_driver);
-
-MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
-MODULE_DESCRIPTION("ARM Versatile LED driver");
-MODULE_LICENSE("GPL v2");
-- 
2.9.3
