From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH v2] leds: lp55xx: avoid dereferencing a stale
 platform_data pointer
Date: Thu, 6 Aug 2015 17:19:30 +0900
Message-ID: <55C31892.1030008@ti.com>
References: <1438679930-26080-1-git-send-email-toshik@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------020201040303000807090108"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:60442 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753059AbbHFITe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2015 04:19:34 -0400
In-Reply-To: <1438679930-26080-1-git-send-email-toshik@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Toshi Kikuchi <toshik@chromium.org>
Cc: linux-leds@vger.kernel.org

--------------020201040303000807090108
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Toshi,

On 8/4/2015 6:18 PM, Toshi Kikuchi wrote:
> lp55xx_of_populate_pdata() allocates platform_data dynamically if DT
> is used. The memory area is allocated with devm_kzalloc() so it is
> automatically freed if the driver is unloaded. The driver should clear
> the pointer to platform_data before it is unloaded, otherwise it will
> use the stale pointer accidentally if the driver is reloaded.

Your patch is good but I just found that I should modify 
lp55xx_of_populate_pdata().
Allocated platform data should not be pointed to I2C device platform 
data. Please see my comments below.

>
> Change-Id: Ia097ed83b92cec5a52534a71dcb5322869c2a7b1
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>

(snip)

>
> +void lp55xx_of_reset_pdata(struct device *dev, struct device_node *np)
> +{
> +	if (np)
> +		dev->platform_data = NULL;
> +}
> +EXPORT_SYMBOL_GPL(lp55xx_of_reset_pdata);

The driver should not change original value of platform data, 
'client->dev.platform_data'. The platform side configures specific 
values and driver just uses it. The values should be kept even after the 
driver is attached or detached.

So, I'd like to modify lp55xx_of_populate_pdata() as follows.

1. Return the pointer of lp55xx_platform_data in 
lp55xx_of_populate_pdata(). The returned value will point to the private 
data structure, 'lp55xx_chip->pdata'
2. Each lp55xx driver checks the pointer and handles error case

Then, original platform data configuration will be kept regardless of 
loading or unloading the driver.
The driver uses it if the platform data exists or allocates the memory 
and copies them from the DT if it's NULL.
After the driver is unloaded, then allocated memory is freed by device 
resource management.
If the driver is loaded again, 'client->dev.platform_data' is same as 
initial load, so stale pointer error will not happen.

May I ask you something? Could you check attached patch if available? I 
can't test it on real target board at this moment. I would appreciate if 
you could test my code.

Best regards,
Milo

--------------020201040303000807090108
Content-Type: text/plain; charset="UTF-8";
	name="fix-stale-pointer-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fix-stale-pointer-error.patch"

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
index 9e1716f..2351984 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -732,20 +732,19 @@ static int lp5523_probe(struct i2c_client *client,
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

--------------020201040303000807090108--
