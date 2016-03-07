From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 4/7] leds: s3c24xx: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:21:15 +0530
Message-ID: <aeef24ccdd1220291e9a64ab7d65f608534d06a7.1457355136.git.amitoj1606@gmail.com>
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

Also, remove s3c24xx_led_remove as it is now has nothing to do.

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
 drivers/leds/leds-s3c24xx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 83641a7..ae3fbed 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -59,15 +59,6 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
 	}
 }
 
-static int s3c24xx_led_remove(struct platform_device *dev)
-{
-	struct s3c24xx_gpio_led *led = pdev_to_gpio(dev);
-
-	led_classdev_unregister(&led->cdev);
-
-	return 0;
-}
-
 static int s3c24xx_led_probe(struct platform_device *dev)
 {
 	struct s3c24xx_led_platdata *pdata = dev_get_platdata(&dev->dev);
@@ -104,7 +95,7 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	/* register our new led device */
 
-	ret = led_classdev_register(&dev->dev, &led->cdev);
+	ret = devm_led_classdev_register(&dev->dev, &led->cdev);
 	if (ret < 0)
 		dev_err(&dev->dev, "led_classdev_register failed\n");
 
@@ -113,7 +104,6 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 static struct platform_driver s3c24xx_led_driver = {
 	.probe		= s3c24xx_led_probe,
-	.remove		= s3c24xx_led_remove,
 	.driver		= {
 		.name		= "s3c24xx_led",
 	},
-- 
1.9.1
