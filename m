From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 1/3] led: gpio: Sort include headers alphabetically
Date: Sun, 28 Sep 2014 16:57:14 +0800
Message-ID: <1411894636-12360-2-git-send-email-Li.Xiubo@freescale.com>
References: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bl2on0117.outbound.protection.outlook.com ([65.55.169.117]:48253
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751070AbaI1JbM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 28 Sep 2014 05:31:12 -0400
In-Reply-To: <1411894636-12360-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>

If the inlcude headers aren't sorted alphabetically, then the
logical choice is to append new ones, however that creates a
lot of potential for conflicts or duplicates because every change
will then add new includes in the same location.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-gpio-register.c |  2 +-
 drivers/leds/leds-gpio.c          | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
index 1c4ed55..fbd8934 100644
--- a/drivers/leds/leds-gpio-register.c
+++ b/drivers/leds/leds-gpio-register.c
@@ -7,9 +7,9 @@
  * Free Software Foundation.
  */
 #include <linux/err.h>
+#include <linux/leds.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/leds.h>
 
 /**
  * gpio_led_register_device - register a gpio-led device
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 57ff20f..1b1e617 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -10,17 +10,17 @@
  * published by the Free Software Foundation.
  *
  */
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/err.h>
 #include <linux/gpio.h>
+#include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/of_gpio.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/module.h>
-#include <linux/err.h>
 
 struct gpio_led_data {
 	struct led_classdev cdev;
-- 
2.1.0.27.g96db324
