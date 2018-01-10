From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] leds: ledtrig-transient: Add SPDX license identifiers
Date: Wed, 10 Jan 2018 15:42:05 -0700
Message-ID: <20180110224205.21926-1-shuahkh@osg.samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:54123 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751975AbeAJWmd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 10 Jan 2018 17:42:33 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, keescook@chromium.org, shuah@kernel.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Replace GPL license statements with SPDX GPL-2.0 license identifiers
and and correct the module license to GPLv2.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
Changes since v1:
- Changed comment format and updated the entire block to match the
  comment format based on Jacek's review.

 drivers/leds/trigger/ledtrig-transient.c | 33 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 7acce64b692a..9d1769073562 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -1,22 +1,15 @@
-/*
- * LED Kernel Transient Trigger
- *
- * Copyright (C) 2012 Shuah Khan <shuahkhan@gmail.com>
- *
- * Based on Richard Purdie's ledtrig-timer.c and Atsushi Nemoto's
- * ledtrig-heartbeat.c
- * Design and use-case input from Jonas Bonn <jonas@southpole.se> and
- * Neil Brown <neilb@suse.de>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
-/*
- * Transient trigger allows one shot timer activation. Please refer to
- * Documentation/leds/ledtrig-transient.txt for details
-*/
+// SPDX-License-Identifier: GPL-2.0
+//
+// LED Kernel Transient Trigger
+//
+// Transient trigger allows one shot timer activation. Please refer to
+// Documentation/leds/ledtrig-transient.txt for details
+// Copyright (C) 2012 Shuah Khan <shuahkhan@gmail.com>
+//
+// Based on Richard Purdie's ledtrig-timer.c and Atsushi Nemoto's
+// ledtrig-heartbeat.c
+// Design and use-case input from Jonas Bonn <jonas@southpole.se> and
+// Neil Brown <neilb@suse.de>
 
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -238,4 +231,4 @@ module_exit(transient_trig_exit);
 
 MODULE_AUTHOR("Shuah Khan <shuahkhan@gmail.com>");
 MODULE_DESCRIPTION("Transient LED trigger");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.14.1
