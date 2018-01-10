From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] leds: ledtrig-transient: Add SPDX license identifiers
Date: Wed, 10 Jan 2018 09:35:35 -0700
Message-ID: <20180110163540.8396-1-shuahkh@osg.samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:57607 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965882AbeAJQgI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 10 Jan 2018 11:36:08 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, keescook@chromium.org, shuah@kernel.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Replace GPL license statements with SPDX GPL-2.0 license identifiers
and and correct the module license to GPLv2.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/leds/trigger/ledtrig-transient.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 7acce64b692a..f0578af858e7 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * LED Kernel Transient Trigger
  *
@@ -8,10 +9,6 @@
  * Design and use-case input from Jonas Bonn <jonas@southpole.se> and
  * Neil Brown <neilb@suse.de>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  */
 /*
  * Transient trigger allows one shot timer activation. Please refer to
@@ -238,4 +235,4 @@ module_exit(transient_trig_exit);
 
 MODULE_AUTHOR("Shuah Khan <shuahkhan@gmail.com>");
 MODULE_DESCRIPTION("Transient LED trigger");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.14.1
