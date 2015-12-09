From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 158/182] leds: pca9532: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:46:10 +0100
Message-ID: <1449668770-5933-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:33753 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083AbbLINqP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 9 Dec 2015 08:46:15 -0500
Received: by lbbkw15 with SMTP id kw15so30279363lbb.0
        for <linux-leds@vger.kernel.org>; Wed, 09 Dec 2015 05:46:13 -0800 (PST)
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
 drivers/leds/leds-pca9532.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index a975b32ee8c8..1b228adfd1a7 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -245,7 +245,7 @@ static void pca9532_led_work(struct work_struct *work)
 #ifdef CONFIG_LEDS_PCA9532_GPIO
 static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
 {
-	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
+	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (led->type == PCA9532_TYPE_GPIO)
@@ -256,7 +256,7 @@ static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
 
 static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int val)
 {
-	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
+	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
 
 	if (val)
@@ -269,7 +269,7 @@ static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int va
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 {
-	struct pca9532_data *data = container_of(gc, struct pca9532_data, gpio);
+	struct pca9532_data *data = gpiochip_get_data(gc);
 	unsigned char reg;
 
 	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
@@ -416,7 +416,7 @@ static int pca9532_configure(struct i2c_client *client,
 		data->gpio.parent = &client->dev;
 		data->gpio.owner = THIS_MODULE;
 
-		err = gpiochip_add(&data->gpio);
+		err = gpiochip_add_data(&data->gpio, data);
 		if (err) {
 			/* Use data->gpio.dev as a flag for freeing gpiochip */
 			data->gpio.parent = NULL;
-- 
2.4.3
