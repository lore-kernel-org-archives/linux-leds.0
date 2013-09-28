From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 1/2] leds: Include linux/of.h header
Date: Sat, 28 Sep 2013 17:08:30 +0530
Message-ID: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:40551 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab3I1Lij (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2013 07:38:39 -0400
Received: by mail-pd0-f169.google.com with SMTP id r10so3692402pdi.0
        for <linux-leds@vger.kernel.org>; Sat, 28 Sep 2013 04:38:39 -0700 (PDT)
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
 5 files changed, 5 insertions(+)

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
-- 
1.7.9.5

