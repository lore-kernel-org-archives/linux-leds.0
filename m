From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC v6 16/36] leds: lm3533: Remove work queue
Date: Thu, 20 Aug 2015 16:43:46 +0200
Message-ID: <1440081846-11697-17-git-send-email-j.anaszewski@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, Johan Hovold <johan@kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver,
and switch to using brightness_set_blocking op.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Johan Hovold <johan@kernel.org>
---
 drivers/leds/leds-lm3533.c |   30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 6e2e020..196dcb5 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -17,7 +17,6 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 
 #include <linux/mfd/lm3533.h>
 
@@ -53,9 +52,6 @@ struct lm3533_led {
 
 	struct mutex mutex;
 	unsigned long flags;
-
-	struct work_struct work;
-	u8 new_brightness;
 };
 
 
@@ -123,27 +119,17 @@ out:
 	return ret;
 }
 
-static void lm3533_led_work(struct work_struct *work)
-{
-	struct lm3533_led *led = container_of(work, struct lm3533_led, work);
-
-	dev_dbg(led->cdev.dev, "%s - %u\n", __func__, led->new_brightness);
-
-	if (led->new_brightness == 0)
-		lm3533_led_pattern_enable(led, 0);	/* disable blink */
-
-	lm3533_ctrlbank_set_brightness(&led->cb, led->new_brightness);
-}
-
-static void lm3533_led_set(struct led_classdev *cdev,
+static int lm3533_led_set(struct led_classdev *cdev,
 						enum led_brightness value)
 {
 	struct lm3533_led *led = to_lm3533_led(cdev);
 
 	dev_dbg(led->cdev.dev, "%s - %d\n", __func__, value);
 
-	led->new_brightness = value;
-	schedule_work(&led->work);
+	if (value == 0)
+		lm3533_led_pattern_enable(led, 0);	/* disable blink */
+
+	return lm3533_ctrlbank_set_brightness(&led->cb, value);
 }
 
 static enum led_brightness lm3533_led_get(struct led_classdev *cdev)
@@ -693,7 +679,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->lm3533 = lm3533;
 	led->cdev.name = pdata->name;
 	led->cdev.default_trigger = pdata->default_trigger;
-	led->cdev.brightness_set = lm3533_led_set;
+	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
 	led->cdev.brightness = LED_OFF;
@@ -701,7 +687,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->id = pdev->id;
 
 	mutex_init(&led->mutex);
-	INIT_WORK(&led->work, lm3533_led_work);
 
 	/* The class framework makes a callback to get brightness during
 	 * registration so use parent device (for error reporting) until
@@ -733,7 +718,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 err_unregister:
 	led_classdev_unregister(&led->cdev);
-	flush_work(&led->work);
 
 	return ret;
 }
@@ -746,7 +730,6 @@ static int lm3533_led_remove(struct platform_device *pdev)
 
 	lm3533_ctrlbank_disable(&led->cb);
 	led_classdev_unregister(&led->cdev);
-	flush_work(&led->work);
 
 	return 0;
 }
@@ -760,7 +743,6 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
 
 	lm3533_ctrlbank_disable(&led->cb);
 	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
-	flush_work(&led->work);
 }
 
 static struct platform_driver lm3533_led_driver = {
-- 
1.7.9.5
