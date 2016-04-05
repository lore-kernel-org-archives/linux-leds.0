From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: nand-disk LED trigger: to remove, or not to remove
Date: Tue, 5 Apr 2016 16:51:20 -0300
Message-ID: <20160405195120.GA6111@laptop.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:35221 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbcDETv0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 5 Apr 2016 15:51:26 -0400
Received: by mail-qg0-f47.google.com with SMTP id y89so19399663qge.2
        for <linux-leds@vger.kernel.org>; Tue, 05 Apr 2016 12:51:25 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Due to the way the 'nand-disk' LED trigger is implemented,
it currently does not work correctly for all NAND drivers.

This is somewhat related to an old thread, where we discussed
the addition of an "mtd" LED trigger. See:

  http://www.spinics.net/lists/linux-leds/msg01181.html

My question is:

 * given that nobody has complained about "nand-disk"
   working on just some NAND drivers, and...
 * given that nobody has complained (except that 2013 patch)
   about lacking a generic MTD LED trigger...

Does it make any sense to have such a trigger at all?
In other words, should we simply get rid of "nand-disk" trigger?

In case the answer is "We want to keep some LED trigger",
then here's a patch for you to f=CC=B6l=CC=B6a=CC=B6m=CC=B6e=CC=B6  rev=
iew:

=46rom 88c7102bb67056b443da323bd3e28b60aca948a2 Mon Sep 17 00:00:00 200=
1
=46rom: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 2 Apr 2016 18:35:50 -0300
Subject: [PATCH] leds: trigger: Introduce a MTD (NAND/NOR) trigger

This commit introduces a MTD trigger for flash (NAND/NOR) device
activity. The implementation is copied from IDE disk.

This deprecates the "nand-disk" LED trigger, but for backwards
compatibility, we still keep the "nand-disk" trigger around.

The motivation for deprecating the "nand-disk" LED trigger is that
it only works for NAND drivers, whereas the "mtd" LED trigger
is more generic (in fact, "nand-disk" currently only works for
certain NAND drivers).

  TODO: Measure how the trigger affects MTD I/O performance.
  It should be cheap because the blink is deferred, but still
  it makes sense to provide some hard numbers.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 48 ++++++++++++++++++++++++++++++=
++++++++
 drivers/mtd/mtdcore.c              |  4 ++++
 drivers/mtd/nand/nand_base.c       | 29 +----------------------
 include/linux/leds.h               |  6 +++++
 6 files changed, 68 insertions(+), 28 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfi=
g
index 554f5bfbeced..b7044a0530c7 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -115,4 +115,12 @@ config LEDS_TRIGGER_PANIC
 	  This allows LEDs to be configured to blink on a kernel panic.
 	  If unsure, say Y.
=20
+config LEDS_TRIGGER_MTD
+	bool "LED MTD (NAND/NOR) Trigger"
+	depends on MTD
+	depends on LEDS_TRIGGERS
+	help
+	  This allows LEDs to be controlled by MTD activity.
+	  If unsure, say N.
+
 endif # LEDS_TRIGGERS
diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makef=
ile
index 547bf5c80e52..80e32add3b07 100644
--- a/drivers/leds/trigger/Makefile
+++ b/drivers/leds/trigger/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+=3D ledtrig-defa=
ult-on.o
 obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+=3D ledtrig-transient.o
 obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+=3D ledtrig-camera.o
 obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+=3D ledtrig-panic.o
+obj-$(CONFIG_LEDS_TRIGGER_MTD)		+=3D ledtrig-mtd.o
diff --git a/drivers/leds/trigger/ledtrig-mtd.c b/drivers/leds/trigger/=
ledtrig-mtd.c
new file mode 100644
index 000000000000..badf72aa1f5f
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-mtd.c
@@ -0,0 +1,48 @@
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
+ * This program is free software; you can redistribute it and/or modif=
y
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
+static unsigned long blink_delay =3D BLINK_DELAY;
+
+void ledtrig_mtd_activity(void)
+{
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
index 309625130b21..5c35a76faff0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/kconfig.h>
+#include <linux/leds.h>
=20
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -862,6 +863,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_in=
fo *instr)
 		mtd_erase_callback(instr);
 		return 0;
 	}
+	ledtrig_mtd_activity();
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -925,6 +927,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, siz=
e_t len, size_t *retlen,
 	if (!len)
 		return 0;
=20
+	ledtrig_mtd_activity();
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
@@ -949,6 +952,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size=
_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	ledtrig_mtd_activity();
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
index b6facac54fc0..8d6287ef3926 100644
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
@@ -97,12 +96,6 @@ static int nand_get_device(struct mtd_info *mtd, int=
 new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
=20
-/*
- * For devices which display every fart in the system on a separate LE=
D. Is
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
=20
-	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* Wait until command is processed or timeout occurs */
 	timeo =3D jiffies + msecs_to_jiffies(timeo);
 	do {
 		if (chip->dev_ready(mtd))
-			goto out;
+			return;
 		cond_resched();
 	} while (time_before(jiffies, timeo));
=20
 	if (!chip->dev_ready(mtd))
 		pr_warn_ratelimited("timeout while waiting for chip to become ready\=
n");
-out:
-	led_trigger_event(nand_led_trigger, LED_OFF);
 }
 EXPORT_SYMBOL_GPL(nand_wait_ready);
=20
@@ -885,8 +875,6 @@ static int nand_wait(struct mtd_info *mtd, struct n=
and_chip *chip)
 	int status;
 	unsigned long timeo =3D 400;
=20
-	led_trigger_event(nand_led_trigger, LED_FULL);
-
 	/*
 	 * Apply this short delay always to ensure that we do wait tWB in any
 	 * case on any machine.
@@ -910,7 +898,6 @@ static int nand_wait(struct mtd_info *mtd, struct n=
and_chip *chip)
 			cond_resched();
 		} while (time_before(jiffies, timeo));
 	}
-	led_trigger_event(nand_led_trigger, LED_OFF);
=20
 	status =3D (int)chip->read_byte(mtd);
 	/* This can happen if in case of timeout or buggy dev_ready */
@@ -4474,20 +4461,6 @@ void nand_release(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(nand_release);
=20
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
=20
+#ifdef CONFIG_LEDS_TRIGGER_MTD
+extern void ledtrig_mtd_activity(void);
+#else
+static inline void ledtrig_mtd_activity(void) {}
+#endif
+
 #if defined(CONFIG_LEDS_TRIGGER_CAMERA) || defined(CONFIG_LEDS_TRIGGER=
_CAMERA_MODULE)
 extern void ledtrig_flash_ctrl(bool on);
 extern void ledtrig_torch_ctrl(bool on);
--=20
2.7.0


--=20
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
