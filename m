From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 27/51] leds: mc13783: Remove work queue
Date: Fri, 17 Jul 2015 10:47:13 +0200
Message-ID: <1437122857-6765-28-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-mc13783.c |   31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index e2b847f..f2f8cae 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -20,7 +20,6 @@
 #include <linux/platform_device.h>
 #include <linux/leds.h>
 #include <linux/of.h>
-#include <linux/workqueue.h>
 #include <linux/mfd/mc13xxx.h>
 
 struct mc13xxx_led_devtype {
@@ -32,8 +31,6 @@ struct mc13xxx_led_devtype {
 
 struct mc13xxx_led {
 	struct led_classdev	cdev;
-	struct work_struct	work;
-	enum led_brightness	new_brightness;
 	int			id;
 	struct mc13xxx_leds	*leds;
 };
@@ -55,9 +52,11 @@ static unsigned int mc13xxx_max_brightness(int id)
 	return 0x3f;
 }
 
-static void mc13xxx_led_work(struct work_struct *work)
+static void mc13xxx_led_set(struct led_classdev *led_cdev,
+			    enum led_brightness value)
 {
-	struct mc13xxx_led *led = container_of(work, struct mc13xxx_led, work);
+	struct mc13xxx_led *led =
+		container_of(led_cdev, struct mc13xxx_led, cdev);
 	struct mc13xxx_leds *leds = led->leds;
 	unsigned int reg, bank, off, shift;
 
@@ -107,17 +106,7 @@ static void mc13xxx_led_work(struct work_struct *work)
 
 	mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + reg,
 			mc13xxx_max_brightness(led->id) << shift,
-			led->new_brightness << shift);
-}
-
-static void mc13xxx_led_set(struct led_classdev *led_cdev,
-			    enum led_brightness value)
-{
-	struct mc13xxx_led *led =
-		container_of(led_cdev, struct mc13xxx_led, cdev);
-
-	led->new_brightness = value;
-	schedule_work(&led->work);
+			value << shift);
 }
 
 #ifdef CONFIG_OF
@@ -260,8 +249,6 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 		leds->led[i].cdev.brightness_set = mc13xxx_led_set;
 		leds->led[i].cdev.max_brightness = mc13xxx_max_brightness(id);
 
-		INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
-
 		ret = led_classdev_register(dev->parent, &leds->led[i].cdev);
 		if (ret) {
 			dev_err(dev, "Failed to register LED %i\n", id);
@@ -270,10 +257,8 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 	}
 
 	if (ret)
-		while (--i >= 0) {
+		while (--i >= 0)
 			led_classdev_unregister(&leds->led[i].cdev);
-			cancel_work_sync(&leds->led[i].work);
-		}
 
 	return ret;
 }
@@ -283,10 +268,8 @@ static int mc13xxx_led_remove(struct platform_device *pdev)
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	int i;
 
-	for (i = 0; i < leds->num_leds; i++) {
+	for (i = 0; i < leds->num_leds; i++)
 		led_classdev_unregister(&leds->led[i].cdev);
-		cancel_work_sync(&leds->led[i].work);
-	}
 
 	return 0;
 }
-- 
1.7.9.5
