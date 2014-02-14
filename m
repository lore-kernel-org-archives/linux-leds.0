From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] leds: leds-s3c24xx: Trivial cleanup in header file
Date: Fri, 14 Feb 2014 12:07:09 +0530
Message-ID: <1392359829-12493-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:46449 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135AbaBNGm0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 14 Feb 2014 01:42:26 -0500
Received: by mail-pd0-f171.google.com with SMTP id g10so11510436pdj.16
        for <linux-leds@vger.kernel.org>; Thu, 13 Feb 2014 22:42:26 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, trivial@kernel.org, sachin.kamat@linaro.org

Commit 436d42c61c3e ("ARM: samsung: move platform_data definitions")
moved the files to the current location but forgot to remove the pointer
to its previous location. Clean it up. While at it also change the header
file protection macros appropriately.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 include/linux/platform_data/leds-s3c24xx.h |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/platform_data/leds-s3c24xx.h b/include/linux/platform_data/leds-s3c24xx.h
index d8a7672519b6..441a6f290649 100644
--- a/include/linux/platform_data/leds-s3c24xx.h
+++ b/include/linux/platform_data/leds-s3c24xx.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/leds-gpio.h
- *
+/*
  * Copyright (c) 2006 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
@@ -11,8 +10,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARCH_LEDSGPIO_H
-#define __ASM_ARCH_LEDSGPIO_H "leds-gpio.h"
+#ifndef __LEDS_S3C24XX_H
+#define __LEDS_S3C24XX_H
 
 #define S3C24XX_LEDF_ACTLOW	(1<<0)		/* LED is on when GPIO low */
 #define S3C24XX_LEDF_TRISTATE	(1<<1)		/* tristate to turn off */
@@ -25,4 +24,4 @@ struct s3c24xx_led_platdata {
 	char			*def_trigger;
 };
 
-#endif /* __ASM_ARCH_LEDSGPIO_H */
+#endif /* __LEDS_S3C24XX_H */
-- 
1.7.9.5
