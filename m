From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 2/6] leds: lp8788: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:53:38 +0530
Message-ID: <bcef225cab300e66d2f8ad8d0a78cca882b684fa.1457449111.git.amitoj1606@gmail.com>
References: <cover.1457449111.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33757 "EHLO
	mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618AbcCIDXn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 22:23:43 -0500
Content-Disposition: inline
In-Reply-To: <cover.1457449111.git.amitoj1606@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove platform_set_drvdata in probe function and the remove
function, lp8788_led_remove as it is now has nothing to do.

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

 drivers/leds/leds-lp8788.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 0eee38f..38c253a 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -146,15 +146,13 @@ static int lp8788_led_probe(struct platform_device *pdev)
 
 	mutex_init(&led->lock);
 
-	platform_set_drvdata(pdev, led);
-
 	ret = lp8788_led_init_device(led, led_pdata);
 	if (ret) {
 		dev_err(dev, "led init device err: %d\n", ret);
 		return ret;
 	}
 
-	ret = led_classdev_register(dev, &led->led_dev);
+	ret = devm_led_classdev_register(dev, &led->led_dev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -163,18 +161,8 @@ static int lp8788_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int lp8788_led_remove(struct platform_device *pdev)
-{
-	struct lp8788_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->led_dev);
-
-	return 0;
-}
-
 static struct platform_driver lp8788_led_driver = {
 	.probe = lp8788_led_probe,
-	.remove = lp8788_led_remove,
 	.driver = {
 		.name = LP8788_DEV_KEYLED,
 	},
-- 
1.9.1
