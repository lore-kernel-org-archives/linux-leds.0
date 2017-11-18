From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] leds: pwm: Remove unneeded header file
Date: Sat, 18 Nov 2017 18:22:46 -0200
Message-ID: <1511036566-25369-1-git-send-email-festevam@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:43053 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967477AbdKRUXA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 18 Nov 2017 15:23:00 -0500
Received: by mail-qk0-f196.google.com with SMTP id j202so3311669qke.10
        for <linux-leds@vger.kernel.org>; Sat, 18 Nov 2017 12:23:00 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com
Cc: linux-leds@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

From: Fabio Estevam <fabio.estevam@nxp.com>

There is nothing provided by <linux/fb.h> that is used here,
so remove this unneeded header file.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/leds/leds-pwm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 8d456dc6..df80c89 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
-#include <linux/fb.h>
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/pwm.h>
-- 
2.7.4
