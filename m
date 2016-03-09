From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 1/6] leds: 88pm860x: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:53:29 +0530
Message-ID: <c776a9456501453a7255a633727659cf870c8724.1457449111.git.amitoj1606@gmail.com>
References: <cover.1457449111.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34467 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782AbcCIDXe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 22:23:34 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457449111.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove platform_set_drvdata in probe function and the remove
function, pm860x_led_remove as it is now has nothing to do.

The Coccinelle semantic patch used to make this change is as follows:
//<smpl>
@platform@
identifier p, probefn, removefn;
@@
struct platform_driver p = {
  .probe = probefn,
  .remove = removefn,
};

@prb@
identifier platform.probefn, pdev;
expression e;
@@
probefn(struct platform_device *pdev, ...) {
  ...
  e =
- led_classdev_register
+ devm_led_classdev_register
  (...);
   ...
?- led_classdev_unregister(...);
  ...
}
@remove depends on prb@
identifier platform.removefn;
@@
removefn(...) {
...
?- led_classdev_unregister(...);
...
}
//</smpl>

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
Changes in v2:
        -Remove unnecesarry platform_set_drvdata

 drivers/leds/leds-88pm860x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1ad4d03..77a104d 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -195,7 +195,6 @@ static int pm860x_led_probe(struct platform_device *pdev)
 		sprintf(data->name, "led1-blue");
 		break;
 	}
-	platform_set_drvdata(pdev, data);
 	data->chip = chip;
 	data->i2c = (chip->id == CHIP_PM8606) ? chip->client : chip->companion;
 	data->port = pdev->id;
@@ -208,7 +207,7 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	data->cdev.brightness_set_blocking = pm860x_led_set;
 	mutex_init(&data->lock);
 
-	ret = led_classdev_register(chip->dev, &data->cdev);
+	ret = devm_led_classdev_register(chip->dev, &data->cdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
 		return ret;
@@ -217,21 +216,12 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pm860x_led_remove(struct platform_device *pdev)
-{
-	struct pm860x_led *data = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&data->cdev);
-
-	return 0;
-}
 
 static struct platform_driver pm860x_led_driver = {
 	.driver	= {
 		.name	= "88pm860x-led",
 	},
 	.probe	= pm860x_led_probe,
-	.remove	= pm860x_led_remove,
 };
 
 module_platform_driver(pm860x_led_driver);
-- 
1.9.1
