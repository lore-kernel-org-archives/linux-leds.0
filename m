From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 13:26:35 -0300
Message-ID: <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:35110 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757123AbcDLQaE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 12:30:04 -0400
Received: by mail-qg0-f46.google.com with SMTP id f105so20376947qge.2
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 09:30:03 -0700 (PDT)
In-Reply-To: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This commit introduces a MTD trigger for flash (NAND/NOR) device
activity. The implementation is copied from IDE disk.

This deprecates the "nand-disk" LED trigger, but for backwards
compatibility, we still keep the "nand-disk" trigger around.

The motivation for deprecating the "nand-disk" LED trigger is that
it only works for NAND drivers, whereas the "mtd" LED trigger
is more generic (in fact, "nand-disk" currently only works for
certain NAND drivers).

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              |  7 ++++++
 drivers/mtd/nand/nand_base.c       | 29 +---------------------
 include/linux/leds.h               |  6 +++++
 6 files changed, 72 insertions(+), 28 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 554f5bfbeced..beac8c31c51b 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -41,6 +41,14 @@ config LEDS_TRIGGER_IDE_DISK
 	  This allows LEDs to be controlled by IDE disk activity.
 	  If unsure, say Y.
 
+config LEDS_TRIGGER_MTD
+	bool "LED MTD (NAND/NOR) Trigger"
+	depends on MTD
+	depends on LEDS_TRIGGERS
+	help
+	  This allows LEDs to be controlled by MTD activity.
+	  If unsure, say N.
+
 config LEDS_TRIGGER_HEARTBEAT
 	tristate "LED Heartbeat Trigger"
 	depends on LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
index 547bf5c80e52..8cc64a4f4e25 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_LEDS_TRIGGER_TIMER)	+= ledtrig-timer.o
 obj-$(CONFIG_LEDS_TRIGGER_ONESHOT)	+= ledtrig-oneshot.o
 obj-$(CONFIG_LEDS_TRIGGER_IDE_DISK)	+= ledtrig-ide-disk.o
+obj-$(CONFIG_LEDS_TRIGGER_MTD)		+= ledtrig-mtd.o
 obj-$(CONFIG_LEDS_TRIGGER_HEARTBEAT)	+= ledtrig-heartbeat.o
 obj-$(CONFIG_LEDS_TRIGGER_BACKLIGHT)	+= ledtrig-backlight.o
 obj-$(CONFIG_LEDS_TRIGGER_GPIO)		+= ledtrig-gpio.o
diff --git a/drivers/leds/trigger/ledtrig-mtd.c b/drivers/leds/trigger/ledtrig-mtd.c
new file mode 100644
index 000000000000..32af377976ec
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-mtd.c
@@ -0,0 +1,49 @@
+/*
+ * LED MTD trigger
+ *
+ * Copyright 2016 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+ *
+ * Based on LED IDE-Disk Activity Trigger
+ *
+ * Copyright 2006 Openedhand Ltd.
+ *
+ * Author: Richard Purdie <rpurdie@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+
+#define BLINK_DELAY 30
+
+DEFINE_LED_TRIGGER(ledtrig_mtd);
+DEFINE_LED_TRIGGER(ledtrig_nand);
+
+void ledtrig_mtd_activity(void)
+{
+	unsigned long blink_delay = BLINK_DELAY;
+
+	led_trigger_blink_oneshot(ledtrig_nand,
+				  &blink_delay, &blink_delay, 0);
+	led_trigger_blink_oneshot(ledtrig_mtd,
+				  &blink_delay, &blink_delay, 0);
+}
+EXPORT_SYMBOL(ledtrig_mtd_activity);
+
+static int __init ledtrig_mtd_init(void)
+{
+	/* For backwards compatibility, we need to keep the nand-disk
+	 * trigger around. Users are encouraged to switch to the
+	 * "mtd" trigger.
+	 */
+	led_trigger_register_simple("nand-disk", &ledtrig_nand);
+	led_trigger_register_simple("mtd", &ledtrig_mtd);
+
+	return 0;
+}
+device_initcall(ledtrig_mtd_init);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 99d83f3331b0..bee180bd11e7 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/kconfig.h>
+#include <linux/leds.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -862,6 +863,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		mtd_erase_callback(instr);
 		return 0;
 	}
+	ledtrig_mtd_activity();
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -925,6 +927,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	if (!len)
 		return 0;
 
+	ledtrig_mtd_activity();
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
@@ -949,6 +952,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	ledtrig_mtd_activity();
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
@@ -982,6 +986,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	ops->retlen = ops->oobretlen = 0;
 	if (!mtd->_read_oob)
 		return -EOPNOTSUPP;
+
+	ledtrig_mtd_activity();
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
 	 * similar to mtd->_read(), returning a non-negative integer
@@ -1005,6 +1011,7 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 		return -EOPNOTSUPP;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	ledtrig_mtd_activity();
 	return mtd->_write_oob(mtd, to, ops);
 }
 EXPORT_SYMBOL_GPL(mtd_write_oob);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6a0e80c1ba02..f036f958200a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -43,7 +43,6 @@
 #include <linux/mtd/nand_bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
-#include <linux/leds.h>
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of_mtd.h>
@@ -97,12 +96,6 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
-/*
- * For devices which display every fart in the system on a separate LED. Is
- * compiled away when LED support is disabled.
- */
-DEFINE_LED_TRIGGER(nand_led_trigger);
-
 static int check_offs_len(struct mtd_info *mtd,
 					loff_t ofs, uint64_t len)
 {
@@ -540,19 +533,16 @@ void nand_wait_ready(struct mtd_info *mtd)
 	if (in_interrupt() || oops_in_progress)
 		return panic_nand_wait_ready(mtd, timeo);
 
-	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* Wait until command is processed or timeout occurs */
 	timeo = jiffies + msecs_to_jiffies(timeo);
 	do {
 		if (chip->dev_ready(mtd))
-			goto out;
+			return;
 		cond_resched();
 	} while (time_before(jiffies, timeo));
 
 	if (!chip->dev_ready(mtd))
 		pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
-out:
-	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
 
@@ -885,8 +875,6 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	int status;
 	unsigned long timeo = 400;
 
-	led_trigger_event(nand_led_trigger, LED_FULL);
-
 	/*
 	 * Apply this short delay always to ensure that we do wait tWB in any
 	 * case on any machine.
@@ -910,7 +898,6 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 			cond_resched();
 		} while (time_before(jiffies, timeo));
 	}
-	led_trigger_event(nand_led_trigger, LED_OFF);
 
 	status = (int)chip->read_byte(mtd);
 	/* This can happen if in case of timeout or buggy dev_ready */
@@ -4499,20 +4486,6 @@ void nand_release(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
-static int __init nand_base_init(void)
-{
-	led_trigger_register_simple("nand-disk", &nand_led_trigger);
-	return 0;
-}
-
-static void __exit nand_base_exit(void)
-{
-	led_trigger_unregister_simple(nand_led_trigger);
-}
-
-module_init(nand_base_init);
-module_exit(nand_base_exit);
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
 MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
diff --git a/include/linux/leds.h b/include/linux/leds.h
index f203a8f89d30..19eb10278bea 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -329,6 +329,12 @@ extern void ledtrig_ide_activity(void);
 static inline void ledtrig_ide_activity(void) {}
 #endif
 
+#ifdef CONFIG_LEDS_TRIGGER_MTD
+extern void ledtrig_mtd_activity(void);
+#else
+static inline void ledtrig_mtd_activity(void) {}
+#endif
+
 #if defined(CONFIG_LEDS_TRIGGER_CAMERA) || defined(CONFIG_LEDS_TRIGGER_CAMERA_MODULE)
 extern void ledtrig_flash_ctrl(bool on);
 extern void ledtrig_torch_ctrl(bool on);
-- 
2.7.0
