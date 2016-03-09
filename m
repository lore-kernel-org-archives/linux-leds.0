From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 4/6] leds: s3c24xx: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:53:57 +0530
Message-ID: <97a18d35caac08b28cac3ae0819aad2a8d0158a2.1457449111.git.amitoj1606@gmail.com>
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

Also, remove unnecessary function pdev_to_gpio, platform_set_drvdata 
in the probe function and the remove function, s3c24xx_led_remove as 
it is now has nothing to do.

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
        -Remove unnecessary platform_set_drvdata and pdev_to_gpio
         function definition.

 drivers/leds/leds-s3c24xx.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/leds/leds-s3c24xx.c b/drivers/leds/leds-s3c24xx.c
index 83641a7..404da45 100644
--- a/drivers/leds/leds-s3c24xx.c
+++ b/drivers/leds/leds-s3c24xx.c
@@ -29,11 +29,6 @@ struct s3c24xx_gpio_led {
 	struct s3c24xx_led_platdata	*pdata;
 };
 
-static inline struct s3c24xx_gpio_led *pdev_to_gpio(struct platform_device *dev)
-{
-	return platform_get_drvdata(dev);
-}
-
 static inline struct s3c24xx_gpio_led *to_gpio(struct led_classdev *led_cdev)
 {
 	return container_of(led_cdev, struct s3c24xx_gpio_led, cdev);
@@ -59,15 +54,6 @@ static void s3c24xx_led_set(struct led_classdev *led_cdev,
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
@@ -79,8 +65,6 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 	if (!led)
 		return -ENOMEM;
 
-	platform_set_drvdata(dev, led);
-
 	led->cdev.brightness_set = s3c24xx_led_set;
 	led->cdev.default_trigger = pdata->def_trigger;
 	led->cdev.name = pdata->name;
@@ -104,7 +88,7 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 	/* register our new led device */
 
-	ret = led_classdev_register(&dev->dev, &led->cdev);
+	ret = devm_led_classdev_register(&dev->dev, &led->cdev);
 	if (ret < 0)
 		dev_err(&dev->dev, "led_classdev_register failed\n");
 
@@ -113,7 +97,6 @@ static int s3c24xx_led_probe(struct platform_device *dev)
 
 static struct platform_driver s3c24xx_led_driver = {
 	.probe		= s3c24xx_led_probe,
-	.remove		= s3c24xx_led_remove,
 	.driver		= {
 		.name		= "s3c24xx_led",
 	},
-- 
1.9.1
