From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] leds: pwm: Allow changing the pinctrl state
Date: Fri, 17 Nov 2017 12:32:06 -0200
Message-ID: <1510929126-9813-1-git-send-email-festevam@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:43660 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030277AbdKQOcV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 09:32:21 -0500
Received: by mail-qt0-f193.google.com with SMTP id n61so6413391qte.10
        for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2017 06:32:20 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: jacek.anaszewski@gmail.com
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux@arm.linux.org.uk, linux-leds@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

From: Fabio Estevam <fabio.estevam@nxp.com>

Add suspend/resume pm hooks, so that the pinctrl state could be changed.

The motivation for doing this was to solve a problem on a imx6-cubox-i
board, where there is a GPIO controlled via pwm-leds that keeps turned on
when the system goes into suspend. Such behaviour is not what we expect
from a system going into suspend.

In order to solve this problem add the suspend/resume pm hooks where
the pinctrl state can be changed accordingly.

This allows to add an extra 'sleep' entry into the pinctrl node, where
the pinctrl can be changed from PWM to GPIO and pull up/pull down can be
configured to turn off the LED during suspend mode.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/leds/leds-pwm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 8d456dc6..ff21aa2 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -14,6 +14,7 @@
 
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
 #include <linux/fb.h>
@@ -210,6 +211,20 @@ static int led_pwm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused led_pwm_suspend(struct device *dev)
+{
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int __maybe_unused led_pwm_resume(struct device *dev)
+{
+	return pinctrl_pm_select_default_state(dev);
+}
+
+static const struct dev_pm_ops led_pwm_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(led_pwm_suspend, led_pwm_resume)
+};
+
 static const struct of_device_id of_pwm_leds_match[] = {
 	{ .compatible = "pwm-leds", },
 	{},
@@ -222,6 +237,7 @@ static struct platform_driver led_pwm_driver = {
 	.driver		= {
 		.name	= "leds_pwm",
 		.of_match_table = of_pwm_leds_match,
+		.pm = &led_pwm_pm_ops,
 	},
 };
 
-- 
2.7.4
