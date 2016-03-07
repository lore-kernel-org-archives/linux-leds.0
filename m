From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 7/7] leds: lm3533: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:42 +0530
Message-ID: <2d56f03be1a346082ffcf253d99593851e74e5f9.1457355137.git.amitoj1606@gmail.com>
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

To be compatible with this change, remove an unnecessary label by
replacing it with direct return statement.

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
 drivers/leds/leds-lm3533.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 196dcb5..5b529dc 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -698,7 +698,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(pdev->dev.parent, &led->cdev);
+	ret = devm_led_classdev_register(pdev->dev.parent, &led->cdev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
 		return ret;
@@ -708,18 +708,13 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	ret = lm3533_led_setup(led, pdata);
 	if (ret)
-		goto err_unregister;
+		return ret;
 
 	ret = lm3533_ctrlbank_enable(&led->cb);
 	if (ret)
-		goto err_unregister;
+		return ret;
 
 	return 0;
-
-err_unregister:
-	led_classdev_unregister(&led->cdev);
-
-	return ret;
 }
 
 static int lm3533_led_remove(struct platform_device *pdev)
@@ -729,7 +724,6 @@ static int lm3533_led_remove(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	lm3533_ctrlbank_disable(&led->cb);
-	led_classdev_unregister(&led->cdev);
 
 	return 0;
 }
-- 
1.9.1
