From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH] leds:lp55xx: use the private data instead of updating I2C device platform data
Date: Mon, 24 Aug 2015 16:09:55 +0900
Message-ID: <1440400195-1432-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:44072 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751980AbbHXHKf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 24 Aug 2015 03:10:35 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, j.anaszewski@samsung.com
Cc: Milo Kim <milo.kim@ti.com>, Toshi Kikuchi <toshik@chromium.org>, linux-leds@vger.kernel.org

Currently, lp55xx_of_populate_pdata() allocates lp55xx_platform_data if
it's null. And it parses the DT and copies values into the
'client->dev.platform_data'. This may have architectural issue.
Platform data is configurable through the DT or I2C board info inside the
platform area. However, lp55xx common driver changes this configuration
when it is loaded. So 'client->dev.platform_data' is not null anymore.
Eventually, the driver initialization is not identical when it's unloaded
and loaded again.
The lp55xx common driver should use the private data, 'lp55xx_chip->pdata'
instead of changing the original platform data.

So, lp55xx_of_populate_pdata() is modified as follows.
* Do not update 'dev->platform_data'. Return the pointer of new allocated
   lp55xx_platform_data. Then the driver points it to private data,
   'lp55xx_chip->pdata'.
* Each lp55xx driver checks the pointer and handles an error case.

Then, original platform data configuration will be kept regardless of
loading or unloading the driver.
The driver allocates the memory and copies them from the DT if it's NULL.
After the driver is loaded again, 'client->dev.platform_data' is same as
initial load, so the driver is initialized identically.

Cc: Toshi Kikuchi <toshik@chromium.org>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5521.c        | 11 +++++------
 drivers/leds/leds-lp5523.c        | 11 +++++------
 drivers/leds/leds-lp5562.c        | 11 +++++------
 drivers/leds/leds-lp55xx-common.c | 13 ++++++-------
 drivers/leds/leds-lp55xx-common.h |  4 ++--
 drivers/leds/leds-lp8501.c        | 11 +++++------
 6 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 8ca197a..63a9254 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -514,20 +514,19 @@ static int lp5521_probe(struct i2c_client *client,
 	int ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata;
+	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
-	if (!dev_get_platdata(&client->dev)) {
+	if (!pdata) {
 		if (np) {
-			ret = lp55xx_of_populate_pdata(&client->dev, np);
-			if (ret < 0)
-				return ret;
+			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
 		} else {
 			dev_err(&client->dev, "no platform data\n");
 			return -EINVAL;
 		}
 	}
-	pdata = dev_get_platdata(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 584dbbc..1d0187f 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -880,20 +880,19 @@ static int lp5523_probe(struct i2c_client *client,
 	int ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata;
+	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
-	if (!dev_get_platdata(&client->dev)) {
+	if (!pdata) {
 		if (np) {
-			ret = lp55xx_of_populate_pdata(&client->dev, np);
-			if (ret < 0)
-				return ret;
+			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
 		} else {
 			dev_err(&client->dev, "no platform data\n");
 			return -EINVAL;
 		}
 	}
-	pdata = dev_get_platdata(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index ca85724..0360c59 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -515,20 +515,19 @@ static int lp5562_probe(struct i2c_client *client,
 	int ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata;
+	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
-	if (!dev_get_platdata(&client->dev)) {
+	if (!pdata) {
 		if (np) {
-			ret = lp55xx_of_populate_pdata(&client->dev, np);
-			if (ret < 0)
-				return ret;
+			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
 		} else {
 			dev_err(&client->dev, "no platform data\n");
 			return -EINVAL;
 		}
 	}
-	pdata = dev_get_platdata(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 96d51e9..59b7683 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -543,7 +543,8 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
-int lp55xx_of_populate_pdata(struct device *dev, struct device_node *np)
+struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
+						      struct device_node *np)
 {
 	struct device_node *child;
 	struct lp55xx_platform_data *pdata;
@@ -553,17 +554,17 @@ int lp55xx_of_populate_pdata(struct device *dev, struct device_node *np)
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	num_channels = of_get_child_count(np);
 	if (num_channels == 0) {
 		dev_err(dev, "no LED channels\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	cfg = devm_kzalloc(dev, sizeof(*cfg) * num_channels, GFP_KERNEL);
 	if (!cfg)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	pdata->led_config = &cfg[0];
 	pdata->num_channels = num_channels;
@@ -588,9 +589,7 @@ int lp55xx_of_populate_pdata(struct device *dev, struct device_node *np)
 	/* LP8501 specific */
 	of_property_read_u8(np, "pwr-sel", (u8 *)&pdata->pwr_sel);
 
-	dev->platform_data = pdata;
-
-	return 0;
+	return pdata;
 }
 EXPORT_SYMBOL_GPL(lp55xx_of_populate_pdata);
 
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index cceab48..c7f1e61 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -202,7 +202,7 @@ extern int lp55xx_register_sysfs(struct lp55xx_chip *chip);
 extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
 
 /* common device tree population function */
-extern int lp55xx_of_populate_pdata(struct device *dev,
-				    struct device_node *np);
+extern struct lp55xx_platform_data
+*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d3098e3..3f54f6f 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -308,20 +308,19 @@ static int lp8501_probe(struct i2c_client *client,
 	int ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata;
+	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
-	if (!dev_get_platdata(&client->dev)) {
+	if (!pdata) {
 		if (np) {
-			ret = lp55xx_of_populate_pdata(&client->dev, np);
-			if (ret < 0)
-				return ret;
+			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
 		} else {
 			dev_err(&client->dev, "no platform data\n");
 			return -EINVAL;
 		}
 	}
-	pdata = dev_get_platdata(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
-- 
1.9.1
