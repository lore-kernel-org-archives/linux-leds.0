From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 3/6] leds: wm831x-status: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:53:47 +0530
Message-ID: <2e386e36e47e5e635dc1103d4782dc8c633ea99f.1457449111.git.amitoj1606@gmail.com>
References: <cover.1457449111.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1457449111.git.amitoj1606@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: linux-leds@vger.kernel.org

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

Also, remove platform_set_drvdata from probe function and the remove
function, wm831x_status_remove as it is now has nothing to do.

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

 drivers/leds/leds-wm831x-status.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 64a2226..be93b20 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -239,7 +239,6 @@ static int wm831x_status_probe(struct platform_device *pdev)
 			       GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, drvdata);
 
 	drvdata->wm831x = wm831x;
 	drvdata->reg = res->start;
@@ -284,7 +283,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->cdev.blink_set = wm831x_status_blink_set;
 	drvdata->cdev.groups = wm831x_status_groups;
 
-	ret = led_classdev_register(wm831x->dev, &drvdata->cdev);
+	ret = devm_led_classdev_register(wm831x->dev, &drvdata->cdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
 		return ret;
@@ -293,21 +292,11 @@ static int wm831x_status_probe(struct platform_device *pdev)
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
