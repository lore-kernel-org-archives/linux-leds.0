From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/20] leds: Remove SEAD3 driver
Date: Tue, 9 Aug 2016 13:35:36 +0100
Message-ID: <20160809123546.10190-12-paul.burton@imgtec.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160809123546.10190-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

SEAD3 is now using the generic syscon & regmap based register-bit-led
driver, so remove the unused custom SEAD3 LED driver.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 drivers/leds/Kconfig      | 10 ------
 drivers/leds/Makefile     |  1 -
 drivers/leds/leds-sead3.c | 78 -----------------------------------------------
 3 files changed, 89 deletions(-)
 delete mode 100644 drivers/leds/leds-sead3.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 9dcc9b1..025de7e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -574,16 +574,6 @@ config LEDS_KTD2692
 
 	  Say Y to enable this driver.
 
-config LEDS_SEAD3
-	tristate "LED support for the MIPS SEAD 3 board"
-	depends on LEDS_CLASS && MIPS_SEAD3
-	help
-	  Say Y here to include support for the FLED and PLED LEDs on SEAD3 eval
-	  boards.
-
-	  This driver can also be built as a module. If so the module
-	  will be called leds-sead3.
-
 config LEDS_IS31FL32XX
 	tristate "LED support for ISSI IS31FL32XX I2C LED controller family"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 0684c86..da594cf 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,7 +66,6 @@ obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
-obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 
 # LED SPI Drivers
diff --git a/drivers/leds/leds-sead3.c b/drivers/leds/leds-sead3.c
deleted file mode 100644
index eb97a32..0000000
--- a/drivers/leds/leds-sead3.c
+++ /dev/null
@@ -1,78 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
- * Copyright (C) 2015 Imagination Technologies, Inc.
- */
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/leds.h>
-#include <linux/err.h>
-#include <linux/io.h>
-
-#include <asm/mips-boards/sead3-addr.h>
-
-static void sead3_pled_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
-{
-	writel(value, (void __iomem *)SEAD3_CPLD_P_LED);
-}
-
-static void sead3_fled_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
-{
-	writel(value, (void __iomem *)SEAD3_CPLD_F_LED);
-}
-
-static struct led_classdev sead3_pled = {
-	.name		= "sead3::pled",
-	.brightness_set = sead3_pled_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
-};
-
-static struct led_classdev sead3_fled = {
-	.name		= "sead3::fled",
-	.brightness_set = sead3_fled_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
-};
-
-static int sead3_led_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	ret = led_classdev_register(&pdev->dev, &sead3_pled);
-	if (ret < 0)
-		return ret;
-
-	ret = led_classdev_register(&pdev->dev, &sead3_fled);
-	if (ret < 0)
-		led_classdev_unregister(&sead3_pled);
-
-	return ret;
-}
-
-static int sead3_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&sead3_pled);
-	led_classdev_unregister(&sead3_fled);
-
-	return 0;
-}
-
-static struct platform_driver sead3_led_driver = {
-	.probe		= sead3_led_probe,
-	.remove		= sead3_led_remove,
-	.driver		= {
-		.name		= "sead3-led",
-	},
-};
-
-module_platform_driver(sead3_led_driver);
-
-MODULE_AUTHOR("Kristian Kielhofner <kris@krisk.org>");
-MODULE_DESCRIPTION("SEAD3 LED driver");
-MODULE_LICENSE("GPL");
-- 
2.9.2
