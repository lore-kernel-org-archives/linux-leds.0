From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] leds: gpio: Add pinctrl PM select sleep,default state in suspend/resume
Date: Fri, 20 Jan 2017 17:45:53 +0100
Message-ID: <20170120164553.27565-1-enric.balletbo@collabora.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46427 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751583AbdATQzj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2017 11:55:39 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

This patch allows users to use an alternate pinctrl "sleep" in order to
clamp outputs to a wanted state at suspend.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/leds/leds-gpio.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dca..a2e9bdb 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/pm.h>
 
 struct gpio_led_data {
 	struct led_classdev cdev;
@@ -269,12 +270,31 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 	}
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int gpio_led_suspend(struct device *dev)
+{
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int gpio_led_resume(struct device *dev)
+{
+	pinctrl_pm_select_default_state(dev);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(gpio_led_pm, gpio_led_suspend, gpio_led_resume);
+
 static struct platform_driver gpio_led_driver = {
 	.probe		= gpio_led_probe,
 	.shutdown	= gpio_led_shutdown,
 	.driver		= {
 		.name	= "leds-gpio",
 		.of_match_table = of_gpio_leds_match,
+		.pm	= &gpio_led_pm,
 	},
 };
 
-- 
2.9.3
