From: Heiko Schocher <hs@denx.de>
Subject: [PATCH] leds: leds-gpio: add shutdown function
Date: Tue, 13 Oct 2015 07:17:12 +0200
Message-ID: <1444713432-24433-1-git-send-email-hs@denx.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58977 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932379AbbJMFRR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Oct 2015 01:17:17 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Georg.Soffel@bosch-si.com

add a shutdown function for setting the gpio-leds
into off state when shuting down.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

 drivers/leds/leds-gpio.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index af1876a..5db4515 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -291,9 +291,22 @@ static int gpio_led_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void gpio_led_shutdown(struct platform_device *pdev)
+{
+	struct gpio_leds_priv *priv = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < priv->num_leds; i++) {
+		struct gpio_led_data *led = &priv->leds[i];
+
+		gpio_led_set(&led->cdev, LED_OFF);
+	}
+}
+
 static struct platform_driver gpio_led_driver = {
 	.probe		= gpio_led_probe,
 	.remove		= gpio_led_remove,
+	.shutdown	= gpio_led_shutdown,
 	.driver		= {
 		.name	= "leds-gpio",
 		.of_match_table = of_gpio_leds_match,
-- 
2.1.0
