From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 3/4] mtd: nand: Remove the "nand-disk" LED trigger
Date: Tue, 12 Apr 2016 17:46:41 -0300
Message-ID: <1460494002-8578-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:33406 "EHLO
	mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965445AbcDLUrH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 16:47:07 -0400
Received: by mail-qk0-f179.google.com with SMTP id n63so406849qkf.0
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 13:47:06 -0700 (PDT)
In-Reply-To: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This commit removes the "nand-disk" LED trigger from the
NAND code.

A trigger with the same name is already available selecting
LEDS_TRIGGER_MTD. Note that "nand-disk" trigger is being
deprecated in favor of the "mtd" trigger.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/nand_base.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
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
@@ -4474,20 +4461,6 @@ void nand_release(struct mtd_info *mtd)
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
-- 
2.7.0
