From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] leds: Include linux/of.h header
Date: Sat, 28 Sep 2013 15:06:43 +0530
Message-ID: <1380361003-4661-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34111 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533Ab3I1Jgx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2013 05:36:53 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so3803146pad.0
        for <linux-leds@vger.kernel.org>; Sat, 28 Sep 2013 02:36:52 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, sachin.kamat@linaro.org

'of_match_ptr' is defined in linux/of.h. Include it explicitly.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/leds/leds-gpio.c   |    1 +
 drivers/leds/leds-lp5523.c |    1 +
 drivers/leds/leds-lp5562.c |    1 +
 drivers/leds/leds-lp8501.c |    1 +
 drivers/leds/leds-ns2.c    |    1 +
 drivers/leds/leds-pwm.c    |    1 +
 6 files changed, 6 insertions(+)

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
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index fe3bcbb..6b553d9 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -29,6 +29,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/platform_data/leds-lp55xx.h>
 #include <linux/slab.h>
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 2585cfd..bf006f4 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -17,6 +17,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/platform_data/leds-lp55xx.h>
 #include <linux/slab.h>
 
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
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index bb6f948..990f57e 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -24,6 +24,7 @@
 #include <linux/leds_pwm.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
+#include <linux/of.h>
 
 struct led_pwm_data {
 	struct led_classdev	cdev;
-- 
1.7.9.5

