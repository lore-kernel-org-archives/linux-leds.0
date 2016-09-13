From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 5/8] leds: gpio: simplify gpio_leds_create
Date: Tue, 13 Sep 2016 08:03:31 +0200
Message-ID: <a8f44760-8276-e52a-86f8-e2301a801d15@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34418 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbcIMGEI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 02:04:08 -0400
Received: by mail-wm0-f68.google.com with SMTP id g141so5655957wmd.1
        for <linux-leds@vger.kernel.org>; Mon, 12 Sep 2016 23:04:07 -0700 (PDT)
In-Reply-To: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Definition of np can be moved into the loop as well to simplify
the code a little.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/leds-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 6b507cc..8e2ffc9 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -154,7 +154,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
 	int count, ret;
-	struct device_node *np;
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -168,6 +167,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
+		struct device_node *np = to_of_node(child);
 
 		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
 		if (IS_ERR(led.gpiod)) {
@@ -176,8 +176,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 			goto err;
 		}
 
-		np = to_of_node(child);
-
 		if (fwnode_property_present(child, "label")) {
 			fwnode_property_read_string(child, "label", &led.name);
 		} else {
-- 
2.9.2
