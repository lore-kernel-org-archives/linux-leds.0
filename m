From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2 6/6] leds: max8997: Use devm_led_classdev_register
Date: Wed, 9 Mar 2016 08:54:32 +0530
Message-ID: <dc647a10d4d665ebd2615ef289e2048277c00f24.1457449111.git.amitoj1606@gmail.com>
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

Also, remove platform_set_drvdata in probe function and the remove
function, max8997_led_remove as it is now has nothing to do.

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

 drivers/leds/leds-max8997.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index 01b45906..4edf74f 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -281,30 +281,18 @@ static int max8997_led_probe(struct platform_device *pdev)
 
 	mutex_init(&led->mutex);
 
-	platform_set_drvdata(pdev, led);
-
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
