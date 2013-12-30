From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] leds: kirkwood: Cleanup in header files
Date: Mon, 30 Dec 2013 10:43:24 +0530
Message-ID: <1388380404-2817-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59864 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989Ab3L3FRA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Dec 2013 00:17:00 -0500
Received: by mail-pb0-f45.google.com with SMTP id rp16so11180824pbb.18
        for <linux-leds@vger.kernel.org>; Sun, 29 Dec 2013 21:16:59 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org, patches@linaro.org

Commit c02cecb92ed4 ("ARM: orion: move platform_data definitions")
moved the files to the current location but forgot to remove the pointer
to its previous location. Clean it up. While at it also change the header
file protection macros appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../linux/platform_data/leds-kirkwood-netxbig.h    |    8 +++-----
 include/linux/platform_data/leds-kirkwood-ns2.h    |    8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/linux/platform_data/leds-kirkwood-netxbig.h b/include/linux/platform_data/leds-kirkwood-netxbig.h
index 24b536ebdf13..d2be19a51acd 100644
--- a/include/linux/platform_data/leds-kirkwood-netxbig.h
+++ b/include/linux/platform_data/leds-kirkwood-netxbig.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/mach-kirkwood/include/mach/leds-netxbig.h
- *
  * Platform data structure for netxbig LED driver
  *
  * This file is licensed under the terms of the GNU General Public
@@ -8,8 +6,8 @@
  * warranty of any kind, whether express or implied.
  */
 
-#ifndef __MACH_LEDS_NETXBIG_H
-#define __MACH_LEDS_NETXBIG_H
+#ifndef __LEDS_KIRKWOOD_NETXBIG_H
+#define __LEDS_KIRKWOOD_NETXBIG_H
 
 struct netxbig_gpio_ext {
 	unsigned	*addr;
@@ -52,4 +50,4 @@ struct netxbig_led_platform_data {
 	int			num_leds;
 };
 
-#endif /* __MACH_LEDS_NETXBIG_H */
+#endif /* __LEDS_KIRKWOOD_NETXBIG_H */
diff --git a/include/linux/platform_data/leds-kirkwood-ns2.h b/include/linux/platform_data/leds-kirkwood-ns2.h
index e21272e5f668..6a9fed57f346 100644
--- a/include/linux/platform_data/leds-kirkwood-ns2.h
+++ b/include/linux/platform_data/leds-kirkwood-ns2.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/mach-kirkwood/include/mach/leds-ns2.h
- *
  * Platform data structure for Network Space v2 LED driver
  *
  * This file is licensed under the terms of the GNU General Public
@@ -8,8 +6,8 @@
  * warranty of any kind, whether express or implied.
  */
 
-#ifndef __MACH_LEDS_NS2_H
-#define __MACH_LEDS_NS2_H
+#ifndef __LEDS_KIRKWOOD_NS2_H
+#define __LEDS_KIRKWOOD_NS2_H
 
 struct ns2_led {
 	const char	*name;
@@ -23,4 +21,4 @@ struct ns2_led_platform_data {
 	struct ns2_led	*leds;
 };
 
-#endif /* __MACH_LEDS_NS2_H */
+#endif /* __LEDS_KIRKWOOD_NS2_H */
-- 
1.7.9.5
