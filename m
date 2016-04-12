From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 2/4] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 17:46:40 -0300
Message-ID: <1460494002-8578-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:33897 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965411AbcDLUrE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 16:47:04 -0400
Received: by mail-qg0-f49.google.com with SMTP id c6so26984282qga.1
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 13:47:03 -0700 (PDT)
In-Reply-To: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This commit introduces a MTD trigger for flash (NAND/NOR) device
activity. The implementation is copied from IDE disk.

This trigger deprecates the "nand-disk" LED trigger, but for backwards
compatibility, we still keep the "nand-disk" trigger around.

The motivation for deprecating the "nand-disk" LED trigger is that
it only works for NAND drivers, whereas the "mtd" LED trigger
is more generic (in fact, "nand-disk" currently only works for
certain NAND drivers).

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
NAND core is also registering a "nand-disk" trigger, which will
clash with the trigger registered in this patch. This won't
cause any issues, except that one of them won't get registered.
The LED trigger code is prepared to handle a trigger register failure.
---
 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h               |  6 +++++
 4 files changed, 60 insertions(+)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 5bda6a9b56bb..df6949a0ce13 100644
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
index 1abf48dacf7e..446f4603a397 100644
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
index 000000000000..99b5b0a4d826
--- /dev/null
+++ b/drivers/leds/trigger/ledtrig-mtd.c
@@ -0,0 +1,45 @@
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
+	led_trigger_blink_oneshot(ledtrig_mtd,
+				  &blink_delay, &blink_delay, 0);
+	led_trigger_blink_oneshot(ledtrig_nand,
+				  &blink_delay, &blink_delay, 0);
+}
+EXPORT_SYMBOL(ledtrig_mtd_activity);
+
+static int __init ledtrig_mtd_init(void)
+{
+	led_trigger_register_simple("mtd", &ledtrig_mtd);
+	led_trigger_register_simple("nand-disk", &ledtrig_nand);
+
+	return 0;
+}
+device_initcall(ledtrig_mtd_init);
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
