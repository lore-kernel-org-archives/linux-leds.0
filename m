From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 6/6] leds: gpio: fix and simplify error handling in
 gpio_leds_create
Date: Tue, 13 Sep 2016 20:57:57 +0200
Message-ID: <5f75fcf6-a83b-6283-25d8-103f9472f56c@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34610 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752686AbcIMS6f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 14:58:35 -0400
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Simplify the error handling and add a missing call to fwnode_handle_put
when checking led.name.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index ab273f8..d400dca 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -177,16 +177,15 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
 		if (IS_ERR(led.gpiod)) {
 			fwnode_handle_put(child);
-			ret = PTR_ERR(led.gpiod);
-			goto err;
+			return ERR_CAST(led.gpiod);
 		}
 
 		ret = fwnode_property_read_string(child, "label", &led.name);
 		if (ret && IS_ENABLED(CONFIG_OF) && np)
 			led.name = np->name;
 		if (!led.name) {
-			ret = -EINVAL;
-			goto err;
+			fwnode_handle_put(child);
+			return ERR_PTR(-EINVAL);
 		}
 
 		fwnode_property_read_string(child, "linux,default-trigger",
@@ -210,16 +209,13 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		ret = create_gpio_led(&led, led_dat, dev, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
-			goto err;
+			return ERR_PTR(ret);
 		}
 		led_dat->cdev.dev->of_node = np;
 		priv->num_leds++;
 	}
 
 	return priv;
-
-err:
-	return ERR_PTR(ret);
 }
 
 static const struct of_device_id of_gpio_leds_match[] = {
-- 
2.9.2
