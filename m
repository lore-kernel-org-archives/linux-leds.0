From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 5/7] leds: da903x: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:21 +0530
Message-ID: <252f474d9402b8a9759ddbb552055d4d75e3da60.1457355136.git.amitoj1606@gmail.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:33918 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753161AbcCGOvZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Mar 2016 09:51:25 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457355135.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove da903x_led_remove as it is now has nothing to do.

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
 drivers/leds/leds-da903x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 4752a2b..3e0aab9 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -113,7 +113,7 @@ static int da903x_led_probe(struct platform_device *pdev)
 	led->flags = pdata->flags;
 	led->master = pdev->dev.parent;
 
-	ret = led_classdev_register(led->master, &led->cdev);
+	ret = devm_led_classdev_register(led->master, &led->cdev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register LED %d\n", id);
 		return ret;
@@ -123,20 +123,11 @@ static int da903x_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int da903x_led_remove(struct platform_device *pdev)
-{
-	struct da903x_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->cdev);
-	return 0;
-}
-
 static struct platform_driver da903x_led_driver = {
 	.driver	= {
 		.name	= "da903x-led",
 	},
 	.probe		= da903x_led_probe,
-	.remove		= da903x_led_remove,
 };
 
 module_platform_driver(da903x_led_driver);
-- 
1.9.1
