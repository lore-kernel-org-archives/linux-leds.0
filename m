From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] leds: s3c24xx: Remove hardware.h inclusion
Date: Fri,  3 Jan 2014 12:00:04 +0530
Message-ID: <1388730604-32329-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:60370 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbaACGdy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jan 2014 01:33:54 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so15021072pde.13
        for <linux-leds@vger.kernel.org>; Thu, 02 Jan 2014 22:33:53 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org, patches@linaro.org

The contents of this header file is not referenced in the led driver.
Remove its inclusion. While at it, re-arrange the headers as per the
category.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-s3c24xx.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 76483fb5ee45..b7876eb09e8c 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -18,10 +18,9 @@
 #include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/platform_data/leds-s3c24xx.h>
 
-#include <mach/hardware.h>
 #include <mach/regs-gpio.h>
-#include <linux/platform_data/leds-s3c24xx.h>
 
 /* our context */
 
-- 
1.7.9.5
