From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 2/4] leds: pca955x: use devm_led_classdev_register
Date: Tue,  8 Aug 2017 15:42:38 +0200
Message-ID: <1502199760-763-3-git-send-email-clg@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:52996 "EHLO
        8.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752068AbdHHNnX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Aug 2017 09:43:23 -0400
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3ED1712AF21
        for <linux-leds@vger.kernel.org>; Tue,  8 Aug 2017 15:43:22 +0200 (CEST)
In-Reply-To: <1502199760-763-1-git-send-email-clg@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>

This lets us remove the loop doing the cleanup in case of failure and
also the remove handler of the i2c_driver.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/leds-pca955x.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 2d34009d00e6..5a5d3765cfd3 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -410,10 +410,10 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led->led_cdev.name = pca955x_led->name;
 		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
 
-		err = led_classdev_register(&client->dev,
-					&pca955x_led->led_cdev);
-		if (err < 0)
-			goto exit;
+		err = devm_led_classdev_register(&client->dev,
+						 &pca955x_led->led_cdev);
+		if (err)
+			return err;
 	}
 
 	/* Turn off LEDs */
@@ -431,23 +431,6 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x_write_psc(client, 1, 0);
 
 	return 0;
-
-exit:
-	while (i--)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return err;
-}
-
-static int pca955x_remove(struct i2c_client *client)
-{
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	int i;
-
-	for (i = 0; i < pca955x->chipdef->bits; i++)
-		led_classdev_unregister(&pca955x->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct i2c_driver pca955x_driver = {
@@ -457,7 +440,6 @@ static struct i2c_driver pca955x_driver = {
 		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
-	.remove	= pca955x_remove,
 	.id_table = pca955x_id,
 };
 
-- 
2.7.5
