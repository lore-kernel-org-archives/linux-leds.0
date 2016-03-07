From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 3/7] leds: wm381x-status: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:08 +0530
Message-ID: <3c7d367b830f6c19f18c825f35ebf942e7f4ca52.1457355136.git.amitoj1606@gmail.com>
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

Also, remove wm831x_status_remove as it is now has nothing to do.

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
 drivers/leds/leds-wm831x-status.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 64a2226..5722b94a 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -284,7 +284,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->cdev.blink_set = wm831x_status_blink_set;
 	drvdata->cdev.groups = wm831x_status_groups;
 
-	ret = led_classdev_register(wm831x->dev, &drvdata->cdev);
+	ret = devm_led_classdev_register(wm831x->dev, &drvdata->cdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
 		return ret;
@@ -293,21 +293,11 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wm831x_status_remove(struct platform_device *pdev)
-{
-	struct wm831x_status *drvdata = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&drvdata->cdev);
-
-	return 0;
-}
-
 static struct platform_driver wm831x_status_driver = {
 	.driver = {
 		   .name = "wm831x-status",
 		   },
 	.probe = wm831x_status_probe,
-	.remove = wm831x_status_remove,
 };
 
 module_platform_driver(wm831x_status_driver);
-- 
1.9.1
