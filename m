From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 7/8] leds: gpio: switch to managed version of
 led_classdev_register
Date: Tue, 13 Sep 2016 08:03:39 +0200
Message-ID: <333c8dff-7cda-b963-3098-9dbbd1745320@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36327 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754078AbcIMGEK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 02:04:10 -0400
Received: by mail-wm0-f68.google.com with SMTP id b184so715516wma.3
        for <linux-leds@vger.kernel.org>; Mon, 12 Sep 2016 23:04:10 -0700 (PDT)
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Using the managed version of led_classdev_register allows to
significantly simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index deea159..381f6e0 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -134,7 +134,7 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return led_classdev_register(parent, &led_dat->cdev);
+	return devm_led_classdev_register(parent, &led_dat->cdev);
 }
 
 struct gpio_leds_priv {
@@ -214,8 +214,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	return priv;
 
 err:
-	for (count = priv->num_leds - 1; count >= 0; count--)
-		led_classdev_unregister(&priv->leds[count].cdev);
 	return ERR_PTR(ret);
 }
 
@@ -244,13 +242,8 @@ static int gpio_led_probe(struct platform_device *pdev)
 			ret = create_gpio_led(&pdata->leds[i],
 					      &priv->leds[i],
 					      &pdev->dev, pdata->gpio_blink_set);
-			if (ret < 0) {
-				/* On failure: unwind the led creations */
-				for (i = i - 1; i >= 0; i--)
-					led_classdev_unregister(
-							&priv->leds[i].cdev);
+			if (ret < 0)
 				return ret;
-			}
 		}
 	} else {
 		priv = gpio_leds_create(pdev);
@@ -263,17 +256,6 @@ static int gpio_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gpio_led_remove(struct platform_device *pdev)
-{
-	struct gpio_leds_priv *priv = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < priv->num_leds; i++)
-		led_classdev_unregister(&priv->leds[i].cdev);
-
-	return 0;
-}
-
 static void gpio_led_shutdown(struct platform_device *pdev)
 {
 	struct gpio_leds_priv *priv = platform_get_drvdata(pdev);
@@ -288,7 +270,6 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 
 static struct platform_driver gpio_led_driver = {
 	.probe		= gpio_led_probe,
-	.remove		= gpio_led_remove,
 	.shutdown	= gpio_led_shutdown,
 	.driver		= {
 		.name	= "leds-gpio",
-- 
2.9.2
