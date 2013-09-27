From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/6] leds: lp8501: Include linux/of.h header
Date: Fri, 27 Sep 2013 17:07:01 +0530
Message-ID: <1380281823-13487-4-git-send-email-sachin.kamat@linaro.org>
References: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:62150 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049Ab3I0LhQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 07:37:16 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so2487264pdj.32
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2013 04:37:16 -0700 (PDT)
In-Reply-To: <1380281823-13487-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-lp8501.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 8d55a780..f1c704f 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -18,6 +18,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/platform_data/leds-lp55xx.h>
 #include <linux/slab.h>
 
-- 
1.7.9.5

