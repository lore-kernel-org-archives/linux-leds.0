From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC 12/51] leds: lm3533: Remove work queue
Date: Fri, 17 Jul 2015 10:46:58 +0200
Message-ID: <1437122857-6765-13-git-send-email-j.anaszewski@samsung.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>, Johan Hovold <johan@kernel.org>
List-Id: linux-leds@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

Now the core implements the work queue, remove it from the driver.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Johan Hovold <johan@kernel.org>
---
 drivers/leds/leds-lm3533.c |   30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 6e2e020..52496d8 100644
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
 static void lm3533_led_set(struct led_classdev *cdev,
-						enum led_brightness value)
+			   enum led_brightness value)
 {
 	struct lm3533_led *led = to_lm3533_led(cdev);
 
-	dev_dbg(led->cdev.dev, "%s - %d\n", __func__, value);
+	dev_dbg(led->cdev.dev, "%s - %u\n", __func__, value);
+
+	if (value == 0)
+		lm3533_led_pattern_enable(led, 0);	/* disable blink */
 
-	led->new_brightness = value;
-	schedule_work(&led->work);
+	lm3533_ctrlbank_set_brightness(&led->cb, value);
 }
 
 static enum led_brightness lm3533_led_get(struct led_classdev *cdev)
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
