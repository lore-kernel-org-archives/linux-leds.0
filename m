From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH] leds: Remove duplicated OOM message for individual driver
Date: Thu, 8 May 2014 11:25:52 +0800
Message-ID: <1399519552-10344-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bn1blp0181.outbound.protection.outlook.com ([207.46.163.181]:51737
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751103AbaEHEOq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 8 May 2014 00:14:46 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, michael.hennerich@analog.com
Cc: linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>

The OOM message of individual driver is unnecessary, and this is
duplicate the memory subsystem generic OOM message.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/leds/leds-adp5520.c | 5 +----
 drivers/leds/leds-bd2802.c  | 4 +---
 drivers/leds/leds-da903x.c  | 4 +---
 drivers/leds/leds-da9052.c  | 3 +--
 drivers/leds/leds-s3c24xx.c | 4 +---
 drivers/leds/leds-sunfire.c | 4 +---
 6 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 7e311a1..9982691 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -121,13 +121,10 @@ static int adp5520_led_probe(struct platform_device *pdev)
 
 	led = devm_kzalloc(&pdev->dev, sizeof(*led) * pdata->num_leds,
 				GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "failed to alloc memory\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	ret = adp5520_led_prepare(pdev);
-
 	if (ret) {
 		dev_err(&pdev->dev, "failed to write\n");
 		return ret;
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index fb5a347..6078c15 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -678,10 +678,8 @@ static int bd2802_probe(struct i2c_client *client,
 	int ret, i;
 
 	led = devm_kzalloc(&client->dev, sizeof(struct bd2802_led), GFP_KERNEL);
-	if (!led) {
-		dev_err(&client->dev, "failed to allocate driver data\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	led->client = client;
 	pdata = led->pdata = dev_get_platdata(&client->dev);
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 2a4b87f..180bbd8 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -109,10 +109,8 @@ static int da903x_led_probe(struct platform_device *pdev)
 	}
 
 	led = devm_kzalloc(&pdev->dev, sizeof(struct da903x_led), GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "failed to alloc memory for LED%d\n", id);
+	if (!led)
 		return -ENOMEM;
-	}
 
 	led->cdev.name = pdata->name;
 	led->cdev.default_trigger = pdata->default_trigger;
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 865d4fa..5aa7e31 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -127,8 +127,7 @@ static int da9052_led_probe(struct platform_device *pdev)
 	led = devm_kzalloc(&pdev->dev,
 			   sizeof(struct da9052_led) * pled->num_leds,
 			   GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&pdev->dev, "Failed to alloc memory\n");
+	if (!led) {
 		error = -ENOMEM;
 		goto err;
 	}
diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 98174e7..37a6a92 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -77,10 +77,8 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	led = devm_kzalloc(&dev->dev, sizeof(struct s3c24xx_gpio_led),
 			   GFP_KERNEL);
-	if (led == NULL) {
-		dev_err(&dev->dev, "No memory for device\n");
+	if (!led)
 		return -ENOMEM;
-	}
 
 	platform_set_drvdata(dev, led);
 
diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index 388632d..0b8cc4a 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -135,10 +135,8 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 	}
 
 	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		dev_err(&pdev->dev, "Could not allocate struct sunfire_drvdata\n");
+	if (!p)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < NUM_LEDS_PER_BOARD; i++) {
 		struct led_classdev *lp = &p->leds[i].led_cdev;
-- 
1.8.4
