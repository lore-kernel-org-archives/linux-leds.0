From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 6/7] leds: max8997: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:30 +0530
Message-ID: <ed12fa8d958178bf27861a03b20c266043316dcb.1457355137.git.amitoj1606@gmail.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34312 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753125AbcCGOvd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2016 09:51:33 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457355135.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove max8997_led_remove as it is now has nothing to do.

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
 drivers/leds/leds-max8997.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index 01b45906..2387e35 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -283,28 +283,18 @@ static int max8997_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
+	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int max8997_led_remove(struct platform_device *pdev)
-{
-	struct max8997_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->cdev);
-
-	return 0;
-}
-
 static struct platform_driver max8997_led_driver = {
 	.driver = {
 		.name  = "max8997-led",
 	},
 	.probe  = max8997_led_probe,
-	.remove = max8997_led_remove,
 };
 
 module_platform_driver(max8997_led_driver);
-- 
1.9.1
