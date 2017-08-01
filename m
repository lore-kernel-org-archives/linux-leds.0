From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v2 2/4] leds: pca955x: use devm_led_classdev_register
Date: Tue,  1 Aug 2017 14:09:07 +0200
Message-ID: <1501589349-5681-3-git-send-email-clg@kaod.org>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501589349-5681-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This lets us remove the loop doing the cleanup in case of failure and
also the remove handler of the i2c_driver.

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
 drivers/leds/leds-pca955x.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 3afd481a760f..a8918ff0a7e9 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -412,10 +412,10 @@ static int pca955x_probe(struct i2c_client *client,
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
@@ -433,23 +433,6 @@ static int pca955x_probe(struct i2c_client *client,
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
@@ -459,7 +442,6 @@ static struct i2c_driver pca955x_driver = {
 		.of_match_table = of_match_ptr(of_pca955x_match),
 	},
 	.probe	= pca955x_probe,
-	.remove	= pca955x_remove,
 	.id_table = pca955x_id,
 };
 
-- 
2.7.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
