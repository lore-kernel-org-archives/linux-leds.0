From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] leds: Remove SEAD-3 driver
Date: Fri, 2 Jun 2017 15:00:07 -0700
Message-ID: <20170602220007.6927-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:37964 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbdFBWAa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Jun 2017 18:00:30 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Paul Burton <paul.burton@imgtec.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Ralf Baechle <ralf@linux-mips.org>, Richard Purdie <rpurdie@rpsys.net>, linux-mips@linux-mips.org

SEAD3 is using the generic syscon & regmap based register-bit-led
driver as of commit c764583f40b8 ("MIPS: SEAD3: Use register-bit-led
driver via DT for LEDs") merged in the v4.9 cycle. As such the custom
SEAD-3 LED driver is now unused, so remove it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: linux-leds@vger.kernel.org
Cc: linux-mips@linux-mips.org

---

 drivers/leds/Kconfig      | 10 ------
 drivers/leds/Makefile     |  1 -
 drivers/leds/leds-sead3.c | 78 -----------------------------------------------
 3 files changed, 89 deletions(-)
 delete mode 100644 drivers/leds/leds-sead3.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6c2999872090..1e47b9182c33 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -590,16 +590,6 @@ config LEDS_KTD2692
 
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
 config LEDS_IS31FL319X
 	tristate "LED Support for ISSI IS31FL319x I2C LED controller family"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 45f133962ed8..8c056dd047e2 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,7 +66,6 @@ obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
-obj-$(CONFIG_LEDS_SEAD3)		+= leds-sead3.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
 obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
diff --git a/drivers/leds/leds-sead3.c b/drivers/leds/leds-sead3.c
deleted file mode 100644
index eb97a3271bb3..000000000000
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
2.13.0
