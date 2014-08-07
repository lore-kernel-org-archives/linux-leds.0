From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 1/3] leds: Reorder include directives
Date: Thu, 07 Aug 2014 14:10:22 +0200
Message-ID: <1407413424-30087-2-git-send-email-j.anaszewski@samsung.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42712 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754303AbaHGMKg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 08:10:36 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N9X00H51R5L0390@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 07 Aug 2014 21:10:33 +0900 (KST)
In-reply-to: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

Reorder include directives so that they are arranged
in alphabetical order.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/leds/led-class.c |   12 ++++++------
 drivers/leds/led-core.c  |    2 +-
 include/linux/leds.h     |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 129729d..3df5632 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -9,15 +9,15 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/list.h>
-#include <linux/spinlock.h>
+#include <linux/ctype.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/ctype.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include "leds.h"
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 4bb1168..8380eb7 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -12,10 +12,10 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/rwsem.h>
-#include <linux/leds.h>
 #include <linux/workqueue.h>
 #include "leds.h"
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a599dc..bc959c5 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -13,8 +13,8 @@
 #define __LINUX_LEDS_H_INCLUDED
 
 #include <linux/list.h>
-#include <linux/spinlock.h>
 #include <linux/rwsem.h>
+#include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
 struct device;
-- 
1.7.9.5
