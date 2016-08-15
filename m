From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] leds: make triggers explicitly non-modular
Date: Mon, 15 Aug 2016 16:54:48 -0400
Message-ID: <20160815205448.20843-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:42713 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932182AbcHOUzm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 15 Aug 2016 16:55:42 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/leds/trigger/Kconfig:menuconfig LEDS_TRIGGERS
drivers/leds/trigger/Kconfig:   bool "LED Trigger support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

We don't replace module.h with init.h since the file doesn't need that.
However it does use EXPORT_SYMBOL, so we add the export.h header.

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/leds/led-triggers.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c92702a684ce..f0b3d101994b 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -11,7 +11,7 @@
  *
  */
 
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
@@ -357,7 +357,3 @@ void led_trigger_unregister_simple(struct led_trigger *trig)
 	kfree(trig);
 }
 EXPORT_SYMBOL_GPL(led_trigger_unregister_simple);
-
-MODULE_AUTHOR("Richard Purdie");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("LED Triggers Core");
-- 
2.8.4
