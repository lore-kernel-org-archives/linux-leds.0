From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/3] drivers/leds: make trigger/ledtrig-cpu.c driver explicitly non-modular
Date: Sun, 13 Dec 2015 16:45:49 -0500
Message-ID: <1450043151-30820-2-git-send-email-paul.gortmaker@windriver.com>
References: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:65384 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbbLMVqV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 13 Dec 2015 16:46:21 -0500
In-Reply-To: <1450043151-30820-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org

The Kconfig for this driver is currently:

config LEDS_TRIGGER_CPU
        bool "LED CPU Trigger"

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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/leds/trigger/ledtrig-cpu.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index aec0f02b6b3e..938467fb82be 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -19,7 +19,6 @@
  *
  */
 
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -140,27 +139,4 @@ static int __init ledtrig_cpu_init(void)
 
 	return 0;
 }
-module_init(ledtrig_cpu_init);
-
-static void __exit ledtrig_cpu_exit(void)
-{
-	int cpu;
-
-	unregister_cpu_notifier(&ledtrig_cpu_nb);
-
-	for_each_possible_cpu(cpu) {
-		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
-
-		led_trigger_unregister_simple(trig->_trig);
-		trig->_trig = NULL;
-		memset(trig->name, 0, MAX_NAME_LEN);
-	}
-
-	unregister_syscore_ops(&ledtrig_cpu_syscore_ops);
-}
-module_exit(ledtrig_cpu_exit);
-
-MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
-MODULE_AUTHOR("Bryan Wu <bryan.wu@canonical.com>");
-MODULE_DESCRIPTION("CPU LED trigger");
-MODULE_LICENSE("GPL");
+device_initcall(ledtrig_cpu_init);
-- 
2.6.1
