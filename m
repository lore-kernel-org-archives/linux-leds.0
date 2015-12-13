From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/3] drivers/leds: make trigger/ledtrig-ide-disk.c driver explicitly non-modular
Date: Sun, 13 Dec 2015 16:45:50 -0500
Message-ID: <1450043151-30820-3-git-send-email-paul.gortmaker@windriver.com>
References: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:42801 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbbLMVqV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 13 Dec 2015 16:46:21 -0500
In-Reply-To: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

The Kconfig for this driver is currently:

config LEDS_TRIGGER_IDE_DISK
        bool "LED IDE Disk Trigger"

...meaning that it currently is not being built as a module by anyone.
Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_init translates to device_initcall in the non-modular
case, the init ordering remains unchanged with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/leds/trigger/ledtrig-ide-disk.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-ide-disk.c b/drivers/leds/trigger/ledtrig-ide-disk.c
index 2cd7c0cf5924..c02a3ac3cd2b 100644
--- a/drivers/leds/trigger/ledtrig-ide-disk.c
+++ b/drivers/leds/trigger/ledtrig-ide-disk.c
@@ -11,7 +11,6 @@
  *
  */
 
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/leds.h>
@@ -33,15 +32,4 @@ static int __init ledtrig_ide_init(void)
 	led_trigger_register_simple("ide-disk", &ledtrig_ide);
 	return 0;
 }
-
-static void __exit ledtrig_ide_exit(void)
-{
-	led_trigger_unregister_simple(ledtrig_ide);
-}
-
-module_init(ledtrig_ide_init);
-module_exit(ledtrig_ide_exit);
-
-MODULE_AUTHOR("Richard Purdie <rpurdie@openedhand.com>");
-MODULE_DESCRIPTION("LED IDE Disk Activity Trigger");
-MODULE_LICENSE("GPL");
+device_initcall(ledtrig_ide_init);
-- 
2.6.1
