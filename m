From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 6/6] leds: lp8860: Various fixes to align with LED framework
Date: Tue, 5 Dec 2017 14:43:27 -0600
Message-ID: <20171205204327.12111-7-dmurphy@ti.com>
References: <20171205204327.12111-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:29139 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751709AbdLEUnt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Dec 2017 15:43:49 -0500
In-Reply-To: <20171205204327.12111-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Update the driver to conform with the LED framework.
Use devm_led_classdev_register
Destroy mutex on exit
Remove dependency on CONFIG_OF in the driver and move
to the Kconfig
Update the MODULE_LICENSE to GPL v2
Remove setting of MAX brightness as the LED framework
does this.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - no changes

 drivers/leds/Kconfig       |  2 +-
 drivers/leds/leds-lp8860.c | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 318a28fd58fe..ac4d9d8bf96b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -347,7 +347,7 @@ config LEDS_LP8788
 
 config LEDS_LP8860
 	tristate "LED support for the TI LP8860 4 channel LED driver"
-	depends on LEDS_CLASS && I2C
+	depends on LEDS_CLASS && I2C && OF
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the TI LP8860 4 channel
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 4fed603ee728..e94041e0e693 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -399,7 +399,6 @@ static int lp8860_probe(struct i2c_client *client,
 
 	led->client = client;
 	led->led_dev.name = led->label;
-	led->led_dev.max_brightness = LED_FULL;
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
 
 	mutex_init(&led->lock);
@@ -426,7 +425,7 @@ static int lp8860_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = led_classdev_register(&client->dev, &led->led_dev);
+	ret = devm_led_classdev_register(&client->dev, &led->led_dev);
 	if (ret) {
 		dev_err(&client->dev, "led register err: %d\n", ret);
 		return ret;
@@ -440,8 +439,6 @@ static int lp8860_remove(struct i2c_client *client)
 	struct lp8860_led *led = i2c_get_clientdata(client);
 	int ret;
 
-	led_classdev_unregister(&led->led_dev);
-
 	if (led->enable_gpio)
 		gpiod_direction_output(led->enable_gpio, 0);
 
@@ -452,6 +449,8 @@ static int lp8860_remove(struct i2c_client *client)
 				"Failed to disable regulator\n");
 	}
 
+	mutex_destroy(&led->lock);
+
 	return 0;
 }
 
@@ -461,18 +460,16 @@ static const struct i2c_device_id lp8860_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lp8860_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id of_lp8860_leds_match[] = {
 	{ .compatible = "ti,lp8860", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_lp8860_leds_match);
-#endif
 
 static struct i2c_driver lp8860_driver = {
 	.driver = {
 		.name	= "lp8860",
-		.of_match_table = of_match_ptr(of_lp8860_leds_match),
+		.of_match_table = of_lp8860_leds_match,
 	},
 	.probe		= lp8860_probe,
 	.remove		= lp8860_remove,
@@ -482,4 +479,4 @@ module_i2c_driver(lp8860_driver);
 
 MODULE_DESCRIPTION("Texas Instruments LP8860 LED driver");
 MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.15.0.124.g7668cbc60
