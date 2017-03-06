From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 2/2] leds: gpio: use OF variant of LED registering function
Date: Mon,  6 Mar 2017 06:19:45 +0100
Message-ID: <20170306051945.14857-2-zajec5@gmail.com>
References: <20170306051945.14857-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36290 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752890AbdCFFT6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Mar 2017 00:19:58 -0500
Received: by mail-lf0-f67.google.com with SMTP id g70so10995210lfh.3
        for <linux-leds@vger.kernel.org>; Sun, 05 Mar 2017 21:19:57 -0800 (PST)
In-Reply-To: <20170306051945.14857-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

In leds-gpio we support LEDs specified in DT so we should use
(devm_)of_led_classdev_register. This allows passing DT node as argument
for use by the LED subsystem.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use the new devm_of_led_classdev_register function.
---
 drivers/leds/leds-gpio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dcaf4d29..c5230249f136 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -77,7 +77,7 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
 
 static int create_gpio_led(const struct gpio_led *template,
 	struct gpio_led_data *led_dat, struct device *parent,
-	gpio_blink_set_t blink_set)
+	struct device_node *np, gpio_blink_set_t blink_set)
 {
 	int ret, state;
 
@@ -139,7 +139,7 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return devm_led_classdev_register(parent, &led_dat->cdev);
+	return devm_of_led_classdev_register(parent, np, &led_dat->cdev);
 }
 
 struct gpio_leds_priv {
@@ -206,7 +206,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
-		ret = create_gpio_led(&led, led_dat, dev, NULL);
+		ret = create_gpio_led(&led, led_dat, dev, np, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
@@ -240,9 +240,9 @@ static int gpio_led_probe(struct platform_device *pdev)
 
 		priv->num_leds = pdata->num_leds;
 		for (i = 0; i < priv->num_leds; i++) {
-			ret = create_gpio_led(&pdata->leds[i],
-					      &priv->leds[i],
-					      &pdev->dev, pdata->gpio_blink_set);
+			ret = create_gpio_led(&pdata->leds[i], &priv->leds[i],
+					      &pdev->dev, NULL,
+					      pdata->gpio_blink_set);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.11.0
