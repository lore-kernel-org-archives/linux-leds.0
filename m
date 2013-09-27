From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/6] leds: gpio: Include linux/of.h header
Date: Fri, 27 Sep 2013 17:06:58 +0530
Message-ID: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:38223 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab3I0LhK (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 07:37:10 -0400
Received: by mail-pa0-f44.google.com with SMTP id lf10so2680202pab.17
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 04:37:09 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-gpio.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index e8b01e5..7ccafde 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/leds.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
-- 
1.7.9.5

