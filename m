From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 2/7] leds: lp8788: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:02 +0530
Message-ID: <f2efd0bd7bcba8f55ab8be51b13c7c4c8cf39ab6.1457355136.git.amitoj1606@gmail.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1457355135.git.amitoj1606@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: linux-leds@vger.kernel.org

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove lp8788_led_remove as it is now has nothing to do.

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
 drivers/leds/leds-lp8788.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lp8788.c b/drivers/leds/leds-lp8788.c
index 0eee38f..ffc3f89 100644
--- a/drivers/leds/leds-lp8788.c
+++ b/drivers/leds/leds-lp8788.c
@@ -154,7 +154,7 @@ static int lp8788_led_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = led_classdev_register(dev, &led->led_dev);
+	ret = devm_led_classdev_register(dev, &led->led_dev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -163,18 +163,8 @@ static int lp8788_led_probe(struct platform_device *pdev)
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
