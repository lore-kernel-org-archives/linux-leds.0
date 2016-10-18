From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH] leds: pca963x: add runtime pm support
Date: Tue, 18 Oct 2016 08:17:17 -0700
Message-ID: <1476803837-25171-1-git-send-email-matt@ranostay.consulting>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35317 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761794AbcJRPRX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Oct 2016 11:17:23 -0400
Received: by mail-pf0-f196.google.com with SMTP id s8so15390665pfj.2
        for <linux-leds@vger.kernel.org>; Tue, 18 Oct 2016 08:17:23 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Allow chip to enter low power state when no LEDs are being lit or in
blink mode.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
---
 drivers/leds/leds-pca963x.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba11e187..a6b954b31fcd 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -35,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_data/leds-pca963x.h>
+#include <linux/pm_runtime.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define PCA963X_LED_OFF		0x0	/* LED driver off */
@@ -108,6 +109,7 @@ struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
 	int led_num; /* 0 .. 15 potentially */
+	enum led_brightness brightness;
 	char name[32];
 	u8 gdc;
 	u8 gfrq;
@@ -116,6 +118,8 @@ struct pca963x_led {
 static int pca963x_brightness(struct pca963x_led *pca963x,
 			       enum led_brightness brightness)
 {
+	struct i2c_client *client = pca963x->chip->client;
+	enum led_brightness prev_brightness = pca963x->brightness;
 	u8 ledout_addr = pca963x->chip->chipdef->ledout_base
 		+ (pca963x->led_num / 4);
 	u8 ledout;
@@ -123,8 +127,12 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 	u8 mask = 0x3 << shift;
 	int ret;
 
+	if (brightness == prev_brightness)
+		return 0;
+
 	mutex_lock(&pca963x->chip->mutex);
 	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
+
 	switch (brightness) {
 	case LED_FULL:
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
@@ -132,6 +140,9 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 			(ledout & ~mask) | (PCA963X_LED_ON << shift));
 		break;
 	case LED_OFF:
+		ret = pm_runtime_put(&client->dev);
+		if (ret < 0)
+			goto unlock;
 		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
 			ledout_addr, ledout & ~mask);
 		break;
@@ -146,7 +157,15 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 			(ledout & ~mask) | (PCA963X_LED_PWM << shift));
 		break;
 	}
+
+	if (prev_brightness == LED_OFF) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0)
+			goto unlock;
+	}
 unlock:
+	pca963x->brightness = brightness;
+
 	mutex_unlock(&pca963x->chip->mutex);
 	return ret;
 }
@@ -350,6 +369,7 @@ static int pca963x_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, pca963x_chip);
+	dev_set_drvdata(&client->dev, client);
 
 	mutex_init(&pca963x_chip->mutex);
 	pca963x_chip->chipdef = chip;
@@ -402,6 +422,12 @@ static int pca963x_probe(struct i2c_client *client,
 			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
 	}
 
+	err = pm_runtime_set_active(&client->dev);
+	if (err)
+		goto exit;
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
 	return 0;
 
 exit:
@@ -416,16 +442,37 @@ static int pca963x_remove(struct i2c_client *client)
 	struct pca963x *pca963x = i2c_get_clientdata(client);
 	int i;
 
+	pm_runtime_disable(&client->dev);
+
 	for (i = 0; i < pca963x->chipdef->n_leds; i++)
 		led_classdev_unregister(&pca963x->leds[i].led_cdev);
 
 	return 0;
 }
 
+static int pca963x_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
+}
+
+static int pca963x_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
+}
+
+const static struct dev_pm_ops pca963x_pms = {
+	SET_RUNTIME_PM_OPS(pca963x_runtime_suspend, pca963x_runtime_resume, NULL)
+};
+
 static struct i2c_driver pca963x_driver = {
 	.driver = {
 		.name	= "leds-pca963x",
 		.of_match_table = of_match_ptr(of_pca963x_match),
+		.pm	= &pca963x_pms,
 	},
 	.probe	= pca963x_probe,
 	.remove	= pca963x_remove,
-- 
2.7.4
