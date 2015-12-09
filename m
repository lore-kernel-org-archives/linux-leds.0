From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 159/182] leds: tca6507: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:46:18 +0100
Message-ID: <1449668778-5980-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34347 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINqY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2015 08:46:24 -0500
Received: by lffu14 with SMTP id u14so34586882lff.1
        for <linux-leds@vger.kernel.org>; Wed, 09 Dec 2015 05:46:22 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Riku Voipio <riku.voipio@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
LEDS people: please ACK this so I can merge it in the GPIO tree.
---
 drivers/leds/leds-tca6507.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 75529a24a615..c548ea10f0f0 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -603,7 +603,7 @@ static int tca6507_blink_set(struct led_classdev *led_cdev,
 static void tca6507_gpio_set_value(struct gpio_chip *gc,
 				   unsigned offset, int val)
 {
-	struct tca6507_chip *tca = container_of(gc, struct tca6507_chip, gpio);
+	struct tca6507_chip *tca = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tca->lock, flags);
@@ -655,7 +655,7 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 #ifdef CONFIG_OF_GPIO
 	tca->gpio.of_node = of_node_get(client->dev.of_node);
 #endif
-	err = gpiochip_add(&tca->gpio);
+	err = gpiochip_add_data(&tca->gpio, tca);
 	if (err) {
 		tca->gpio.ngpio = 0;
 		return err;
-- 
2.4.3
