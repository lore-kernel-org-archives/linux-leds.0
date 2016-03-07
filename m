From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 1/7] leds: 88pm860x: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:20:56 +0530
Message-ID: <626701d05839d4bf14d411bd529b1c00668dee0d.1457355136.git.amitoj1606@gmail.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:32789 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbcCGOvA (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2016 09:51:00 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457355135.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove pm860x_led_remove as it is now has nothing to do.

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
 drivers/leds/leds-88pm860x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 1ad4d03..16cfb3d 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -208,7 +208,7 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	data->cdev.brightness_set_blocking = pm860x_led_set;
 	mutex_init(&data->lock);
 
-	ret = led_classdev_register(chip->dev, &data->cdev);
+	ret = devm_led_classdev_register(chip->dev, &data->cdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
 		return ret;
@@ -217,21 +217,12 @@ static int pm860x_led_probe(struct platform_device *pdev)
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
