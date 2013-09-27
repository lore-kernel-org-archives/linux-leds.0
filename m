From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/6] leds: ns2: Include linux/of.h header
Date: Fri, 27 Sep 2013 17:07:02 +0530
Message-ID: <1380281823-13487-5-git-send-email-sachin.kamat@linaro.org>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:43206 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab3I0LhT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 07:37:19 -0400
Received: by mail-pa0-f45.google.com with SMTP id rd3so2675157pab.32
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 04:37:18 -0700 (PDT)
In-Reply-To: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-ns2.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 141f134..c7a4230 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -30,6 +30,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/platform_data/leds-kirkwood-ns2.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 
 /*
-- 
1.7.9.5

