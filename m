From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 5/6] leds: da903x: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:54:10 +0530
Message-ID: <ba976266862775a54a48e39c8ea0d650d9b0d77b.1457449111.git.amitoj1606@gmail.com>
References: <cover.1457449111.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:32877 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227AbcCIDYP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 22:24:15 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457449111.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove platform_set_drvdata in probe function and the remove
function, da903x_led_remove as it is now has nothing to do.

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
        -Remove unnecessary platform_set_drvdata

 drivers/leds/leds-da903x.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 4752a2b..5ff7d72 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -113,21 +113,12 @@ static int da903x_led_probe(struct platform_device *pdev)
 	led->flags = pdata->flags;
 	led->master = pdev->dev.parent;
 
-	ret = led_classdev_register(led->master, &led->cdev);
+	ret = devm_led_classdev_register(led->master, &led->cdev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register LED %d\n", id);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, led);
-	return 0;
-}
-
-static int da903x_led_remove(struct platform_device *pdev)
-{
-	struct da903x_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->cdev);
 	return 0;
 }
 
@@ -136,7 +127,6 @@ static struct platform_driver da903x_led_driver = {
 		.name	= "da903x-led",
 	},
 	.probe		= da903x_led_probe,
-	.remove		= da903x_led_remove,
 };
 
 module_platform_driver(da903x_led_driver);
-- 
1.9.1
