From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] leds: lp3952: Store leds[LP3952_LED_ALL] in struct
 lp3952_led_array
Date: Sun, 17 Jul 2016 10:18:18 +0800
Message-ID: <1468721898.9106.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36587 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbcGQCSX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 16 Jul 2016 22:18:23 -0400
Received: by mail-pa0-f65.google.com with SMTP id ez1so5171365pab.3
        for <linux-leds@vger.kernel.org>; Sat, 16 Jul 2016 19:18:23 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Tony Makkiel <tony.makkiel@daqri.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

The LP3952_LED_ALL is known at compile time, so we can just store
leds[LP3952_LED_ALL] in struct lp3952_led_array rather than calling
devm_kcalloc() to allocate the memory.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/leds/leds-lp3952.c  | 9 ---------
 include/linux/leds-lp3952.h | 2 +-
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index f6157c0..a73c8ff 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -215,21 +215,12 @@ static int lp3952_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	int status;
-	struct lp3952_ctrl_hdl *leds;
 	struct lp3952_led_array *priv;
 
 	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	leds = devm_kcalloc(&client->dev, LP3952_LED_ALL, sizeof(*leds),
-			    GFP_KERNEL);
-	if (!leds) {
-		devm_kfree(&client->dev, priv);
-		return -ENOMEM;
-	}
-
-	priv->leds = leds;
 	priv->client = client;
 
 	priv->enable_gpio = devm_gpiod_get(&client->dev, "nrst",
diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.h
index edd5ed6..49b37ed 100644
--- a/include/linux/leds-lp3952.h
+++ b/include/linux/leds-lp3952.h
@@ -119,7 +119,7 @@ struct lp3952_led_array {
 	struct regmap *regmap;
 	struct i2c_client *client;
 	struct gpio_desc *enable_gpio;
-	struct lp3952_ctrl_hdl *leds;
+	struct lp3952_ctrl_hdl leds[LP3952_LED_ALL];
 };
 
 #endif /* LEDS_LP3952_H_ */
-- 
2.5.0
