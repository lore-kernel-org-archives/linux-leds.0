From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/2] leds: gpio: set of_node before calling led_classdev_register
Date: Mon, 27 Feb 2017 23:23:00 +0100
Message-ID: <20170227222300.2060-2-zajec5@gmail.com>
References: <20170227222300.2060-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36112 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbdB0W43 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Feb 2017 17:56:29 -0500
Received: by mail-lf0-f67.google.com with SMTP id l6so2195773lfb.3
        for <linux-leds@vger.kernel.org>; Mon, 27 Feb 2017 14:56:28 -0800 (PST)
In-Reply-To: <20170227222300.2060-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>

From: Rafał Miłecki <rafal@milecki.pl>

This allows core code to access DT info earlier, during LED registration
process. Thanks to this we will be able to support DT bindings in LEDs
core code.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/leds/leds-gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index d400dcaf4d29..7bdce5df658b 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,7 +172,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
-		struct device_node *np = to_of_node(child);
+
+		led_dat->cdev.of_node = to_of_node(child);
 
 		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
 		if (IS_ERR(led.gpiod)) {
@@ -181,8 +182,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		}
 
 		ret = fwnode_property_read_string(child, "label", &led.name);
-		if (ret && IS_ENABLED(CONFIG_OF) && np)
-			led.name = np->name;
+		if (ret && IS_ENABLED(CONFIG_OF) && led_dat->cdev.of_node)
+			led.name = led_dat->cdev.of_node->name;
 		if (!led.name) {
 			fwnode_handle_put(child);
 			return ERR_PTR(-EINVAL);
@@ -211,7 +212,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
 		}
-		led_dat->cdev.dev->of_node = np;
 		priv->num_leds++;
 	}
 
-- 
2.11.0
