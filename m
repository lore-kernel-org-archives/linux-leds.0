From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH] leds: leds-pca963x: add power management support
Date: Fri, 30 Sep 2016 12:27:42 -0700
Message-ID: <1475263662-14149-1-git-send-email-matt@ranostay.consulting>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:32870 "EHLO
        mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbcI3T1r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Sep 2016 15:27:47 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

Turn off LEDS on suspend and put device in low power state, and restore
settings on resume.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
---
 drivers/leds/leds-pca963x.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 407eba11e187..4840bdaa1b48 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -382,6 +382,7 @@ static int pca963x_probe(struct i2c_client *client,
 
 		pca963x[i].led_cdev.name = pca963x[i].name;
 		pca963x[i].led_cdev.brightness_set_blocking = pca963x_led_set;
+		pca963x[i].led_cdev.flags = LED_CORE_SUSPENDRESUME;
 
 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
 			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
@@ -422,10 +423,40 @@ static int pca963x_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int pca963x_set_power(struct i2c_client *client, bool state)
+{
+	return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
+					 state ? 0 : BIT(4));
+}
+
+static int pca963x_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return pca963x_set_power(client, false);
+}
+
+static int pca963x_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = pca963x_set_power(client, true);
+
+	/* wait for oscillator enabling */
+	if (!ret)
+		usleep_range(500, 1000);
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(pca963x_pm, pca963x_suspend, pca963x_resume);
+
 static struct i2c_driver pca963x_driver = {
 	.driver = {
 		.name	= "leds-pca963x",
 		.of_match_table = of_match_ptr(of_pca963x_match),
+		.pm	= &pca963x_pm,
 	},
 	.probe	= pca963x_probe,
 	.remove	= pca963x_remove,
-- 
2.7.4
